main:
      li $t0, 0x00101000
      slt $t2, $0, $t0
      bne $t2, $0, ELSE
      j DONE
      ELSE: addi $t2, $t2, 5
DONE:
