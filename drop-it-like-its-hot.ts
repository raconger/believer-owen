// Drop It Like It's Hot by Snoop Dogg ft. Pharrell
// Minimalist beat - C# minor key
// Very sparse with synth stabs
// Button A trigger

input.onButtonPressed(Button.A, function () {
    music.setVolume(255)
    music.setTempo(95)

    // Minimalist synth pattern - The Neptunes' sparse production
    // Descending chord stabs
    for (let index = 0; index < 4; index++) {
        // C# minor chord stab
        music.playTone(277, music.beat(BeatFraction.Sixteenth))   // C#4
        music.rest(music.beat(BeatFraction.Half))

        // Another stab
        music.playTone(277, music.beat(BeatFraction.Sixteenth))   // C#4
        music.rest(music.beat(BeatFraction.Whole))
    }

    basic.pause(500)
})
