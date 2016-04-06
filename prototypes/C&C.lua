data:extend({
	  {
		type = "explosion",
		name = "low-power",
		flags = {"not-on-map"},
		animations =
		{
			{
				filename = "__Red Alerts__/graphics/null.png",
				priority = "low",
				width = 32,
				height = 32,
				frame_count = 1,
				line_length = 1,
				animation_speed = 1
			},
		},
		light = {intensity = 0, size = 0},
		sound =
		{
		  {
			filename = "__Red Alerts__/sound/C&C/lowpower.ogg",
			volume = 0.75
		  },
		},
	  },
	  {
		type = "explosion",
		name = "structure-destroyed",
		flags = {"not-on-map"},
		animations =
		{
			{
				filename = "__Red Alerts__/graphics/null.png",
				priority = "low",
				width = 32,
				height = 32,
				frame_count = 1,
				line_length = 1,
				animation_speed = 1
			},
		},
		light = {intensity = 0, size = 0},
		sound =
		{
		  {
			filename = "__Red Alerts__/sound/C&C/structuredestroyed.ogg",
			volume = 0.75
		  },
		},
	  },
	  {
		type = "explosion",
		name = "unit-lost",
		flags = {"not-on-map"},
		animations =
		{
			{
				filename = "__Red Alerts__/graphics/null.png",
				priority = "low",
				width = 32,
				height = 32,
				frame_count = 1,
				line_length = 1,
				animation_speed = 1
			},
		},
		light = {intensity = 0, size = 0},
		sound =
		{
		  {
			filename = "__Red Alerts__/sound/C&C/unitlost.ogg",
			volume = 0.75
		  },
		},
	  },
	  {
		type = "explosion",
		name = "reinforcements",
		flags = {"not-on-map"},
		animations =
		{
			{
				filename = "__Red Alerts__/graphics/null.png",
				priority = "low",
				width = 32,
				height = 32,
				frame_count = 1,
				line_length = 1,
				animation_speed = 1
			},
		},
		light = {intensity = 0, size = 0},
		sound =
		{
		  {
			filename = "__Red Alerts__/sound/C&C/reinforcements.ogg",
			volume = 0.75
		  },
		},
	  },
	}
)