public class OscPitch {
    this.freq => float freq;
    getSemitoneRatio() => float SEMITONE;
    
    // Change the pitch by N musical steps
    // @param float steps : the number of steps to change the frequency, positive or negative
    // @return float : the changed frequency
    fun float change(float steps) {  
        if (Math.isnan(steps)) {
            <<< now, ": ", steps, " is not a number" >>>;
            return freq;
        } else {
            // The semitone ratio has to be applied once for each step change
            // hence the use of Math.pow which does everything
            // in one operation, rather than having to use a loop
            return freq * Math.pow(SEMITONE, steps) => freq;
        }
    }
    
    // Get the ratio to apply to a frequency to go up or down one semitone
    fun float getSemitoneRatio() {
        // The ratio for a musical semitone is
        // the 12th root of 2, or approximately 1.05946309436
        // More info: https://en.wikipedia.org/wiki/Twelfth_root_of_two
        return Math.pow(2.0, 1.0/12.0);
    }
    // Getters and setters
    fun float getFreq() { return freq; }
    fun void setFreq(float val) { val => freq; }
}