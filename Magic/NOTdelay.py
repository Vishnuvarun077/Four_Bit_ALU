import os
import subprocess

# Define the path to the NGSpice executable and input file
ngspice_executable = 'ngspice'  # Change this to the path of ngspice executable if needed
spice_file = 'NOT.spice'

# Create an output file to store results
output_file = open("output.txt", 'w')
output_file.close()

# Command to run NGSpice with the destination file
command = f" destination.ckt"

# Start of the script
for i in range(2):
    if i == 0:
        s1 = "in"
        s2 = "out"
        mode1 = "FALL"
        mode2 = "RISE"
    else:
        s1 = "out"
        s2 = "in"
        mode1 = "RISE"
        mode2 = "FALL"

    # Read the source circuit file
    with open("NOT.spice", 'r') as fp1:
        data = fp1.read()

    # Replace target text with delay measurement
    search_text = "*target text"
    replace_text = f'''
.measure tran trise 
+ TRIG v({s1}) VAL = 'SUPPLY/2' {mode1} = 1
+ TARG v({s2}) VAL = 'SUPPLY/2' {mode2} = 1

.measure tran tpd param = 'trise' goal = 'SUPPLY/2' rise
        '''
    data = data.replace(search_text, replace_text)

    # Write the modified circuit to the destination file
    with open("destination.ckt", 'w') as fp2:
        fp2.write(data)

    # Run NGSpice simulation
    completed_process = subprocess.run(command, shell=True, text=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)

    # Capture the NGSpice output
    if completed_process.returncode == 0:
        output = completed_process.stdout
    else:
        output = f"Command execution failed for iteration {i}"

    # Write results to the output file
    output = output.split('\n')
    output = output[-4]  # Assuming the delay information is in the last lines
    additional_text = f" input = {s1} output = {s2}\n"

    with open("output.txt", 'a') as fp3:
        fp3.write(output + additional_text)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            