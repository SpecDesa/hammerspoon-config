

local messages = require("hs.messages")
local myFunctions = require("myFunctions")

 hs.hotkey.bindSpec({ { "ctrl", "cmd", "alt" }, "h" },
    function()
      hs.notify.show("Hello World!", "Welcome to Hammerspoon", "")
      myFunctions.startFetch('+4521294197', 'https://secure.onreg.com/onreg2/bibexchange/?eventid=6087&language=us')
    end
  )

 hs.hotkey.bindSpec({ { "ctrl", "cmd", "alt" }, "r" }, hs.reload)
	
