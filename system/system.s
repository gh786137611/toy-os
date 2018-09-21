.code16
.global _start
.section .text

_start:
    movb    $0x13, %al
    movb    $0,    %ah
    int $0x10

movw gdt_base, %ax


###########0# empty GDT
    movl    $0x00000000,   0(%eax)
    movl    $0x00000000,   4(%eax)
############1# code GDT
    movl    $0x820001ff,   8(%eax)
    movl    $0x00409a00,   12(%eax)
############2# videomem GDT
    movl    $0x0000ffff,   16(%eax)
    movl    $0x0040920a,   20(%eax)
############3# stack GDT
    movl    $0x00007a00,   24(%eax)
    movl    $0x00409600,   28(%eax)

##############configuration 
    movw    $31,       gdt_size
    lgdt    gdt_size
#turn on A20
    in  $0x92,     %al
    or  $0x02,     %al
    out %al,        $0x92
#close interrupt
    cli 
#configure CR0
    movl    %cr0,       %eax
    or  $1,        %eax
    mov %eax,       %cr0
#protect mode start
    ljmp    $0x0008,	$(start_protect-_start) #16bits descriptor, 32bits disp

start_protect:
.code32
    movw    $0x0010,   %ax
    movw    %ax,        %ds
    movw    $0x0018,   %ax
    movw    %ax,        %ss
    movl    $0x7a00,    %esp

    call    SysMain

gdt_size: .word 0
gdt_base: .long 0x8400
