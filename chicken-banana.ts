// Chicken Wing Song - Simple repetitive melody
// Viral children's song
// Button A+B trigger
input.onButtonPressed(Button.AB, function () {
    music.setVolume(255)
    music.setTempo(130)

    // Simple, repetitive melody in C major
    for (let index = 0; index < 2; index++) {
        music.playTone(523, music.beat(BeatFraction.Quarter))     // C5
        music.playTone(523, music.beat(BeatFraction.Quarter))     // C5
        music.playTone(523, music.beat(BeatFraction.Quarter))     // C5
        music.playTone(587, music.beat(BeatFraction.Quarter))     // D5

        music.playTone(659, music.beat(BeatFraction.Quarter))     // E5
        music.playTone(659, music.beat(BeatFraction.Quarter))     // E5
        music.playTone(587, music.beat(BeatFraction.Quarter))     // D5
        music.playTone(523, music.beat(BeatFraction.Quarter))     // C5

        music.rest(music.beat(BeatFraction.Quarter))
    }

    basic.pause(500)
})
