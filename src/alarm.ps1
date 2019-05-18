param([float]$millisec)

write-output ("Hello, I'm an Alarm! bububububuuuuuu!!!")

$stopwatch = [System.Diagnostics.Stopwatch]::StartNew() # creates it and starts it
write-output("started")
[float]$elapsed = $stopwatch.elapsedmilliseconds
write-output("elapsed: $elapsed")
write-output("now counting down...")
while($elapsed -le $millisec){[float]$elapsed = $stopwatch.elapsedmilliseconds; $remainingBOX = ($millisec - $elapsed)/1440000; write-output("remaining BOX: $remainingBOX"); Start-Sleep -milliseconds 28}

# quit sequence
write-output ""
write-output "bip bip!"
write-output ""
$loop = 1
while($loop = 1){
  [console]::beep(864,200)
  #[console]::beep(432,200)
  Start-Sleep -milliseconds 576
}
cmd /c pause | out-null # wait for key-press
