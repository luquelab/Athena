---
layout: default
title: Viewing PDF's on cinci
nav_order: 5
parent: CSRC cluster
grand_parent: Lab Documentation
---

# Viewing PDF's on the cinci cluster

The cinci cluster uses okular as the document viewer. Following are the steps that need to be followed to use ssh with x11 forwarding be able to access okular.


## Accessing okular using Linux/ Mac 
1. Download and install XQuartz on macOS
    * XQuartz package can be found [here](https://www.xquartz.org/)
    * Once this package is downloaded, install the server and follow the instructions provided on the dialogue box to complete the installation process
    * XQuartz can also be downloaded using the brew command on the terminal
    
    ``` brew install -cask xquartz```
    
2. Reboot your mac 
    * Click on the Apple icon and then restart or use the following command on the terminal 
    
    ``` sudo reboot ```
    
3. Log into cinci using the SSH command with -X or -Y  flages

    ```ssh -X user@cinci.sdsu.edu``` or 
    
    ```ssh -Y user@cinci.sdsu.edu```
4. Open required file using the following command

    ``` okular path/doc.pdf ```
    
5. More command line options for okular can be found [here](https://docs.kde.org/stable5/en/okular/okular/command-line-options.html)



## Accessing okular using Windows
1. Download and install PuTTY from [here](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html)
2. Create a session under the 'Session' category. Enter 'cinci.sdsu.edu' under 'Host Name' and under 'Saved Sessions'
3. Select SSH as the Connection type
4. Click on the 'plus' of the SSH category, select X11, and check 'Enable X11 forwarding'
5. Select the 'Session' category, and clieck on 'Save'.
6. Conntect to cinci.sdsu.edu by clicking 'Open'.
7. Log in using your username and password.
8. Open required file using the following command

    ``` okular path/doc.pdf ```
    
9. More command line options for okular can be found [here](https://docs.kde.org/stable5/en/okular/okular/command-line-options.html).
