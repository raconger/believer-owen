// Drop It Like It's Hot by Snoop Dogg ft. Pharrell
// Minimalist beat with distinctive synth sounds
// Use long press on Button A as trigger

input.onButtonPressed(Button.A, function () {
    // Check if button is held for long press functionality
    music.setVolume(255)
    music.setTempo(95)

    // Intro - Distinctive synth stabs
    for (let index = 0; index < 2; index++) {
        // Main synth pattern - very sparse and minimalist
        music.playTone(165, music.beat(BeatFraction.Eighth))
        music.rest(music.beat(BeatFraction.Quarter))
        music.playTone(165, music.beat(BeatFraction.Eighth))
        music.rest(music.beat(BeatFraction.Quarter))
        music.playTone(165, music.beat(BeatFraction.Eighth))
        music.rest(music.beat(BeatFraction.Half))

        music.playTone(196, music.beat(BeatFraction.Eighth))
        music.rest(music.beat(BeatFraction.Quarter))
        music.playTone(196, music.beat(BeatFraction.Eighth))
        music.rest(music.beat(BeatFraction.Half))
    }

    // Verse groove - Low bass pattern
    for (let index = 0; index < 4; index++) {
        music.playTone(147, music.beat(BeatFraction.Quarter))
        music.rest(music.beat(BeatFraction.Eighth))
        music.playTone(165, music.beat(BeatFraction.Eighth))
        music.rest(music.beat(BeatFraction.Quarter))
        music.playTone(147, music.beat(BeatFraction.Eighth))
        music.rest(music.beat(BeatFraction.Quarter))
    }

    basic.pause(200)

    // Hook section - Synth melody
    music.playTone(330, music.beat(BeatFraction.Eighth))
    music.rest(music.beat(BeatFraction.Sixteenth))
    music.playTone(294, music.beat(BeatFraction.Eighth))
    music.rest(music.beat(BeatFraction.Sixteenth))
    music.playTone(247, music.beat(BeatFraction.Quarter))
    music.rest(music.beat(BeatFraction.Quarter))

    music.playTone(330, music.beat(BeatFraction.Eighth))
    music.rest(music.beat(BeatFraction.Sixteenth))
    music.playTone(294, music.beat(BeatFraction.Eighth))
    music.rest(music.beat(BeatFraction.Sixteenth))
    music.playTone(247, music.beat(BeatFraction.Quarter))
    music.rest(music.beat(BeatFraction.Quarter))

    // Build up
    music.playTone(165, music.beat(BeatFraction.Eighth))
    music.playTone(165, music.beat(BeatFraction.Eighth))
    music.rest(music.beat(BeatFraction.Eighth))
    music.playTone(196, music.beat(BeatFraction.Eighth))
    music.playTone(196, music.beat(BeatFraction.Eighth))
    music.rest(music.beat(BeatFraction.Eighth))
    music.playTone(220, music.beat(BeatFraction.Eighth))
    music.playTone(220, music.beat(BeatFraction.Eighth))

    basic.pause(150)

    // Chorus - repetitive bass hits
    for (let index = 0; index < 8; index++) {
        music.playTone(147, music.beat(BeatFraction.Eighth))
        music.rest(music.beat(BeatFraction.Eighth))
        music.playTone(165, music.beat(BeatFraction.Sixteenth))
        music.rest(music.beat(BeatFraction.Eighth))
    }

    // Ending synth stab
    music.playTone(165, music.beat(BeatFraction.Quarter))
    music.rest(music.beat(BeatFraction.Eighth))
    music.playTone(196, music.beat(BeatFraction.Half))
    music.playTone(220, music.beat(BeatFraction.Whole))

    basic.pause(500)
})
