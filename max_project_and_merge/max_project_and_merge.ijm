//Damit alles funktioniert müssen alle Freizeichen aus den Dateinamen und Dateipfaden entfernt werden - am besten durch Unterstriche ersetzen. 

input = getDirectory("Input directory");
output = getDirectory("Output directory");

suffix = "_fiji_done";   //suffix der am Ende an den Dateinamen angehängt wird

//do_channel variables: please assign true if channel is to be processed and false if channel should be ignored
//min & max channel variables: please assign the respective min and max bit values
//color_channel variables: please assign "red", "green" or "blue". Make sure to use each color only once


// Hier auf Kanäle achten - checken welcher Kanal welche Farbe hat! Soll ein Kanal nicht belegt werden dann "true" in "false" ändern, schaltet den jeweiligen Kanal ab
do_channel0 = true;			
min_channel0 = 0;
max_channel0 = 4095;
color_channel0 = "blue";   

do_channel1 = true;
min_channel1 = 0;
max_channel1 = 4095;
color_channel1 = "yellow";

do_channel2 = true;
min_channel2 = 0;
max_channel2 = 4095;
color_channel2 = "cyan";

do_channel3 = true;
min_channel3 = 0;
max_channel3 = 4095;
color_channel3 = "magenta";

//Execution:

setBatchMode(true);

red_color = "";			//per default die Strings für die einzelnen Colors auf leer setzen, da sonst die Merge function nicht funktioniert
green_color = ""; 
blue_color = "";
gray_color = "";
cyan_color = "";
magenta_color = "";
yellow_color = "";

list = getFileList(input);	//Array aus allen Files im Input directory erstellen
Array.print(list);
for (i = 0; i < list.length; i++)
        action(list[i]);		//für jede Datei aus dem Input array wird die function "action" ausgeführt. Dabei wird der lokalen Funktionsvariablen "filename" jeweils der Dateiname assigned (list[i])

//Function:

function action(filename) {
        command = "open=" + input + filename + " color_mode=Grayscale split_channels view=Hyperstack stack_order=XYCZT";
		run("Bio-Formats", command);  //allows you to open oib files without the settings window being opened
        if (do_channel0==true) {	//überprüft ob dieser Channel prozessiert werden soll
       		selectWindow(filename + " - C=0");
        	run("Z Project...", "projection=[Max Intensity]");
        	setMinAndMax(min_channel0, max_channel0);
        	call("ij.ImagePlus.setDefault16bitRange", 12);
        	run("Apply LUT");
        	channel0 = getTitle;
	    	if (color_channel0 == "red") {	//überprüft, in welchen Farbkanal du den Channel im merge legen möchtest
				red_color = "c1=[" + channel0 + "] ";
				} else { if (color_channel0 == "green") {
					green_color = "c2=[" + channel0 + "] ";
					} else { if (color_channel0 == "blue") {
						blue_color = "c3=[" + channel0 + "] ";
						} else { if (color_channel0 == "gray") {
							gray_color = "c4=[" + channel0 + "] ";	
							} else { if (color_channel0 == "cyan") {
								cyan_color = "c5=[" + channel0 + "] ";
								} else { if (color_channel0 == "magenta") {
									magenta_color = "c6=[" + channel0 + "] ";
									} else { if (color_channel0 == "yellow") {
										yellow_color = "c7=[" + channel0 + "] ";
										
		}}}}}}}}
        if (do_channel1==true) {
        	selectWindow(filename + " - C=1");
        	run("Z Project...", "projection=[Max Intensity]");
        	setMinAndMax(min_channel1, max_channel1);
        	call("ij.ImagePlus.setDefault16bitRange", 12);
        	run("Apply LUT");
        	channel1 = getTitle;
			if (color_channel1 == "red") {
				red_color = "c1=[" + channel1 + "] ";
				} else { if (color_channel1 == "green") {
					green_color = "c2=[" + channel1 + "] ";
					} else { if (color_channel1 == "blue") {
						blue_color = "c3=[" + channel1 + "] ";
						} else { if (color_channel1 == "gray") {
							gray_color = "c4=[" + channel1 + "] ";	
							} else { if (color_channel1 == "cyan") {
								cyan_color = "c5=[" + channel1 + "] ";
								} else { if (color_channel1 == "magenta") {
									magenta_color = "c6=[" + channel1 + "] ";
									} else { if (color_channel1 == "yellow") {
										yellow_color = "c7=[" + channel1 + "] ";
										
		}}}}}}}}
        if (do_channel2==true) {
        	selectWindow(filename + " - C=2");
        	run("Z Project...", "projection=[Max Intensity]");
        	setMinAndMax(min_channel2, max_channel2);
        	call("ij.ImagePlus.setDefault16bitRange", 12);
        	run("Apply LUT");
        	channel2 = getTitle;
			if (color_channel2 == "red") {
				red_color = "c1=[" + channel2 + "] ";
				} else { if (color_channel2 == "green") {
					green_color = "c2=[" + channel2 + "] ";
					} else { if (color_channel2 == "blue") {
						blue_color = "c3=[" + channel2 + "] ";
						} else { if (color_channel2 == "gray") {
							gray_color = "c4=[" + channel2 + "] ";	
							} else { if (color_channel2 == "cyan") {
								cyan_color = "c5=[" + channel2 + "] ";
								} else { if (color_channel2 == "magenta") {
									magenta_color = "c6=[" + channel2 + "] ";
									} else { if (color_channel2 == "yellow") {
										yellow_color = "c7=[" + channel2 + "] ";
										
		}}}}}}}}
        if (do_channel3==true) {
        	selectWindow(filename + " - C=3");
        	run("Z Project...", "projection=[Max Intensity]");
        	setMinAndMax(min_channel3, max_channel3);
        	call("ij.ImagePlus.setDefault16bitRange", 12);
        	run("Apply LUT");
        	channel3 = getTitle;
			if (color_channel3 == "red") {
				red_color = "c1=[" + channel3 + "] ";
				} else { if (color_channel3 == "green") {
					green_color = "c2=[" + channel3 + "] ";
					} else { if (color_channel3 == "blue") {
						blue_color = "c3=[" + channel3 + "] ";
						} else { if (color_channel3 == "gray") {
							gray_color = "c4=[" + channel3 + "] ";	
							} else { if (color_channel3 == "cyan") {
								cyan_color = "c5=[" + channel3 + "] ";
								} else { if (color_channel3 == "magenta") {
									magenta_color = "c6=[" + channel3 + "] ";
									} else { if (color_channel3 == "yellow") {
										yellow_color = "c7=[" + channel3 + "] ";
										
		}}}}}}}}
        run("Merge Channels...", red_color + green_color + blue_color + gray_color + cyan_color + magenta_color + yellow_color);
        selectWindow("RGB");
        run("RGB Color");
        file = substring(filename, 0, lastIndexOf(filename, "."));	//Trennt die Dateiendung (.oib) vom Dateinamen ab
        saveAs("Tiff", output + file + suffix);
        run("Close All");
}



