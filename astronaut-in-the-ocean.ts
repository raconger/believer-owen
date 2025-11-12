// Astronaut in the Ocean by Masked Wolf
// Hip-hop track with distinctive piano melody
// Use tilt/logo pressed/etc. as trigger

input.onLogoEvent(TouchButtonEvent.Pressed, function () {
    music.setVolume(255)
    music.setTempo(145)

    // Iconic piano riff intro
    // "What you know about rollin' down in the deep"

    for (let index = 0; index < 2; index++) {
        // Main melodic hook
        music.playTone(330, music.beat(BeatFraction.Eighth))
        music.rest(music.beat(BeatFraction.Sixteenth))
        music.playTone(330, music.beat(BeatFraction.Eighth))
        music.playTone(370, music.beat(BeatFraction.Eighth))
        music.playTone(392, music.beat(BeatFraction.Quarter))
        music.rest(music.beat(BeatFraction.Eighth))

        music.playTone(330, music.beat(BeatFraction.Eighth))
        music.rest(music.beat(BeatFraction.Sixteenth))
        music.playTone(330, music.beat(BeatFraction.Eighth))
        music.playTone(370, music.beat(BeatFraction.Eighth))
        music.playTone(349, music.beat(BeatFraction.Quarter))
        music.rest(music.beat(BeatFraction.Eighth))

        music.playTone(294, music.beat(BeatFraction.Eighth))
        music.rest(music.beat(BeatFraction.Sixteenth))
        music.playTone(294, music.beat(BeatFraction.Eighth))
        music.playTone(330, music.beat(BeatFraction.Eighth))
        music.playTone(370, music.beat(BeatFraction.Quarter))
        music.rest(music.beat(BeatFraction.Eighth))

        music.playTone(294, music.beat(BeatFraction.Eighth))
        music.rest(music.beat(BeatFraction.Sixteenth))
        music.playTone(294, music.beat(BeatFraction.Eighth))
        music.playTone(330, music.beat(BeatFraction.Eighth))
        music.playTone(262, music.beat(BeatFraction.Quarter))

        music.rest(music.beat(BeatFraction.Quarter))
    }

    // Chorus hook - "Astronaut in the ocean"
    music.playTone(392, music.beat(BeatFraction.Quarter))
    music.playTone(370, music.beat(BeatFraction.Quarter))
    music.playTone(349, music.beat(BeatFraction.Eighth))
    music.playTone(330, music.beat(BeatFraction.Eighth))
    music.playTone(294, music.beat(BeatFraction.Half))

    music.rest(music.beat(BeatFraction.Quarter))

    // Build up
    music.playTone(294, music.beat(BeatFraction.Eighth))
    music.playTone(330, music.beat(BeatFraction.Eighth))
    music.playTone(370, music.beat(BeatFraction.Eighth))
    music.playTone(392, music.beat(BeatFraction.Eighth))
    music.playTone(440, music.beat(BeatFraction.Quarter))

    music.rest(music.beat(BeatFraction.Eighth))

    // Drop section
    for (let index = 0; index < 4; index++) {
        music.playTone(262, music.beat(BeatFraction.Eighth))
        music.playTone(262, music.beat(BeatFraction.Eighth))
        music.rest(music.beat(BeatFraction.Sixteenth))
        music.playTone(294, music.beat(BeatFraction.Eighth))
        music.rest(music.beat(BeatFraction.Sixteenth))
    }

    // Final melodic phrase
    music.playTone(330, music.beat(BeatFraction.Quarter))
    music.playTone(370, music.beat(BeatFraction.Quarter))
    music.playTone(392, music.beat(BeatFraction.Half))
    music.playTone(440, music.beat(BeatFraction.Half))

    music.rest(music.beat(BeatFraction.Quarter))

    // Ending riff
    music.playTone(392, music.beat(BeatFraction.Quarter))
    music.playTone(370, music.beat(BeatFraction.Quarter))
    music.playTone(349, music.beat(BeatFraction.Quarter))
    music.playTone(330, music.beat(BeatFraction.Quarter))
    music.playTone(294, music.beat(BeatFraction.Whole))

    basic.pause(500)
})
