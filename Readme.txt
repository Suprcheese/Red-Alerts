Red Alerts 1.0.4
================

Version 1.0.4 was released April 17, 2016, was tested using Factorio v0.12.30, and was authored by Supercheese, with contributions from daydev.

Do you wish there was a separate notification for when a structure is destroyed, rather than just using the same sound as when a structure is merely damaged? Then this mod is for you!
After researching the "Automated Alert Systems" technology (a relatively cheap early-game tech) you will begin to hear automated voiced alerts for certain events:

	-Structure destroyed
	-Unit (e.g. combat robot) lost
	-Arrival of reinforcements (i.e. other players joining the game)
	-Upon building the "Power Sensor" building and connecting it to your power grid, you will be notified when you have low power

The Power Sensor will try to trigger a Low Power notification whenever you are not generating enough power to satisfy all your factory's demands.
Due to its nature, however, it is not very responsive to short bursts of low power, such as when many laser turrets are firing,
but it is good at alerting you when your accumulators have only ~5% of their remaining charge during a long period of discharging, or
other instances of sustained low power generation.


You can choose between four different voices and one unvoiced soundset for the alerts:

	-The original Command & Conquer EVA voice
	-The Command & Conquer: Red Alert voice
	-The C&C: Tiberian Sun EVA voice
	-The C&C: Tiberian Sun CABAL voice
	-A set of tones/sounds

Choose your announcer in the config.lua file. The default is the original C&C EVA.


Credits:
--------

The announcer voices are from the "Command & Conquer" series of games by Westwood Studios.

Command and Conquer: Tiberian Dawn was released as freeware in 2007.
Command and Conquer: Red Alert was released as freeware in 2008.
Command and Conquer: Tiberian Sun was released as freeware in 2010.

All graphics are from Factorio itself.

Several portions of the control.lua code (et al.) were inspired by code from the following mods:

	-YARM by Narc
	-EvoGUI by Narc
	-Blueprint String by DaveMcW
	-FARL by Choumiko

My thanks to these talented modders for their great mods.

Thanks to the forum and #factorio IRC denizens for advice & bugtesting.


See also the associated forum thread to give feedback, view screenshots, etc.:

http://www.factorioforums.com/forum/viewtopic.php?f=92&t=19579
