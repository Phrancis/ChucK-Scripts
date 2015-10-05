// Imports.ck
// This file defines which files to add to the VM
// Inspired from instructions found at:
//  https://lists.cs.princeton.edu/pipermail/chuck-users/2012-March/006605.html
Machine.add("OscUtils/OscPitch.ck") => int OscPitchId;
Machine.add("TimeUtils/TempoMeter.ck") => int TempoMeterId;
if(me.args() > 0) {
    Machine.add("fizzbuzz_run:" + me.arg(0) + ".ck");
} else {
    Machine.add("fizzbuzz_run.ck");
}