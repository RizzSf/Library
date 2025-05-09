# Keylib v1
Key lib is still a work in progress and is not complete
## Booting the Library
```lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/RizzSf/Library/refs/heads/main/Library%20Source/KeySysLib.lua"))()
```
## Make Window
```lua
Library:MakeWindow({
    Key = "MySecretKey", -- Setting Key!
    Title = "Key System", -- Title
    Keylink = "https://example.com/getkey", -- getkey link
    ExecuteScript = function() -- Script to run if key is correct
        print("Key accepted! Running main script...")
    end
})
```
