.include TSMC_180nm.txt
.include andthree.sub
.include and.sub
.include or.sub
.include andfour.sub
.include andfive.sub
.include orfour.sub
.include xor.sub
.include NAND.sub
.include nor.sub
.include Adder_subtract.sub
* .include fourtoonemux.sub
.include comparator.sub
.param SUPPLY = 1V
.param LAMBDA = 0.18u

.param wn1 = {10*LAMBDA}
.param wn2 = {10*LAMBDA}
.param wn3 = {10*LAMBDA}
.param wn4 = {10*LAMBDA}
.param wn5 = {10*LAMBDA}
.param wn6 = {10*LAMBDA}
.param ln1 = {2*LAMBDA}
.param ln2 = {2*LAMBDA}
.param ln3 = {2*LAMBDA}
.param ln4 = {2*LAMBDA}
.param ln5 = {2*LAMBDA}
.param ln6 = {2*LAMBDA}
.param wp1 = wn1
.param wp2 = wn2
.param wp3 = wn3
.param wp4 = wn4
.param wp5 = wn4
.param wp6 = wn4
.param lp1 = {LAMBDA}
.param lp2 = {LAMBDA}
.param lp3 = {LAMBDA}
.param lp4 = {LAMBDA}
.param lp5 = {LAMBDA}
.param lp6 = {LAMBDA}
.global vdd gnd
Vdd vdd gnd 'SUPPLY'


* V_in_a3 a3 gnd PULSE(0 1 0ns 100ps 100ps 20ns 40ns)
* V_in_a2 a2 gnd PULSE(0 1 0ns 100ps 100ps 30ns 50ns)
* V_in_a1 a1 gnd PULSE(0 1 0ns 100ps 100ps 40ns 60ns)
* V_in_a0 a0 gnd PULSE(0 1 0ns 100ps 100ps 50ns 80ns)

*  V_in_b3 b3 gnd PULSE(0 1 0ns 100ps 100ps 10ns 50ns)
*  V_in_b2 b2 gnd PULSE(0 1 0ns 100ps 100ps 20ns 60ns)
* V_in_b1 b1 gnd PULSE(0 1 0ns 100ps 100ps 30ns 70ns)
* V_in_b0 b0 gnd PULSE(0 1 0ns 100ps 100ps 40ns 80ns)

V_in_a3 a3 gnd DC 1V
V_in_a2 a2 gnd DC 0V
V_in_a1 a1 gnd DC 1V
V_in_a0 a0 gnd DC 1V

V_in_b3 b3 gnd DC 0V
V_in_b2 b2 gnd DC 1V
V_in_b1 b1 gnd DC 1V
V_in_b0 b0 gnd DC 1V


*xtwo_fourdecoder node_a node_b node_out3 node_out2 node_out1 node_out0 node_x gnd two_fourdecoder
xcomparator a3 a2 a1 a0 b3 b2 b1 b0 agb aeb alb vdd gnd comparator
* x1 a0 b0 b1 b2 b3  out vdd gnd andfive
*  x2 b0 b0 b1 b1 b1 out vdd gnd andfive
* x3 a0 a1 out vdd gnd xnor
* x6 a0 a1 output vdd gnd nor
* V_inaddenable aen gnd DC 1V
* xadd a3 a2 a1 a0 b3 b2 b1 b0 aen addresult3 addresult2 addresult1 addresult0 addcout vdd gnd Adder_subtract

.tran 0.05n 100n

.control
run
set color0 = rgb:f/f/e
set color1 = black
plot v(a0) v(a1)+3 v(a2)+6 v(a3)+9  v(b0)+12 v(b1)+15 v(b2)+18 v(b3)+21 
* plot v(addresult0) v(addresult1)+2 v(addresult2)+4 v(addresult3)+6 v(addcout)+8
plot v(alb) v(aeb)+4 v(agb)+8 
*  plot v(a0) v(b0)+4  v(b1)+8 v(b2)+12 v(b3)+15 v(out)+17
*  plot v(a0) v(a1)+4  v(output)+8

.endc
.end


