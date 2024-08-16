# Social Interaction Chamber
Detailed Protocol: Social Interaction Chamber 

See the “Detailed Protocol” tab in the “Social Interaction Chamber Materials” spreadsheet for a sequential list of the required materials for the construction of the Social Interaction Chamber.
GitHub repository: https://github.com/UNC-optics/Social-Interaction-Chamber 
![Clear pieces](https://github.com/user-attachments/assets/942b8b99-c172-4cbd-9cc6-058e0963b1c9)

Construction of laser cut box
1.	Use the “Social Interaction Chamber Walls Laser Cut File.svg” in the GitHub to vector laser cut the structural panels of the Social Interaction Chamber. 
2.	Cut the partition and lid (black lines) out of 1/16in clear cast acrylic.
3.	Cut the left and right walls, back wall, and floor (red lines) out of 1/8in white cast acrylic. 
4.	Use acrylic paste cement to attach the walls and floor as shown in Figure 2E. Leave the lid and partition detached from the rest of the panels.
5.	Use acrylic paste cement to secure the acrylic hinge to the lid and the back wall of the box as shown in Figure 2E. 
6.	Allow acrylic panels to sit overnight to cure. 

PCB assembly 
7.	Use the “PCB Fabrication Files Social Interaction Chamber” folder provided in the GitHub to order the custom pre-assembled PCB from a manufacturing company (JLCPCB, HK, CN). The PCB should be prepared as a 1.6mm thick two-layer PCB, with no special instructions. 
8.	In the same order, use the “PCB Assembly Files Social Interaction Chamber” folder to request electronic component assembly services. Parts must be placed according to the Bill of Materials and Components Placement List as demonstrated in the assembly files.
9.	Following assembly, use a tampered cutter tool to detach the PCB board at the joints indicated in Figure 2A to produce 2 L-shaped PCBs and one rectangular PCB.
10.	Hand solder the 90-degree pins onto the rectangular PCB as shown in Figure 2B. 
11.	Solder the base of the L-shaped PCBs to the other end of the 90-degree pins to hold them perpendicular to the rectangular PCB (Figure 2C). Use the width of the acrylic chamber as a sizing guide and ensure that the diodes of the L-shaped PCBs face inward toward one another with the flush side of the base PCB facing upward. 
12.	Use the tampered cutter tool to trim the excess wire from the 90-degree pins.

PCB testing and cable construction
13.	Plug in a USB-A to USB-C cable into the Seeeduino XIAO and a computer with Arduino IDE software (Version: 2.3.2). Install the Seeeduino library and drivers via the board manager (https://wiki.seeedstudio.com/Seeed_Arduino_Boards/).
14.	Open the “Programming_Code_ Social_Interaction_Chamber.ino” code provided in the GitHub using the Arduino IDE software. Connect to the Seeeduino XIAO port and allow the device to sit freely without obstructions. Upload the programming code to the board. 
15.	Open the serial monitor in the Arduino software. Obstruct the beam path with a solid object and ensure that Inside “I”, Outside “O”, and Near “N” outputs appear in the serial monitor along with binary data indicating beam break status (0 - no break, 1 - beam broken). Upon functionality confirmation, unplug the device.
16.	Use wire strippers to remove ~20mm of the outer jacket from one end of the black cable and expose the 4 internal conductors. Then strip ~10 mm of insulator from each of the individual wires to expose the copper core of all internal conductors. 
17.	Thread heat shrink over each of the 4 internal conductors. Hand solder the wires on one side of the cable to each of the metal pins of the 4-pin female socket header as shown in Figure 2B. Pull the heat shrink over exposed wire surfaces and melt the material with a soldering iron to enclose the soldered junctions. 
18.	On the other end of the black cable, use the wire stripper to remove ~50mm of the jacket and ~15mm of insulator from each internal conductor. The open wires will be secured into the ANY-maze digital interface terminals in the experimental protocol.

3D printed case and waterproofing
19.	3D print the PCB case and diode sleeves provided in the GitHub as .step files using white PLA filament with 0.2mm resolution. 
20.	When the print is complete, use tweezers to remove internal supports from the diode sleeves and the PCB case. 
21.	Place the external PCB case over the finalized PCB to protect the PCB and components as shown in Figure 2D. 
22.	Fit the PCB around the acrylic walls with the diodes aligned with the 4 holes through each wall (Figure 2E). Be sure to avoid dragging the diodes across the edge of the wall to prevent damage.
23.	Super glue the 3D printed inner diode sleeves to the internal wall of the chamber as shown in Figure 2F.  
24.	With a 1:1 ratio, mix 20mL of 2-part epoxy. If a 1:1 ratio is not maintained, the epoxy will not fully cure.
25.	Use a cotton swab to apply the mixed epoxy into the space between the PCB and the external casing, as well as along the bottom edge of the chamber and PCB. Be generous along this surface and over the PCB, as it will waterproof the chamber to prevent potential damage to the PCB caused by mouse urine.
26.	While the epoxy is still wet, place the partition over the open face of the chamber as depicted in Figure 2G. You may also apply epoxy at the top of the side walls to secure the partition in place.
27.	Place the outer sleeves over the protruding PCB arms and use super glue to secure the sleeves to the outside of the partition as shown in Figure 2G.
28.	Allow the chamber to cure for at least an hour before testing. 

ANY-maze integration
29.	To integrate the device with ANY-maze, connect the wires that correspond with the outputs to separate ports in the ANY-maze Digital Interface. 
30.	Connect the ground wire to a secondary terminal in one of the ports.
31.	In the ANY-maze device configuration settings, configure the selected ports to be TTL inputs with 0V (GND) provided as the output power at the second pin of each port. 
32.	Plug in the USB-C to provide 5V of power to the device from the computer and select the I/O tab in ANY-maze to track the status of each output. 
33.	Use a solid object to obstruct the photobeams and test functionality. The default outputs 
