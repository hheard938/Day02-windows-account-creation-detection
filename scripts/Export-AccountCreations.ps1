#Requires -RunAsAdministrator
[CmdletBinding()]
param(
   [ValidateRange(1,168)]
   [int]$HoursBack = 24,
   [string]$OutputPath = ".\data\account-creations.csv"
)
$ErrorActionPreference = 'Stop'
$startTime = (Get-Date).AddHours(-$HoursBack)
$events = Get-WinEvent -FilterHashtable @{
   LogName   = 'Security'
   Id        = 4720
   StartTime = $startTime
} -ErrorAction SilentlyContinue
if (-not $events) {
   Write-Warning "No Event ID 4720 records found since $startTime."
   return
}
$records = foreach ($event in $events) {
   $xml = [xml]$event.ToXml()
   $fields = @{}
   foreach ($item in $xml.Event.EventData.Data) {
       $fields[$item.Name] = [string]$item.'#text'
   }
   [pscustomobject]@{
       TimeCreated       = $event.TimeCreated.ToString("o")
       EventId           = $event.Id
       Computer          = $event.MachineName
       SubjectUserName   = $fields['SubjectUserName']
       SubjectDomainName = $fields['SubjectDomainName']
       TargetUserName    = $fields['TargetUserName']
       TargetDomainName  = $fields['TargetDomainName']
       TargetSid         = $fields['TargetSid']
   }
}
$records |
   Sort-Object TimeCreated -Descending |
   Export-Csv -Path $OutputPath -NoTypeInformation
Write-Host "Exported $($records.Count) account-creation record(s) to $OutputPath" -ForegroundColor Green
