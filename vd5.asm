.model small
.stack 100
.data
 nhap db 'nhap 1 chuoi ki tu: $'
 xuat db 13, 10, 'do dai cua chuoi vua nhap la: $'
.code
 main proc   
    ;khoi tao thanh ghi DS
    mov ax, @data
    mov ds, ax
    ;hien thi tb hay nhap chuoi ki tu tu ban phim
    lea dx, nhap
    mov ah, 09h
    int 21h
    ;xoa cac thanh ghi CX va BX
    xor cx, cx

 nhapchuoi:    
    mov ah,01h
    int 21h ; nhap 1 ki tu tu ban phim
    cmp al, 13 ; so sanh ki tu vua nhap voi enter
    je ra  
    inc cx ; tang bo dem len 1
    jmp nhapchuoi
    
 ra:lea dx, xuat  ;hien thi thong bao xuat chuoi nguoc len man hinh  
    mov ah, 09h
    int 21h
    ;thuc hien xuat chuoi nguoc len man hinh   
    mov dx, 0
    mov ax, cx
    xor cx, cx
dodaichuoi:  
    mov dx, 0 
    mov bx, 10
    div bx ;chia dxax cho 10
    push dx
    cmp ax, 0
    je ra2
    inc cx
    jmp dodaichuoi
ra2:
    mov ah, 02h
    pop dx
    add dx, 30h ; ma ascii cua ki tu so 
    int 21h
    cmp cx, 0
    je done
    dec cx
    jmp ra2
    
    

done: mov ah, 4ch
      int 21h 
 main endp
end main