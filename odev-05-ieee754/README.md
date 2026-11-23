# 32-bit IEEE 754 Cozumleyici

32 bitlik girisi isaret, us ve kesir alanlarina ayirir. Sifir, subnormal, normal, sonsuz ve NaN turlerini tespit eder. Saat sinyali gerektirmeyen kombinasyonel bir devredir.

| Alan | Bitler |
| --- | --- |
| Isaret | 31 |
| Saklanan us | 30:23 |
| Kesir | 22:0 |

| Tur | Saklanan us | Kesir |
| --- | --- | --- |
| Sifir | 0 | 0 |
| Subnormal | 0 | Sifirdan farkli |
| Normal | 1-254 | Herhangi |
| Sonsuz | 255 | 0 |
| NaN | 255 | Sifirdan farkli |

Isaret biti sayinin turunu degistirmez. Us cikisi bias cikarilmamis, giriste saklanan 8 bitlik alandir.

## Calistirma

```sh
iverilog -g2012 -s testbench -o /tmp/ieee754_sim design.sv testbench.sv
vvp /tmp/ieee754_sim
```

EDA Playground'da SystemVerilog ve Icarus Verilog secilerek design.sv ile testbench.sv ilgili alanlara yapistirilabilir.

Test dosyasi once odevdeki sekiz ornegi yazdirir. Ardindan iki isaret degeri, 256 us degeri ve bes farkli kesir degerini kontrol eder. Toplam 2568 test uygulanir. Her testte bit alanlari ve bes siniflandirma cikisi beklenen degerlerle karsilastirilir. Uyusmazlikta simulasyon hata ile durur.
