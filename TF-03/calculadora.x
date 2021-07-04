struct numbers{
    float a;
    float b;
};
program CALC_PROG{
    version CALC_VERS{
        float ADD(numbers)=1;
        float SUB(numbers)=2;
        float MUlT(numbers)=3;
        float DIV(numbers)=4;
    }=1;
}=0x23451111;
