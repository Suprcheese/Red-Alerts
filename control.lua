require "util"
require "config"

script.on_init(function() On_Init() end)
script.on_configuration_changed(function() On_Init() end)

function On_Init()
	global.ticks = global.ticks or {}
	global.lowPowerTicks = global.lowPowerTicks or {}
	global.lowPowerTicks["control"] = 1
	global.power_sensors = global.power_sensors or {}
	for i, force in pairs(game.forces) do
		global.ticks[force.name] = game.tick + minTicksBetweenAlerts
		global.lowPowerTicks[force.name] = game.tick + minTicksBetweenAlerts
	end
end

script.on_event(defines.events.on_forces_merging, function(event)
	if global.ticks[event.source.name] then
		global.ticks[event.source.name] = nil
	end
end)

script.on_event(defines.events.on_player_joined_game, function(event)
	local player = game.players[event.player_index]
	if (playerJoinedGameAlert == false) or (player.force.technologies["alert-systems"].researched == false) then
		return
	end
	playSoundForForce("reinforcements", player.force)
	global.ticks[player.force.name] = event.tick + minTicksBetweenAlerts
end)

function findSensor(sensor)
	for i,s in pairs(global.power_sensors) do
		if s == sensor then
			return i
		end
	end
	return false
end

function dismissWarning(force, current_tick)
	if not showSnoozePopup then return end
	for i, player in pairs(force.players) do
		local frame = player.gui.center["dismiss-low-power"]
		if not frame and (global.lowPowerTicks["control"] < current_tick) then
			frame = player.gui.center.add{type="frame", name="dismiss-low-power", caption={"dismiss-low-power-warning"}, direction="horizontal"}
			frame.add{type="button", name="dismiss-yes-button", caption={"yes"}}
			frame.add{type="button", name="dismiss-no-button", caption={"no"}}
		end
	end
end

script.on_event(defines.events.on_gui_click, function(event)
	local player = game.players[event.element.player_index]
	local name = event.element.name
	local frame = player.gui.center["dismiss-low-power"]
	if frame and (name == "dismiss-yes-button") then
		global.lowPowerTicks[player.force.name] = event.tick + (60 * snoozeSeconds)
		frame.destroy()
	elseif frame and (name == "dismiss-no-button") then
		global.lowPowerTicks["control"] = event.tick + (60 * snoozeSeconds)
		frame.destroy()
	end
end)

script.on_event(defines.events.on_entity_died, function(event)
	local current_tick = event.tick
	local entityType = event.entity.type
	if event.entity.force == "enemy" or entityType == "tree" or entityType == "simple-entity" or entityType == "land-mine" then
		return
	end
	if event.entity.name == "power-sensor" then
		local i = findSensor(event.entity)
		if i then
			table.remove(global.power_sensors, i)
		end
	end
	if (global.ticks[event.entity.force.name] and global.ticks[event.entity.force.name] > current_tick) or (event.entity.force.technologies["alert-systems"].researched == false) then
		return
	end
	if unitEntityTypes[entityType] then
		if unitLostAlert then
			playSoundForForce("unit-lost", event.entity.force)
			global.ticks[event.entity.force.name] = current_tick + minTicksBetweenAlerts
		end
		return
	else
		if structureDestroyedAlert then
			playSoundForForce("structure-destroyed", event.entity.force)
			global.ticks[event.entity.force.name] = current_tick + minTicksBetweenAlerts
		end
		return
	end
end)

script.on_event(defines.events.on_tick, function(event)
	local current_tick = event.tick
	if game.tick % 60 == 4 then
		if lowPowerWarning then
			for i, sensor in pairs(global.power_sensors) do
				if (sensor.energy < 1) and global.ticks[sensor.force.name] and (global.ticks[sensor.force.name] < current_tick) and global.lowPowerTicks[sensor.force.name] and (global.lowPowerTicks[sensor.force.name] < current_tick) then
					playSoundForForce("low-power", sensor.force)
					global.ticks[sensor.force.name] = current_tick + minTicksBetweenAlerts
					if global.lowPowerTicks[sensor.force.name] == 1 then
						dismissWarning(sensor.force, current_tick)
						return
					end
					global.lowPowerTicks[sensor.force.name] = 1
				end
			end
		end
	end
end)

function playSoundForPlayer(sound, player)
	player.surface.create_entity({name = sound, position = player.position})
end

function playSoundForForce(sound, force)
	if #force.players == 0 then
		return
	end
	for i, player in pairs(force.players) do
		if player.connected then
			player.surface.create_entity({name = sound, position = player.position})
		end
	end
end

script.on_event(defines.events.on_built_entity, function(event)
	local player = game.players[event.player_index]
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
