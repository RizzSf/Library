# Webhooklib v1
Send Webhook library
## Booting the Library
```lua
local WebhookLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/RizzSf/Library/refs/heads/main/Library%20Source/WebhookLib.lua"), true)()
```
## Send Message
```lua
WebhookLib({
    Url = "https://discord.com/api/webhooks/xxx/yyy",
    Name = "Webhook Bot",
    Avatar = "https://example.com/avatar.png",
    Title = "This is Title",
    Content = "This is Contents!",
    Color = 0x00ff00
})
```

## Example
```lua
local P = game.Players.LocalPlayer

WebhookLib({
    Url = "https://discord.com/api/webhooks/xxx/yyy",
    Name = "User Logger",
    Avatar = "https://cdn.discordapp.com/attachments/1343369002965139531/1365430817807138957/IMG_9043.jpg?ex=68210e8b&is=681fbd0b&hm=8759634f4285ca0ded31648e25e8a35e0eb5c123082f479fcb1b0f01d0647e14&",
    Title = "Useing Script",
    Content = "User: "..P.DisplayName.." [ "..P.Name.." ]",
    Color = 0x00ff00
})
```
