# Detailed Protocol: Social Interaction Chamber 

See the *Detailed Protocol* tab in the *Materials List/Social Interaction Chamber Materials.xlsx* spreadsheet for a sequential list of the required materials for the construction of the Social Interaction Chamber.
GitHub repository: https://github.com/UNC-optics/Social-Interaction-Chamber 

# Construction of laser cut box

1.	Use the *Hardware Manufacturing/Laser Cutting Files/Social Interaction Chamber Walls Laser Cut File.svg* file to vector laser cut the structural panels of the Social Interaction Chamber.
   
2.	Cut the partition and lid (black lines) out of 1/16in clear cast acrylic.
   ![Clear Laser Cut Pieces](https://github.com/user-attachments/assets/6a37a6c0-da75-4a4f-b60f-0c010265fa8a)
  	
3.	Cut the left and right walls, back wall, and floor (red lines) out of 1/8in white cast acrylic.
   ![White Laser Cut Pieces](https://github.com/user-attachments/assets/3ea4cb6e-5954-450e-8881-0b6baed38976)
  	
4.	Use acrylic paste cement to attach the walls and floor. Leave the lid and partition detached from the rest of the panels.
   
5.	Use acrylic paste cement to secure the acrylic hinge to the lid and the back wall of the box.
   ![Chamber Acrylic Assembly](https://github.com/user-attachments/assets/3b6847cc-9614-4489-95fc-c9b40c694510)

6.	Allow acrylic panels to sit overnight to cure. 

# PCB assembly

7.	Use the *Hardware Manufacturing/PCB Fabrication and Assembly/PCB Fabrication Files Social Interaction Chamber.zip* folder provided in the GitHub to order the custom pre-assembled PCB from a manufacturing company (JLCPCB, HK, CN). The PCB should be prepared as a 1.6mm thick two-layer PCB, with no special instructions.
   
8.	In the same order, use the *Hardware Manufacturing/PCB Fabrication and Assembly/PCB Assembly Files Social Interaction Chamber.zip* folder to request electronic component assembly services. Parts must be placed according to the Bill of Materials and Components Placement List as demonstrated in the assembly files.
    
9.	Following assembly, use a tampered cutter tool to detach the PCB board at the indicated joints to produce 2 L-shaped PCBs and one rectangular PCB.
   ![PCB PreCut](https://github.com/user-attachments/assets/68fa4855-61aa-4018-852d-9c0f7007131e)

10. Hand solder the 90-degree pins onto the rectangular PCB as shown.
    ![PCB PostCut](https://github.com/user-attachments/assets/8707419a-9551-4b26-9ecc-c180010a4cd7)

11. Solder the base of the L-shaped PCBs to the other end of the 90-degree pins to hold them perpendicular to the rectangular PCB. Use the width of the acrylic chamber as a sizing guide and ensure that the diodes of the L-shaped PCBs face inward toward one another with the flush side of the base PCB facing upward.
    ![PCB Perpendicular](https://github.com/user-attachments/assets/6f875342-134d-4b68-8167-c98845003936)

12. Use the tampered cutter tool to trim the excess wire from the 90-degree pins.


# PCB testing and cable construction

13. Plug in a USB-A to USB-C cable into the Seeeduino XIAO and a computer with Arduino IDE software (Version: 2.3.2). Install the Seeeduino library and drivers via the board manager (https://wiki.seeedstudio.com/Seeed_Arduino_Boards/).
    
14. Open the *Microcontroller Programming Code/Programming_Code_Social_Interaction_Chamber.ino* file using the Arduino IDE software. Connect to the Seeeduino XIAO port and allow the device to sit freely without obstructions. Upload the programming code to the board.
  
15. Open the serial monitor in the Arduino software. Obstruct the beam path with a solid object and ensure that Inside “I”, Outside “O”, and Near “N” outputs appear in the serial monitor along with binary data indicating beam break status (0 - no break, 1 - beam broken). Upon functionality confirmation, unplug the device.
    
16. Use wire strippers to remove ~20mm of the outer jacket from one end of the black cable and expose the 4 internal conductors. Then strip ~10 mm of insulator from each of the individual wires to expose the copper core of all internal conductors.
    
17. Thread heat shrink over each of the 4 internal conductors. Hand solder the wires on one side of the cable to each of the metal pins of the 4-pin female socket header as shown in Figure 2B. Pull the heat shrink over exposed wire surfaces and melt the material with a soldering iron to enclose the soldered junctions.
    
    ![Cable Pinout](https://github.com/user-attachments/assets/de594cb1-ff33-4ce7-89c0-413638bbd0cf)

18. On the other end of the black cable, use the wire stripper to remove ~50mm of the jacket and ~15mm of insulator from each internal conductor. The open wires will be secured into the ANY-maze digital interface terminals in the experimental protocol.

# 3D printed case and waterproofing
19. 3D print the PCB case and diode sleeves provided in the *Hardware Manufacturing/3D Printed Parts* folder using white PLA filament with 0.2mm resolution.
20. When the print is complete, use tweezers to remove internal supports from the diode sleeves and the PCB case.
    ![3D Printed Casing](https://github.com/user-attachments/assets/c63ea85d-db89-451b-ad10-bc1a7e68651c)
    
21. Place the external PCB case over the finalized PCB to protect the PCB and components.
![PCB with Case](https://github.com/user-attachments/assets/2a1111d7-4de6-4b23-89be-299ad7393930)

22. Fit the PCB around the acrylic walls with the diodes aligned with the 4 holes through each wall. Be sure to avoid dragging the diodes across the edge of the wall to prevent damage.
    
    ![PCB Placed Around Chamber](https://github.com/user-attachments/assets/dac081dc-cd19-4ac8-ac1d-ff1d14faae1b)

23. Super glue the 3D printed inner diode sleeves to the internal wall of the chamber.
    ![Inner Diode Sleeve Placement](https://github.com/user-attachments/assets/347cacdc-24b3-4b23-975e-a12556d9acd3)

24. With a 1:1 ratio, mix 20mL of 2-part epoxy. If a 1:1 ratio is not maintained, the epoxy will not fully cure.
25. Use a cotton swab to apply the mixed epoxy into the space between the PCB and the external casing, as well as along the bottom edge of the chamber and PCB. Be generous along this surface and over the PCB, as it will waterproof the chamber to prevent potential damage to the PCB caused by mouse urine.
26. While the epoxy is still wet, place the partition over the open face of the chamber. You may also apply epoxy at the top of the side walls to secure the partition in place.

    ![Partition Placement](https://github.com/user-attachments/assets/27d2ef60-740d-4079-a9a5-0f123fb5614c)

27. Place the outer sleeves over the protruding PCB arms and use super glue to secure the sleeves to the outside of the partition.
    ![Outer Sleeve Placement](https://github.com/user-attachments/assets/723e89b2-ced5-4816-965e-b7e8508a4e04)

28. Allow the chamber to cure for at least an hour before testing. 

# ANY-maze integration

29. To integrate the device with ANY-maze, connect the wires that correspond with the outputs to separate ports in the ANY-maze Digital Interface.
    
30. Connect the ground wire to a secondary terminal in one of the ports.
    
31. In the ANY-maze device configuration settings, configure the selected ports to be TTL inputs with 0V (GND) provided as the output power at the second pin of each port
    
32. Plug in the USB-C to provide 5V of power to the device from the computer and select the I/O tab in ANY-maze to track the status of each output.
  
33. Use a solid object to obstruct the photo beams and test functionality. The default programming outputs trigger a TTL input switch in the following conditions: when the stimulus mouse breaks both beams (Inside - “I”), when the experimental mouse breaks both beams (Outside - “O”), or when the experimental mouse is approaching and breaks only one beam (Near - “N”). Additionally, each N, I, O state is streamed through the USB port whenever a status change occurs and can be used to troubleshoot the ANY-maze integration functionality.
