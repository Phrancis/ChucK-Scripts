TempoMeter tempoMeter;
tempoMeter.setTempo(240) => dur beat;
tempoMeter.setMeter(4,4) => dur measure;

27.5 => float NOTE_A_ZERO;
OscPitch oscPitch;
NOTE_A_ZERO => oscPitch.freq;
0 => int NoteAOctave;

// oscillator to digital audio controller
SqrOsc fizzbuzzOsc => dac;
oscPitch.freq => fizzbuzzOsc.freq;

// audio controls
0.1 => fizzbuzzOsc.gain;

// variables for looping
now + 16::measure => time stop;
1 => int stepCounter;

while (now < stop) {
    <<< "-----" >>>;
    if (stepCounter % 15 == 0) {
        <<< "Result: ", "FizzBuzz" >>>;
    } else if (stepCounter % 5 == 0) {
        <<< "Result: ", "Fizz" >>>;
    } else if (stepCounter % 3 == 0) {
        <<< "Result: ", "Buzz" >>>;
    } else {
        <<< "Result: ", stepCounter >>>;
    }
    // identify reference A notes and their octave and print them
    if (Math.floor(oscPitch.getFreq() % NOTE_A_ZERO) == 0.0) {
        <<< "Reference A", NoteAOctave >>>;
        1 +=> NoteAOctave;
    }
    <<< "Osc Freq: ", oscPitch.getFreq() >>>;
    oscPitch.change(1) => fizzbuzzOsc.freq;
    beat +=> now;
    1 +=> stepCounter;
}
<<< "end program" >>>;