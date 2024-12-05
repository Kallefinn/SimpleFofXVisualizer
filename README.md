# SimpleFofXVisualizer
A tool to plott a number of functions on a canvas. Build in Qt with qml

![image](https://github.com/user-attachments/assets/fdd978e5-3d58-4d2c-8797-5476107dc40a)

## How to use:

  ### Plotting
  - To draw a function just write down the formula in the top input.
  - To add a new input press the plus button.
  - To delete a function just erase the formula and press enter.
  ### Panning and Zoom
  - #### Mouse
    - Drag with left mouse button to pan
    - Scroll Wheel + Ctrl to Zoom
  - #### Touchpad
    - Pan with two fingers
    - Zoom with two fingers + Ctrl

### Features
  - right click on Input field to change color
  - right click on plot to:
    - Export as Png
    - Change style (Build in Qt Styles)
    - change background color
    - remove or add axies and grid

### Build
  Open project in QtCreator and make sure to have Qt6.7 installed
### To Do
  - Visual formulas with [MicroTex](https://github.com/NanoMichael/MicroTeX/tree/master)
  - Allow for family of functions with range and stepsize with slider
  - 2 Dimensional Functions?

## Notes
  This was just a project to learn the whole Qt6 framework along with Cmake and qml.
  The most interesting thing is probably the parser library ![exprtk by Arash Partov](https://github.com/ArashPartow/exprtk).
  This would, in theory, enable this project to be expanded well beyond the optimizations i integrated.
  Especially if combined with the options Qt6 offers regarding 3D capabilitites.
  Right now it just means that the parser accepts a whole lot of function inputs like sin(),log() etc.
  
