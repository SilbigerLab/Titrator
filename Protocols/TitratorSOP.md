# Standard Protocol Procedure for Using the Titrator

Original: 3/5/2018
Last Revised: 4/20/2018

Contents
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

1. <a name="Pre-Setup"></a> **Pre-Setup**
	1. Since you are working with acid. You must wear a Lab Coat and Examination Gloves always, before starting the experiment. Safety Goggles is optional.
2. <a name="Setup"></a> **Setup**
	1. Turn on Laptop, InMotion Pro Autosampler, and Titrator.
		1. To turn on the Titrator, press the Power Button in the front of the machine (green button).
		2. To turn on the Autosampler, press the Power Button in the front of the machine (green button). 
			1. If the Autosampler is Yellow while the Titrator is on, restart both Autosampler and Titrator until it’s green
			2. If the Autosampler is Red, Report it.
			3. If the Autosampler is Green, you may move on to the next step. 
		3. When the Autosampler is connected, the Titrator will detect an acid. Once shown, press “OK” on the screen.
		4. Another pop-up will show up. Press “OK” on that too.
	2. Using the laptop, create one Folder within the Data Folder. [C: >labx_data >add titration > Data]
		1. The folder must be named something appropriate for the samples being processed (for example, Bermuda31 would be all the Bermuda data for 31 degrees) within the Data Folder. *(That is your folder of the day.)*
	3. Open Excel, LabX and RStudio (R)
		1. Minimize Excel and R to reduce clutter.
		2. Using LabX, modify the Server Export Directory to so that the filed export to your *folder of the day*. To do so, go to System (Bottom Left) > At the System’s tab, click “Import and Export” then “Export Templates” > Look for “Export Template data export” and search for Settings then Export File. Look for the “Server Export Directory.”
			1. On the “Server Export Directory,” that is where your data is going. You can modify it by clicking on “Edit Export Template” and navigate to the *folder of the day*.
	4. Using an 80ml cup, place it on the Autosampler in position 69.
	5. Park the autosampler by pressing “Park” on the tablet. This will send the sensors to position 69.
	6. Using the Titrator tablet, tap “PRIME” at least 3 separate times.
		1. **YOU MUST PARK THE AUTOSAMPLER FIRST, OTHERWISE THE ACID WILL SPILL ALL OVER THE AUTOSAMPLER.**
			1. If it ever occurs, you must use the chemical wipes with DI water to soak up the acid.
		2. *[Note: Prime is used to purge any air bubbles that may occur in the acid line.]*
	7. After Purging, if the Autosampler’s arm does not lift automatically, wave your arm on the sensor on the  right side of the Autosampler’s arm to lift it. 
	8. Recycle the acid into the glass bottle that is connected to the titrator by removing the small white plug and pour carefully into the bottle.
		1. If a spill occurs, read **[e.i.1]**
	9. Using DI water, clean the acid cup.
	10. Located at the left side, at the back of the Autosampler, there should be a pH Sensor. Place it on the hole that’s next to the propeller.
		1. Before calibrations can be made, look at the top of the Sensor for KCl, if a sufficient amount of KCl can be seen, skip to **[j]**. If not, follow the step below.
		2. If KCl reservoir is low, open the cap on the sensor’s reservoir and add a few drops of KCl on the opening.
	11. Make sure that the cap is open at all times, so it can measure the pH.
	12. Make sure the probe rinse reservoir is filled with DI water (an Erlenmeyer Flask on the right side of the InMotion Pro). 

3. <a name="Calibration"></a> **Calibration**
	1. Gather three 80ml cups and add the pH buffer to each of the cups until filled halfway.
		1. The pH buffers used are 4, 7, and 10.
			1. If you use new buffers, write the date opened on the bottle and pour ~60 ml into 3 separate 80 ml cups.
			2. After calibration, pour the buffers into a clean regent bottle, respective of their pH. Those buffers can be used for future uses for ~ 1 week.
	2. Place the three cups in the Autosampler starting from position 1-3. Place a 4th cup filled with DI water in position 69 on the sample changer.
		1. The pH cups will be in the order of 4, 7 and 10
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
		2. To gather Zero Point and Slope, go to LabX > Click Data > look for “Result Sets” on the Data Tab bar (Top Left) > Click “Last 24 hours” > Click pH CAL” > Record the data onto Excel
			1. *As an alternative: Go to the Titrator tablet and if the tablet displays that the Calibration is done, press OK to view the Zero Point and Slope.*
		3. To gather data for each pH, go to Result Set, then “last 24 hours,” then click on Results (click the Raw Data tab).
			1. On the top, look for “E”, you’re going to use that number as a calibration. 
				1. Note: The results should be displayed as pH 4 from the top while pH 10 is at the bottom.
	8. Once the calibrations are complete, remove the cups from the Autosampler and dispose them into the into a plastic reagent bottle, respective of their pH.
	9. Save document and set the destination to the “Data” Folder.

4. <a name="Running_a_titration"></a> **Running_a_titration**
	1. Titration set-up
		1. You should start each day by running a Certified Reference Material (CRM) from the Dickson Lab. These are the standards. The procedure for running any titration, whether a CRM or unknowns are as follows. It is also advisable to start with a “junk” sample (filtered seawater that you don’t care about) at the beginning of each run to ensure there are no air bubbles in the acid line. 
		2. On the LabX window, similarly to calibration, click on Silbiger TA (EP)r1 > Start > Titration
		3. A window should pop up. Depending on the number of the sample measured, click on “Number of Samples” then apply the specific number of samples used in the titration, then press enter on the keyboard.
	2. On the left, look for the “ID 1” column and label the sample. Put in all your sample IDs into this column.
		1. Next to the “ID 1” column, there should be a column named “Weight [g].” 
		2. Click on the first row and then proceed to the analytical balance.
	3. Weigh the sample from the Analytical Balance.
		1. See [“Protocol Procedure for Using the Balance” ](BalanceSOP.md), Turn on the balance > tap LabX Online > weigh empty bottle first > Press “→T←” button to “Zero” the balance.
			1. *[Note: The balance may connect to LabX automatically upon switching on. Also, note, the LabX workspace for the balance must be open for the data to transfer]*
		2. In this step, carefully add the sample into the 80ml cup until the scale reads 60ml ± .5ml or instructed otherwise.
			1. If the pipettes are available, open the top of the case and use the pipette vertically from the cup then pour until the weight reaches 60ml ± .5ml or instructed otherwise.
			2. If the pipettes aren’t available, use a beaker to pour on the sample on the side while the case is open. (PROCEDE WITH EXTREME CAUTION!)
			3. If any spillage ever occurs, Report it immediately. Don’t attempt to clean it yourself.
		3. Also recalling from “Protocol Procedure for Using the Balance”, transfer the sample by tapping “Transfer…” > first selection of “Simple Transfer” > “OK” > “OK” 
			1. Before tapping the second “OK,” wait until the weight stabilize before going on to the next step.
		4. Check in LabX, if it recorded any weight from the balance. If not, report it and set the weight manually. 
		5. Place the measured cups in the Autosampler, starting from position 1, then position 2, 3, etc. If more than one samples are used. 
	4. Begin Titration
		1. After the data are set into the system, on the bottom right of the “Task Editor” window, press Start.
			1. Once started, each titration will take around five minutes, unless there is a change of the method from the instructor.

5. <a name="CRM_Titration"></a> **CRM_Titration**
	1. Run step 4, but only use a CRM (or a junk and CRM sample if needed).
	2. Skip to [**Data_Analysis**](#Data_Analysis) to calculate total alkalinity of the CRM. Then check the accuracy of the data.
	3. **In every CRM Titration, it is necessary to report the accuracy in the “CRMAccuracyData” file to test the accuracy.  If must never be more than 1% off. Accuracy must be tested before running any samples for the day.**

6. <a name="SAMPLE_Titration"></a> **SAMPLE_Titration**
	1. Repeat step **[4.]**. However, in step **[4.c]**, replace to [the sample name given on the sample bottle].

7. <a name="Measure_Salinity"></a> **Measure_Salinity**
	1. While the samples are running on the titrator, you will measure salinity of each sample from the original sample vial.
	2. Calibrate the conductivity meter (Orion Star) using a 2 point calibration.
	3. Measure the salinity of every sample and write down the value in a csv file.

8. <a name="Data_Analysis"></a> **Data_Analysis**
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

9. <a name="Clean_Up"></a> **Clean_Up**
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





