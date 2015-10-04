0.5::second => dur beat;
4::beat => dur measure;

now + 16::measure => time stop;
1 => int stepCounter;

while ( now < stop ) {
    <<< "Now:", now, "Step:", stepCounter >>>;
    beat +=> now;
    1 +=> stepCounter;
}
<<< "end program" >>>;