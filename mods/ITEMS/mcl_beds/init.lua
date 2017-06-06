mcl_beds = {}
mcl_beds.player = {}
mcl_beds.pos = {}

mcl_beds.formspec = "size[8,15;true]" ..
	"bgcolor[#080808BB; true]" ..
	"button_exit[2,12;4,0.75;leave;Leave Bed]"

local modpath = minetest.get_modpath("mcl_beds")

-- Load files

dofile(modpath .. "/functions.lua")
dofile(modpath .. "/api.lua")
dofile(modpath .. "/beds.lua")
