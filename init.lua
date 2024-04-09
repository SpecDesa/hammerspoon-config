

local messages = require("hs.messages")
local myFunctions = require("myFunctions")

 hs.hotkey.bindSpec({ { "ctrl", "cmd", "alt" }, "h" },
    function()
      hs.notify.show("Hello World!", "Welcome to Hammerspoon", "")
      myFunctions.startFetch('+4512345678','url.com' 
    end
  )

 hs.hotkey.bindSpec({ { "ctrl", "cmd", "alt" }, "r" }, hs.reload)
	
