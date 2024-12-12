local RepStorage = game:GetService("ReplicatedStorage")
local event = RepStorage:WaitForChild("HookableEvent")

-- Hooking the FireServer function
local originalFireServer = event.FireServer
local hookedFireServer = hookfunction(event.FireServer, function(self, ...)
    print("HookableEvent is being fired with arguments:", ...)
    return originalFireServer(self, ...)  --call the original function with the same arguments
end)

event:FireServer("stack", "OverFlow")  --output: HookableEvent is being fired with arguments: stack OverFlow

--[[

    hookfunction(event.FireServer, function(self, ...)): This replaces the FireServer function of HookableEvent with a custom function that logs the arguments before calling the original FireServer.
    The originalFireServer(self, ...) part ensures the event still fires after logging the arguments.

--]]
