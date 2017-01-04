minetest.register_craftitem("mesecons_materials:slimeball", {
	image = "jeija_glue.png",
	on_place_on_ground = minetest.craftitem_place_item,
    	description="Slimeball",
})

minetest.register_craft({
	output = 'mesecons_materials:slimeball',
	type = "cooking",
	recipe = "default:sapling",
	cooktime = 10,
})

minetest.register_craft({
	output = 'mesecons_materials:slimeball 9',
	recipe = {{"default:slimeblock"}},
})

minetest.register_craft({
	output = "default:slimeblock",
	recipe = {{"mesecons_materials:slimeball","mesecons_materials:slimeball","mesecons_materials:slimeball",},
		{"mesecons_materials:slimeball","mesecons_materials:slimeball","mesecons_materials:slimeball",},
		{"mesecons_materials:slimeball","mesecons_materials:slimeball","mesecons_materials:slimeball",}},
})

minetest.register_alias("mesecons_materials:glue", "mesecons_materials:slimeball")
