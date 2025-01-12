
## Specification

### 1つ目のMux16

```nasm
// Mux16(a= ,b= ,sel= ,out= ) /* Selects between two 16-bit inputs */

a: instruction
b: alu output
sel: instruction[15] // a-instructionかどうかの判断に利用。0ならa
out: mux1out
```

### A register

```nasm
// ARegister(in= ,load= ,out= ) /* Address register (built-in) */

in: mux1out
load: // a-instruction か、もしくは c-instruction の destに A registerがあるか
out: aRegisterOut
```

### PC

```nasm
// PC(in= ,load= ,inc= ,reset= ,out= ) /* Program Counter */

in: aRegisterOut
load:  // c-instructionのjumpを元に算出
inc: true // 常にtrue
reset: reset
out: pcOut
```

### 2つ目のMux16

```nasm
// Mux16(a= ,b= ,sel= ,out= ) /* Selects between two 16-bit inputs */

a: aRegisterOut
b: inM[16]:
sel: instruction[15] // 0ならAレジスタの値を使い、1ならMの値を使う
out: mux2out
```

### D register

```nasm

```

## Link
https://drive.google.com/file/d/1IsDnH0t7q_Im491LQ7_5_ajV0CokRbwR/view