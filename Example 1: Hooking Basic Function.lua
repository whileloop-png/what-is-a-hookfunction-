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
