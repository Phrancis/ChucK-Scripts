TempoMeter tempoMeter;
tempoMeter.setTempo(240) => dur beat;
tempoMeter.setMeter(4,4) => dur measure;

// oscillator to digital audio controller
SqrOsc fizzbuzzOsc => dac;

27.5 => float NOTE_A_ZERO;
OscPitch oscPitch;
NOTE_A_ZERO => oscPitch.freq => fizzbuzzOsc.freq;
0 => int NoteAOctave;

// audio controls
0.1 => fizzbuzzOsc.gain;

// variables for looping
now + 8::measure => time stop;
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
    if (Math.floor(Math.fmod(oscPitch.getFreq(), 27.5)) == 0.0) {
        ((oscPitch.getFreq() / 27.5) - 1) $ int => int octave;
        <<< "Reference A", NoteAOctave >>>;
        1 +=> NoteAOctave;
    }
    <<< "Osc Freq: ", oscPitch.getFreq() >>>;
    oscPitch.change(1) => fizzbuzzOsc.freq;
    beat +=> now;
    1 +=> stepCounter;
}
<<< "end program" >>>;
