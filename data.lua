require("config")
require("prototypes.items")
require("prototypes.recipes")
require("prototypes.technologies")
require("prototypes.entities")

if voiceStyle == "CommandAndConquer" then
	require("prototypes.C&C")
end

if voiceStyle == "RedAlert" then
	require("prototypes.RedAlert")
end

if voiceStyle == "TiberianSunEVA" then
	require("prototypes.TibSunEVA")
end

if voiceStyle == "TiberianSunCABAL" then
	require("prototypes.TibSunCABAL")
end
