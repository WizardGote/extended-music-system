local PLUGIN = PLUGIN

PLUGIN.name = "Extended Music System"
PLUGIN.description = "An extended music system ported from CC with some tweaks"
PLUGIN.author = "Ceryx"

ix.lang.AddTable("english", {
	ambient_music = "Ambient Music",

	optMusicVol = "Music Volume",
	optdMusicVol = "Choose your preferred volume of the ambient music"
})

CAMI.RegisterPrivilege({
	Name = "Helix - Music Player",
	MinAccess = "admin"
})

ix.util.Include("cl_plugin.lua")
ix.util.Include("sv_hooks.lua")

ix.option.Add("musicVol", ix.type.number, 50, {
	category = "ambient_music",
	min = 0,
	max = 100,
	decimals = 0,
	OnChanged = function(oldValue, value)
		if (Schema.MusicPatch) then
			if (value == 0) then
				Schema:FadeOutMusic()
			else
				Schema.MusicPatch:ChangeVolume(value / 100)
			end
		end
	end
})

MUSIC_NOPLAY = 0
MUSIC_MENU = 1
MUSIC_AMBIENT = 2
MUSIC_COMBAT = 3
MUSIC_STINGER = 4

ix.Music = {

	{ "music/radio1.mp3", 39, MUSIC_MENU, "Radio" },
	{ "music/hl2_song27_trainstation2.mp3", 72, MUSIC_MENU, "Train Station 2" },
	{ "music/hl1_song11.mp3", 34, MUSIC_NOPLAY, "Hazardous Environments" },
	{ "music/hl2_song23_suitsong3.mp3", 43, MUSIC_NOPLAY, "Triage At Dawn" },
	{ "music/hl2_song7.mp3", 50, MUSIC_AMBIENT, "Ravenholm Reprise" },
	{ "music/hl1_song14.mp3", 90, MUSIC_AMBIENT, "Triple Entanglement" },
	{ "music/hl1_song19.mp3", 115, MUSIC_AMBIENT, "Negative Pressure" },
	{ "music/hl2_song1.mp3", 98, MUSIC_AMBIENT, "Particle Ghost" },
	{ "music/hl2_song10.mp3", 29, MUSIC_AMBIENT, "A Red Letter Day" },
	{ "music/hl2_song32.mp3", 42, MUSIC_AMBIENT, "Slow Light" },
	{ "music/hl2_song3.mp3", 65, MUSIC_COMBAT, "The Innsbruck Experiment" },
	{ "music/hl2_song4.mp3", 65, MUSIC_COMBAT, "The Innsbruck Experiment" },
	{ "music/hl2_song33.mp3", 90, MUSIC_COMBAT, "Dark Energy" },
	{ "music/hl2_song6.mp3", 45, MUSIC_COMBAT, "Pulse Phase" },
	{ "music/hl2_song20_submix0.mp3", 103, MUSIC_COMBAT, "CP Violation" },
	{ "music/stingers/hl1_stinger_song7.mp3", 23, MUSIC_STINGER, "Apprehensive" },
	{ "music/stingers/hl1_stinger_song8.mp3", 9, MUSIC_STINGER, "Bass String" },
	{ "music/stingers/hl1_stinger_song16.mp3", 16, MUSIC_STINGER, "Scared Confusion" },
	{ "music/stingers/hl1_stinger_song27.mp3", 17, MUSIC_STINGER, "Dark Piano" }

}

function Schema:GetSongDuration(path)
	for _, v in pairs(ix.Music) do
		if (string.lower(v[1]) == string.lower(path)) then return v[2] end
	end

	return 0
end

function Schema:GetSongList(e)
	local tab = {}

	for _, v in pairs(ix.Music) do
		if (v[3] == e) then
			table.insert(tab, v[1])
		end
	end

	return tab
end

function Schema:GetSongName(e)
	for _, v in pairs(ix.Music) do
		if (v[1] == e) then return v[4] end
	end
end

function Schema:GetSongLength(e)
	for _, v in pairs(ix.Music) do
		if (v[1] == e) then return v[2] end
	end
end