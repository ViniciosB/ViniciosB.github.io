struct numbers{
    int a;
    int b;
};
program CALC_PROG{
    version CALC_VERS{
        int ADD(numbers)=1;
        int SUB(numbers)=2;
        int MUlT(numbers)=3;
        float DIV(numbers)=4;
    }=1;
}=0x23451111;