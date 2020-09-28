# Standard Protocol Procedure for Using the Titrator

Original: 3/5/2018
Last Revised: 2/10/2019

Contents
- [**Materials**](#Materials)
- [**Pre-Setup**](#Pre-Setup)
- [**Setup**](#Setup) 
- [**Calibration**](#Calibration) 
- [**Running_a_titration**](#Running_a_titration) 
- [**CRM_Titration**](#CRM_Titration) 
- [**SAMPLE_Titration**](#SAMPLE_Titration) 
- [**Measure_Salinity**](#Measure_Salinity) 
- [**Data_Analysis**](#Data_Analysis) 
- [**Clean_Up**](#Clean_Up) 

--- 

1. <a name="Materials"></a> **Materials**
	1. Mettler Toledo InMotion Pro Autosampler
	2. Mettler Toledo Titrator
	2. Mettler Toledo Interchangable Burettes
	3. Mettler Toledo Analytical Balance (XP Model)
	4. Mettler Toledo LabX Laboratory Software (connects titrator, balance, burettes, etc.)
	5. Mettler Toledo Compact Stirrer
	6. Mettler Toledo pH electrode 
	7. Mettler Toledo Temperature Probe 
	8. Mettler Toledo InLab Solutions KCl 3 mol/L solution (for titrator pH electrode)
	9. Thermo Scientific Orion Star A221 and Star A321 Portable pH Meter
	10. Nitrile gloves
	11. Kimwipes
	12. 250 mL glass beaker
	13. 80 mL tall plastic beakers (titrator cups)
	14. 25 mL CELLSTAR serological pipette
	15. Scienceware 25mL pipette holder
	16. Computer capatible with LabX program
	17. Orion application solution pH buffers (4.01, 7.00 and 10.01)
	18. 3 NALGENE 250 mL centrifuge bottles 
	19. DI water
	20. Filtered seawater (for junk samples)
	21. 5 gallon carboy for waste
	22. Certified Reference Material (CRM) from the Dickson Lab (standards)
	23. Orion application solutions for two-point conductivity calibration (TDS standard: 12.9 mS/cm and 1413 μS/cm)
	24. 3 drying mats
	25. RStudio software
	26. Dickson Lab HCl 0.1 N 

2. <a name="Pre-Setup"></a> **Pre-Setup**
	1. Since you are working with acid. You must wear a Lab Coat and Examination Gloves always, before starting the experiment. Safety Goggles is optional.
3. <a name="Setup"></a> **Setup**
	1. Turn on Laptop, InMotion Pro Autosampler, and Titrator.
		1. To turn on the Titrator, press the Power Button in the front of the machine (green button).
		2. To turn on the Autosampler, press the Power Button in the front of the machine (green button). 
			1. If the Autosampler is Yellow while the Titrator is on, restart both Autosampler and Titrator until it’s green
			2. If the Autosampler is Red, Report it.
			3. If the Autosampler is Green, you may move on to the next step. 
		3. When the Autosampler is connected, the Titrator will detect an acid. Once shown, press “OK” on the screen.
		4. Another pop-up will show up. Press “OK” on that too.  It's possible the titrator will go straight to its main menu, in which case, go to the next step.
	2. Using the laptop, create one Folder within the Data Folder. [this PC > windowsC: >labx_data > Titrator > Data]
		1. The folder must be named something appropriate for the samples being processed (for example, Bermuda31 would be all the Bermuda data for 31 degrees) within the Data Folder. *(That is your folder of the day.)*
	3. Open Excel, LabX and RStudio (R)
		1. Minimize Excel and R to reduce clutter.
		2. Using LabX, modify the Server Export Directory so that the files export to your *folder of the day*. To do so, go to System (Bottom Left) > At the System’s tab, click “Import and Export” then “Export Templates” > Select “Export Template” and search for the "Edit Export Template" icon in the upper left. Click the Settings tab then edit the Export File Name and Export Directory.
			1. On the “Server Export Directory,” that is where your data is going. You can modify it by clicking on “Edit Export Template” and navigate to the *folder of the day*.
	4. Using an 80ml empty cup (use cup labeled "ACID HCL ONLY"), place it on the Autosampler in position 69.
	5. Park the autosampler by pressing “Park” then "OK" on the Titrator tablet. This will send the sensors to position 69.
	6. On the Titrator tablet, tap “PRIME” at least 3 separate times, waiting each time for the titrator to run through its acid purge into the cup.
		1. **YOU MUST PARK THE AUTOSAMPLER FIRST, OTHERWISE THE ACID WILL SPILL ALL OVER THE AUTOSAMPLER.**
			1. If it ever occurs, you must use the chemical wipes with DI water to soak up the acid.
		2. *[Note: Prime is used to purge any air bubbles that may occur in the acid line.]*
	7. After Purging, if the Autosampler’s arm does not lift automatically, wave your arm on the sensor on the  right side of the Autosampler’s arm to lift it. 
	8. Recycle the acid into the glass bottle that is connected to the titrator by removing the small white plug and pour carefully into the bottle.
		1. If a spill occurs, read **[e.i.1]**
	9. Using DI water, clean the acid cup and hang it on the rack to dry.
	10. Located at the left side, at the back of the Autosampler, there should be a pH Sensor. Place it on the hole that’s next to the propeller.
		1. Before calibrations can be made, look at the top of the Sensor for KCl, if a sufficient amount of KCl can be seen, skip to **[j]**. If not, follow the step below.
		2. If KCl reservoir is low, open the cap on the sensor’s reservoir and add a few drops of KCl on the opening.
	11. Make sure that the cap is open at all times, so it can measure the pH.
	12. Make sure the probe rinse reservoir is filled with DI water (an Erlenmeyer Flask on the right side of the InMotion Pro). 
	13. Once the pH probe is placed in its slot next to the propeller, fill a DI Only cup 2/3 full with DI water and place this cup in slot 69.  On the Titrator screen, "Park" the autosampler.  The pH probe should always be submerged in a liquid (DI or its storage solution).

4. <a name="Calibration"></a> **Calibration**
	1. Gather three 80ml cups (labeled as pH cups) and add the pH buffer to each of the cups until filled halfway.
		1. The pH buffers used are 4, 7, and 10.
			1. If you use new buffers, write the date opened on the bottle and pour ~60 ml into the 3 separate 80 ml cups.
			2. After calibration, pour the buffers into a clean regent bottle, respective of their pH. Those buffers can be used for future uses for ~ 1 week.
	2. Place the three cups in the Autosampler starting from position 1-3.
		1. The pH cups will be in the order of 4, 7, and 10 in slots 1, 2, and 3 repsectively.
	3. Using LabX, click "Analysis" on the bottom left-hand side then look for the Released Methods and click on “Calibration”
	4. Click Start > Titrator > Start to start the Calibration.
		1. You can either Right click on the Calibration group or look for the tab named “Recurrence” (It’s on top of the Released Methods) and click Start.
	5. Viewing from the Titrator window, watch the graph for any anomalies.
		1. Anomalies such as the graph jumping constantly.
			1. **Unless the zoom scale of the graph in the y-axis is at .1, small zig-zags are acceptable, but any change >0.1 units over time means that the calibration should be re-done with new buffers.**
		2. Once finished, the graph should be a Flat Line for individual samples or a downward graph if all three points are displayed.
			1. **If the results are not as described in step [ii.], replace buffers and redo [a. - d.].**
	6. Using Excel, open the “pHCalibration.csv” file 
		1. *(Destination: labX_data > Data)*
	7. Record the Date, Zero Point, Slope, pH 4, pH 7, pH 10, and Notes
		1. The Notes are used to determine the age of the buffer.
		2. To gather Zero Point and Slope, go to LabX > Click Data > look for “Result Sets” on the Data Tab bar (Top Left) > Click “Last 24 hours” > Doiuble click pH CAL” > Record the data for slope and zero point onto the Excel spreadsheet.
			1. *As an alternative: Go to the Titrator tablet and if the tablet displays that the Calibration is done, press OK to view the Zero Point and Slope.*
		3. To gather data for each pH, click the Raw Data tab from the same pH CAL Results Set.
			1. Look for the “E” mV value for each pH, and record the "E" values on the spreadsheet. 
				1. Note: The results should be displayed in order from pH of 4, 7, then 10 as you scroll down in the raw data results page.
	8. Once the calibrations are complete, remove the cups from the Autosampler and dispose them into the into a plastic reagent bottle, respective of their pH.
	       1. If the pH buffers need replacing, dispose of the buffers by pouring 4 and 10 down the sink simultaneously while running the faucet.  Then pour the 7 buffer.  Rince the pH buffer cups with water and hang them on the rack to dry.
	9. Save document and set the destination to the “Data” Folder.

5. <a name="Running_a_titration"></a> **Running_a_titration**
	1. Titration set-up
		1. You should start each day by running a Certified Reference Material (CRM) from the Dickson Lab. These are the standards. The procedure for running any titration, whether a CRM or unknowns are as follows. It is also advisable to start with a “junk” sample (filtered seawater that you don’t care about) at the beginning of each run to ensure there are no air bubbles in the acid line. 
		2. On the LabX window, similarly to calibration, click on Silbiger TA (EP)r1 > Start > Titration
		3. A window should pop up. Depending on the number of the sample measured, click on “Number of Samples” then apply the specific number of samples used in the titration, then press enter on the keyboard.
	2. On the left, look for the “ID 1” column and label the sample. Put in all your sample IDs into this column.
		1. Next to the “ID 1” column, there should be a column named “Weight [g].” 
		2. Click on the first row and then proceed to the analytical balance.
	3. Weigh the sample from the Analytical Balance.
		1. See [“Protocol Procedure for Using the Balance” ](BalanceSOP.md), Turn on the balance > tap LabX Online (on balance) > weigh empty bottle first > Press “→T←” button to “Zero” the balance.
			1. *[Note: The balance may connect to LabX automatically upon switching on. Also, note, the LabX workspace for the balance must be open for the data to transfer (go to labX main page > show workbench > xp205dr]*
		2. In this step, carefully add the sample into the 80ml cup until the scale reads 60g ± .5g or instructed otherwise.
			1. If the pipettes are available, open the top of the case and use the pipette vertically from the cup then pour until the weight reaches 60g ± .5g or instructed otherwise.
			2. If the pipettes aren’t available, use a beaker to pour on the sample on the side while the case is open. (PROCEDE WITH EXTREME CAUTION!)
			3. If any spillage ever occurs, Report it immediately. Don’t attempt to clean it yourself.
		3. Also recalling from “Protocol Procedure for Using the Balance”, transfer the sample by tapping “Transfer…” > first selection of “Simple Transfer” > “OK”
			1. Wait until the weight stabilize before tapping "OK" once more, then go on to the next step.
		4. Check in LabX if the weight from the balance was transferred and recorded. If not, report it and set the weight manually by typing it into the box. 
		5. Place the measured cups in the Autosampler, starting from position 1, then position 2, 3, etc. If more than one samples are used. 
	4. Begin Titration
		1. After the data are set into the system, and all cups are placed in their slots in the autosampler, press Start on the bottom right of the “Task Editor” window.
			1. Once started, each titration will take around 10.5 minutes, unless there is a change of the method from the instructor.

6. <a name="CRM_Titration"></a> **CRM_Titration**
	1. Run step 4, but only use a CRM (or a junk and CRM sample if needed).
	2. Skip to [**Data_Analysis**](#Data_Analysis) to calculate total alkalinity of the CRM. Then check the accuracy of the data.
	3. **In every CRM Titration, it is necessary to report the accuracy in the “CRMAccuracyData” file to test the accuracy.  If must never be more than 1% off. Accuracy must be tested before running any samples for the day.**

7. <a name="SAMPLE_Titration"></a> **SAMPLE_Titration**
	1. Repeat step **[4.]**. However, in step **[4.c]**, replace to [the sample name given on the sample bottle].

8. <a name="Measure_Salinity"></a> **Measure_Salinity**
	1. While the samples are running on the titrator, you will measure salinity of each sample from the original sample vial.
	2. Calibrate the conductivity meter (Orion Star) using a 2 point calibration.
	3. Measure the salinity of every sample and write down the value in a csv file.

9. <a name="Data_Analysis"></a> **Data_Analysis**
	1. After the titration is complete, you must gather the data and export it to the current folder. The titrations will automatically export, but the mass of the sample will not.
		1. To gather the mass data, you must export it to the current folder.
			1. Go Data > Result Sets > Last 24 Hours  > Click on the most recent data 
			2. A separate window should pop up. Using that window, go to Results > Click Print Data Tab > Export > Export To > CSV file> Save on the most recent folder and label Mass_(Date) [No parenthesis].
		2. Open RStudio and make sure that you are in the Titrator project (top right-hand side of the display)
		3. Open the R script named TotalAlkCalc_wParsing.R, scroll down to find “path” , “massfile”, “TitratorFiles” and “Date”
			1. Modify “date” to the current day.
			2. Modify “path” to the name of the folder of the day from step [2.b] (Case Sensitive)
			3. “TitratorFiles”  is the name of the .csv file with all the titrations that was automatically exported.
			4. Modify “massfile” to the name of the current file from step [5.a.ii.2] (Case Sensitive)
		4. Click on Source to completely transfer the data
		5. A csv file will be automatically exported to the folder of the day with the calculated TA data. If this is a CRM run, here is where you will be the TA value of the CRM to enter it into the CRMAccuracyData file (see 5b).
		6. After the CRM run, edit the file names for Mass, the raw Titrator File, and the new TA file to include "_CRM_".
			1. After each titration, the raw Titrator File and Mass File will overwrite the previous files in the folder if a new name is not given to the previous files.
			1. After each Source of the TotalAlkCalc_wParsing.R script, the new TA file will overwrite the previous file in the folder if a new name is not given to the previous file.
			1. For multiple titrations after the CRM run, use a label for these three files to distinguish between the multiple titrations.
		
10. <a name="Clean_Up"></a> **Clean_Up**
	1. When the titrations are complete, remove the cups from the Autosampler, and dispose the samples into the sink ONLY if there was no HgCl2 in the sample *[note: all CRMs and nearly all samples in this lab have HgCl2]*. If the sample has HgCl2, then dispose it into a labeled waste container with a funnel by the fume hood.
	2. Clean the cups using RO water. Then, dry them using a drying rack next to the Autosampler.
		1. If the rack is full, use the drying rack on the other end of the table.
	3. Using the Titrator, move the Autosampler arm into position 69 (which should have a cup with DI water in it) by pressing Park on the tablet.
	4. Return the sensor of the autosampler to its holder on the left of the InMotion arm. Double-check that it holder is filled with KCl.
	5. If the arm isn’t lifted, lift it by waving your hand on the sensor on the backside of the arm.
Shut off both Titrator and Autosampler.
		1. To shut off the Autosampler, simply hold the power button at least 5 seconds.
			1. When you hear a beep, it’s notifying you that it’s ready to shut off, when you are ready release the button.
		2. To shut off the Titrator, use the tablet to make it offline then tap shut down.
	6. Wipe down Sample Changer carefully with DI water.





