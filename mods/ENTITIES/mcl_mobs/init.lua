
local path = minetest.get_modpath(minetest.get_current_modname())

-- Mob API
dofile(path .. "/api.lua")

-- Rideable Mobs
dofile(path .. "/mount.lua")

-- Mob Items
dofile(path .. "/crafts.lua")

minetest.log("action", "[MOD] Mobs Redo: MineClone 2 Edition loaded")
