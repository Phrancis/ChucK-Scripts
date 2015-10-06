TempoMeter tempoMeter;
tempoMeter.setTempo(120) => dur beat;
tempoMeter.setMeter(4,4) => dur measure;

55 => float NOTE_A1;
OscPitch oscPitch;
NOTE_A1 => oscPitch.freq;
1 => int NoteAOctave;

OscChords chord;

// oscillator to digital audio controller
TriOsc fizzbuzzOsc => dac;
oscPitch.freq => chord.root => fizzbuzzOsc.freq;

// audio controls
0.1 => fizzbuzzOsc.gain;

// variables for looping
now + 12::measure => time stop;
1 => int stepCounter;

while (now < stop) {
    chord.noChord();
    <<< "-----" >>>;
    if (stepCounter % 15 == 0) {
        chord.major7(oscPitch.getFreq());
        chord.play();
        <<< "Result: ", "FizzBuzz", "| chord:", chord.getCurrentChord() >>>;
    } else if (stepCounter % 5 == 0) {
        chord.minor(oscPitch.getFreq());
        chord.play();
        <<< "Result: ", "Fizz", "| chord:", chord.getCurrentChord() >>>;
    } else if (stepCounter % 3 == 0) {
        chord.major(oscPitch.getFreq());
        chord.play();
        <<< "Result: ", "Buzz", "| chord:", chord.getCurrentChord() >>>;
    } else {
        <<< "Result: ", stepCounter >>>;
    }
    // identify reference A notes and their octave and print them
    if (Math.floor(oscPitch.getFreq() % NOTE_A1) == 0.0) {
        <<< "Reference A", NoteAOctave >>>;
        1 +=> NoteAOctave;
    }
    <<< "Osc Freq: ", oscPitch.getFreq(), "Hz" >>>;
    
    beat +=> now;
    chord.stop();
    oscPitch.change(1) => fizzbuzzOsc.freq;
    1 +=> stepCounter;
}
<<< "end program" >>>;
