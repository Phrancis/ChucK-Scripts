OscPitch foo;
110 => foo.freq;
<<< foo.getFreq() >>>;
foo.setFreq(220.0);
<<< foo.getFreq() >>>;
foo.change(12);
<<< foo.getFreq() >>>;
foo.change(12);
<<< foo.getFreq() >>>;
foo.setFreq(110);
<<< foo.getFreq() >>>;
foo.change(-12);
<<< foo.getFreq() >>>;