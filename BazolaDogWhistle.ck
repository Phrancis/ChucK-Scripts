SinOsc myOsc => dac;
.15 => myOsc.gain;
0.0 => float t;

while( true ) {
    30 + ( Math.sin(t) + 1.0 ) * 10000 => myOsc.sfreq;
    t + .004 => t;
    1::ms => now;
}