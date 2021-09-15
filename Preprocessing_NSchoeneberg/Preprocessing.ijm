// Please make sure to change the following three variables accordingly:

// 1) The output directory ("out_dir"). The macro will save all max projections and merged RGB files to this directory
//    If it does not exist already, please create it.
out_dir = "C:\\Users\\dsege\\TEMP\\NSchoeneberg\\output\\";

// 2) The filepath of the "next_imageID.txt" file
id_txt_file_path = "C:\\Users\\dsege\\TEMP\\NSchoeneberg\\next_imageID.txt";

// 3) The filepath of the "assignment.txt" file
assignment_txt_file_path = "C:\\Users\\dsege\\TEMP\\NSchoeneberg\\assignment.txt";

// Your work in this document is done now! :) 
// All you have to do from now on is to open a .czi file, select the corresponding series (or multiple) and then come
// back to this window and hit the "Run" button. You will see some windows popping up and eventually closing again.
// A window with a short message will inform you that all files were processed.
// You can confirm with hitting "Ok" and continue by opening the next .czi file, selecting the series, hitting run, ... 




/////////////////////////////////////////
//// Don´t touch the following part /////
/////////////////////////////////////////

slides = newArray();
channels = newArray("C=0", "C=1");
windows = getList("image.titles");

//Get czi filename
czi_filename = substring(windows[0], 0, indexOf(windows[0], ".czi") + 4);

//Get all slides
for (i = 0; i < windows.length; i++) {
	slide_number = substring(windows[i], lastIndexOf(windows[i], "#"), lastIndexOf(windows[i], "-"));
	slides = Array.concat(slides,slide_number);
}
unique_slides = ArrayUnique(slides);

//Process the images
for (i = 0; i < unique_slides.length; i++) {
	slide_id = unique_slides[i];
	image_id = File.openAsString(id_txt_file_path);
	image_id = substring(image_id, 0, 4);
	
	for (x = 0; x < channels.length; x++) {
		channel_id = channels[x];
		window_id = czi_filename + " - " + czi_filename + " " + slide_id + "- " + channel_id;
		selectWindow(window_id);
        run("Z Project...", "projection=[Max Intensity]");
        max_window_id = "MAX_" + window_id;
        if (channel_id == "C=0") {
        	label = "DAPI";
        }
        if (channel_id == "C=1") {
        	label = "TH";
        }
        selectWindow(max_window_id);
        saveAs("Tiff", out_dir + image_id + "_" + label);
	}
	blue_color = "c3=[" + image_id + "_DAPI.tif" + "] ";
	yellow_color = "c7=[" + image_id + "_TH.tif" + "] ";
	
	run("Merge Channels...", blue_color + yellow_color);
	selectWindow("RGB");
    run("RGB Color");
    saveAs("Tiff", out_dir + image_id + "_RGB");
    selectWindow(image_id + "_RGB.tif");
    close();

    //Update the next_imageID.txt file
	id_txt_file = File.open(id_txt_file_path);
	next_image_id = IJ.pad(parseInt(image_id) + 1, 4);
	print(id_txt_file, next_image_id);
	File.close(id_txt_file);

	//Write all information into the assignment.txt file
	assignment = File.openAsString(assignment_txt_file_path);
	assignment = assignment + czi_filename + "," + slide_id + "," + image_id + "\n";
	assignment_txt_file = File.open(assignment_txt_file_path);
	print(assignment_txt_file, assignment);
	File.close(assignment_txt_file);
}

run("Close All");
showMessage("Whoop whoop!", "Yeah - another file is done!\nLet´s keep going! :D");

function ArrayUnique(array) {
	array 	= Array.sort(array);
	array 	= Array.concat(array, 999999);
	uniqueA = newArray();
	i = 0;	
   	while (i<(array.length)-1) {
		if (array[i] == array[(i)+1]) {
			//print("found: "+array[i]);			
		} else {
			uniqueA = Array.concat(uniqueA, array[i]);
		}
   		i++;
   	}
	return uniqueA;
}