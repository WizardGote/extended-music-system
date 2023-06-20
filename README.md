<p align="center">
	<img src="https://raw.githubusercontent.com/WizardGote/extended-music-system/main/musicpower.png" alt="Pic" />
</p>

Instructions:
This was ported from Combine Control with some tweaks to work better with Helix
With this plugin you can add ambient music that will play random songs while playing on your schema
You can also add combat music that will play to the player if they engage in combat

Music is played autonomously but players with cami access can also control it via the TAB menu in the "Music" tab

***Important to know***

The enumerations below will each activate during certain scenarios:
MUSIC_NOPLAY - Will never play unless forced; This can be useful if you want to use specific songs for events.

MUSIC_MENU - Will only play if the player is in the main menu(character selection);
*By default Helix does not allow multiple songs in the characters menu but now you can add as many as you like and the music will even continue playing on a loop.
*The characters menu music will only play if you set your music to blank in your config.
*The characters menu music will not reset after you exit the characters menu because I'm not sure how to do it effeicintly without bugging the whole script; Pick short stuff if you want or music you don't mind to continue playing during gameplay.

MUSIC_AMBIENT - Will play ambient music as long as the player is alive and not in the main menu(character selection).

MUSIC_COMBAT - Will play only if the player engage in combat, ambient will not play if a combat music has started. stingers will end combat music though.

MUSIC_STINGER - Will play only when the player dies for whatever reason.

When adding a song to the 'ix.Music' table be sure to follow this template:
{ path/to/music/file, music file duration in seconds(I.E: 6 minutes and 23 seconds song would be 383 seconds), enumeration(I.E: MUSIC_COMBAT), name of the song },

A good way to check song duration is first via your media player and then google like this for a result "# minutes and # seconds in seconds"

Lastly:
You can modify this plugin however you want, my only demand if you happen to upload it anywhere credit me for it.
