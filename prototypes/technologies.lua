data:extend({
 {
  type = "technology",
  name = "alert-systems",
  icon = "__Red Alerts__/graphics/AlertSystems.png",
  icon_size = 128,
  prerequisites = {"circuit-network"},
  effects =
  {
   {
    type = "unlock-recipe",
    recipe = "power-sensor"
   },
  },
  unit =
    {
      count = 40,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 15
    },
  order = "a-d-e",
 },
})