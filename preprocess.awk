BEGIN {
    print "include(boilerplate.m4)";
}
(FNR == 1) {
    print "\t.file 1 \"" FILENAME "\"";
}
{
    print "DBGLOC(" FNR ")";
    print;
}

