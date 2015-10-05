public class OscChords {
    OscPitch oscPitch;
    this.root => float root;
    SqrOsc I, III, V;
    0.1 => float gain;
    0.0 => float mute; 
    
    fun void major(float root) {
        root => oscPitch.freq => I.freq;
        oscPitch.change(4)    => III.freq;
        oscPitch.change(3)    => V.freq;
    }
    
    fun void play(dur beat) {
        gain => I.gain;
        gain => III.gain;
        gain => V.gain;
        now + 1::beat => time stopPlaying;
        while (now < stopPlaying) {
            I   => dac;
            III => dac;
            V   => dac;
            1::beat +=> now;
        }
        mute => I.gain;
        mute => III.gain;
        mute => V.gain;
    }
}