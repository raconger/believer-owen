// Under Pressure by Queen & David Bowie
// Famous bassline
// Add this as a new event handler in your main.ts
// You could use Button A held down, or shake gesture, etc.

input.onGesture(Gesture.Shake, function () {
    music.setVolume(255)
    music.setTempo(110)

    // Iconic bassline intro - "Dum dum dum da-da dum dum"
    // Repeats throughout the song
    for (let index = 0; index < 2; index++) {
        // Main bassline riff
        music.playTone(294, music.beat(BeatFraction.Quarter))
        music.playTone(294, music.beat(BeatFraction.Quarter))
        music.playTone(294, music.beat(BeatFraction.Quarter))
        music.playTone(349, music.beat(BeatFraction.Eighth))
        music.playTone(294, music.beat(BeatFraction.Eighth))
        music.playTone(262, music.beat(BeatFraction.Quarter))
        music.playTone(294, music.beat(BeatFraction.Quarter))

        music.rest(music.beat(BeatFraction.Quarter))

        // Repeat with variation
        music.playTone(294, music.beat(BeatFraction.Quarter))
        music.playTone(294, music.beat(BeatFraction.Quarter))
        music.playTone(294, music.beat(BeatFraction.Quarter))
        music.playTone(349, music.beat(BeatFraction.Eighth))
        music.playTone(294, music.beat(BeatFraction.Eighth))
        music.playTone(262, music.beat(BeatFraction.Quarter))
        music.playTone(233, music.beat(BeatFraction.Quarter))

        music.rest(music.beat(BeatFraction.Quarter))
    }

    // Verse melody - "Pressure, pushing down on me"
    music.playTone(392, music.beat(BeatFraction.Half))
    music.playTone(440, music.beat(BeatFraction.Quarter))
    music.playTone(392, music.beat(BeatFraction.Quarter))
    music.playTone(349, music.beat(BeatFraction.Half))
    music.playTone(330, music.beat(BeatFraction.Half))

    music.rest(music.beat(BeatFraction.Quarter))

    // "Pressing down on you, no man ask for"
    music.playTone(392, music.beat(BeatFraction.Half))
    music.playTone(440, music.beat(BeatFraction.Quarter))
    music.playTone(392, music.beat(BeatFraction.Quarter))
    music.playTone(349, music.beat(BeatFraction.Half))
    music.playTone(330, music.beat(BeatFraction.Half))
    music.playTone(294, music.beat(BeatFraction.Whole))

    basic.pause(300)

    // Bassline returns
    music.playTone(294, music.beat(BeatFraction.Quarter))
    music.playTone(294, music.beat(BeatFraction.Quarter))
    music.playTone(294, music.beat(BeatFraction.Quarter))
    music.playTone(349, music.beat(BeatFraction.Eighth))
    music.playTone(294, music.beat(BeatFraction.Eighth))
    music.playTone(262, music.beat(BeatFraction.Quarter))
    music.playTone(294, music.beat(BeatFraction.Quarter))

    music.rest(music.beat(BeatFraction.Half))

    // "Under pressure"
    music.playTone(392, music.beat(BeatFraction.Half))
    music.playTone(440, music.beat(BeatFraction.Half))
    music.playTone(494, music.beat(BeatFraction.Whole))

    // Final bassline
    music.playTone(294, music.beat(BeatFraction.Quarter))
    music.playTone(294, music.beat(BeatFraction.Quarter))
    music.playTone(294, music.beat(BeatFraction.Quarter))
    music.playTone(349, music.beat(BeatFraction.Eighth))
    music.playTone(294, music.beat(BeatFraction.Eighth))
    music.playTone(262, music.beat(BeatFraction.Quarter))
    music.playTone(233, music.beat(BeatFraction.Whole))

    basic.pause(500)
})
