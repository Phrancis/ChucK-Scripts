// fizzbuzz.ck
// This file defines which files to add to the VM
Machine.add("OscUtils/OscPitch.ck") => int OscPitchId;
Machine.add("OscUtils/OscChords.ck") => int OscChordsId;
Machine.add("TimeUtils/TempoMeter.ck") => int TempoMeterId;
if(me.args() > 0) {
    Machine.add("fizzbuzz_run:" + me.arg(0) + ".ck");
} else {
    Machine.add("fizzbuzz_run.ck");
}