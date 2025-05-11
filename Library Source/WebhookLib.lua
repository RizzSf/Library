--[[
 ____      ____      __       __                     __        _____      _   __        
|_  _|    |_  _|    [  |     [  |                   [  |  _   |_   _|    (_) [  |       
  \ \  /\  / /.---.  | |.--.  | |--.   .--.    .--.  | | / ]    | |      __   | |.--.   
   \ \/  \/ // /__\\ | '/'`\ \| .-. |/ .'`\ \/ .'`\ \| '' <     | |   _ [  |  | '/'`\ \ 
    \  /\  / | \__., |  \__/ || | | || \__. || \__. || |`\ \   _| |__/ | | |  |  \__/ | 
     \/  \/   '.__.'[__;.__.'[___]|__]'.__.'  '.__.'[__|  \_] |________|[___][__;.__.'
]]
return function(Settings)
    local HttpService = game:GetService("HttpService")
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer

    local request = http_request or syn and syn.request or request or HttpPost
    local url = Settings.Url

    local userId = LocalPlayer.UserId
    local username = LocalPlayer.Name
    local displayName = LocalPlayer.DisplayName

    local data = {
        ["username"] = Settings.Name or username,
        ["avatar_url"] = Settings.Avatar or ("https://www.roblox.com/headshot-thumbnail/image?userId="..userId.."&width=420&height=420&format=png"),
        ["embeds"] = {{
            ["title"] = Settings.Title or "No Title",
            ["description"] = Settings.Content or "No Content",
            ["type"] = "rich",
            ["color"] = Settings.Color or 0x3498db,
            ["footer"] = {
                ["text"] = "Sent by: " .. displayName .. " [" .. username .. "] | " .. os.date("%Y-%m-%d %H:%M:%S")
            }
        }}
    }

    local body = HttpService:JSONEncode(data)

    local success, err = pcall(function()
        request({
            Url = url,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = body
        })
    end)

    if not success then
        warn("[Webhook Error]: " .. tostring(err))
    end
end
