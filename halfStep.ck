function float oscHalfStep ( float oscFreq, int numberOfSteps ) {
    if ( Math.isnan ( numberOfSteps ) || Math.isnan ( oscFreq ) ) {
        <<< "Invalid input: not a number." >>>;
        return oscFreq;
    }
    else if ( numberOfSteps == 0 ) {
        <<< "Step input is ", numberOfSteps, ", no change made." >>>;
        return oscFreq;
    }
    else {
        Math.pow ( 2.0, 1.0/12.0 ) => float oscFreqMultiplier;
        oscFreq * oscFreqMultiplier => oscFreq;
        <<< numberOfSteps, " steps incremented." >>>;
        return oscFreq;
    }
}