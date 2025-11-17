// Astronaut in the Ocean by Masked Wolf
// Distinctive piano riff in E minor
// Logo press trigger

input.onLogoEvent(TouchButtonEvent.Pressed, function () {
    music.setVolume(255)
    music.setTempo(140)

    // Main piano hook riff (simplified version of the iconic intro)
    // Key of E minor
    for (let index = 0; index < 2; index++) {
        music.playTone(659, music.beat(BeatFraction.Eighth))      // E5
        music.playTone(587, music.beat(BeatFraction.Eighth))      // D5
        music.playTone(494, music.beat(BeatFraction.Eighth))      // B4
        music.playTone(587, music.beat(BeatFraction.Eighth))      // D5
        music.playTone(494, music.beat(BeatFraction.Quarter))     // B4
        music.rest(music.beat(BeatFraction.Eighth))

        music.playTone(659, music.beat(BeatFraction.Eighth))      // E5
        music.playTone(587, music.beat(BeatFraction.Eighth))      // D5
        music.playTone(494, music.beat(BeatFraction.Eighth))      // B4
        music.playTone(440, music.beat(BeatFraction.Quarter))     // A4
        music.rest(music.beat(BeatFraction.Eighth))
    }

    basic.pause(500)
})
