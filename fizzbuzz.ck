// set tempo to 120 bpm
0.5::second => dur beat;
4::beat => dur measure;

// freqIncrement value is approx: 0.059463
Math.pow ( 2.0, 1.0/12.0 ) - 1.0 => float freqIncrement;

// oscillators
SawOsc fizzbuzzOsc => dac;

27.5 => float NOTE_A_ZERO;
OscPitch oscPitch;
NOTE_A_ZERO => oscPitch.freq => fizzbuzzOsc.freq;

// audio controls
0.15 => fizzbuzzOsc.gain;

// variables for looping
now + 16::measure => time stop; // 64 beats
1 => int stepCounter;

while (now < stop) {
    if (stepCounter % 15 == 0) {
        <<< "Result: ", "FizzBuzz" >>>;
    } else if (stepCounter % 5 == 0) {
        <<< "Result: ", "Fizz" >>>;
    } else if (stepCounter % 3 == 0) {
        <<< "Result: ", "Buzz" >>>;
    } else {
        <<< "Result: ", stepCounter >>>;
    }
    
    <<< "Osc Freq: ", oscPitch.getFreq() >>>;
    oscPitch.change(1) => fizzbuzzOsc.freq;
    beat +=> now;
    1 +=> stepCounter;
}
<<< "end program" >>>;
