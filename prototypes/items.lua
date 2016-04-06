data:extend({
	{
	type = "item",
	name = "power-sensor",
	icon = "__Red Alerts__/graphics/PowerSensorIcon.png",
	flags = {"goes-to-quickbar"},
    place_result = "power-sensor",
	subgroup = "circuit-network",
	order = "b[combinators]-c[sensor]",
	stack_size = 1,
	},
})