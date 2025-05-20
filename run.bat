$batchContent = @"
@echo off
java -cp ".;lib/*" com.soundconverter.Main
pause
"@

$batchContent | Out-File -FilePath "C:\SoundConverter\run.bat" -Encoding UTF8