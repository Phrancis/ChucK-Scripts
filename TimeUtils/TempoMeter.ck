public class TempoMeter {
    this.bpm => float bpm;
    this.upper => int upper;
    this.lower => int lower;
    60 => int SECONDS_PER_MINUTE;
    // default values
    1::second => dur beat;
    4::beat => dur measure;
    
    // Divide a minute into the number of beats per minute (bpm)
    //   and return the duration of 1 beat. Default 60 bpm unless set otherwise.
    // @param float bpm : the beats per minute of the tempo
    // @return dur : the duration of a beat
    fun dur setTempo(float bpm) {
        if (Math.isnan(bpm)) {
            <<< now, ": ", bpm, " is not a number" >>>;
            return beat;
        } else {
            (SECONDS_PER_MINUTE / bpm)::second => beat;
            return beat;
        }
    }
    
    // Set the meter (or time signature) using traditional Western
    //   music notation. Default 4/4 unless set otherwise.
    // @param int upper : the number of beats per measure
    // @param int lower : the duration ratio (or unit) of a beat
    // @return dur : the duration of a measure
    fun dur setMeter(int upper, int lower) {
        if (Math.isnan(upper) || Math.isnan(lower)) {
            <<< now, ": ", upper, " or ", lower, " is not a number" >>>;
            return measure;
        } else {
            lower / 4 => float beatDurationRatio;
            beat * beatDurationRatio => beat;
            upper::beat => measure;
            return measure;
        }
    }

    // Getters and setters
    fun float getBpm() { return bpm; }
    fun void setBpm(float val) { val => bpm; }
    fun int getUpper() { return upper; }
    fun void setUpper(int val) { val => upper; }
    fun int getLower() { return lower; }
    fun void setLower(int val) { val => upper; }
}