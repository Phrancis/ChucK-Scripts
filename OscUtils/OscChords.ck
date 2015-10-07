// Class used to create chords.
public class OscChords {
    OscPitch oscPitch;
    this.root => float root;
    SawOsc _1st, _3rd, _5th, _7th;
    0.05 => float playGain;
    0.0 => float muteGain;
    string currentChord;
    
    // initialize oscillators
    noChord();
    mute();
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
    // Sets the playGain on the chord to make it audible.
    fun void play() {
        playGain => _1st.gain;
        playGain => _3rd.gain;
        playGain => _5th.gain;
        playGain => _7th.gain;
    }
    // Sets the playGain on the chord to make it inaudible.
    fun void mute() {        
        muteGain => _1st.gain;
        muteGain => _3rd.gain;
        muteGain => _5th.gain;
        muteGain => _7th.gain;
    }
    // @return string : the name of the current chord.
    fun string getCurrentChord() { return currentChord; }
 
    // CHORDS
 
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


}