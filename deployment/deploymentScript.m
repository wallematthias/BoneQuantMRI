projectRoot = "/Users/matthias.walle/Documents/GitHub/BoneQuantMRI";

% Create target build options object, set build properties and build.
buildOpts = compiler.build.StandaloneApplicationOptions(fullfile(projectRoot, "app", "qMRIBone.mlapp"));
buildOpts.AdditionalFiles = [fullfile(projectRoot, "icon-2.png"), fullfile(projectRoot, "topbar_long.png")];
buildOpts.AutoDetectDataFiles = false;
buildOpts.OutputDir = fullfile(projectRoot, "deployment", "Mac-AppleSilicon");
buildOpts.ObfuscateArchive = true;
buildOpts.Verbose = true;
buildOpts.EmbedArchive = true;
buildOpts.ExecutableIcon = fullfile(projectRoot, "deployment", "resources", "icon.png");
buildOpts.ExecutableName = "BoneQuantMRI";
buildOpts.ExecutableVersion = "1.0";
buildOpts.TreatInputsAsNumeric = false;
buildResult = compiler.build.standaloneApplication(buildOpts);


% Create package options object, set package properties and package.
packageOpts = compiler.package.InstallerOptions(buildResult);
packageOpts.ApplicationName = "BoneQuantMRI";
packageOpts.AuthorName = "Matthias Walle";
packageOpts.AuthorEmail = "matthias.walle@gmail.com";
packageOpts.AuthorCompany = "Nazarian Lab, BIDMC, Harvard Medical School.";
packageOpts.Description = "BoneQuantMRI is a lightweight research tool for analyzing bone MRI scans using ROI-based segmentation and phantom-based calibration. Designed for flexible inspection and quantitative evaluation of trabecular, cortical, and growth plate regions." + newline + "" + newline + "Instructions:" + newline + "Load your MRI scan and optional B1 correction image to begin. Navigate, segment, and analyze regions of interest. Export summary statistics for each region." + newline + "" + newline + "License:" + newline + "For non-commercial academic research use only." + newline + "Redistribution or clinical application is not permitted." + newline + "" + newline + "© 2025 Matthias Walle" + newline + "Nazarian Lab, Beth Israel Medical Center, Harvard Medical School." + newline + "";
packageOpts.InstallerIcon = fullfile(projectRoot, "deployment", "resources", "icon.png");
packageOpts.InstallerLogo = fullfile(projectRoot, "deployment", "resources", "sidebar_long.png");
packageOpts.InstallerName = "installBoneQuantMRI";
packageOpts.InstallerSplash = fullfile(projectRoot, "deployment", "resources", "splash_screen.png");
packageOpts.OutputDir = fullfile(projectRoot, "deployment", "Mac-AppleSilicon", "output", "package");
packageOpts.Summary = "Tool for analyzing MRI bone images using ROI-based segmentation and phantom calibration." + newline + "" + newline + "";
packageOpts.Verbose = true;
packageOpts.Version = "1.0";
compiler.package.installer(buildResult, "Options", packageOpts);