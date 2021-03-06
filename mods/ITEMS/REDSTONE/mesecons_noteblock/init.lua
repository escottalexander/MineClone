minetest.register_node("mesecons_noteblock:noteblock", {
	description = "Note Block",
	_doc_items_longdesc = "A note block is a musical block which plays one of many musical notes and different intruments when it is punched or supplied with redstone power.",
	_doc_items_usagehelp = [[Rightclick the note block to choose the next musical note (there are 24 half notes, or 2 octaves). The intrument played depends on the material of the block below the note block:

• Glass: Sticks
• Wood: Bass guitar
• Stone: Bass drum
• Sand or gravel: Snare drum
• Anything else: Piano

The note block will only play a note when it is below air, otherwise, it stays silent.]],
	tiles = {"mesecons_noteblock.png"},
	groups = {handy=1,axey=1, material_wood=1},
	is_ground_content = false,
	place_param2 = 0,
	on_rightclick = function (pos, node) -- change sound when rightclicked
		node.param2 = (node.param2+1)%24
		mesecon.noteblock_play(pos, node.param2)
		minetest.set_node(pos, node)
	end,
	on_punch = function (pos, node) -- play current sound when punched
		mesecon.noteblock_play(pos, node.param2)
	end,
	sounds = mcl_sounds.node_sound_wood_defaults(),
	mesecons = {effector = { -- play sound when activated
		action_on = function (pos, node)
			mesecon.noteblock_play(pos, node.param2)
		end,
		rules = mesecon.rules.alldirs,
	}},
	_mcl_blast_resistance = 4,
	_mcl_hardness = 0.8,
})

minetest.register_craft({
	output = '"mesecons_noteblock:noteblock" 1',
	recipe = {
		{"group:wood", "group:wood", "group:wood"},
		{"group:wood", "mesecons:redstone", "group:wood"},
		{"group:wood", "group:wood", "group:wood"},
	}
})

minetest.register_craft({
	type = "fuel",
	recipe = "mesecons_noteblock:noteblock",
	burntime = 15
})

local soundnames_piano = {
	[0] = "mesecons_noteblock_c",
	"mesecons_noteblock_csharp",
	"mesecons_noteblock_d",
	"mesecons_noteblock_dsharp",
	"mesecons_noteblock_e",
	"mesecons_noteblock_f",
	"mesecons_noteblock_fsharp",
	"mesecons_noteblock_g",
	"mesecons_noteblock_gsharp",
	"mesecons_noteblock_a",
	"mesecons_noteblock_asharp",
	"mesecons_noteblock_b",

	"mesecons_noteblock_c2",
	"mesecons_noteblock_csharp2",
	"mesecons_noteblock_d2",
	"mesecons_noteblock_dsharp2",
	"mesecons_noteblock_e2",
	"mesecons_noteblock_f2",
	"mesecons_noteblock_fsharp2",
	"mesecons_noteblock_g2",
	"mesecons_noteblock_gsharp2",
	"mesecons_noteblock_a2",
	"mesecons_noteblock_asharp2",
	"mesecons_noteblock_b2",

}

mesecon.noteblock_play = function (pos, param2)
	local block_above_name = minetest.get_node({x=pos.x, y=pos.y+1, z=pos.z}).name
	if block_above_name ~= "air" then
		-- Don't play sound if no air is above
		return
	end

	-- Default: One of 24 piano notes
	local soundname = soundnames_piano[param2]

	local block_below_name = minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name

	if minetest.get_item_group(block_below_name, "material_glass") ~= 0 then
		-- TODO: 24 sticks and clicks
		soundname="mesecons_noteblock_temp_stick"
	elseif minetest.get_item_group(block_below_name, "material_wood") ~= 0 then
		-- TODO: 24 bass guitar sounds
		soundname="mesecons_noteblock_temp_bass_guitar"
	elseif minetest.get_item_group(block_below_name, "material_sand") ~= 0 then
		-- TODO: 24 snare drum sounds
		soundname="mesecons_noteblock_temp_snare"
	elseif minetest.get_item_group(block_below_name, "material_stone") ~= 0 then
		-- TODO: 24 bass drum sounds
		soundname="mesecons_noteblock_temp_kick"
	end
	minetest.sound_play(soundname,
	{pos = pos, gain = 1.0, max_hear_distance = 48,})
end
