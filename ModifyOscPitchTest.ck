Machine.add( "ModifyOscPitch.ck" ) => int modifyOscPitchInstance;

// set tempo to 120 bpm
0.5::second => dur beat;
4::beat => dur measure;

// oscillators
SawOsc testOsc => dac;
//( 55.0 / 2.0 ) => float oscFreq => testOsc.freq; // Musical note: A0 | 27.5 Hertz
( 100 ) => float oscFreq => testOsc.freq; // Musical note: A0 | 27.5 Hertz

// audio controls
0.15 => testOsc.gain;

// instantiate objects
ModifyOscPitch modifyOscPitch;

<<< oscFreq >>>;

2::beat +=> now;

( oscFreq, 2.0 ) => modifyOscPitch.oscHalfStep => oscFreq => testOsc.freq;

<<< oscFreq >>>;

2::beat +=> now;

Machine.remove( modifyOscPitchInstance );