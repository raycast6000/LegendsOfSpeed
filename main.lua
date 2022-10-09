local orbTypes = {
    [1] = {
        action = "collectOrb",
        orbType = "Orange Orb",
        place = "City"
    },

    [2] = {
        action = "collectOrb",
        orbType = "Blue Orb",
        place = "City"
    },

    [3] = {
        action = "collectOrb",
        orbType = "Red Orb",
        place = "City"
    },

    [4] = {
        action = "collectOrb",
        orbType = "Gem",
        place = "City"
    }
}

local remote = game:GetService("ReplicatedStorage").rEvents.orbEvent

function getOrb(orbType)
    local a,o,p


    for i,v in pairs(orbTypes) do
        if v.orbType == orbType then
            a,o,p = v.action, v.orbType, v.place
            break
        end
    end

    return a,o,p
end

_G.Enabled = true
local sh = _G.Enabled
local time = 0.05

spawn(function ()
    while sh do
        wait(time)
        remote:FireServer(getOrb("Red Orb"))
        remote:FireServer(getOrb("Blue Orb"))
        remote:FireServer(getOrb("Orange Orb"))
        remote:FireServer(getOrb("Gem"))
    end
end)