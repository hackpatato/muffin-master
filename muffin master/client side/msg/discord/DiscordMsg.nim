import std/[strutils, httpclient, os ,osproc]

var lastmessageID = ""
proc send_discord_message(client: HttpClient, content: string)=
  let url = "https://discord.com/api/v10/channels/" & CHANNEL_ID & "/messages"
  client.headers = newHttpHeaders({
    "Authorization": "Bot " & BOT_TOKEN,
    "Content-Type": "application/json"
  })

  let encrypted = 
