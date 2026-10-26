# Odev 3 - 4 Bit ALU

SystemVerilog ile 4 bitlik ALU devresi tasarlandi. ALU, `select` girisine gore iki sayi uzerinde toplama, cikarma, AND veya OR islemi yapar.

| Secim | Islem |
| --- | --- |
| 00 | Toplama |
| 01 | Cikarma |
| 10 | AND |
| 11 | OR |

## Dosyalar

- `design.sv`: ALU tasarimi
- `testbench.sv`: Secilen islemi deneyen test kodu

## EDA Playground'da calistirma

1. Language olarak **SystemVerilog/Verilog**, simulator olarak **Icarus Verilog 12.0** secilir.
2. `testbench.sv` sol Testbench bolumune, `design.sv` sag Design bolumune yerlestirilir.
3. **Run Options** bos birakilir.
4. **Compile Options** icinde `-Wall -g2012 -DSECIM=0` yazilir. Sondaki sayi 0-3 arasinda degistirilerek islem secilir.
5. **Run** ile sonuc gorulur.

Ornek girisler: A = `0110` (6), B = `0011` (3).

| SECIM | Beklenen sonuc |
| --- | --- |
| 0 | 1001 (9) |
| 1 | 0011 (3) |
| 2 | 0010 (AND) |
| 3 | 0111 (OR) |

Not: Cikis 4 bittir. Toplama ve cikarmada sonuc 4 bit ile sinirlandirilir.
