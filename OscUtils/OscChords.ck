// Class used to create chords.
public class OscChords {
    OscPitch oscPitch;
    this.root => float root;
    
    0.05 => float gain;
    0.0 => float mute;
    SawOsc I, III, V, VII;
    string currentChord;
    
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
    
    // Sets all chord frequencies to 0, making them inaudible.
    fun void noChord() {
        0 => I.freq;
        0 => III.freq;
        0 => V.freq;
        0 => VII.freq;
        "no chord" => currentChord;
    }
    
    // Creates a major chord.
    // @input float root : the root note of the chord.
    fun void major(float root) {
        root => oscPitch.freq => I.freq;
        oscPitch.change(4)    => III.freq;
        oscPitch.change(3)    => V.freq;
        0                     => VII.freq;
        "major" => currentChord;
    }
    // Creates a minor chord.
    // @input float root : the root note of the chord.
    fun void minor(float root) {
        root => oscPitch.freq => I.freq;
        oscPitch.change(3)    => III.freq;
        oscPitch.change(4)    => V.freq;
        0                     => VII.freq;
        "minor" => currentChord;
    }
    // Creates a major7 chord.
    // @input float root : the root note of the chord.
    fun void major7(float root) {
        root => oscPitch.freq => I.freq;
        oscPitch.change(4)    => III.freq;
        oscPitch.change(3)    => V.freq;
        oscPitch.change(4)    => VII.freq;
        "major7" => currentChord;
    }
    // Sets the gain on the chord to make it audible.
    fun void play() {
        gain => I.gain;
        gain => III.gain;
        gain => V.gain;
        gain => VII.gain;
    }
    // Sets the gain on the chord to make it inaudible.
    fun void stop() {        
        mute => I.gain;
        mute => III.gain;
        mute => V.gain;
        mute => VII.gain;
    }
    // @return string : the name of the current chord.
    fun string getCurrentChord() { return currentChord; }
}