// Class used to create chords.
public class OscChords {
    OscPitch oscPitch;
    this.root => float root;
    
    0.05 => float gain;
    0.0 => float mute;
    SawOsc _1st, _3rd, _5th, _7th;
    string currentChord;
    
    // initialize oscillators
    0 => _1st.freq;
    0 => _3rd.freq;
    0 => _5th.freq;
    0 => _7th.freq;
    mute => _1st.gain;
    mute => _3rd.gain;
    mute => _5th.gain;
    mute => _7th.gain;
    _1st => dac;
    _3rd => dac;
    _5th => dac;
    _7th => dac; 
    
    // Sets all chord frequencies to 0, making them inaudible.
    fun void noChord() {
        0 => _1st.freq;
        0 => _3rd.freq;
        0 => _5th.freq;
        0 => _7th.freq;
        "no chord" => currentChord;
    }
    
    // Creates a major chord.
    // @input float root : the root note of the chord.
    fun void major(float root) {
        root => oscPitch.freq => _1st.freq;
        oscPitch.change(4)    => _3rd.freq;
        oscPitch.change(3)    => _5th.freq;
        0                     => _7th.freq;
        "major" => currentChord;
    }
    // Creates a minor chord.
    // @input float root : the root note of the chord.
    fun void minor(float root) {
        root => oscPitch.freq => _1st.freq;
        oscPitch.change(3)    => _3rd.freq;
        oscPitch.change(4)    => _5th.freq;
        0                     => _7th.freq;
        "minor" => currentChord;
    }
    // Creates a major7 chord.
    // @input float root : the root note of the chord.
    fun void major7(float root) {
        root => oscPitch.freq => _1st.freq;
        oscPitch.change(4)    => _3rd.freq;
        oscPitch.change(3)    => _5th.freq;
        oscPitch.change(4)    => _7th.freq;
        "major7" => currentChord;
    }
    // Sets the gain on the chord to make it audible.
    fun void play() {
        gain => _1st.gain;
        gain => _3rd.gain;
        gain => _5th.gain;
        gain => _7th.gain;
    }
    // Sets the gain on the chord to make it inaudible.
    fun void stop() {        
        mute => _1st.gain;
        mute => _3rd.gain;
        mute => _5th.gain;
        mute => _7th.gain;
    }
    // @return string : the name of the current chord.
    fun string getCurrentChord() { return currentChord; }
}