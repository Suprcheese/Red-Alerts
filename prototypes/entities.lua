if lowPowerWarning then
data:extend({
  {
    type = "accumulator",
    name = "power-sensor",
    icon = "__Red Alerts__/graphics/PowerSensorIcon.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "power-sensor"},
    max_health = 100,
    corpse = "small-remnants",
    collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    energy_source =
    {
      type = "electric",
      buffer_capacity = "15J",
      usage_priority = "terciary",
      input_flow_limit = "1W",
      output_flow_limit = "1W"
    },
    picture =
    {
      filename = "__Red Alerts__/graphics/PowerSensorBase.png",
      priority = "extra-high",
      width = 47,
      height = 29,
      shift = {0.0, -0.0}
    },
    charge_animation =
    {
		filename = "__Red Alerts__/graphics/PowerSensorGreen.png",
		width = 47,
		height = 29,
		line_length = 1,
		frame_count = 1,
		shift = {0.0, -0.0},
		animation_speed = 0
    },
    charge_cooldown = 600,
    charge_light = {intensity = 0.5, size = 4, color={r=0.592157, g=1, b=0.117647}},
    discharge_animation =
    {
		filename = "__Red Alerts__/graphics/PowerSensorYellow.png",
		width = 47,
		height = 29,
		line_length = 1,
		frame_count = 1,
		shift = {0.0, -0.0},
		animation_speed = 0
    },
    discharge_cooldown = 60,
    discharge_light = {intensity = 0.5, size = 4, color={r=0.815686, g=0.670588, b=0.431373}},
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/accumulator-working.ogg",
        volume = 0
      },
      idle_sound = {
        filename = "__base__/sound/accumulator-idle.ogg",
        volume = 0
      },
      max_sounds_per_type = 0
    },
  },
}
)
end