public class ModifyOscPitch {
    
    oscFreq => float inOscFreq;
    numberOfSteps => float inNumberOfSteps;
    
    function float oscHalfStep ( float inOscFreq, float inOscFreq ) {
        
        if ( inNumberOfSteps == 0.0 ) {
            <<< "Step input is ", inNumberOfSteps, ", no change made." >>>;
            return oscFreq;
        }
        else {
            Math.pow ( 2.0, inNumberOfSteps/12.0 ) => float stepIncrement;
            //Math.pow ( 2.0, numberOfSteps/12.0 ) => float oscFreqMultiplier;
            inOscFreq * ( 1.0 - stepIncrement ) => oscFreq;
            <<< inNumberOfSteps, "steps incremented." >>>;
            return oscFreq;
        }
    }
    
}