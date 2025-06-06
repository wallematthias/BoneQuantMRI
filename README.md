# MRI User Interface Manual

![image](https://github.com/user-attachments/assets/12ba626c-63bb-4426-86b8-a6d0b02b794f)


## Purpose
This user interface supports the analysis of 31P and 1H signals from MRI scans. It allows users to:

1. Visualize images in 2D and 3D
2. Segment images in 2D
3. Apply local B1-correction
4. Apply calibration curves to extract physical measurements
5. Perform ROI-based processing
6. Export modified images

The interface was tested with 64 × 64 × 64 images, but other dimensions should also work.

---

## User Types
- **(I) Inexperienced Users:** No programming experience required. Familiarity with medical imaging and segmentation is recommended. Use only the UI.
- **(E) Experienced Users:** Familiar with MATLAB, image processing, and App Designer. Encouraged to modify and extend the app.

---

## Quick Start (for E Users)

1. **Data:** Load raw image and B1 correction image. The B1 image is downscaled automatically.
2. **Slice Browser:** View images in sagittal, coronal, or axial planes. Use the 3D button to view the result.
3. **Segmentation:** Manually adjust ROI for bone and phantom. Save/load masks.
4. **ROI Analysis:** Define trabecular and cortical regions. A third (growth plate) is inferred. Auto-segmentation uses Otsu's method.
5. **Results:** ROI types: Cortical, Trabecular, Growth Plate. Metrics: Volume, mean/median intensity (Tissue vs Bone).

---

## Detailed Instructions (for I Users)

### 1. MATLAB Installation
- Install MATLAB R2019a or newer: [MathWorks Trials](https://www.mathworks.com/campaigns/products/trials.html?prodcode=ML)
- On BIDMC computers: Use license file from `S:\Obl\Matlab2019a\license.dat`

### 2. Launch App
- Open MATLAB → Use the Workspace Browser to open `MRI_Bone_Analysis.mlapp`
- App Designer opens → Press **Run**

### 3. Interface Overview
- The application window launches after pressing Run.

### 4. Data Import
- Use "Select DICOM for Raw image" and "Select DICOM for B1 image"

### 5. Visualization
- Use Slice Browser controls
- Display options (colormap, enhanced contrast) in **Data Processing** tab
- Turn off overlays for exporting images

### 6. 3D Rendering
- Use the 3D button for visualizing the final image
- MATLAB's `volumeViewer` is used under the hood

### 7. Segmentation
- Auto-segmented regions:
  - Green: specimen
  - Blue: phantom
  - Red/Black: holes
- Adjust threshold as needed (resets manual contours!)

### 8. Manual Re-Segmentation
- Press **Resegment** → Manual tool appears
- Draw ROI for phantom (blue) and bone (green)
- Use "New ROI" before each action

### 9. Navigation & Saving
- Navigate slices → Save to same folder as image
- Use Load button to reload masks

### 10. ROI-Based Processing
- Use sliders to define Cortical (C) and Trabecular (T) regions
- GPA region is auto-computed
- "Guess" estimates standard ROI sizes

### 11. Calibration
- Set reference density (e.g., 0.71)
- Choose 1-point or 2-point calibration modes
- Optionally set segmentation threshold (e.g., 4255)
- Enable/disable B1-correction

### 12. Results Table
- Use "Single" button to populate results
- Clicking a cell copies results to clipboard (paste in Excel)

### 13. Export
- Use Export menu to save calibrated images as 3D DICOM stacks

### 14. Automatic Mode
- Folder structure: `Run-1/Set-1/*.DCM`
- Do **not** select subfolders like `Set-1`
- Press "Auto" and select `Run-1`
- Ensure B1 file is preloaded

### 15. Result Parameters
- **TV**: Total Volume
- **BV**: Bone Volume
- **V_cort**: Cortical Volume
- **V_trab**: Trabecular Volume
- **Bone D.**: Mean Bone Density
- **Tissue D.**: Mean Tissue Density (Cortical, Trabecular, GPA)
- **Phantom / Noise**: Mean phantom or background values

---

## Modifications

Switch to **Code View** in App Designer to customize:
- Document changes in the program header
- Code sections:
  - **Properties** = Global variables
  - **Private functions** = Main logic (top-to-bottom workflow)
  - **Callbacks** = GUI component responses (ordered by creation)

---

## ❓ FAQ

**The app behaves unexpectedly / I see an error.**
- Check the MATLAB command window for detailed errors
- If reproducible, send bug report with steps and error to: `matthias.walle@gmail.com`

**How should my data be structured for automatic mode?**
```
Folder1/
  ├─ FolderA/*.DCM
  ├─ FolderB/*.DCM
  └─ FolderC/*.DCM
```
Do not select subfolders. Place all folders to process into one root folder.

**How can I export a screenshot of a slice?**
- Adjust settings in Slice Browser and Data Processing tab
- Use the export button in the corner of the image
- Or use the `.fig` button to open as MATLAB figure → Export

**Why do calibration phantoms look different across images?**
- MATLAB auto-adjusts grayscale contrast for display
- Use colormap or extract values from the results table to compare actual densities

---

## 📦 Compatibility
Tested from **MATLAB R2019a to R2025a**.

---

## 📬 Contact
For questions or contributions, email [matthias.walle@gmail.com](mailto:matthias.walle@gmail.com)
