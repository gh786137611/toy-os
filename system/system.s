.code16
.global _start
.section .text
_start:
    movb    $0x13, %al
    movb    $0,    %ah
    int $0x10

final:
    hlt
    jmp final
