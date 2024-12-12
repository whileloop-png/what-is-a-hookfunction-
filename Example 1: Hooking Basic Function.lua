local function add(a, b)
    return a + b
end

--//hooking..
local originalAdd = add --saving the original function
local hookedAdd; hookedAdd = hookfunction(add, function(a, b)
    print("adding numbers:", a, b)  --log input values
    return originalAdd(a, b) + 10  --modify result by adding 10
end)

print(hookedAdd(2, 3))  --output: adding numbers: 2 3 and then 15

--[[

    hookfunction(add, function(a, b)): We hook the add function, replacing it with our own version that logs the inputs and modifies the output.
    originalAdd(a, b): This calls the original add function after modifying the result (adding 10).

--]]
