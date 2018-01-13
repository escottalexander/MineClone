mesecon.rules = {}
mesecon.state = {}

mesecon.rules.default =
{{x=0,  y=0,  z=-1},
 {x=1,  y=0,  z=0},
 {x=-1, y=0,  z=0},
 {x=0,  y=0,  z=1},
 {x=0,  y=1,  z=0},
 {x=0,  y=-1, z=0},

 {x=1,  y=1,  z=0},
 {x=1,  y=-1, z=0},
 {x=-1, y=1,  z=0},
 {x=-1, y=-1, z=0},
 {x=0,  y=1,  z=1},
 {x=0,  y=-1, z=1},
 {x=0,  y=1,  z=-1},
 {x=0,  y=-1, z=-1}}

mesecon.rules.alldirs =
{{x= 1, y= 0,  z= 0},
 {x=-1, y= 0,  z= 0},
 {x= 0, y= 1,  z= 0},
 {x= 0, y=-1,  z= 0},
 {x= 0, y= 0,  z= 1},
 {x= 0, y= 0,  z=-1}}

mesecon.rules.pplate =
{{x = 1,  y = 0, z = 0},
 {x =-1,  y = 0, z = 0},
 {x = 0,  y = 1, z = 0},
 {x = 0,  y =-1, z = 0, spread = true},
 {x = 0,  y = 0, z = 1},
 {x = 0,  y = 0, z =-1}}

mesecon.rules.buttonlike =
{{x = 0,  y = 0, z =-1},
 {x = 0,  y = 0, z = 1},
 {x = 0,  y =-1, z = 0},
 {x = 0,  y = 1, z = 0},
 {x =-1,  y = 0, z = 0},
 {x = 1,  y = 0, z = 0, spread = true}}

mesecon.rules.flat =
{{x = 1, y = 0, z = 0},
 {x =-1, y = 0, z = 0},
 {x = 0, y = 0, z = 1},
 {x = 0, y = 0, z =-1}}

-- NOT IN ORIGNAL MESECONS
mesecon.rules.mcl_alldirs_spread =
{{x= 1, y= 0,  z= 0, spread = true},
 {x=-1, y= 0,  z= 0, spread = true},
 {x= 0, y= 1,  z= 0, spread = true},
 {x= 0, y=-1,  z= 0, spread = true},
 {x= 0, y= 0,  z= 1, spread = true},
 {x= 0, y= 0,  z=-1, spread = true}}

-- END OF UNOFFICIAL RULES

mesecon.rules.buttonlike_get = function(node)
	local rules = mesecon.rules.buttonlike
	local dir = minetest.facedir_to_dir(node.param2)
	if dir.x == 1 then
		-- No action needed
	elseif dir.z == -1 then
		rules=mesecon.rotate_rules_left(rules)
	elseif dir.x == -1 then
		rules=mesecon.rotate_rules_right(mesecon.rotate_rules_right(rules))
	elseif dir.z == 1 then
		rules=mesecon.rotate_rules_right(rules)
	elseif dir.y == -1 then
		rules=mesecon.rotate_rules_up(rules)
	elseif dir.y == 1 then
		rules=mesecon.rotate_rules_down(rules)
	end
	return rules
end

mesecon.state.on = "on"
mesecon.state.off = "off"
