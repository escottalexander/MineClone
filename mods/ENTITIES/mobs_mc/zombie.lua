--MCmobs v0.2
--maikerumine
--made for MC like Survival game
--License for code WTFPL and otherwise stated in readmes

local zombie = {
	type = "monster",
	hp_min = 20,
	hp_max = 20,
	collisionbox = {-0.5, -0.01, -0.5, 0.5, 1.99, 0.5},
	textures = {
	{"mobs_zombie.png"}
	},
	visual = "mesh",
	mesh = "mobs_zombie.x",
	makes_footstep_sound = true,
	sounds = {
		random = "zombie1",
		death = "zombiedeath",
		damage = "zombiehurt1",
		attack = "default_punch3",
	},
	walk_velocity = .8,
	run_velocity = 1.6,
	damage = 3,
	fear_height = 8,
	pathfinding = true,
	jump = true,
	jump_height = 1.25,
	group_attack = true,
	drops = {
		{name = "mcl_mobitems:rotten_flesh",
		chance = 1,
		min = 0,
		max = 2,},
		{name = "mcl_core:iron_ingot",
		-- approximation to 8.5%
		chance = 11,
		min = 1,
		max = 1,},
		{name = "mcl_core:shovel_iron",
		-- approximation to 8.5%
		chance = 11,
		min = 1,
		max = 1,},
		{name = "mcl_core:sword_iron",
		-- approximation to 8.5%
		chance = 11,
		min = 1,
		max = 1,},
		{name = "mcl_farming:carrot_item",
		-- approximation to 8.5%
		chance = 11,
		min = 1,
		max = 1,},
		{name = "mcl_farming:potato_item",
		-- approximation to 8.5%
		chance = 11,
		min = 1,
		max = 1,},
		-- TODO: Remove this drop when record discs are properly dropped
		{name = "mcl_jukebox:record_8",
		chance = 150,
		min = 1,
		max = 1,},
	},
	animation = {
		speed_normal = 24,
		speed_run = 48,
		stand_start = 0,
		stand_end = 23,
		walk_start = 24,
		walk_end = 47,
		run_start = 48,
		run_end = 62,
		hurt_start = 64,
		hurt_end = 86,
		death_start = 88,
		death_end = 118,
	},
	drawtype = "front",
	lava_damage = minetest.registered_nodes["mcl_core:lava_source"].damage_per_second,
	-- TODO: Burn mob only when in direct sunlight
	light_damage = 1,
	view_range = 40,
	attack_type = "dogfight",
}


mobs:register_mob("mobs_mc:zombie", zombie)

-- Baby Zombie.
-- A smaller and more dangerous variant of the zombie

local baby = table.copy(zombie)
baby.collisionbox = {-0.25, -0.01, -0.25, 0.25, 0.94, 0.25}
baby.visual_size = {x=0.5, y=0.5}
baby.walk_velocity = 1.2
baby.run_velocity = 2.4
baby.light_damage = 0

mobs:register_mob("mobs_mc:baby_zombie", baby)


-- Spawning

mobs:register_spawn("mobs_mc:zombie", {"group:solid"}, 7, -1, 5000, 4, 31000)
-- Baby zombie is 20 times less likely than regular zombies
mobs:register_spawn("mobs_mc:baby_zombie", {"group:solid"}, 7, -1, 100000, 4, 31000)


-- Compatibility
mobs:alias_mob("mobs:zombie", "mobs_mc:zombie")

-- Spawn eggs
mobs:register_egg("mobs_mc:zombie", "Spawn Zombie", "spawn_egg_zombie.png")
mobs:register_egg("mobs_mc:baby_zombie", "Spawn Baby Zombie", "spawn_egg_baby_zombie.png")


if minetest.setting_get("log_mods") then
	minetest.log("action", "MC Zombie loaded")
end
