.code16
.global _start
.section .text
_start: 
entry:
    movl    $0,    %eax
    movl    %eax,   %ds
    movl    %eax,   %ss
    movl    $0x7c00,%esp


    movl    $0x0820,%eax
    movl    %eax,   %es
    movb    $0,    %ch #柱面0
    movb    $0,    %dh #磁头0
    movb    $2,    %cl #扇区2

read:   
    movb    $0x02, %ah #读磁盘
    movb    $1,    %al #读一个扇区
    movw    $0,    %bx 
    movb    $0,    %dl #A驱动器
    int $0x13      #读磁盘

    movl    %es,    %eax
    add $0x0020,    %eax
    movl    %eax,   %es

    inc %cl
    cmp $18,   %cl
    jbe read
    movb $1, %cl
    inc %dh
    cmp $1,    %dh
    jbe read
    movb    $0,    %dh
    inc %ch
    cmp $9,    %ch
    jbe read
    jmp 0x8200
marker1:
    .fill   0x1fe-(marker1-_start)
    .byte   0x55,   0xaa
