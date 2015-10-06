public class OscChords {
    OscPitch oscPitch;
    this.root => float root;
    0.05 => float gain;
    0.0 => float mute;
    SawOsc I, III, V, VII;
    
    fun void major(float root) {
        root => oscPitch.freq => I.freq;
        oscPitch.change(4)    => III.freq;
        oscPitch.change(3)    => V.freq;
        0 => VII.freq;
    }
    
    fun void minor(float root) {
        root => oscPitch.freq => I.freq;
        oscPitch.change(3)    => III.freq;
        oscPitch.change(4)    => V.freq;
        0 => VII.freq;
    }
    
    fun void major7(float root) {
        root => oscPitch.freq => I.freq;
        oscPitch.change(4)    => III.freq;
        oscPitch.change(3)    => V.freq;
        oscPitch.change(4)    => VII.freq;
    }
    
    fun void play(dur noteDur) {
        gain => I.gain;
        gain => III.gain;
        gain => V.gain;
        gain => VII.gain;
        now + 1::noteDur => time stopPlaying;
        while (now < stopPlaying) {
            I   => dac;
            III => dac;
            V   => dac;
            VII => dac;
            1::noteDur +=> now;
        }
        mute => I.gain;
        mute => III.gain;
        mute => V.gain;
        mute => VII.gain;
    }
}