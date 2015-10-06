public class OscChords {
    OscPitch oscPitch;
    this.root => float root;
    0.05 => float gain;
    0.0 => float mute;
    SawOsc I, III, V, VII;
    
    // initialize oscillators
    0 => I.freq;
    0 => III.freq;
    0 => V.freq;
    0 => VII.freq;
    mute => I.gain;
    mute => III.gain;
    mute => V.gain;
    mute => VII.gain;
    I   => dac;
    III => dac;
    V   => dac;
    VII => dac; 
    
    fun void noChord() {
        0 => I.freq;
        0 => III.freq;
        0 => V.freq;
        0 => VII.freq;
    }
    
    fun void major(float root) {
        root => oscPitch.freq => I.freq;
        oscPitch.change(4)    => III.freq;
        oscPitch.change(3)    => V.freq;
        0                     => VII.freq;
    }
    
    fun void minor(float root) {
        root => oscPitch.freq => I.freq;
        oscPitch.change(3)    => III.freq;
        oscPitch.change(4)    => V.freq;
        0                     => VII.freq;
    }
    
    fun void major7(float root) {
        root => oscPitch.freq => I.freq;
        oscPitch.change(4)    => III.freq;
        oscPitch.change(3)    => V.freq;
        oscPitch.change(4)    => VII.freq;
    }
    
    fun void play() {
        gain => I.gain;
        gain => III.gain;
        gain => V.gain;
        gain => VII.gain;
    }
    
    fun void stop() {        
        mute => I.gain;
        mute => III.gain;
        mute => V.gain;
        mute => VII.gain;
    }
}