## MRI User Interface Manual 

### Content

1.  Purpose

2.  User

3.  Quick Start Guide

4.  Detailed Instructions

5.  Modifications

### Purpose

This user interface may be used to analyze 31P and 1H signals resulting
from MRI scans. It may be used to:

1.  Visualize images in 2D and 3D,

2.  Segment images in 2D,

3.  Apply a local B1-Correction,

4.  Apply a calibration curve in order to extract physical measurements,

5.  Region of Interest-based processing,

6.  Export modified images.

The interface was tested with 64 × 64 × 64 sized images any image
dimensions should work.

### User

Two types of user groups can be defined: Inexperienced Users (I) and
Experienced Matlab Users (E). (I) users do not have any prior knowledge
using MATLAB or any comparable programming language (e.g. Python).
However, they should be familiar with medical images, and segmentation
methods in order to correctly apply implemented processes. For
inexperienced users, it is recommended to only access the user interface
and keep changes within the code to a minimum. (E) users are familiar
with related programming languages, ideally MATLAB, image processing
methods, and the MATLAB App-designer. (E) Experienced users are very
welcome to implement changes within the app in order to adjust it to
their needs and purposes.

###  

### Quick-Start Guide ((E) User)

1.  Data: Select a raw image (64×64×64) and B1 correction image. The B1
    correction image will be downscaled to match the raw image. This
    means ideally the B1 image is of the same size or larger.

2.  Slice Browser: Use Slice Browser to view your image in Saggital,
    Coronal or Axial view. 3D Button opens a 3D display of the Resulting
    Image. Slice Limits are set according to initial mask.

3.  Segmentation: Re-segmentation opens the manual window to adapt ROI
    of the identified bone/pellet. New ROI lets you Add or Remove, Bone
    or Phantom region. Bone Region is coloured in green, Phantom region
    in blue. Save and Load buttons let you save your segmentation masks.

4.  ROI Analysis: Lets you actively define 2 regions: Trabecular and
    Cortical. A third growth plate region is automatically defined from
    starting bone to the trabecular region. Using the Threshold function
    you can adapt the threshold used for segmentation. In auto mode,
    Otsu\'s method is used for segmentation. Phantom Density is used to
    calibrate the whole image to the density phantom.

5.  Result structure: There is 3 ROI: Cortical (cort), Trabecular (trab)
    and Growth Plate (gpa). Volume (vol) of each region is given ccmm.
    Further, there is always a Tissue (tiss) and Bone (bone) mean. The
    Tissue mean includes all tissue within the ROI the bone mean just
    the most saturated signals (segmented). The Mean (+STD) and Median
    of each group is calculated

### 

###  

### Detailed Instructions ((I) User)

+----+------------------------------------------------------------------------------------------------------------------------------------------------------------+:---------------------------------------------------------------------------------:+
| 1  | **[MATLAB Installation and setup]{.underline}**                                                                                                            | ![A screenshot of a computer Description automatically                            |
|    |                                                                                                                                                            | generated](media/image1.png){width="2.369792213473316in"                          |
|    | Install Matlab 2019a or later: You can check your eligibility for campus license here:                                                                     | height="1.9303029308836395in"}                                                    |
|    | [[https://www.mathworks.com/campaigns/products/trials.html?prodcode=ML]{.underline}](https://www.mathworks.com/campaigns/products/trials.html?prodcode=ML) |                                                                                   |
|    |                                                                                                                                                            |                                                                                   |
|    | Note: If installing on BIDMC Computer: Select 'Activate from license file'. Find license file in S:\\Obl\\Matlab2019a and copy license.dat to your MATLAB  |                                                                                   |
|    | folder                                                                                                                                                     |                                                                                   |
+----+------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------+
| 2  | Start Matlab:                                                                                                                                              | ![](media/image2.png){width="0.3697922134733158in" height="0.452580927384077in"}  |
|    |                                                                                                                                                            |                                                                                   |
|    | *Windows → Search → MATLAB*                                                                                                                                |                                                                                   |
+----+------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------+
| 3  | Use the workspace browser on the left hand panel to navigate and open using double click: *MRI_Bone_Analysis.mlapp*                                        | ![](media/image3.png){width="2.8645833333333335in" height="1.7222222222222223in"} |
+----+------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------+
| 4  | App designer should start up automatically showing Component Library, Design and Code View as well as Component Browser. All functionality of the app can  | ![](media/image4.png){width="3.2083333333333335in" height="1.6944444444444444in"} |
|    | be changed here.                                                                                                                                           |                                                                                   |
+----+------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------+
| 5  | Press the *Run* button in the menu strip                                                                                                                   | ![A screenshot of a computer Description automatically                            |
|    |                                                                                                                                                            | generated](media/image5.png){width="2.4895833333333335in"                         |
|    |                                                                                                                                                            | height="0.9791666666666666in"}                                                    |
+----+------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------+
| 6  | **[User Interface]{.underline}**                                                                                                                           | ![](media/image6.png){width="3.2083333333333335in" height="2.0694444444444446in"} |
|    |                                                                                                                                                            |                                                                                   |
|    | The application interface should pop up.                                                                                                                   |                                                                                   |
+----+------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------+
| 7  | **[Data Import]{.underline}**                                                                                                                              | ![](media/image7.png){width="3.2083333333333335in" height="2.1527777777777777in"} |
|    |                                                                                                                                                            |                                                                                   |
|    | Press *Select DICOM* for Raw image.                                                                                                                        |                                                                                   |
|    |                                                                                                                                                            |                                                                                   |
|    | Browse to DICOM stack folder (1 image per folder)                                                                                                          |                                                                                   |
+----+------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------+
| 8  | *Notice* how raw- Image data should change the plot handles in the bottom panel                                                                            | ![](media/image8.png){width="3.2083333333333335in" height="2.1527777777777777in"} |
|    |                                                                                                                                                            |                                                                                   |
|    | Press *Select DICOM* for B1 correction image.                                                                                                              |                                                                                   |
|    |                                                                                                                                                            |                                                                                   |
|    | Browse to DICOM stack folder (1 image per folder)                                                                                                          |                                                                                   |
+----+------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------+
| 9  | **[Visualization]{.underline}**                                                                                                                            | ![](media/image9.png){width="3.2083333333333335in" height="2.0694444444444446in"} |
|    |                                                                                                                                                            |                                                                                   |
|    | Within the Slice-Browser Panel use Navigation controls to browse your image.                                                                               |                                                                                   |
+----+------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------+
| 10 | **[Display Options]{.underline}**                                                                                                                          | ![](media/image10.png){width="3.2083333333333335in"                               |
|    |                                                                                                                                                            | height="3.9027777777777777in"}                                                    |
|    | Within the Data Processing tab:                                                                                                                            |                                                                                   |
|    |                                                                                                                                                            |                                                                                   |
|    | [Changing of the Colormap:]{.underline}                                                                                                                    |                                                                                   |
|    |                                                                                                                                                            |                                                                                   |
|    | Change colormap in the dropdown *Cmap* field.                                                                                                              |                                                                                   |
|    |                                                                                                                                                            |                                                                                   |
|    | [Enhancing Display Contrast:]{.underline}                                                                                                                  |                                                                                   |
|    |                                                                                                                                                            |                                                                                   |
|    | Turn on enhanced display contrast in order to saturate the image further                                                                                   |                                                                                   |
|    |                                                                                                                                                            |                                                                                   |
|    | [New]{.underline}: Turn off Segmentation in order to export images. Also Colormap can be turned off                                                        |                                                                                   |
|    |                                                                                                                                                            |                                                                                   |
|    | *Note that these options do not influence the underlaying raw data.*                                                                                       |                                                                                   |
+----+------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------+
| 11 | **[3D Rendering]{.underline}**                                                                                                                             | ![](media/image11.png){width="3.2083333333333335in" height="2.75in"}              |
|    |                                                                                                                                                            |                                                                                   |
|    | Inspect your Geometry in 3D this will show you the Segmented, B1-Corrected final image.                                                                    |                                                                                   |
|    |                                                                                                                                                            |                                                                                   |
|    | MATLAB's VolumeViewer will provide you with several rendering and good image browsing options.                                                             |                                                                                   |
|    |                                                                                                                                                            |                                                                                   |
|    | For further information:                                                                                                                                   |                                                                                   |
|    |                                                                                                                                                            |                                                                                   |
|    | [[https://www.mathworks.com/help/images/ref/volumeviewer-app.html]{.underline}](https://www.mathworks.com/help/images/ref/volumeviewer-app.html)           |                                                                                   |
+----+------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------+
| 12 | **[Segmentation]{.underline}**                                                                                                                             | ![](media/image12.png){width="2.78125in" height="0.5in"}                          |
|    |                                                                                                                                                            |                                                                                   |
|    | Within the Segmentation Tab:                                                                                                                               | ![](media/image13.png){width="3.2083333333333335in"                               |
|    |                                                                                                                                                            | height="3.4027777777777777in"}                                                    |
|    | With automatic segmentation turned you should be able to observe the following color coded regions of interest:                                            |                                                                                   |
|    |                                                                                                                                                            |                                                                                   |
|    | [green]{.underline}: around the specimen                                                                                                                   |                                                                                   |
|    |                                                                                                                                                            |                                                                                   |
|    | [blue]{.underline}: around the phantom                                                                                                                     |                                                                                   |
|    |                                                                                                                                                            |                                                                                   |
|    | [red]{.underline}: indicating holes (extractions) within the specimen region                                                                               |                                                                                   |
|    |                                                                                                                                                            |                                                                                   |
|    | [black]{.underline}: indicating holes (extractions) within the phantom region                                                                              |                                                                                   |
+----+------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------+
| 13 | **[Adjust the Automatic Threshold if required]{.underline}**                                                                                               | ![](media/image14.png){width="2.7291666666666665in"                               |
|    |                                                                                                                                                            | height="0.5in"}![](media/image15.png){width="1.421875546806649in"                 |
|    | **WARNING**: This clears all manually generated contours. So do this first if required.                                                                    | height="1.547704505686789in"}![](media/image16.png){width="1.453125546806649in"   |
|    |                                                                                                                                                            | height="1.5296052055993001in"}                                                    |
|    | Uncheck automatic checkbox, and using the slider:                                                                                                          |                                                                                   |
|    |                                                                                                                                                            |                                                                                   |
|    | Increase threshold when phantom and specimen region are connected. (Left)                                                                                  |                                                                                   |
|    |                                                                                                                                                            |                                                                                   |
|    | Decrease threshold when phantom and specimen region do not cover entire area (Right)                                                                       |                                                                                   |
+----+------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------+
| 14 | **[Resegmentation]{.underline}**                                                                                                                           | ![](media/image17.png){width="3.2083333333333335in" height="3.513888888888889in"} |
|    |                                                                                                                                                            |                                                                                   |
|    | If the automatic segmentation method fails, e.g. for 1H signals you may re-segment images manually.                                                        |                                                                                   |
|    |                                                                                                                                                            |                                                                                   |
|    | Press the *Resegment* Button                                                                                                                               |                                                                                   |
|    |                                                                                                                                                            |                                                                                   |
|    | Notice how the Manual Segmentation Window open.                                                                                                            |                                                                                   |
|    |                                                                                                                                                            |                                                                                   |
|    | Notice how new Controls are displayed below the Resegment Button                                                                                           |                                                                                   |
+----+------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------+
| 15 | [Operations]{.underline}                                                                                                                                   | ![A screenshot of a computer Description automatically                            |
|    |                                                                                                                                                            | generated](media/image18.png){width="2.3020833333333335in"                        |
|    | Decide on Adding or Removing to your ROI                                                                                                                   | height="1.2083333333333333in"}                                                    |
|    |                                                                                                                                                            |                                                                                   |
|    | [ROI:]{.underline}                                                                                                                                         |                                                                                   |
|    |                                                                                                                                                            |                                                                                   |
|    | Decide on changing the phantom (blue) or bone ROI (green)                                                                                                  |                                                                                   |
|    |                                                                                                                                                            |                                                                                   |
|    | Press *'New ROI'* Button to start drawing within the Manual Segmentation figure. Your curser should change to a *+*                                        |                                                                                   |
+----+------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------+
| 16 | Contour regions carefully, don't forget to press the 'New Roi' button for each operation.                                                                  | ![](media/image19.png){width="2.5989588801399823in" height="2.759283683289589in"} |
|    |                                                                                                                                                            |                                                                                   |
|    | *Warning: There is no 'Undo' feature. Changes are directly written to the file.*                                                                           |                                                                                   |
+----+------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------+
| 17 | [Contour Navigation]{.underline}                                                                                                                           | ![](media/image20.png){width="2.34375in" height="1.3229166666666667in"}           |
|    |                                                                                                                                                            |                                                                                   |
|    | After Contouring one individual slice go to the next/previous slice using the controls in the main figure. Or exit using the *'Exit'* Button               |                                                                                   |
+----+------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------+
| 18 | After all necessary slices are contoured you can check your result using the 3D View (Step 11)                                                             | ![](media/image21.png){width="3.2083333333333335in"                               |
|    |                                                                                                                                                            | height="2.6666666666666665in"}                                                    |
|    | **[Save your contour.]{.underline}**                                                                                                                       |                                                                                   |
|    |                                                                                                                                                            |                                                                                   |
|    | It is important to save the contour file in the same folder as your raw image data.                                                                        |                                                                                   |
|    |                                                                                                                                                            |                                                                                   |
|    | *Save Contour → Browse to Raw Image folder → Keep suggested filename → save.*                                                                              |                                                                                   |
|    |                                                                                                                                                            |                                                                                   |
|    | *Note: you can load contours, in the same way, using the Load button*                                                                                      |                                                                                   |
+----+------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------+
| 19 | **[ROI based Image Processing]{.underline}**                                                                                                               | ![](media/image22.png){width="3.2083333333333335in" height="2.888888888888889in"} |
|    |                                                                                                                                                            |                                                                                   |
|    | Within the ROI tab you can define two ROI: A Cortical Region (C) and a Trabecular Region (T) using the 4 Sliders or Button controls (\<\<,\>\>).           |                                                                                   |
|    |                                                                                                                                                            |                                                                                   |
|    | The "Start of Bone" is automatically determined based on the 3D image.                                                                                     |                                                                                   |
|    |                                                                                                                                                            |                                                                                   |
|    | (GPA) This zone is also calculated based on Start of bone and start of trabecular Zone.                                                                    |                                                                                   |
|    |                                                                                                                                                            |                                                                                   |
|    | Use the *'Guess'* Button for a 4 mm trabecular and 4 mm cortical Zone.                                                                                     |                                                                                   |
+----+------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------+
| 20 | **[Save ROI]{.underline}**                                                                                                                                 | ![](media/image23.png){width="2.814453193350831in" height="0.5156255468066492in"} |
|    |                                                                                                                                                            |                                                                                   |
|    | *Press the Save Button → Navigate to Raw Data folder → Save*                                                                                               |                                                                                   |
|    |                                                                                                                                                            |                                                                                   |
|    | The name ASliceData is chosen so that it is the first entry and not at the bottom of the filelist but it does not matter.                                  |                                                                                   |
|    |                                                                                                                                                            |                                                                                   |
|    | This operation will create an Excel File with the according slider values. These values are not absolute but based on the Start of Bone line.              |                                                                                   |
+----+------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------+
| 21 | **[Data Processing Options]{.underline}**                                                                                                                  | ![](media/image24.png){width="3.2083333333333335in"                               |
|    |                                                                                                                                                            | height="1.4861111111111112in"}![](media/image25.png){width="3.2083333333333335in" |
|    | **[Calibration]{.underline}**                                                                                                                              | height="1.6944444444444444in"}                                                    |
|    |                                                                                                                                                            |                                                                                   |
|    | Provide a Reference Density Value (e.g. 0.71)                                                                                                              |                                                                                   |
|    |                                                                                                                                                            |                                                                                   |
|    | You can chose a 1 Point or Two                                                                                                                             |                                                                                   |
|    |                                                                                                                                                            |                                                                                   |
|    | Point Calibration with:                                                                                                                                    |                                                                                   |
|    |                                                                                                                                                            |                                                                                   |
|    | - 1pt: Calibration Phantom                                                                                                                                 |                                                                                   |
|    |                                                                                                                                                            |                                                                                   |
|    | - 1pt: Background Noise                                                                                                                                    |                                                                                   |
|    |                                                                                                                                                            |                                                                                   |
|    | - 2pt: Calibration Phantom and Background Noise                                                                                                            |                                                                                   |
|    |                                                                                                                                                            |                                                                                   |
|    | If you are not using the Calibration Phantom, provide a reference Threshold (eg. 4255) which corresponds to your reference density                         |                                                                                   |
|    |                                                                                                                                                            |                                                                                   |
|    | **[B1 - Correction]{.underline}**                                                                                                                          |                                                                                   |
|    |                                                                                                                                                            |                                                                                   |
|    | - Turn local B1 correction on or off                                                                                                                       |                                                                                   |
|    |                                                                                                                                                            |                                                                                   |
|    | Press *Single* Button to print Results in the Result table.                                                                                                |                                                                                   |
|    |                                                                                                                                                            |                                                                                   |
|    | Note: When clicking in the Results table field all results are automatically copied to your clipboard. Paste in Excel. (Ctr + V)                           |                                                                                   |
+----+------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------+
| 22 | **[Exporting Images:]{.underline}**                                                                                                                        | ![](media/image26.png){width="1.1041666666666667in" height="1.21875in"}           |
|    |                                                                                                                                                            |                                                                                   |
|    | Use the Export Menu to select which Calibrations/Modifications you would like to apply to your images.                                                     |                                                                                   |
|    |                                                                                                                                                            |                                                                                   |
|    | Press *Export* to save the dicom file. Note: Dicom file will be saved as 3D not individual sliced file.                                                    |                                                                                   |
+----+------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------+
| 23 | **[Automatic Mode:]{.underline}**                                                                                                                          | ![](media/image27.png){width="3.2083333333333335in" height="1.5in"}               |
|    |                                                                                                                                                            |                                                                                   |
|    | If all required segmentation files, and all required slice data is saved within each image folder you can use the automatic mode.                          |                                                                                   |
|    |                                                                                                                                                            |                                                                                   |
|    | (Note: if files are not found automatic mode uses, automatic segmentation, and guess ROI)                                                                  |                                                                                   |
|    |                                                                                                                                                            |                                                                                   |
|    | Each Dicom Stack needs to be in a folder (e.g. Set-1A). All Sets that need to be analyzed need to be in a folder (e.g. Run-1) resulting in the following   |                                                                                   |
|    | structure:                                                                                                                                                 |                                                                                   |
|    |                                                                                                                                                            |                                                                                   |
|    | e.g. *Run-1/Set-1/\*.DCM*                                                                                                                                  |                                                                                   |
|    |                                                                                                                                                            |                                                                                   |
|    | *DO NOT SELECT A SUBFOLDER e.g. Set-1 when navigating to Run-1.*                                                                                           |                                                                                   |
|    |                                                                                                                                                            |                                                                                   |
|    | Press the Auto Button and navigate to *Run-1* folder.                                                                                                      |                                                                                   |
|    |                                                                                                                                                            |                                                                                   |
|    | Notice: The appropriate B1- Correction file needs to be loaded in advance.                                                                                 |                                                                                   |
+----+------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------+
| 24 | Results are sorted in accordance to folder structure.                                                                                                      | ![](media/image28.png){width="3.2083333333333335in"                               |
|    |                                                                                                                                                            | height="1.3611111111111112in"}                                                    |
|    | Volumetric Measurements are provided in \[ccmm\], Densities in \[g/cm\^3\]                                                                                 |                                                                                   |
+----+------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------+
| 25 | **[Results]{.underline}**                                                                                                                                                                                                                      |
|    |                                                                                                                                                                                                                                                |
|    | Following parameters are provided:                                                                                                                                                                                                             |
|    |                                                                                                                                                                                                                                                |
|    | - TV: Total Volume                                                                                                                                                                                                                             |
|    |                                                                                                                                                                                                                                                |
|    | - BV: Bone Volume                                                                                                                                                                                                                              |
|    |                                                                                                                                                                                                                                                |
|    | - V_cort: Cortical Bone Volume                                                                                                                                                                                                                 |
|    |                                                                                                                                                                                                                                                |
|    | - V_trab: Trab. Bone Volume                                                                                                                                                                                                                    |
|    |                                                                                                                                                                                                                                                |
|    | - Bone D. Mean Bone Density                                                                                                                                                                                                                    |
|    |                                                                                                                                                                                                                                                |
|    | - Cort D. Mean Cortical Density                                                                                                                                                                                                                |
|    |                                                                                                                                                                                                                                                |
|    | - Trab D. Mean Trab. Density                                                                                                                                                                                                                   |
|    |                                                                                                                                                                                                                                                |
|    | - GPA D. Mean Growth Plate Density                                                                                                                                                                                                             |
|    |                                                                                                                                                                                                                                                |
|    | - Cort T. D. Mean Cort. Tissue Density                                                                                                                                                                                                         |
|    |                                                                                                                                                                                                                                                |
|    | - Trab T. D. Mean Trab. Tissue Density.                                                                                                                                                                                                        |
|    |                                                                                                                                                                                                                                                |
|    | - Phantom: Mean Phantom Density                                                                                                                                                                                                                |
|    |                                                                                                                                                                                                                                                |
|    | - Noise: Mean Background Density                                                                                                                                                                                                               |
|    |                                                                                                                                                                                                                                                |
|    | *Standard Deviations (STD) for mean values are provided.*                                                                                                                                                                                      |
|    |                                                                                                                                                                                                                                                |
|    | *Bone: All tissue within ROI larger than a threshold given by segmentation*                                                                                                                                                                    |
|    |                                                                                                                                                                                                                                                |
|    | *Tissue: All voxel within ROI.*                                                                                                                                                                                                                |
+----+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

###  

### Modifications

If you feel comfortable modifying the Code: Switch to Code view:

![](media/image29.png){width="6.270833333333333in"
height="1.0972222222222223in"}

Please Document changes in the Program Header! Refer to comments within
code for detailed descriptions.

![](media/image30.png){width="5.140625546806649in"
height="3.244912510936133in"}

**[The code is structured as such:]{.underline}**

- Properties: These are your global Variables

- Private Functions: These are defining most of the logic behind the
  app. They are sorted after their appearance within the workflow. E.g.
  The import Data function is in the beginning, and the results function
  in the end.

- Callbacks that handle Component events: The order of these functions
  is based on the order of creation and cannot be changed (sadly). Some
  later added functions do some heavy lifting down here, but as said,
  most calculations should be handled within the private function block
  and User Input/Output in the Callbacks block.

### 

### FAQ (to be extended...) 

*The app behaves unexpected/ I have an error.*

> Go to MATLAB\'s main window there may be a useful warning/error
> message pre-implemented. Record the Error-Code you are seeing. Track
> the exact steps that are necessary to reproduce the error. If the
> error is reproducible submit a bug-report via email to
> [[matthias.walle@gmail.com]{.underline}](mailto:matthias.walle@gmail.com)

*How do I need to structure my Raw Data for Automatic Processing*

> Folder1/FolderA/\*.DCM
>
> For each image there should be one folder (FolderA, FolderB, FolderC)
> for 3 images, each containing appropriate DCM files. All folders that
> are supposed to be processed need to be within one folder (Folder1)

*How do I export a screenshot of one individual slice?*

> First adjust the Results image using the options in the data
> processing tab and the slice browser in order to get the wanted
> result. Now there is two options: Hover over the image, select the
> little export symbol, the very left in the top right corner. Export
> your image as image file. Second option, click the new '.\*fig' button
> in the data processing tab in order to open the figure as matlab
> figure. Go to *File → Export Figure → Export*. You can define
> additional options in the export setup menu.

*Why do calibration phantoms not have the same intensity in every
image?*

> MATLAB adjusts the colormap (contrast) for greyscale images for each
> image individually. Therefore, independent phantom images may not have
> the same gray value, however, when you turn on the colormap they
> should have the same value. You can also extract their mean value from
> the results table to check.
