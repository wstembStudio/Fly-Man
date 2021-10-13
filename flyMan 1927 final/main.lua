io.stdout:setvbuf('no')

if arg[#arg] == "-debug" then require("mobdebug").start() end

-- music
game1Music = love.audio.newSource("music/game1.mp3", "stream")
game2Music = love.audio.newSource("music/game2.mp3", "stream")
game3Music = love.audio.newSource("music/game3.mp3", "stream")
menuMusic = love.audio.newSource("music/menu.mp3", "stream")

-- effects
heroShotSound = love.audio.newSource("effects/heroShot.mp3", "static")
explosionSound = love.audio.newSource("effects/explosion.mp3", "static")
freezeSound = love.audio.newSource("effects/freeze.mp3", "static")
powerActivatedSound = love.audio.newSource("effects/powerActivated.mp3", "static")
damagedSound = love.audio.newSource("effects/damage.mp3", "static")

-- IMAGES

-- hero
heroImg = love.graphics.newImage("image/hero.png")

-- alien
t1_cityImg = love.graphics.newImage("image/t1_city.png")
t1_mountainImg = love.graphics.newImage("image/t1_mountain.png")
t1_iceImg = love.graphics.newImage("image/t1_ice.png")
t1_oceanImg = love.graphics.newImage("image/t1_ocean.png")
t1_asiaImg = love.graphics.newImage("image/t1_asia.png")
t1_desertImg = love.graphics.newImage("image/t1_desert.png")
t1_jungleImg = love.graphics.newImage("image/t1_jungle.png")

t2_cityImg = love.graphics.newImage("image/t2_city.png")
t2_mountainImg = love.graphics.newImage("image/t2_mountain.png")
t2_iceImg = love.graphics.newImage("image/t2_ice.png")
t2_oceanImg = love.graphics.newImage("image/t2_ocean.png")
t2_asiaImg = love.graphics.newImage("image/t2_asia.png")
t2_desertImg = love.graphics.newImage("image/t2_desert.png")
t2_jungleImg = love.graphics.newImage("image/t2_jungle.png")

t3_cityImg = love.graphics.newImage("image/t3_city.png")
t3_mountainImg = love.graphics.newImage("image/t3_mountain.png")
t3_iceImg = love.graphics.newImage("image/t3_ice.png")
t3_oceanImg = love.graphics.newImage("image/t3_ocean.png")
t3_asiaImg = love.graphics.newImage("image/t3_asia.png")
t3_desertImg = love.graphics.newImage("image/t3_desert.png")
t3_jungleImg = love.graphics.newImage("image/t3_jungle.png")

t4_cityImg = love.graphics.newImage("image/t4_city.png")
t4_mountainImg = love.graphics.newImage("image/t4_mountain.png")
t4_iceImg = love.graphics.newImage("image/t4_ice.png")
t4_oceanImg = love.graphics.newImage("image/t4_ocean.png")
t4_asiaImg = love.graphics.newImage("image/t4_asia.png")
t4_desertImg = love.graphics.newImage("image/t4_desert.png")
t4_jungleImg = love.graphics.newImage("image/t4_jungle.png")

boss_cityImg = love.graphics.newImage("image/boss_city.png")
boss_mountainImg = love.graphics.newImage("image/boss_mountain.png")
boss_iceImg = love.graphics.newImage("image/boss_ice.png")
boss_oceanImg = love.graphics.newImage("image/boss_ocean.png")
boss_asiaImg = love.graphics.newImage("image/boss_asia.png")
boss_desertImg = love.graphics.newImage("image/boss_desert.png")
boss_jungleImg = love.graphics.newImage("image/boss_jungle.png")

-- infos
xpImg = love.graphics.newImage("image/xp.jpg")

-- txt
logoImg = love.graphics.newImage("image/logo.png")
winImg = love.graphics.newImage("image/win.png")
loseImg = love.graphics.newImage("image/gameOver.png")
studioImg = love.graphics.newImage("image/logoWilliamStudio.png")

-- power
explosionImg = love.graphics.newImage("image/clear.png")
healImg = love.graphics.newImage("image/greenCross.png")

-- create the hero
g_hero = {}
g_hero.vx = 0
g_hero.vy = 0
g_hero.speed = 7
g_hero.width = 275
g_hero.height = 84
g_hero.hp = 40
g_hero.att = 2
g_hero.rangeAtt = 1
g_hero.x = 0
g_hero.y = 0

g_heroBulletTable = {}
g_alienBulletTable = {}
g_alienTable = {}
g_worldTable = {}
g_nbAlienTable = {}
g_powerTable = {}
g_freezeTable = {}
g_deadAlien = {}
g_greenCrossTable = {}
g_backGroundTable = {}

g_shootTimer = 0.4
g_shootTime = 0.4

g_alienShootTimer = 1
g_alienShootTime = 0

g_invincibleTimer = 2
g_invincibleTime = 0

g_alienHitTimer = 0.01
g_alienHitTime = 0

g_moveTimer = 10
g_stopTimer = 5
g_gameTime = 0

g_waveTime = 0
g_waveTimer = 45

g_powerTime = 0
g_powerTimer = 20

g_distanceTime = 0

g_shadowTime = 0
g_shadowTimer = 1
g_shadow = false

g_teleportTime = 0
g_teleportTimer = 3
g_teleport = false

g_deadTimer = 0.5
g_deadTime = 0

g_healTimer = 0.95
g_healTime = 0

g_menuTimer = 5
g_menuTime = 0

g_score = 0

g_xp = 0

g_nb = 0

g_invincible = false
g_alienHit = false
g_heroHit = false

g_alienStop = false

g_sartWave = true

g_powerActive = false

g_freeze = false
g_speed = false
g_shield = false
g_slow = false
g_small = false
g_heal = false

g_heroDead = false
g_heroWin = false

g_t9Stop = false

g_drawBackGround = true

g_cursorMusicWidth = 250
g_cursorEffectWidth = 250

-- BOSS
CITY_BOSS = 5
MOUNTAIN_BOSS = 6
ICE_BOSS = 7
OCEAN_BOSS = 8
ASIA_BOSS = 9
DESERT_BOSS = 10
JUNGLE_BOSS = 11

dofile("world.lua")
dofile("power.lua")

g_currentWorld = g_world1

g_gameStart = false
g_settings = false
g_menuStart = true

function love.load()
  -- full screan
  love.window.setMode(1920, 1080) 

  -- screen infos
  g_width = love.graphics.getWidth()
  g_height = love.graphics.getHeight()

  -- hero's position
  g_hero.x = g_width / 4
  g_hero.y = g_height / 2 - g_hero.height / 2

  CreateBackGround()
  CreateBackGround()
  
  love.mouse.setVisible(false)

  menuMusic:play()

end

function love.update(dt)
  
  menuMusic:setVolume(g_cursorMusicWidth / 500)
  game1Music:setVolume(g_cursorMusicWidth / 5000)
  game2Music:setVolume(g_cursorMusicWidth / 5000)
  game3Music:setVolume(g_cursorMusicWidth / 5000)

  heroShotSound:setVolume(g_cursorEffectWidth / 750)
  explosionSound:setVolume(g_cursorEffectWidth / 1500)
  freezeSound:setVolume(g_cursorEffectWidth / 500)
  powerActivatedSound:setVolume(g_cursorEffectWidth / 500)
  damagedSound:setVolume(g_cursorEffectWidth / 500)
  
  if g_menuStart == true then
    g_menuTime = g_menuTime + dt
    if g_menuTime >= g_menuTimer then
      g_menuStart = false
    end
  end

  if g_gameStart == false and g_heroDead == false and g_heroWin == false and g_menuStart == false then
    if love.keyboard.isDown("return") then
      g_gameStart = true
      menuMusic:stop()
    end
  end
  if g_gameStart == true then
    if game1Music == g_currentWorld.music then
      game3Music:stop()
      game2Music:stop()
      game1Music:play()
    elseif game2Music == g_currentWorld.music then
      game3Music:stop()
      game2Music:play()
      game1Music:stop()
    elseif game3Music == g_currentWorld.music then
      game3Music:play()
      game2Music:stop()
      game1Music:stop()
    end
  else
    game3Music:stop()
    game2Music:stop()
    game1Music:stop()
    menuMusic:play()
  end

local screen_border = 50

for i, world in ipairs(g_worldTable) do

  if g_currentWorld.number == world.number then

    g_currentWorld = world

    g_waveTimer = g_currentWorld.speed

    if g_gameStart == true then
      g_waveTime = g_waveTime + dt
      if g_waveTime >= g_waveTimer then
        g_sartWave = true
      end
    end

    if g_currentWorld.waves > 0 and g_sartWave == true and  g_gameStart == true then

      -- WORLD 1

      if g_currentWorld.waves == 4 and g_currentWorld.number == 1 then

        CreateAlien(1)
        CreateAlien(1)
        CreateAlien(0)
        CreateAlien(0)
        CreateAlien(0)
        CreateAlien(0)
        CreateAlien(1)
        CreateAlien(1)


      elseif g_currentWorld.waves == 3 and g_currentWorld.number == 1 then

        CreateAlien(0)
        CreateAlien(0)
        CreateAlien(1)
        CreateAlien(1)
        CreateAlien(1)
        CreateAlien(1)
        CreateAlien(0)
        CreateAlien(0)

      elseif g_currentWorld.waves == 2 and g_currentWorld.number == 1 then

        CreateAlien(0)
        CreateAlien(2)
        CreateAlien(0)
        CreateAlien(1)
        CreateAlien(1)
        CreateAlien(0)
        CreateAlien(2)
        CreateAlien(0)

      elseif g_currentWorld.waves == 1 and g_currentWorld.number == 1 then

        CreateAlien(CITY_BOSS)

        -- WORLD 2

      elseif g_currentWorld.waves == 5 and g_currentWorld.number == 2 then

        CreateAlien(1)
        CreateAlien(2)
        CreateAlien(0)
        CreateAlien(1)
        CreateAlien(1)
        CreateAlien(0)
        CreateAlien(2)
        CreateAlien(1)

      elseif g_currentWorld.waves == 4 and g_currentWorld.number == 2 then

        CreateAlien(0)
        CreateAlien(3)
        CreateAlien(3)
        CreateAlien(0)
        CreateAlien(0)
        CreateAlien(3)
        CreateAlien(3)
        CreateAlien(0)

      elseif g_currentWorld.waves == 3 and g_currentWorld.number == 2 then

        CreateAlien(1)
        CreateAlien(2)
        CreateAlien(3)
        CreateAlien(0)
        CreateAlien(0)
        CreateAlien(3)
        CreateAlien(2)
        CreateAlien(1)

      elseif g_currentWorld.waves == 2 and g_currentWorld.number == 2 then

        CreateAlien(1)
        CreateAlien(2)
        CreateAlien(3)
        CreateAlien(0)
        CreateAlien(0)
        CreateAlien(3)
        CreateAlien(2)
        CreateAlien(1)

      elseif g_currentWorld.waves == 1 and g_currentWorld.number == 2 then

        CreateAlien(MOUNTAIN_BOSS)

      elseif g_currentWorld.waves == 6 and g_currentWorld.number == 3 then

        CreateAlien(3)
        CreateAlien(1)
        CreateAlien(1)
        CreateAlien(0)
        CreateAlien(0)
        CreateAlien(1)
        CreateAlien(1)
        CreateAlien(3)

      elseif g_currentWorld.waves == 5 and g_currentWorld.number == 3 then

        CreateAlien(2)
        CreateAlien(2)
        CreateAlien(0)
        CreateAlien(1)
        CreateAlien(1)
        CreateAlien(0)
        CreateAlien(2)
        CreateAlien(2)

      elseif g_currentWorld.waves == 4 and g_currentWorld.number == 3 then

        CreateAlien(3)
        CreateAlien(0)
        CreateAlien(3)
        CreateAlien(0)
        CreateAlien(3)
        CreateAlien(0)
        CreateAlien(3)
        CreateAlien(0)

      elseif g_currentWorld.waves == 3 and g_currentWorld.number == 3 then

        CreateAlien(0)
        CreateAlien(1)
        CreateAlien(2)
        CreateAlien(3)
        CreateAlien(3)
        CreateAlien(2)
        CreateAlien(1)
        CreateAlien(0)

      elseif g_currentWorld.waves == 2 and g_currentWorld.number == 3 then

        CreateAlien(0)
        CreateAlien(4)
        CreateAlien(0)
        CreateAlien(0)
        CreateAlien(0)
        CreateAlien(0)
        CreateAlien(4)
        CreateAlien(0)

      elseif g_currentWorld.waves == 1 and g_currentWorld.number == 3 then

        CreateAlien(ICE_BOSS)

      elseif g_currentWorld.waves == 7 and g_currentWorld.number == 4 then

        CreateAlien(0)
        CreateAlien(3)
        CreateAlien(3)
        CreateAlien(2)
        CreateAlien(2)
        CreateAlien(3)
        CreateAlien(3)
        CreateAlien(0)

      elseif g_currentWorld.waves == 6 and g_currentWorld.number == 4 then

        CreateAlien(3)
        CreateAlien(1)
        CreateAlien(0)
        CreateAlien(2)
        CreateAlien(2)
        CreateAlien(0)
        CreateAlien(1)
        CreateAlien(3)

      elseif g_currentWorld.waves == 5 and g_currentWorld.number == 4 then

        CreateAlien(2)
        CreateAlien(3)
        CreateAlien(0)
        CreateAlien(1)
        CreateAlien(1)
        CreateAlien(0)
        CreateAlien(3)
        CreateAlien(2)

      elseif g_currentWorld.waves == 4 and g_currentWorld.number == 4 then

        CreateAlien(0)
        CreateAlien(4)
        CreateAlien(3)
        CreateAlien(0)
        CreateAlien(0)
        CreateAlien(3)
        CreateAlien(4)
        CreateAlien(0)

      elseif g_currentWorld.waves == 3 and g_currentWorld.number == 4 then

        CreateAlien(1)
        CreateAlien(1)
        CreateAlien(1)
        CreateAlien(1)
        CreateAlien(1)
        CreateAlien(1)
        CreateAlien(1)
        CreateAlien(1)

      elseif g_currentWorld.waves == 2 and g_currentWorld.number == 4 then

        CreateAlien(0)
        CreateAlien(4)
        CreateAlien(4)
        CreateAlien(0)
        CreateAlien(0)
        CreateAlien(4)
        CreateAlien(4)
        CreateAlien(0)

      elseif g_currentWorld.waves == 1 and g_currentWorld.number == 4 then

        CreateAlien(OCEAN_BOSS)

      elseif g_currentWorld.waves == 8 and g_currentWorld.number == 5 then

        CreateAlien(0)
        CreateAlien(2)
        CreateAlien(4)
        CreateAlien(1)
        CreateAlien(1)
        CreateAlien(4)
        CreateAlien(2)
        CreateAlien(0)

      elseif g_currentWorld.waves == 7 and g_currentWorld.number == 5 then

        CreateAlien(3)
        CreateAlien(0)
        CreateAlien(3)
        CreateAlien(3)
        CreateAlien(3)
        CreateAlien(3)
        CreateAlien(3)
        CreateAlien(3)

      elseif g_currentWorld.waves == 6 and g_currentWorld.number == 5 then

        CreateAlien(3)
        CreateAlien(3)
        CreateAlien(3)
        CreateAlien(3)
        CreateAlien(3)
        CreateAlien(3)
        CreateAlien(0)
        CreateAlien(3)

      elseif g_currentWorld.waves == 5 and g_currentWorld.number == 5 then

        CreateAlien(2)
        CreateAlien(2)
        CreateAlien(0)
        CreateAlien(1)
        CreateAlien(1)
        CreateAlien(0)
        CreateAlien(2)
        CreateAlien(2)

      elseif g_currentWorld.waves == 4 and g_currentWorld.number == 5 then

        CreateAlien(0)
        CreateAlien(4)
        CreateAlien(3)
        CreateAlien(4)
        CreateAlien(4)
        CreateAlien(3)
        CreateAlien(4)
        CreateAlien(0)

      elseif g_currentWorld.waves == 3 and g_currentWorld.number == 5 then

        CreateAlien(4)
        CreateAlien(2)
        CreateAlien(1)
        CreateAlien(3)
        CreateAlien(3)
        CreateAlien(1)
        CreateAlien(2)
        CreateAlien(4)

      elseif g_currentWorld.waves == 2 and g_currentWorld.number == 5 then

        CreateAlien(0)
        CreateAlien(4)
        CreateAlien(4)
        CreateAlien(2)
        CreateAlien(2)
        CreateAlien(4)
        CreateAlien(4)
        CreateAlien(0)

      elseif g_currentWorld.waves == 1 and g_currentWorld.number == 5 then

        CreateAlien(ASIA_BOSS)

      elseif g_currentWorld.waves == 9 and g_currentWorld.number == 6 then

        CreateAlien(1)
        CreateAlien(1)
        CreateAlien(1)
        CreateAlien(1)
        CreateAlien(1)
        CreateAlien(1)
        CreateAlien(1)
        CreateAlien(1)

      elseif g_currentWorld.waves == 8 and g_currentWorld.number == 6 then

        CreateAlien(2)
        CreateAlien(1)
        CreateAlien(2)
        CreateAlien(2)
        CreateAlien(2)
        CreateAlien(2)
        CreateAlien(1)
        CreateAlien(2)

      elseif g_currentWorld.waves == 7 and g_currentWorld.number == 6 then

        CreateAlien(3)
        CreateAlien(0)
        CreateAlien(3)
        CreateAlien(3)
        CreateAlien(3)
        CreateAlien(3)
        CreateAlien(0)
        CreateAlien(3)

      elseif g_currentWorld.waves == 6 and g_currentWorld.number == 6 then

        CreateAlien(3)
        CreateAlien(4)
        CreateAlien(3)
        CreateAlien(1)
        CreateAlien(1)
        CreateAlien(3)
        CreateAlien(4)
        CreateAlien(3)

      elseif g_currentWorld.waves == 5 and g_currentWorld.number == 6 then

        CreateAlien(4)
        CreateAlien(4)
        CreateAlien(0)
        CreateAlien(3)
        CreateAlien(3)
        CreateAlien(0)
        CreateAlien(4)
        CreateAlien(4)

      elseif g_currentWorld.waves == 4 and g_currentWorld.number == 6 then

        CreateAlien(0)
        CreateAlien(4)
        CreateAlien(3)
        CreateAlien(0)
        CreateAlien(0)
        CreateAlien(3)
        CreateAlien(4)
        CreateAlien(0)

      elseif g_currentWorld.waves == 3 and g_currentWorld.number == 6 then

        CreateAlien(4)
        CreateAlien(2)
        CreateAlien(0)
        CreateAlien(2)
        CreateAlien(2)
        CreateAlien(0)
        CreateAlien(2)
        CreateAlien(4)

      elseif g_currentWorld.waves == 2 and g_currentWorld.number == 6 then

        CreateAlien(1)
        CreateAlien(2)
        CreateAlien(4)
        CreateAlien(3)
        CreateAlien(3)
        CreateAlien(4)
        CreateAlien(2)
        CreateAlien(1)

      elseif g_currentWorld.waves == 1 and g_currentWorld.number == 6 then

        CreateAlien(DESERT_BOSS)

      elseif g_currentWorld.waves == 10 and g_currentWorld.number == 7 then

        CreateAlien(3)
        CreateAlien(3)
        CreateAlien(3)
        CreateAlien(3)
        CreateAlien(3)
        CreateAlien(3)
        CreateAlien(3)
        CreateAlien(3)

      elseif g_currentWorld.waves == 9 and g_currentWorld.number == 7 then

        CreateAlien(2)
        CreateAlien(2)
        CreateAlien(2)
        CreateAlien(2)
        CreateAlien(2)
        CreateAlien(2)
        CreateAlien(2)
        CreateAlien(2)

      elseif g_currentWorld.waves == 8 and g_currentWorld.number == 7 then

        CreateAlien(1)
        CreateAlien(1)
        CreateAlien(1)
        CreateAlien(1)
        CreateAlien(1)
        CreateAlien(1)
        CreateAlien(1)
        CreateAlien(1)

      elseif g_currentWorld.waves == 7 and g_currentWorld.number == 7 then

        CreateAlien(3)
        CreateAlien(4)
        CreateAlien(3)
        CreateAlien(4)
        CreateAlien(4)
        CreateAlien(3)
        CreateAlien(4)
        CreateAlien(3)

      elseif g_currentWorld.waves == 6 and g_currentWorld.number == 7 then

        CreateAlien(3)
        CreateAlien(4)
        CreateAlien(3)
        CreateAlien(2)
        CreateAlien(2)
        CreateAlien(3)
        CreateAlien(4)
        CreateAlien(3)

      elseif g_currentWorld.waves == 5 and g_currentWorld.number == 7 then

        CreateAlien(2)
        CreateAlien(4)
        CreateAlien(3)
        CreateAlien(3)
        CreateAlien(3)
        CreateAlien(3)
        CreateAlien(4)
        CreateAlien(2)

      elseif g_currentWorld.waves == 4 and g_currentWorld.number == 7 then

        CreateAlien(3)
        CreateAlien(4)
        CreateAlien(3)
        CreateAlien(3)
        CreateAlien(3)
        CreateAlien(3)
        CreateAlien(4)
        CreateAlien(3)

      elseif g_currentWorld.waves == 3 and g_currentWorld.number == 7 then

        CreateAlien(4)
        CreateAlien(4)
        CreateAlien(4)
        CreateAlien(4)
        CreateAlien(4)
        CreateAlien(4)
        CreateAlien(4)
        CreateAlien(4)

      elseif g_currentWorld.waves == 2 and g_currentWorld.number == 7 then

        CreateAlien(2)
        CreateAlien(2)
        CreateAlien(4)
        CreateAlien(3)
        CreateAlien(3)
        CreateAlien(4)
        CreateAlien(2)
        CreateAlien(2)

      elseif g_currentWorld.waves == 1 and g_currentWorld.number == 7 then

        CreateAlien(JUNGLE_BOSS)

      end

      g_waveTime = 0
      g_gameTime = 0
      g_sartWave = false
      g_alienStop = false
      g_currentWorld.waves = g_currentWorld.waves - 1
      g_nbAlienTable = {}

    end
  end
  if g_currentWorld.waves == 0 and g_sartWave == true and g_currentWorld.bossDead == true then
    g_currentWorld.number = g_currentWorld.number + 1
    g_currentWorld.bossDead = false
    if g_currentWorld.number > 7 then
      g_heroWin = true
    end
  end
end

-- move or stop alien 
if g_gameStart == true then
  g_gameTime = g_gameTime + dt
  if g_gameTime >= g_moveTimer and g_alienStop == false then
    g_alienStop = true
    g_gameTime = 0
  end
  if g_alienStop == true then
    if g_gameTime >= g_stopTimer then
      g_alienStop = false
      g_gameTime = 0
    end
  end

  g_distanceTime = g_distanceTime + dt

  g_shadowTime = g_shadowTime + dt
  if g_shadowTime >= g_shadowTimer and g_shadow == false then
    g_shadow = true
    g_shadowTime = 0
  elseif g_shadowTime >= g_shadowTimer and g_shadow == true then
    g_shadow = false
    g_shadowTime = 0
  end

  g_teleportTime = g_teleportTime + dt
  if g_teleportTime >= g_teleportTimer then
    g_teleport = true
    g_teleportTime = 0
  else
    g_teleport = false
  end

  if table.getn(g_deadAlien) > 0 then
    g_deadTime = g_deadTime + dt
    if g_deadTime >= g_deadTimer then
      table.remove(g_deadAlien, 1 )
      g_deadTime = 0
    end
  end

  if g_heal == true then
    g_healTime = g_healTime + dt
    if g_healTime >= g_healTimer then
      CreateGreenCross()
      g_hero.hp = g_hero.hp + 1
      g_healTime = 0
    end
  end
end

-- hero dead ?
if g_hero.hp <= 0 then
  g_heroDead = true
end

if g_heroDead == true then
  g_alienTable = {}
  g_gameStart = false
end

if g_heroWin == true then
  g_alienTable = {}
  g_gameStart = false
end

-- aliens dead ?
for i, alien in ipairs (g_alienTable) do
  if alien.hp <= 0 then
    if alien.type > 4 then
      g_currentWorld.bossDead = true
    end
    if g_powerActive == false then
      g_xp = g_xp + alien.xp
      g_score = g_score + alien.score
      table.insert(g_deadAlien, alien)
      table.remove(g_alienTable, i)
      explosionSound:stop()
      explosionSound:play()
    else
      g_score = g_score + alien.score
      table.insert(g_deadAlien, alien)
      table.remove(g_alienTable, i)
      explosionSound:stop()
      explosionSound:play()
    end
  end
  if alien.x + alien.size < 0 then
    if alien.type > 4 then
      g_heroDead = true
      table.remove(g_alienTable, i)
    else
      table.remove(g_alienTable, i)
    end
  end
end

-- avoid hero to go out of the screen
if g_hero.x > g_width - g_hero.width then 
  g_hero.x = g_width - g_hero.width  
  g_hero.vx = 0
end
if g_hero.x < 0 then 
  g_hero.x = 0
  g_hero.vx = 0
end
if g_hero.y > g_height - g_hero.height - screen_border then 
  g_hero.y = g_height - g_hero.height - screen_border
  g_hero.vy = 0
end
if g_hero.y < 0 + screen_border then 
  g_hero.y = 0 + screen_border
  g_hero.vy = 0
end

-- check if hero is on the border
if (g_hero.y >= g_height - screen_border - g_hero.height) or (g_hero.y <= 0 + screen_border ) then
  if g_invincible == false and g_shield == false then
    g_hero.hp = g_hero.hp - 2
    damagedSound:play()
    g_invincible = true
  end
end

-- remove bullet
for i, bullet in ipairs(g_heroBulletTable) do
  if bullet.x > g_width - bullet.width then 
    table.remove(g_heroBulletTable, i)
  end
end
for i, bullet in ipairs(g_alienBulletTable) do
  if bullet.x < 0 then 
    table.remove(g_alienBulletTable, i)
  end
end

-- HERO MOVE
if g_gameStart == true then
  -- up
  if love.keyboard.isDown("z") or love.keyboard.isDown("up") then
    g_hero.vy = g_hero.vy - (g_hero.speed * dt)
  end
  -- down
  if love.keyboard.isDown("s") or love.keyboard.isDown("down") then
    g_hero.vy = g_hero.vy + (g_hero.speed * dt)
  end
  -- left
  if love.keyboard.isDown("q") or love.keyboard.isDown("left") then
    g_hero.vx = g_hero.vx - (g_hero.speed * dt)
  end
  -- right
  if love.keyboard.isDown("d") or love.keyboard.isDown("right") then
    g_hero.vx = g_hero.vx + (g_hero.speed * dt)
  end
end

-- HERO SHOT
g_shootTime = g_shootTime + dt
if g_shootTime > g_shootTimer then
  shot = true
else
  shot = false
end

-- power time
if g_powerActive == true then
  g_powerTime = g_powerTime + dt
  if g_powerTime >= g_powerTimer then
    g_powerActive = false
    if g_slow == true then
      ResetPower("slow")
    elseif g_small == true then
      ResetPower("small")
    elseif g_speed == true then
      ResetPower("speed")
    elseif g_shield == true then
      ResetPower("shield")
    elseif g_freeze == true then
      ResetPower("freeze")
    elseif g_heal == true then
      ResetPower("heal")
    end
    g_powerTime = 0
  end
end

-- reset power
function ResetPower(power)
  if power == "small" then
    powerActivatedSound:play()
    g_hero.height = 84
    g_hero.width = 275
    g_small = false
  elseif power == "slow" then
    for i, alien in ipairs(g_alienTable) do
      alien.vx = alien.vx * 2
      alien.vy = alien.vy * 2
    end
    for i, alienBullet in ipairs(g_alienBulletTable) do
      alienBullet.vx = alienBullet.vx * 2
    end
    g_alienShootTimer = g_alienShootTimer * 2
    g_slow = false
  elseif power == "shield" then
    g_shield = false
  elseif power == "speed" then
    g_hero.vx = g_hero.vx / 2
    g_hero.vy = g_hero.vy / 2
    for i, heroBullet in ipairs(g_heroBulletTable) do
      heroBullet.vx = heroBullet.vx / 2
    end
    g_shootTimer = g_shootTimer * 3
    g_speed = false
  elseif power == "freeze" then
    g_freeze = false
  elseif power == "heal" then
    g_heal = false
  end
end

-- small power
if love.keyboard.isDown("1") then
  if g_xp >= g_smallPower.price and g_powerActive == false then
    powerActivatedSound:play()
    g_powerActive = true
    g_xp = g_xp - g_smallPower.price
    g_small = true
    g_hero.height = g_hero.height / 5 
    g_hero.width = g_hero.width / 5
  end
end

-- slow power
if love.keyboard.isDown("2") then
  if g_xp >= g_slowPower.price and g_powerActive == false then
    g_powerActive = true
    g_xp = g_xp - g_slowPower.price
    g_slow = true
    for i, alien in ipairs(g_alienTable) do
      alien.vx = alien.vx / 2
      alien.vy = alien.vy / 2
    end
    for i, alienBullet in ipairs(g_alienBulletTable) do
      alienBullet.vx = alienBullet.vx / 2
    end
    g_alienShootTimer = g_alienShootTimer / 2
  end
end

-- freeze power
if love.keyboard.isDown("3") then
  if g_xp >= g_freezePower.price and g_powerActive == false then
    freezeSound:play()
    g_powerActive = true
    g_xp = g_xp - g_freezePower.price
    g_freeze = true
  end
end

-- heal power
if love.keyboard.isDown("4") then
  if g_xp >= g_healPower.price and g_powerActive == false then
    g_powerActive = true
    g_xp = g_xp - g_healPower.price
    g_heal = true
  end
end

-- shield power
if love.keyboard.isDown("5") then
  if g_xp >= g_shieldPower.price and g_powerActive == false then
    g_powerActive = true
    g_xp = g_xp - g_shieldPower.price
    g_shield = true
  end
end

-- speed power
if love.keyboard.isDown("6") then
  if g_xp >= g_speedPower.price and g_powerActive == false then
    g_powerActive = true
    g_speed = true
    g_xp = g_xp - g_speedPower.price
    g_hero.vx = g_hero.vx * 2
    g_hero.vy = g_hero.vy * 2
    for i, heroBullet in ipairs(g_heroBulletTable) do
      heroBullet.vx = heroBullet.vx * 2
    end
    g_shootTimer = g_shootTimer / 3
  end
end

-- clear power
if love.keyboard.isDown("7") then
  if g_xp >= g_clearPower.price and g_powerActive == false then
    g_powerActive = true
    g_xp = g_xp - g_clearPower.price
    for i, alien in ipairs(g_alienTable) do 
      alien.hp = alien.hp - 4
    end
  end
end

if g_gameStart == true then
  if shot == true and g_invincible == false and g_shield == false then
    if love.keyboard.isDown("space") or love.mouse.isDown(1) then
      heroShotSound:stop()
      heroShotSound:play()
      -- create bullet 
      g_heroBullet = {}
      g_heroBullet.width = 40
      g_heroBullet.height = 10
      g_heroBullet.x = g_hero.x + g_hero.width - g_heroBullet.width
      g_heroBullet.y = g_hero.y + g_hero.height / 2 - g_heroBullet.height / 2
      g_heroBullet.vx = 25
      g_heroBullet.vy = 0
      g_heroBullet.speed = 0
      table.insert(g_heroBulletTable, g_heroBullet)
      g_shootTime = 0
    end
  end
end

-- gravity
if g_gameStart == true then
  g_hero.vy = g_hero.vy + (0.6 * dt)
  if g_bullet ~= nil and g_bullet.vy ~= nil then
    g_bullet.vy = g_bullet.vy + (0.6 * dt)
  end
end

-- speed limit
if g_speed == true then
  g_speed_limit = 12
else
  g_speed_limit = 8
end
if math.abs(g_hero.vx) > g_speed_limit then
  if g_hero.vx > 0 then
    g_hero.vx = g_speed_limit
  else
    g_hero.vx = -g_speed_limit
  end
end
if math.abs(g_hero.vy) > g_speed_limit then
  if g_hero.vy > 0 then
    g_hero.vy = g_speed_limit
  else
    g_hero.vy = -g_speed_limit
  end
end

-- move the hero
if g_gameStart == true then
  g_hero.x = g_hero.x + g_hero.vx
  g_hero.y = g_hero.y + g_hero.vy

  -- move hero bullet
  for i, bullet in ipairs(g_heroBulletTable) do
    bullet.x = bullet.x + bullet.vx
    bullet.y = bullet.y + bullet.vy
  end

  -- move alien bullet
  for i, bullet in ipairs(g_alienBulletTable) do
    bullet.x = bullet.x - bullet.vx
    bullet.y = bullet.y - bullet.vy
  end

  -- move alien
  for i, alien in ipairs(g_alienTable) do
    if g_freeze == false then
      if (g_alienStop == false and alien.type < 5) or (alien.type >= 5 and alien.type ~= ICE_BOSS and alien.type ~= ASIA_BOSS) then 
        alien.x = alien.x + alien.vx 
        alien.y = alien.y + alien.vy
      end
      if (g_alienStop == false and alien.type == ICE_BOSS) or (g_t9Stop == false and alien.type == ASIA_BOSS) then
        alien.x = alien.x + alien.vx 
      end
      if (g_alienStop == true and alien.type == ICE_BOSS) or (g_t9Stop == true and alien.type == ASIA_BOSS) then
        alien.y = alien.y + alien.vy
      end 
    end
  end

  -- alien shot
  g_alienShootTime = g_alienShootTime + dt
  if g_alienShootTime >= g_alienShootTimer then
    for i, alien in ipairs(g_alienTable) do
      if alien.rangeAtt > 0 and g_freeze == false and alien.type < ICE_BOSS then
        g_alienBullet = {}
        g_alienBullet.width = 40
        g_alienBullet.height = 10
        g_alienBullet.x = alien.x
        g_alienBullet.y = alien.y + alien.size / 2 - g_alienBullet.height / 2
        g_alienBullet.vx = 25
        g_alienBullet.vy = 0
        g_alienBullet.speed = 0
        g_alienBullet.att = alien.rangeAtt
        table.insert(g_alienBulletTable, g_alienBullet)
        g_alienShootTime = 0
      end
      if alien.rangeAtt > 0 and g_freeze == false then
        if alien.type == ICE_BOSS or alien.type == DESERT_BOSS  or alien.type == JUNGLE_BOSS then
          g_alienBullet = {}
          g_alienBullet.width = 40
          g_alienBullet.height = 10
          g_alienBullet.x = alien.x
          g_alienBullet.y = alien.y + alien.size * 1/3 - g_alienBullet.height / 2
          g_alienBullet.vx = 25
          g_alienBullet.vy = 0
          g_alienBullet.speed = 0
          g_alienBullet.att = alien.rangeAtt
          table.insert(g_alienBulletTable, g_alienBullet)
          g_alienBullet = {}
          g_alienBullet.width = 40
          g_alienBullet.height = 10
          g_alienBullet.x = alien.x
          g_alienBullet.y = alien.y + alien.size * 2/3 - g_alienBullet.height / 2
          g_alienBullet.vx = 25
          g_alienBullet.vy = 0
          g_alienBullet.speed = 0
          g_alienBullet.att = alien.rangeAtt
          table.insert(g_alienBulletTable, g_alienBullet)
          g_alienShootTime = 0
        end
      end
      if alien.rangeAtt > 0 and g_freeze == false and alien.type == ASIA_BOSS then
        g_alienBullet = {}
        g_alienBullet.width = 40
        g_alienBullet.height = 10
        g_alienBullet.x = alien.x
        g_alienBullet.y = alien.y + alien.size * 1/4 - g_alienBullet.height / 2
        g_alienBullet.vx = 25
        g_alienBullet.vy = 0
        g_alienBullet.speed = 0
        g_alienBullet.att = alien.rangeAtt
        table.insert(g_alienBulletTable, g_alienBullet)
        g_alienBullet = {}
        g_alienBullet.width = 40
        g_alienBullet.height = 10
        g_alienBullet.x = alien.x
        g_alienBullet.y = alien.y + alien.size * 1/2 - g_alienBullet.height / 2
        g_alienBullet.vx = 25
        g_alienBullet.vy = 0
        g_alienBullet.speed = 0
        g_alienBullet.att = alien.rangeAtt
        table.insert(g_alienBulletTable, g_alienBullet)
        g_alienBullet = {}
        g_alienBullet.width = 40
        g_alienBullet.height = 10
        g_alienBullet.x = alien.x
        g_alienBullet.y = alien.y + alien.size * 3/4 - g_alienBullet.height / 2
        g_alienBullet.vx = 25
        g_alienBullet.vy = 0
        g_alienBullet.speed = 0
        g_alienBullet.att = alien.rangeAtt
        table.insert(g_alienBulletTable, g_alienBullet)
        g_alienShootTime = 0
      end
    end
  end
end


-- collision hero bullet/alien
for i, alien in ipairs(g_alienTable) do
  for i, heroBullet in ipairs(g_heroBulletTable) do
    x1=heroBullet.x
    y1=heroBullet.y
    w1=heroBullet.width
    h1=heroBullet.height
    x2=alien.x 
    y2=alien.y 
    w2=alien.size 
    h2=alien.size 
    collision = CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
    if (collision == true) then
      table.remove(g_heroBulletTable, i)
      if g_alienHit == false then
        alien.hp = alien.hp - g_hero.rangeAtt
        g_alienHit = true
      end
    end
    if g_alienHit == true then
      g_alienHitTime = g_alienHitTime + dt
      if g_alienHitTime >= g_alienHitTimer then
        g_alienHit = false
        g_alienHitTime = 0
      end
    end
  end
end

-- collision alien bullet/hero
for i, alienBullet in ipairs(g_alienBulletTable) do
  x1=alienBullet.x
  y1=alienBullet.y
  w1=alienBullet.width
  h1=alienBullet.height
  x2=g_hero.x 
  y2=g_hero.y 
  w2=g_hero.width 
  h2=g_hero.height 
  collision = CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  if (collision == true) and g_invincible == false and g_shield == false then
    table.remove(g_alienBulletTable, i)
    g_hero.hp = g_hero.hp - alienBullet.att
    damagedSound:play()
    g_invincible = true
  end
end

-- collision hero/alien
for i, alien in ipairs(g_alienTable) do
  x1=g_hero.x
  y1=g_hero.y
  w1=g_hero.width
  h1=g_hero.height
  x2=alien.x 
  y2=alien.y 
  w2=alien.size 
  h2=alien.size 
  collision = CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  if (collision == true) and g_invincible == false and g_shield == false then
    g_hero.hp = g_hero.hp - alien.att
    alien.hp = alien.hp - g_hero.att
    if alien.att == 0 and g_invincible == false then
      g_invincible = false
    elseif alien.att ~= 0 then
      damagedSound:play()
      g_invincible = true
    end
  elseif (collision == true) and g_invincible == false and g_shield == true then
    if alien.type < 5 then
      table.remove(g_alienTable, i)
    end
  end
end
if g_invincible == true then
  g_invincibleTime = g_invincibleTime + dt
  if g_invincibleTime >= g_invincibleTimer then
    g_invincible = false
    g_invincibleTime = 0
  end
end

-- move BOSS
for i, alien in ipairs(g_alienTable) do
  if alien.type == CITY_BOSS then -- BOSS bounce in Y
    if alien.y >= g_height - screen_border - alien.size then
      alien.vy = 0 - alien.vy
    elseif alien.y <= 0 + screen_border then
      alien.vy = 0 - alien.vy
    end
  elseif alien.type == MOUNTAIN_BOSS or alien.type == OCEAN_BOSS then -- move like a wave
    if alien.y >= g_height * 3/4 - alien.size  then
      alien.vy = 0 - alien.vy
      alien.vx = alien.vx - 0.1
    elseif alien.y <= 0 + g_height * 1/4 then
      alien.vy = 0 - alien.vy
      alien.vx = alien.vx - 0.1
    end
  elseif alien.type == ICE_BOSS then -- stop 2 times and move in Y
    if g_alienStop == true then
      if alien.y >= g_height - screen_border - alien.size then
        alien.vy = 0 - alien.vy
      elseif alien.y <= 0 + screen_border then
        alien.vy = 0 - alien.vy
      end
    end
  elseif alien.type == ASIA_BOSS then -- stop and move in Y and move foreward
    if alien.x <= g_width - alien.size * 3/2 and g_nb == 0 then
      g_t9Stop = true
    end
    if alien.y >= g_height - screen_border - alien.size then
      alien.vy = 0 - alien.vy
      g_nb = g_nb + 1
    elseif alien.y <= 0 + screen_border then
      alien.vy = 0 - alien.vy
      g_nb = g_nb + 1
    end
    if g_nb == 4 then
      g_t9Stop = false
      alien.vx = alien.vx * 10
    end
  elseif alien.type == DESERT_BOSS then -- follow player Y
    alien.y = g_hero.y + g_hero.height / 2 - alien.size / 2
  elseif alien.type == JUNGLE_BOSS then -- stop and move in Y and move foreward
    if g_teleport == true then
      alien.y = math.random(screen_border , g_height - screen_border - alien.size)
    end
  end
end
-- move background
for i, backGround in ipairs(g_backGroundTable) do
  backGround.x = backGround.x - 3
  if backGround.x <= - g_width then
    table.remove(g_backGroundTable, i)
  end
  if table.getn(g_backGroundTable) == 1 then
    CreateBackGround()
  end
end
end

function CreateAlien(alienType)
  local screen_border = 75
  local margin = 120
  local offsetY = margin * table.getn(g_nbAlienTable)

  if alienType == 0 then
    alien0 = {}
    alien0.x = -5
    alien0.vx = 0
    alien0.vy = 0
    alien0.speed = 0
    alien0.size = 0
    alien0.hp = 1
    alien0.att = 0
    alien0.rangeAtt = 0
    alien0.type = 0
    alien0.xp = 0
    alien0.score = 0

    alien0.y = screen_border + offsetY
    table.insert(g_alienTable, alien0)
    table.insert(g_nbAlienTable, alien0)
  end
  if alienType == 1 then
    alien1 = {}
    alien1.x = g_width
    alien1.vx = - 1.75
    alien1.vy = 0
    alien1.speed = 0
    alien1.size = 80
    alien1.hp = 2
    alien1.att = 2
    alien1.rangeAtt = 0
    alien1.type = 1
    alien1.xp = 1
    alien1.score = 100
    if g_currentWorld.number == 1 then
      alien1.img = t1_cityImg
    elseif g_currentWorld.number == 2 then
      alien1.img = t1_mountainImg
    elseif g_currentWorld.number == 3 then
      alien1.img = t1_iceImg
    elseif g_currentWorld.number == 4 then
      alien1.img = t1_oceanImg
    elseif g_currentWorld.number == 5 then
      alien1.img = t1_asiaImg
    elseif g_currentWorld.number == 6 then
      alien1.img = t1_desertImg
    elseif g_currentWorld.number == 7 then
      alien1.img = t1_jungleImg
    end

    alien1.y = screen_border + offsetY
    table.insert(g_alienTable, alien1)
    table.insert(g_nbAlienTable, alien1)
  end
  if alienType == 2 then
    alien2 = {}
    alien2.x = g_width
    alien2.vx = - 1.75
    alien2.vy = 0
    alien2.speed = 0
    alien2.size = 70
    alien2.hp = 1
    alien2.att = 0
    alien2.rangeAtt = 3
    alien2.type = 2
    alien2.xp = 2
    alien2.score = 200
    if g_currentWorld.number == 1 then
      alien2.img = t2_cityImg
    elseif g_currentWorld.number == 2 then
      alien2.img = t2_mountainImg
    elseif g_currentWorld.number == 3 then
      alien2.img = t2_iceImg
    elseif g_currentWorld.number == 4 then
      alien2.img = t2_oceanImg
    elseif g_currentWorld.number == 5 then
      alien2.img = t2_asiaImg
    elseif g_currentWorld.number == 6 then
      alien2.img = t2_desertImg
    elseif g_currentWorld.number == 7 then
      alien2.img = t2_jungleImg
    end

    alien2.y = screen_border + offsetY
    table.insert(g_alienTable, alien2)
    table.insert(g_nbAlienTable, alien2)
  end
  if alienType == 3 then
    alien3 = {}
    alien3.x = g_width
    alien3.vx = - 1.17
    alien3.vy = 0
    alien3.speed = 0
    alien3.size = 90
    alien3.hp = 4
    alien3.att = 2
    alien3.rangeAtt = 0
    alien3.type = 3
    alien3.xp = 3
    alien3.score = 300
    if g_currentWorld.number == 1 then
      alien3.img = t3_cityImg
    elseif g_currentWorld.number == 2 then
      alien3.img = t3_mountainImg
    elseif g_currentWorld.number == 3 then
      alien3.img = t3_iceImg
    elseif g_currentWorld.number == 4 then
      alien3.img = t3_oceanImg
    elseif g_currentWorld.number == 5 then
      alien3.img = t3_asiaImg
    elseif g_currentWorld.number == 6 then
      alien3.img = t3_desertImg
    elseif g_currentWorld.number == 7 then
      alien3.img = t3_jungleImg
    end

    alien3.y = screen_border + offsetY
    table.insert(g_alienTable, alien3)
    table.insert(g_nbAlienTable, alien3)
  end
  if alienType == 4 then
    alien4 = {}
    alien4.x = g_width 
    alien4.vx = - 3.5
    alien4.vy = 0
    alien4.speed = 0
    alien4.size = 60
    alien4.hp = 2
    alien4.att = 0
    alien4.rangeAtt = 4
    alien4.type = 4
    alien4.xp = 4
    alien4.score = 400
    if g_currentWorld.number == 1 then
      alien4.img = t4_cityImg
    elseif g_currentWorld.number == 2 then
      alien4.img = t4_mountainImg
    elseif g_currentWorld.number == 3 then
      alien4.img = t4_iceImg
    elseif g_currentWorld.number == 4 then
      alien4.img = t4_oceanImg
    elseif g_currentWorld.number == 5 then
      alien4.img = t4_asiaImg
    elseif g_currentWorld.number == 6 then
      alien4.img = t4_desertImg
    elseif g_currentWorld.number == 7 then
      alien4.img = t4_jungleImg
    end

    alien4.y = screen_border + offsetY
    table.insert(g_alienTable, alien4)
    table.insert(g_nbAlienTable, alien4)
  end
  if alienType == CITY_BOSS then
    alien5 = {}
    alien5.x = g_width
    alien5.vx = - 1
    alien5.vy = 1
    alien5.speed = 0
    alien5.size = 400
    alien5.hp = 20
    alien5.att = 5
    alien5.rangeAtt = 5
    alien5.type = 5
    alien5.xp = 10
    alien5.score = 1000
    alien5.img = boss_cityImg

    alien5.y = g_height / 2 - alien5.size / 2
    table.insert(g_alienTable, alien5)
    table.insert(g_nbAlienTable, alien5)
  end
  if alienType == MOUNTAIN_BOSS then
    alien6 = {}
    alien6.x = g_width
    alien6.vx = - 0.3
    alien6.vy = 1.75
    alien6.speed = 0
    alien6.size = 350
    alien6.hp = 20
    alien6.att = 6
    alien6.rangeAtt = 6
    alien6.type = 6
    alien6.xp = 12
    alien6.score = 1200
    alien6.img = boss_mountainImg

    alien6.y = g_height / 2 - alien6.size / 2
    table.insert(g_alienTable, alien6)
    table.insert(g_nbAlienTable, alien6)
  end
  if alienType == ICE_BOSS then
    alien7 = {}
    alien7.x = g_width
    alien7.vx = - 1.2
    alien7.vy = - 2
    alien7.speed = 0
    alien7.size = 325
    alien7.hp = 20
    alien7.att = 7
    alien7.rangeAtt = 7
    alien7.type = 7
    alien7.xp = 14
    alien7.score = 1400
    alien7.img = boss_iceImg

    alien7.y = g_height / 2 - alien7.size / 2
    table.insert(g_alienTable, alien7)
    table.insert(g_nbAlienTable, alien7)
  end
  if alienType == OCEAN_BOSS then
    alien8 = {}
    alien8.x = g_width
    alien8.vx = - 0.6
    alien8.vy = 1.8
    alien8.speed = 0
    alien8.size = 200 
    alien8.hp = 20
    alien8.att = 8
    alien8.rangeAtt = 8
    alien8.type = 8
    alien8.xp = 16
    alien8.score = 1600
    alien8.img = boss_oceanImg

    alien8.y = g_height / 2 - alien8.size / 2
    table.insert(g_alienTable, alien8)
    table.insert(g_nbAlienTable, alien8)
  end
  if alienType == ASIA_BOSS then
    alien9 = {}
    alien9.x = g_width
    alien9.vx = - 2.5
    alien9.vy = 1
    alien9.speed = 0
    alien9.size = 450
    alien9.hp = 20
    alien9.att = 9
    alien9.rangeAtt = 9
    alien9.type = 9
    alien9.xp = 18
    alien9.score = 1800
    alien9.img = boss_asiaImg

    alien9.y = g_height / 2 - alien9.size / 2
    table.insert(g_alienTable, alien9)
    table.insert(g_nbAlienTable, alien9)
  end
  if alienType == DESERT_BOSS then
    alien10 = {}
    alien10.x = g_width
    alien10.vx = - 1.2
    alien10.vy = 0
    alien10.speed = 0
    alien10.size = 350
    alien10.hp = 20
    alien10.att = 10
    alien10.rangeAtt = 10
    alien10.type = 10
    alien10.xp = 20
    alien10.score = 2000
    alien10.img = boss_desertImg

    alien10.y = g_height / 2 - alien10.size / 2
    table.insert(g_alienTable, alien10)
    table.insert(g_nbAlienTable, alien10)
  end
  if alienType == JUNGLE_BOSS then
    alien11 = {}
    alien11.x = g_width
    alien11.vx = - 1 
    alien11.vy = 0
    alien11.speed = 2
    alien11.size = 350 
    alien11.hp = 20
    alien11.att = 12
    alien11.rangeAtt = 12
    alien11.type = 11
    alien11.xp = 22
    alien11.score = 2200
    alien11.img = boss_jungleImg

    alien11.y = g_height / 2 - alien11.size / 2
    table.insert(g_alienTable, alien11)
    table.insert(g_nbAlienTable, alien11)
  end
end
function CreateGreenCross()
-- create green cross
  g_greenCross = {}
  g_greenCross.img = healImg
  g_greenCross.x = math.random(g_hero.x , g_hero.x + g_hero.width)
  g_greenCross.y = g_hero.y
  g_greenCross.size = 0.1
  table.insert(g_greenCrossTable, g_greenCross)
end
function CreateBackGround()
  -- create backGround
  g_backGround = {}
  g_backGround.x = table.getn(g_backGroundTable) * g_width
  g_backGround.y = 50
  g_backGround.img = g_currentWorld.img
  table.insert(g_backGroundTable, g_backGround)
end

function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
  x2 < x1+w1 and
  y1 < y2+h2 and
  y2 < y1+h1
end
function CalculateScore()
  g_distance = g_distanceTime 
  g_distance = g_distance * 28.2
  g_distance = g_distance + g_score
  return g_distance
end
function love.keypressed(key, scancode, isrepeat)
  if key == "escape" then
    if g_settings == false then
      g_settings = true
      love.mouse.setVisible(true)
    else
      g_settings = false
      love.mouse.setVisible(false)
    end
  end
end
function love.draw()
  if g_menuStart == true then
    love.graphics.setColor(1,1,1)
    love.graphics.draw(studioImg, g_width / 2, g_height / 2, 0, 1, 1, studioImg:getWidth() / 2, studioImg:getHeight() / 2)
  end
  if g_gameStart == true then
    -- draw screen border
    local border_width = g_width
    local border_height = 50
    if g_drawBackGround == true then
      for i, backGround in ipairs(g_backGroundTable) do
        love.graphics.setColor(1,1,1)
        love.graphics.draw(backGround.img, backGround.x, backGround.y)
      end
    end
    love.graphics.setColor(0.1,0.1,0.1)
    love.graphics.rectangle("fill", 0, 0, border_width, border_height)
    love.graphics.rectangle("fill", 0, g_height - border_height, border_width, border_height)

    -- draw hero bullet
    love.graphics.setColor(1,0,0)
    for i, bullet in ipairs(g_heroBulletTable) do
      love.graphics.rectangle("fill", bullet.x, bullet.y, bullet.width, bullet.height)
    end

    -- draw alien bullet
    love.graphics.setColor(0,1,0)
    for i, bullet in ipairs(g_alienBulletTable) do
      love.graphics.rectangle("fill", bullet.x, bullet.y, bullet.width, bullet.height)
    end

    -- draw alien
    for i, alien in ipairs(g_alienTable) do
      love.graphics.setColor(1,1,1,1)
      if alien.img ~= nil then
        if alien.type == 1 then
          love.graphics.draw(alien.img, alien.x, alien.y, 0, 0.16, 0.16)
        elseif alien.type == 2 then
          love.graphics.draw(alien.img, alien.x, alien.y, 0, 0.14, 0.14)
        elseif alien.type == 3 then
          love.graphics.draw(alien.img, alien.x, alien.y, 0, 0.18, 0.18)
        elseif alien.type == 4 then
          love.graphics.draw(alien.img, alien.x, alien.y, 0, 0.12, 0.12)
        elseif alien.type == CITY_BOSS then
          love.graphics.draw(alien.img, alien.x, alien.y, 0, 0.8, 0.8)
        elseif alien.type == MOUNTAIN_BOSS then
          love.graphics.draw(alien.img, alien.x, alien.y, 0, 0.7, 0.7)
        elseif alien.type == ICE_BOSS then
          love.graphics.draw(alien.img, alien.x, alien.y, 0, 0.65, 0.65)
        elseif alien.type == OCEAN_BOSS and g_shadow == false then
          love.graphics.draw(alien.img, alien.x, alien.y, 0, 0.4, 0.4)
        elseif alien.type == ASIA_BOSS then
          love.graphics.draw(alien.img, alien.x, alien.y, 0, 0.9, 0.9)
        elseif alien.type == DESERT_BOSS then
          love.graphics.draw(alien.img, alien.x, alien.y, 0, 0.7, 0.7)
        elseif alien.type == JUNGLE_BOSS then
          love.graphics.draw(alien.img, alien.x, alien.y, 0, 0.7, 0.7)
        end
        love.graphics.setColor(0,0,0,1)
        --love.graphics.print(alien.hp, alien.x, alien.y)
        if g_freeze == true then
          love.graphics.setColor(180/255,207/255,250/255,0.75)
          love.graphics.rectangle("fill", alien.x, alien.y, alien.size, alien.size)
        end
      end
    end

    -- draw explosion
    for i, alien in ipairs(g_deadAlien) do
      love.graphics.setColor(1,1,1,1)
      love.graphics.draw(explosionImg, alien.x, alien.y, (alien.size * 0.002), (alien.size * 0.002))
    end

    -- draw green cross
    if g_heal == true then
      for i, greenCross in ipairs(g_greenCrossTable) do
        love.graphics.setColor(1,1,1,1)
        love.graphics.draw(greenCross.img, greenCross.x, greenCross.y , 0, greenCross.size, greenCross.size)
        greenCross.y = greenCross.y -3
      end
    end

    -- draw hero
    if g_invincible == false then
      love.graphics.setColor(1,1,1,1)
    else 
      love.graphics.setColor(1,0,0,0.5)
    end
    if g_heroDead == false then
      love.graphics.draw(heroImg, g_hero.x, g_hero.y, 0, g_hero.width/275, g_hero.height/83)
    end

    -- draw shield
    if g_shield == true then
      love.graphics.setColor(0,0,1,0.25)
      love.graphics.circle("fill", g_hero.x + g_hero.width / 2, g_hero.y + g_hero.height / 2, g_hero.width / 1.9)
    end

    -- draw power
    for i, power in ipairs(g_powerTable) do
      local power_size = 23
      love.graphics.setColor(1,1,1,1)
      love.graphics.circle("fill", power.x, power.y, power.size)
      love.graphics.setColor(1,1,1,1)
      love.graphics.print(power.price, power.x - 35, power.y + 11, 0, 1, 1)
      if power.name == "Small Power" then
        love.graphics.draw(power.img, power.x, power.y, 0, 0.085, 0.085, power.img:getWidth() / 2, power.img:getHeight() / 2)
      elseif power.name == "Slow Power" then
        love.graphics.draw(power.img, power.x, power.y, 0, 0.22, 0.22, power.img:getWidth() / 2, power.img:getHeight() / 2)
      elseif power.name == "Freese Power" then
        love.graphics.draw(power.img, power.x, power.y - 2, 0, 0.3, 0.3, power.img:getWidth() / 2, power.img:getHeight() / 2)
      elseif power.name == "Speed Power" then
        love.graphics.draw(power.img, power.x, power.y - 5, 0, 0.11, 0.12, power.img:getWidth() / 2, power.img:getHeight() / 2)
      elseif power.name == "Heal Power" then
        love.graphics.draw(power.img, power.x, power.y, 0, 0.22, 0.22, power.img:getWidth() / 2, power.img:getHeight() / 2)
      elseif power.name == "Shield Power" then
        love.graphics.draw(power.img, power.x, power.y, 0, 0.095, 0.095, power.img:getWidth() / 2, power.img:getHeight() / 2)
      elseif power.name == "Clear Power" then
        love.graphics.draw(power.img, power.x, power.y, 0, 0.1, 0.1, power.img:getWidth() / 2, power.img:getHeight() / 2)
      end
    end

    -- print infos
    local margin = 10
    love.graphics.setColor(1,1,1)
    love.graphics.print("Lifes:".." "..g_hero.hp, margin ,margin, 0, 1.5, 1.5)
    love.graphics.print("Distance:".." "..math.ceil(CalculateScore()), g_width - 200, margin, 0, 1.5, 1.5)
    love.graphics.print(g_currentWorld.name.." - ".."World:".." ".."N°"..g_currentWorld.number.." - ".."Waves:".." ".."N°"..g_currentWorld.waves.."/"..g_currentWorld.Twaves - 1, margin, g_height - margin * 3 , 0, 1.5, 1.5)
    local wave_time = g_waveTimer - g_waveTime
    if g_currentWorld.waves ~= 0 then
      love.graphics.print("Next wave:".." "..math.ceil(wave_time), g_width / 2 - 100, margin, 0, 1.5, 1.5)
    else 
      love.graphics.print("Next wave:".." ".."KILL THE BOSS", g_width / 2 - 100, margin, 0, 1.5, 1.5)
    end
    love.graphics.setColor(1,1,1)
    love.graphics.draw(xpImg, g_width - margin * 5, g_height - margin * 5, 0, 0.095, 0.095)
    if g_xp < 10 then
      love.graphics.print(g_xp, g_width - margin * 7, g_height - margin * 3, 0, 1.5, 1.5)
    elseif g_xp < 100 then
      love.graphics.print(g_xp, g_width - margin * 8, g_height - margin * 3, 0, 1.5, 1.5)
    elseif g_xp >= 100 then
      love.graphics.print(g_xp, g_width - margin * 9, g_height - margin * 3, 0, 1.5, 1.5)
    end
    local power_time = g_powerTimer - g_powerTime
    if g_powerActive == false then
      power_time = 0
    end
    love.graphics.print("Power time:".." "..math.ceil(power_time), g_width / 2 - 100, g_height - margin * 3, 0, 1.5, 1.5)

elseif g_gameStart == false and g_heroDead == false and g_heroWin == false and g_menuStart == false then
    love.graphics.setColor(1,1,1)
    love.graphics.setColor(1,1,1)
    love.graphics.draw(logoImg, g_width / 2, g_height / 2, 0, 2, 2, logoImg:getWidth()/2, logoImg:getHeight()/2)
    love.graphics.setColor(1,1,0)
    love.graphics.print("Edited by William Studio", g_width - 200, g_height - 20)
  end
  if g_heroDead == true then
    love.graphics.setColor(1,1,1)
    love.graphics.draw(loseImg, g_width / 2, g_height / 2, 0, 2, 2, loseImg:getWidth()/2, loseImg:getHeight()/2)
    love.graphics.print("You died in the world N°"..g_currentWorld.number.." ".."your score is:"..math.ceil(CalculateScore()), 0, 0, 0, 3, 3)
  end
  if g_heroWin == true then
    love.graphics.setColor(1,1,1)
    love.graphics.draw(winImg, g_width / 2, g_height / 2, 0, 2, 2, winImg:getWidth()/2, winImg:getHeight()/2)
    love.graphics.print("Your score is:"..math.ceil(CalculateScore()), 0, 0, 0, 3, 3)
  end
  if g_settings == true then
    local mx = love.mouse.getX() 
    local my = love.mouse.getY() 
    local setting_width = 800
    local setting_height = 600
    
    local cursor_width = 500
    local cursor_height = 50
    
    local cursorMusicX = g_width / 2 - cursor_width / 2
    local cursorMusicY =  g_height / 2 - setting_height / 2 + cursor_height * 3
    
    local cursorEffectX = g_width / 2 - cursor_width / 2
    local cursorEffectY = g_height / 2 - setting_height / 2 + cursor_height * 6
    
    local cursorBackGroundX = g_width / 2 - cursor_width / 2
    local cursorBackGroundY = g_height / 2 - setting_height / 2 + cursor_height * 9
    
    local hotMusic
    local hotEffect
    local hotBackGround
    
    love.graphics.setColor(0.5,0.5,0.5)
    love.graphics.rectangle("fill", g_width / 2 - setting_width / 2, g_height / 2 - setting_height / 2, setting_width, setting_height)
    love.graphics.setColor(1,0,0)
    love.graphics.rectangle("line", g_width / 2 - setting_width / 2, g_height / 2 - setting_height / 2, setting_width, setting_height)
    
    love.graphics.setColor(1,1,1)
    love.graphics.print("Music Volume:", g_width / 2 - cursor_width / 2, g_height / 2 - setting_height / 2 + cursor_height * 2, 0, 2, 2)
    love.graphics.print("Effect Volume:", g_width / 2 - cursor_width / 2, g_height / 2 - setting_height / 2 + cursor_height * 5, 0, 2, 2)
    love.graphics.print("Draw BackGround:", g_width / 2 - cursor_width / 2, g_height / 2 - setting_height / 2 + cursor_height * 8, 0, 2, 2)
    
    love.graphics.setColor(0.5,0,0)
    love.graphics.rectangle("fill", cursorMusicX, cursorMusicY, g_cursorMusicWidth, cursor_height)
    love.graphics.rectangle("line", cursorMusicX, cursorMusicY, cursor_width, cursor_height)
    
    love.graphics.rectangle("fill", cursorEffectX, cursorEffectY, g_cursorEffectWidth, cursor_height)
    love.graphics.rectangle("line", cursorEffectX, cursorEffectY, cursor_width, cursor_height)
    
    if g_drawBackGround == true then
      love.graphics.rectangle("fill", cursorBackGroundX, cursorBackGroundY, cursor_width, cursor_height)
    end
    love.graphics.rectangle("line", cursorBackGroundX, cursorBackGroundY, cursor_width, cursor_height)
    
    -- hot music
    if mx >= cursorMusicX and mx <= cursorMusicX + cursor_width then
      if my >= cursorMusicY and my <= cursorMusicY + cursor_height then
        hotMusic = true
      end
    end
    
    -- hot music
    if mx >= cursorEffectX and mx <= cursorEffectX + cursor_width then
      if my >= cursorEffectY and my <= cursorEffectY + cursor_height then
        hotEffect = true
      end
    end
    
    -- hot music
    if mx >= cursorBackGroundX and mx <= cursorBackGroundX + cursor_width then
      if my >= cursorBackGroundY and my <= cursorBackGroundY + cursor_height then
        hotBackGround = true
      end
    end
    
    if hotMusic == true then
      g_cursorMusicWidth = mx - cursorMusicX
    end
    
    if hotEffect == true then
      g_cursorEffectWidth = mx - cursorEffectX
    end
    
    if hotBackGround == true then
      if g_drawBackGround == true then
        g_drawBackGround = false
      elseif g_drawBackGround == false then
        g_drawBackGround = true
      end
    end
    
  end
end