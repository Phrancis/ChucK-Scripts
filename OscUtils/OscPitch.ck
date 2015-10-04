public class OscPitch 
{
    this.freq => float freq;
    getSemitoneRatio() => static float SEMITONE;
    
    fun float getFreq() { return freq; }
    fun void setFreq(float val) { val => freq; }
    
    fun float change(float steps)
    {  
        return freq * Math.pow(SEMITONE, steps) => freq;
    }
    
    fun float getSemitoneRatio() 
    {
        return Math.pow(2.0, 1.0/12.0);
    }
}