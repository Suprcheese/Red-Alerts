-- Choose which announcer voice you would like. Your options are:
--
-- "CommandAndConquer" - the original C&C from 1995.
-- "RedAlert" - C&C: Red Alert from 1996
-- "TiberianSunEVA" - C&C: Tiberian Sun EVA
-- "TiberianSunCABAL" - C&C: Tiberian Sun CABAL
-- "SFX_daydev" - non-verbal sound notifications (probably, not very good)

voiceStyle = "CommandAndConquer"


-- This controls the minimum time between consecutive voiced alerts.
-- The value is measured in gameticks; there are 60 ticks per second, so the default 300 ticks would be 5 seconds.

minTicksBetweenAlerts = 300


-- Here you can enable/disable each category of alerts
-- Note that "Structure destroyed" plays when a building-type entity is destroyed, while "Unit lost" plays when a non-structure entity such as a combat robot is destroyed.

lowPowerWarning = true
playerJoinedGameAlert = true
unitLostAlert = true
structureDestroyedAlert = true


-- Choose whether or not to show the "Dismiss Low Power Warning?" dialog.

showSnoozePopup = true


-- This is how many seconds the Low Power warning will be suppressed when you choose to dismiss it.

snoozeSeconds = 60


-- This table enumerates all entity-types that are considered "units" and trigger the "Unit Lost" voice clip when destroyed, rather than "Structure Destroyed".

unitEntityTypes = {}

unitEntityTypes["unit"] = 				true
unitEntityTypes["car"] = 				true
unitEntityTypes["cargo-wagon"] = 		true
unitEntityTypes["combat-robot"] = 		true
unitEntityTypes["construction-robot"] = true
unitEntityTypes["logistic-robot"] = 	true
unitEntityTypes["locomotive"] = 		true
unitEntityTypes["player"] = 			true
