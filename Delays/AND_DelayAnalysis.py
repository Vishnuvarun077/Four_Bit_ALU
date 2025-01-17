import os
import subprocess

command = "ngspice destination.cir"

fp3 = open("ANDblock_delayanalysis.txt", 'w')
fp3.close()

fp1 = open("alu.cir", "r")
data = fp1.read()
fp1.close()

SearchText = "* VinS0 S0"
ReplaceText = "VinS0 S0 Gnd DC 'SUPPLY'"
data = data.replace(SearchText, ReplaceText)

SearchText = "* VinS1 S1"
ReplaceText = "VinS1 S1 Gnd DC 'SUPPLY'"
data = data.replace(SearchText, ReplaceText)

SearchText = "* V_in_a3 A3"
ReplaceText = "V_in_a3 A3 Gnd PULSE('SUPPLY' 0 0ns 100ps 100ps 10ns 20ns)"
data = data.replace(SearchText, ReplaceText)

SearchText = "* V_in_a2 A2"
ReplaceText = "V_in_a2 A2 Gnd PULSE('SUPPLY' 0 0ns 100ps 100ps 10ns 20ns)"
data = data.replace(SearchText, ReplaceText)

SearchText = "* V_in_a1 A1"
ReplaceText = "V_in_a1 A1 Gnd PULSE('SUPPLY' 0 0ns 100ps 100ps 10ns 20ns)"
data = data.replace(SearchText, ReplaceText)

SearchText = "* V_in_a0 A0"
ReplaceText = "V_in_a0 A0 Gnd PULSE('SUPPLY' 0 0ns 100ps 100ps 10ns 20ns)"
data = data.replace(SearchText, ReplaceText)

SearchText = "* V_in_b3 B3"
ReplaceText = "V_in_b3 B3 Gnd PULSE('SUPPLY' 0 0ns 100ps 100ps 10ns 20ns)"
data = data.replace(SearchText, ReplaceText)

SearchText = "* V_in_b2 B2"
ReplaceText = "V_in_b2 B2 Gnd PULSE('SUPPLY' 0 0ns 100ps 100ps 10ns 20ns)"
data = data.replace(SearchText, ReplaceText)

SearchText = "* V_in_b1 B1"
ReplaceText = "V_in_b1 B1 Gnd PULSE('SUPPLY' 0 0ns 100ps 100ps 10ns 20ns)"
data = data.replace(SearchText, ReplaceText)

SearchText = "* V_in_b0 B0"
ReplaceText = "V_in_b0 B0 Gnd PULSE('SUPPLY' 0 0ns 100ps 100ps 10ns 20ns)"
data = data.replace(SearchText, ReplaceText)

# SearchText = "* Operation"
# ReplaceText = '''
# run
# quit
# '''
data = data.replace(SearchText, ReplaceText)

for j in range(0, 8):
    if j < 4:
        s1 = 'A'+str(j)
    else:
        s1 = 'B'+str(j-4)
    for i in range(0, 4):
        s2 = 'AndY'+str(i)

        fp2 = open("destination.cir", "w")
        fp3 = open("ANDblock_delayanalysis.txt", "a")

        mode1 = 'RISE'
        mode2 = 'RISE'
        mode3 = 'FALL'
        mode4 = 'FALL'

        SearchText = "* Text to be Replaced"
        ReplaceText = f'''
.measure tran trise 
+ TRIG v({s1}) VAL = 'SUPPLY/2' {mode1} =1
+ TARG v({s2}) VAL = 'SUPPLY/2' {mode2} =1 

.measure tran tfall 
+ TRIG v({s1}) VAL = 'SUPPLY/2' {mode3} =1 
+ TARG v({s2}) VAL = 'SUPPLY/2' {mode4}=1

.measure tran tpd param = '(trise + tfall)/2' goal = 0
'''
        data = data.replace(SearchText, ReplaceText)

        fp2.write(data)
        fp2.close()


        Simulation = subprocess.run(
            command, shell=True, text=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        if Simulation.returncode == 0:
            output = Simulation.stdout
        else:
            output = ("Command execution failed. at", str(i), str(j))

        output = output.split('\n')
        output = output[-4]
        AdditionalText = f"for Input = {s1} and Output = {s2}\n"

        fp3.write(output+AdditionalText)
        fp3.close()
