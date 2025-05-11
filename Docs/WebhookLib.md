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
