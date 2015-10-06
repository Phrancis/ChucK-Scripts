TempoMeter tempoMeter;
tempoMeter.setTempo(140) => dur beat;
tempoMeter.setMeter(4,4) => dur measure;

55 => float NOTE_A1;
OscPitch oscPitch;
NOTE_A1 => oscPitch.freq;
1 => int NoteAOctave;

OscChords oscChords;

// oscillator to digital audio controller
TriOsc fizzbuzzOsc => dac;
oscPitch.freq => oscChords.root => fizzbuzzOsc.freq;

// audio controls
0.1 => fizzbuzzOsc.gain;



// variables for looping
now + 12::measure => time stop;
1 => int stepCounter;

while (now < stop) {
    oscChords.noChord();
    <<< "-----" >>>;
    if (stepCounter % 15 == 0) {
        oscChords.major7(oscPitch.getFreq());
        oscChords.play();
        <<< "Result: ", "FizzBuzz", "| chord:", oscChords.getCurrentChord() >>>;
    } else if (stepCounter % 5 == 0) {
        oscChords.minor(oscPitch.getFreq());
        oscChords.play();
        <<< "Result: ", "Fizz", "| chord:", oscChords.getCurrentChord() >>>;
    } else if (stepCounter % 3 == 0) {
        oscChords.major(oscPitch.getFreq());
        oscChords.play();
        <<< "Result: ", "Buzz", "| chord:", oscChords.getCurrentChord() >>>;
    } else {
        <<< "Result: ", stepCounter >>>;
    }
    // identify reference A notes and their octave and print them
    if (Math.floor(oscPitch.getFreq() % NOTE_A1) == 0.0) {
        <<< "Reference A", NoteAOctave >>>;
        1 +=> NoteAOctave;
    }
    <<< "Osc Freq: ", oscPitch.getFreq() >>>;
    
    beat +=> now;
    oscChords.stop();
    oscPitch.change(1) => fizzbuzzOsc.freq;
    1 +=> stepCounter;
}
<<< "end program" >>>;
