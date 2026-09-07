import std/[os,strutils]

let BOT_TOKEN* = getEnv("DISCORD_TOKEN", "HERE_TOKEN")
let CHANNEL_ID* = getEnv("DISCORD_CHANNEL", "HERE_CHANEL")
