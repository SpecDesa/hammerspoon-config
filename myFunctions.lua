
-- Kill in terminal with killall Hammerspoon

local http = require("socket.http")
local ltn12 = require("ltn12")
local socket = require("socket")

local url = "" -- Replace with the URL you want to watch
local lastContent = ""

local myFunctions = {}

local messages = require("hs.messages")

function myFunctions.fetchContent(url)
    local response = {}
    local result, status = http.request{
        url = url,
        sink = ltn12.sink.table(response)
    }
    return table.concat(response), status
end


function myFunctions.startFetch(phoneNumber, url) 
    hs.notify.show("From watcher", "Starter med at overvåge url: " .. url .. "!", "")

    local count = 1

    messages.iMessage(phoneNumber, "Hej! mit lille lua program tarter med at overvåge url: " .. url .. "!" )

    while true do
        local content, status = myFunctions.fetchContent(url)
        
        if lastContent == "" then
            lastContent = content 
        end
        
        if count % 200 == 0 then
            hs.notify.show("From watcher","Kører stadig - Watch => " .. url .. "!", "")
        end
        
        if status == 200 and content ~= lastContent and count ~= 1 then
            messages.iMessage(phoneNumber, "Skynd dig! Noget ændrede sig på siden: " .. url)
            hs.notify.show("From watcher","It changed. Go to => " .. url .. "!", "")
            lastContent = content
        end
        count = count + 1
        socket.sleep(5) -- Wait for n seconds
    end
end


return myFunctions





