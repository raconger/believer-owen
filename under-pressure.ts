// Under Pressure by Queen & David Bowie
// Iconic bassline riff - one of the most famous in music
// Shake gesture trigger

input.onGesture(Gesture.Shake, function () {
    music.setVolume(255)
    music.setTempo(110)

    // The famous bassline: D D D D Bb D C D
    // Using bass register (lower octave)
    for (let index = 0; index < 4; index++) {
        music.playTone(147, music.beat(BeatFraction.Eighth))      // D3
        music.playTone(147, music.beat(BeatFraction.Eighth))      // D3
        music.playTone(147, music.beat(BeatFraction.Eighth))      // D3
        music.playTone(147, music.beat(BeatFraction.Eighth))      // D3
        music.playTone(117, music.beat(BeatFraction.Eighth))      // Bb2
        music.playTone(147, music.beat(BeatFraction.Eighth))      // D3
        music.playTone(131, music.beat(BeatFraction.Eighth))      // C3
        music.playTone(147, music.beat(BeatFraction.Quarter))     // D3
        music.rest(music.beat(BeatFraction.Eighth))
    }

    basic.pause(500)
})
