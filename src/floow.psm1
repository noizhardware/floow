$global:tallsec = $null
$global:ttnum = $null
$global:ttnumf = $null
$global:ttnumPos = $null
$global:ttnumPosf = $null
$global:ttsign = $null
$global:ttmark = $null
$global:ttoutput = $null
$global:miloutput = $null
$global:secoutput = $null
$global:date = $null
$global:dateFloow = $null
$global:timestamp = $null
$global:fragMS = 288000
$global:sliverMS = 28800

# F L O O W  functions
# todo:
# tt to military convert (test & debug)
# project duration forecast system



function floow-init { # clean up some garbage here pleeeese
  [int]$thou = get-date -format HH
  [int]$tmin = get-date -format mm
  [int]$tsec = get-date -format ss
  $global:tallsec = (($thou * 3600)+($tmin * 60)+$tsec)
  # Triplet Time
  if($tallsec -le 28800){$global:ttmark = "S"; $global:ttnumf = ($tallsec / 14400) - 1}
  elseif($tallsec -gt 28800 -AND $tallsec -lt 57600){$global:ttmark = "M"; $global:ttnumf = (($tallsec - 28800)/14400) - 1}
  elseif($tallsec -ge 57600){$global:ttmark = "R"; $global:ttnumf = (($tallsec - 57600)/14400) - 1}
  $global:ttnumPosf = ($tallsec%28800)/28800 # with three (0-1) ranges
  $global:ttnumPos = "{0:n2}" -f $global:ttnumPosf # truncated ttnum
}

function floow-currentFrags ($truncate){ # with RETURN and only local variables used // the parameter: 0>>full extension, 1>>truncate to two decimals
  [int]$thou = get-date -format HH
  [int]$tmin = get-date -format mm
  [int]$tsec = get-date -format ss
  $tallsec = (($thou * 3600)+($tmin * 60)+$tsec)
  # if($tallsec -le 28800){$ttmark = "S"; $ttnumf = ($tallsec / 14400) - 1}
  # elseif($tallsec -gt 28800 -AND $tallsec -lt 57600){$ttmark = "M"; $ttnumf = (($tallsec - 28800)/14400) - 1}
  # elseif($tallsec -ge 57600){$ttmark = "R"; $ttnumf = (($tallsec - 57600)/14400) - 1}
  $allfragsF = $tallsec / 28800 # full decimal extension
  $allfrags = "{0:n2}" -f $allfragsF # truncated ttnum
  if($truncate -eq 0){$output = $allfragsF}
  elseif($truncate -eq 1){$output = $allfrags}
  return $output
}

function floow-convert-ttsec ($ttinput){ # tt to seconds time conversion
  $letter = $ttinput.Split(":")[0]
  if ($letter -eq "S"){$letter = 0}
  elseif ($letter -eq "M"){$letter = 28800}
  elseif ($letter -eq "R"){$letter = 57600}
  [float]$number = $ttinput.Split(":")[1]
  $global:secoutput = ($number * 28800) + $letter
  $global:secoutput = [Math]::Floor([decimal]$secoutput) # get rid of decimals
}

function floow-convert-miltt ($milinput){
  [int]$milhour = $milinput.SubString(0,2) # i due numeri sono INDEX e LENGHT porcoddioo!!!!!
  [int]$milmin = $milinput.SubString(2,2) # i due numeri sono INDEX e LENGHT porcoddioo!!!!!
  $tallsec = ($milhour*3600)+($milmin*60)
  if($tallsec -le 28800){$global:ttmark = "S"; $global:ttnumf = ($tallsec / 14400) - 1}
  elseif($tallsec -gt 28800 -AND $tallsec -lt 57600){$global:ttmark = "M"; $global:ttnumf = (($tallsec - 28800)/14400) - 1}
  elseif($tallsec -ge 57600){$global:ttmark = "R"; $global:ttnumf = (($tallsec - 57600)/14400) - 1}
  $global:ttnumPosf = ($tallsec%28800)/28800 # with three (0-1) ranges
  $global:ttnumPos = "{0:n2}" -f $global:ttnumPosf # truncated ttnum
  $global:ttoutput = ("$global:ttmark`:$global:ttnumPos")
}

function floow-convert-ttmil ($ttinput){ # tt to military time conversion
  $ttMarkIn = $ttinput.SubString(0,1) # i due numeri sono INDEX e LENGHT porcoddioo!!!!!
  $ttSignIn = $ttinput.SubString(1,1)
  $ttIntIn = $ttinput.SubString(2,1)
  $ttCentIn = $ttinput.SubString(4,2)
  $ttValueIn = $ttIntIn + ($ttCentIn / 100)
  if($ttSignIn -eq "-"){$ttValueIn = 1 - $ttValueIn}
  if($ttSignIn -eq "+"){$ttValueIn = 1 + $ttValueIn}
  # ehhhhh da qui andrebbe convertito tutto in secondi e poi da li estratta ora e minutiiii
  # $ttValueIn *= 4
  if($ttMarkIn -eq "A"){$global:miloutput = $ttValueIn * 100}
  if($ttMarkIn -eq "M"){$global:miloutput = ($ttValueIn + 8) * 100}
  if($ttMarkIn -eq "Q"){$global:miloutput = ($ttValueIn + 16) * 100}
  write-output "mark:$ttMarkIn int:$ttIntIn cent:$ttCentIn sign:$ttSignIn fullvalue:$ttValueIn"
}

function floow-date([double]$offset){
  if(!($offset)){[double]$offset = 0}
  #(Get-date).AddDays([double]$offset)
  $month = (get-date (get-date).addDays([double]$offset) -UFormat "%m")
  #$month = Get-date -UFormat %m
  #$month.AddDays($offset)
  if([int]$month -eq 1){$monthletter = "a"}
  if([int]$month -eq 2){$monthletter = "b"}
  if([int]$month -eq 3){$monthletter = "c"}
  if([int]$month -eq 4){$monthletter = "d"}
  if([int]$month -eq 5){$monthletter = "e"}
  if([int]$month -eq 6){$monthletter = "f"}
  if([int]$month -eq 7){$monthletter = "g"}
  if([int]$month -eq 8){$monthletter = "h"}
  if([int]$month -eq 9){$monthletter = "i"}
  if([int]$month -eq 10){$monthletter = "j"}
  if([int]$month -eq 11){$monthletter = "k"}
  if([int]$month -eq 12){$monthletter = "w"}
  $year = (get-date (get-date).addDays([double]$offset) -UFormat "%Y")
  $day = (get-date (get-date).addDays([double]$offset) -UFormat "%d")

  $global:dateFloow = "$year$monthletter$day"
  return $dateFloow
}

function floow-dateTime {
    floow-init
    $dateFloow = floow-date
    $dateTime = "$global:dateFloow`:$global:ttmark`:$global:ttnumPos"
    return $dateTime
}

function floow-timestamp {
  $dateFloow = floow-date
  floow-init
  [string]$temp = $global:dateFloow
  $temp += ":"
  $temp += $global:ttmark
  $temp += ":"
  $temp += $global:ttnumPosf
  $global:timestamp = $temp
}


function floow-ringFrag ([float]$fragsAlarm) { # for timeboxing // beeps after XX frags, if no arg is provided after 5 frags (half a BLOK, or a BOX)
  [float]$millisec = $fragsAlarm * 288000
  [float]$sec = $fragsAlarm * 288

# TODO: absolute local path
  $argList = "-file `"R:\Work\git\floow\src\alarm.ps1`" -millisec $millisec"
  Start-Process powershell -argumentlist $argList



### OLD SHIT :)



  #Start-Process powershell -file "R:\scripts\floow\src\alarm.ps1"




  # OK THIS SEGMENT WORKS!!!
  # $stopwatch = [System.Diagnostics.Stopwatch]::StartNew() # creates it and starts it
  # wr("started")
  # [float]$elapsed = $stopwatch.elapsedmilliseconds
  # wr("elapsed: $elapsed")
  # wr("now counting down...")


  # # this one works, but still doesn't run in background...
  # Add-Type -AssemblyName System.Windows.Forms
  # $w = new-object 'System.Windows.Forms.Form'
  # $timer = New-Object system.timers.timer
  # $timer.Enabled = $true
  # $timer.Interval = $millisec
  # # $action = {wr("yooo")}
  # $timer.add_Elapsed({ Write-Host "borgoddiooo!!!"; $w.Close()})
  # $timer.AutoReset = $false
  # $timer.SynchronizingObject = $w
  # $timer.Start()
  # $w.Width = 10
  # $w.Height = 10
  # $w.ShowDialog()


# QUESTO è DA MATTI
# Function New-Alarm {
#
#   [cmdletbinding(SupportsShouldProcess=$True,DefaultParameterSetName="Time")]
#
#   Param (
#     [Parameter(Position=0,ValueFromPipelineByPropertyName=$True)]
#     [ValidateNotNullorEmpty()]
#     [string]$Command="Notepad",
#     [Parameter(Position=1,ValueFromPipelineByPropertyName=$True,ParameterSetName="Time")]
#     [ValidateNotNullorEmpty()]
#     [Alias("time")]
#     [datetime]$Alarm=(Get-Date).AddMinutes(5),
#     [Parameter(ValueFromPipelineByPropertyName=$True,ParameterSetName="Seconds")]
#     [int]$Seconds,
#     [Parameter(ValueFromPipelineByPropertyName=$True,ParameterSetName="Minutes")]
#     [int]$Minutes,
#     [Parameter(ValueFromPipelineByPropertyName=$True,ParameterSetName="Hours")]
#     [int]$Hours,
#     [Parameter(ValueFromPipelineByPropertyName=$True)]
#     [Alias("init","is")]
#     [string]$InitializationScript
#   )
#
#   Process {
#
#     if ($seconds) {$Alarm=(Get-Date).AddSeconds($seconds)}
#     if ($minutes) {$Alarm=(Get-Date).AddMinutes($minutes)}
#     if ($Hours) {$Alarm=(Get-Date).AddHours($hours)}
#
#     Write-Verbose ("{0} Creating an alarm for {1} to execute {2}" -f (Get-Date),$Alarm,$Command)
#
#     #define a scriptblock that takes parameters. Parameters are validated in the
#     #function so we don't need to do it here.
#     $sbText="@"
#     Param ([string]$Command,[datetime]$Alarm,[string]$Init)
#
#     #define a boolean flag
#     $Done=$False
#
#     #loop until the time is greater or equal to the alarm time
#     #sleeping every 10 seconds
#     do {
#       if ((get-date) -ge $Alarm) {
#         #run the command
#         $ActualTime=Get-Date
#         Invoke-Expression $Command
#         #set the flag to True
#         $Done=$True
#       }
#       else {
#         sleep -Seconds 10
#       }
#     } while (-Not $Done)
#
#     #write an alarm summary object which can be retrieved with Receive-Job
#     New-Object -TypeName PSObject -Property @{
#       ScheduledTime=$Alarm
#       ActualTime=$ActualTime
#       Command=$Command
#       Initialization=$Init
#     }
#
#     #append metadata to the scriptblock text so they can be parsed out with Get-Alarm
#     #to discover information for currently running alarm jobs
#
#     $meta="@"
#
#     #Alarm Command::$Command
#     #Alarm Time::$Alarm
#     #Alarm Init::$InitializationScript
#     #Alarm Created::$(Get-Date)
#
#
#     #add meta data to scriptblock text
#     $sbText+=$meta
#
#     Write-Debug "Scriptblock text:"
#     Write-Debug $sbText
#     Write-Debug "Creating the scriptblock"
#
#     #create a scriptblock to use with Start-Job
#     $sb=$ExecutionContext.InvokeCommand.NewScriptBlock($sbText)
#
#     Try {
#       If ($InitializationScript) {
#         #turn $initializationscript into a script block
#         $initsb=$ExecutionContext.InvokeCommand.NewScriptBlock($initializationscript)
#         Write-Verbose ("{0} Using an initialization script: {1}" -f (Get-Date),$InitializationScript)
#       }
#       else {
#         #no initialization command so create an empty scriptblock
#         $initsb= {}
#       }
#
#       #WhatIf
#       if ($pscmdlet.ShouldProcess("$command at $Alarm")) {
#         #create a background job
#         Start-job -ScriptBlock $sb -ArgumentList @($Command,$Alarm,$InitializationScript) -ErrorAction  "Stop" -InitializationScript $Initsb
#         Write-Verbose ("{0} Alarm Created" -f (Get-Date))
#       }
#     }
#
#     Catch {
#       $msg="{0} Exception creating the alarm job. {1}" -f (Get-Date),$_.Exception.Message
#       Write-Warning $msg
#     }
#     } #Process
#
#     } #end function
#
#
#     new-alarm "wr('porcoddioooooohhhh')" -Seconds 2


}

# F L O O W  functions END.

function date-init {
  $global:date = Get-Date -UFormat "%Y-%m-%d"
}
