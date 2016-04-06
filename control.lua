require "util"
require "defines"
require ("config")

script.on_init(function() On_Init() end)
script.on_configuration_changed(function() On_Init() end)

function On_Init()
	if not global.ticks then
		global.ticks = {}
	end
	if not global.power_sensors then
		global.power_sensors = {}
	end
	if not global.connected then
		global.connected = {}
	end
	for i, force in pairs(game.forces) do
		global.ticks[force.name] = game.tick + minTicksBetweenAlerts
	end
	for i, player in ipairs(game.players) do
		global.connected[player.index] = player.connected
	end
end

script.on_event(defines.events.on_forces_merging, function(event)
	if global.ticks[event.source.name] then
		table.remove(global.ticks, event.source.name)
	end
end)

script.on_event(defines.events.on_player_created, function(event)
	local player = game.players[event.player_index]
	if (playerJoinedGameAlert == false) or (player.force.technologies["alert-systems"].researched == false) then
		return
	end
	playSoundForForce("reinforcements", player.force)
	global.ticks[player.force.name] = event.tick + minTicksBetweenAlerts
	global.connected[player.index] = player.connected
end)

function findSensor(sensor)
	for i,s in ipairs(global.power_sensors) do
		if s == sensor then
			return i
		end
	end
	return false
end

script.on_event(defines.events.on_entity_died, function(event)
	if event.entity.type == "tree" or event.entity.type == "simple-entity" or event.entity.type == "land-mine" or event.entity.type == "unit" or event.entity.type == "unit-spawner" then
		return
	end
	if event.entity.name == "power_sensor" then
		local i = findSensor(event.entity)
		if i then
			table.remove(global.power_sensors, i)
		end
	end
	if (global.ticks[event.entity.force.name] and global.ticks[event.entity.force.name] > event.tick) or (event.entity.force.technologies["alert-systems"].researched == false) then
		return
	end
	if event.entity.type == "car" or event.entity.type == "cargo-wagon" or event.entity.type == "combat-robot" or event.entity.type == "construction-robot" or event.entity.type == "locomotive" or event.entity.type == "logistic-robot" or event.entity.type == "player" then
		if unitLostAlert then
			playSoundForForce("unit-lost", event.entity.force)
			global.ticks[event.entity.force.name] = event.tick + minTicksBetweenAlerts
		end
		return
	else
		if structureDestroyedAlert then
			playSoundForForce("structure-destroyed", event.entity.force)
			global.ticks[event.entity.force.name] = event.tick + minTicksBetweenAlerts
		end
		return
	end
end)

script.on_event(defines.events.on_tick, function(event)
	if game.tick % 60 == 4 then
		if playerJoinedGameAlert then
			for i, player in ipairs(game.players) do
				if global.connected[player.index] == false and player.connected == true then
					for i, p in ipairs(player.force.players) do
						if p.connected and p.index ~= player.index and player.force.technologies["alert-systems"].researched == true then
							playSoundForPlayer("reinforcements", p)
						end
					end
					global.ticks[player.force.name] = event.tick + minTicksBetweenAlerts
					global.connected[player.index] = player.connected
				end
				if global.connected[player.index] == true and player.connected == false then
					global.connected[player.index] = false
				end
			end
		end
		if lowPowerWarning then
			for i, sensor in pairs(global.power_sensors) do
				if (sensor.energy < 1) and (global.ticks[sensor.force.name] and global.ticks[sensor.force.name] < event.tick) then
					playSoundForForce("low-power", sensor.force)
					global.ticks[sensor.force.name] = event.tick + minTicksBetweenAlerts
				end
			end
		end
	end
end)

function messageAll(mes)
  for i, player in ipairs(game.players) do
	if player.connected then
		player.print(mes)
	end
  end
end

function messageForce(mes, force)
  for i, player in ipairs(force.players) do
	if player.connected then
		player.print(mes)
	end
  end
end

function messagePlayer(mes, player)
    player.print(mes)
end

function playSoundForPlayer(sound, player)
	player.surface.create_entity({name = sound, position = player.position})
end

function playSoundForForce(sound, force)
	if #force.players == 0 then
		return
	end
	for i, player in ipairs(force.players) do
		if player.connected then
			player.surface.create_entity({name = sound, position = player.position})
		end
	end
end

script.on_event(defines.events.on_built_entity, function(event)
	local player = game.get_player(event.player_index)
	if event.created_entity.name == "power-sensor" then
		table.insert(global.power_sensors, event.created_entity)
		global.ticks[event.created_entity.force.name] = event.tick + minTicksBetweenAlerts
	end
end)

script.on_event(defines.events.on_preplayer_mined_item, function(event)
	if event.entity.name == "power-sensor" then
		local i = findSensor(event.entity)
		if i then
			table.remove(global.power_sensors, i)
		end
	end
end)

script.on_event(defines.events.on_robot_pre_mined, function(event)
	if event.entity.name == "power-sensor" then
		local i = findSensor(event.entity)
		if i then
			table.remove(global.power_sensors, i)
		end
	end
end)
