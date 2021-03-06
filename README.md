# DialysisNow

Dialysis is a critical treatment for patients with declining kidney functionality. However, it can be difficult
to locate dialysis centers and/or assess the availability of that center for treatment, especially in times of crisis 
(such as during natural disasters). 
DialysisNow is an application that aims to provide a central database of
dialysis centers within the United States.
The application will provide navigational components, as well as give
users the capability to report closures of certain dialysis centers
during times of crisis. This will allow other users to avoid wasting
valuable time searching a multitude of centers to find treatment.

## Release Notes for Version 0.5.0

### Version 0.5.0
#### New Features:
* Ability to report dialysis center status (synchronized over multiple devices) and have that information reflected in-application

#### Bug Fixes
* As previously stated in our last release notes, we were facing significant issues with MongoDB as our database. We pivoted to Firebase, which we ended up utilizing for our report functionality

#### Known Issues
* N/A

##

## Release Notes for Version 0.4.0

### Version 0.4.0
#### New Features:
* Implementation of a functional favorites menu so that users can easily mark their preferred dialysis centers, as well as reference them again with ease.

#### Bug Fixes
* N/A

#### Known Issues
* Currently experiencing ongoing issues with integration between the MongoDB database and Flutter integration due to previously noted issues. This has been worked on extensively during previous sprints, with no known solutions. As a result, will consider pivoting to a different database to be used for the report functionality. This pivot will likely be to Firebase. 

##

### Version 0.3.0
#### New Features:
* Implementation of a functional navigation bar so that users can easily access the different screens of the application.

* Interactive map marker which allows for quicker accessibility of a dialysis center's information.

#### Bug Fixes
* Fixed map marker bug which repeatedly rendered old map markers, which can cause clutter on screen view

* Fixed search and filtering when looking for particular dialysis centers

#### Known Issues
* MongoDB database and Flutter integration issue involving pub being unable to resolve dependency constraints due to varying package dependencies

##

### Version 0.2.0
#### New Features:
* Map view to displayer dialysis center within a map screen.

* A user is able to search for dialysis care centers by name or address keywords which yields a list view of resulting dialysis care centers.

* The map marker is first set to the user's location and then set to the chosen dialysis care center.

* The map marker can be clicked for the info screen for the center's information.


#### Bug Fixes
* Crowding on map screen

#### Known Issues
* N/A

##

### Version 0.1.0
#### New Features:

* Linked the Google Places API to the application to provide
  navigational services and features.

* Has the capability to show information about a particular
  dialysis center, such as their address and opening hours.

* Linked the call functionality so that users are able to contact
  their selected dialysis center.

#### Bug Fixes
* N/A

#### Known Issues
* N/A

##

# Installation Guide

Listed below are some steps for setting up a Flutter project. It is recommended to follow the installation guide for each respective software, as it is typically specific to your operating system.

### Prerequisite:
1. Download VS Code (https://code.visualstudio.com/download)
2. Install Flutter (https://docs.flutter.dev/get-started/install)
3. Set-up Flutter (https://docs.flutter.dev/get-started/install/macos) 
    - Tip: Run flutter doctor in your terminal to check for any issues / check status


### Project Set-Up (Download Build and Installation)
1. Download the DialysisNow GitHub project: https://github.com/yurijhang0/JIE1355_DialysisNow
2. Open project in VS Code
3. Get and upgrade Dependencies (Click on buttons at the top right corner)
4. If there's a version mismatch, follow the following steps:
    - sudo gem install cocoapods
    - pod update


### Running and Exporting Application
1. Run the project by selecting a simulator within VS Code and running main.dart
2. Export to iOS device (https://docs.flutter.dev/get-started/install/macos)

### Troubleshooting
1. Run flutter doctor to check for any possible issues
2. Make sure all dependencies are up-to-date and unconflicting to avoid issues
3. Link: https://medium.com/wayvs-tech/flutter-troubleshooting-guide-c5eb5ccb595f

