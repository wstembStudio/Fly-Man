 -- full screan
love.window.setMode(1920, 1080) 

g_width = love.graphics.getWidth()
g_height = love.graphics.getHeight()

local margin = 13.5
local scaleX = 600
local power_size = 23

g_smallPower = {}
g_smallPower.size = power_size
g_smallPower.name = "Small Power"
g_smallPower.x = g_width - scaleX + (margin * 2 + g_smallPower.size * 2) * table.getn(g_powerTable)
g_smallPower.y = g_height - g_smallPower.size / 2 - margin
g_smallPower.img = love.graphics.newImage("image/down_arrow.png")
g_smallPower.price = 10
table.insert(g_powerTable, g_smallPower)

g_slowPower = {}
g_slowPower.size = power_size
g_slowPower.name = "Slow Power"
g_slowPower.x = g_width - scaleX + (margin * 2 + g_smallPower.size * 2) * table.getn(g_powerTable)
g_slowPower.y = g_height - g_slowPower.size / 2- margin
g_slowPower.img = love.graphics.newImage("image/slow.png")
g_slowPower.price = 12
table.insert(g_powerTable, g_slowPower)

g_freezePower = {}
g_freezePower.size = power_size
g_freezePower.name = "Freese Power"
g_freezePower.x = g_width - scaleX + (margin * 2 + g_smallPower.size * 2) * table.getn(g_powerTable)
g_freezePower.y = g_height - g_freezePower.size / 2- margin
g_freezePower.img = love.graphics.newImage("image/freeze.png")
g_freezePower.price = 14
table.insert(g_powerTable, g_freezePower)

g_healPower = {}
g_healPower.size = power_size
g_healPower.name = "Heal Power"
g_healPower.x = g_width - scaleX + (margin * 2 + g_smallPower.size * 2) * table.getn(g_powerTable)
g_healPower.y = g_height - g_healPower.size / 2 - margin
g_healPower.img = love.graphics.newImage("image/heal.png")
g_healPower.price = 16
table.insert(g_powerTable, g_healPower)

g_shieldPower = {}
g_shieldPower.name = "Shield Power"
g_shieldPower.size = power_size
g_shieldPower.x = g_width - scaleX + (margin * 2 + g_smallPower.size * 2) * table.getn(g_powerTable)
g_shieldPower.y = g_height - g_shieldPower.size / 2 - margin
g_shieldPower.img = love.graphics.newImage("image/shield.jpg")
g_shieldPower.price = 18
table.insert(g_powerTable, g_shieldPower)

g_speedPower = {}
g_speedPower.size = power_size
g_speedPower.name = "Speed Power"
g_speedPower.x = g_width - scaleX + (margin * 2 + g_smallPower.size * 2) * table.getn(g_powerTable)
g_speedPower.y = g_height - g_speedPower.size / 2 - margin
g_speedPower.img = love.graphics.newImage("image/speed.png")
g_speedPower.price = 20
table.insert(g_powerTable, g_speedPower)

g_clearPower = {}
g_clearPower.name = "Clear Power"
g_clearPower.size = power_size
g_clearPower.x = g_width - scaleX + (margin * 2 + g_clearPower.size * 2) * table.getn(g_powerTable)
g_clearPower.y = g_height - g_clearPower.size / 2 - margin
g_clearPower.img = love.graphics.newImage("image/clear.png")
g_clearPower.price = 22
table.insert(g_powerTable, g_clearPower)







