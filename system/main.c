void SysMain()
{
    int i;
    char *p;
    for(i = 0x00000;i<0x0ffff;i++)
    {
        p = (char *)i;
        *p = 94;
    }
    while(1);
}
