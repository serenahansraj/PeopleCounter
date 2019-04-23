# PeopleCounter
This is the repository for the people counter scripts for at Smith College Botanic Garden, by Serena Hansraj.

## Purpose
These scripts are to automate the data flow for dynamic reports of up-to-date data.

The data is provided by the people counter machines found at the top of each entrance in the botanic garden. Each machine records the movement of people coming in and out of the door in in sets of 15 minute intervals. 

## How to Setup

To run these sets of scripts you must first organize your data folders (please see manual in google drive for specifics for the R drive) and edit the pathnames in each of the files. 

Now that the folders are in order, your next step is copy and paste the code from the ProcessingMarco.vba into a Personal.xlsb macro/module (please see manual for macro setup). 

Finally, you need to enable logging in WinSCP and specify where you'd like your log file to live (please see manual on how to setup logging files in WinSCP).

## How to Run

To run these scripts, you can setup your task scheduler (or manual click on the) MasterScript.bat file (please see manual on how to set up task scheduler). The master will begin sync the local folders to the remote and download all new files by running WinSCP with the commands written in WinSCPDownloadFTP.txt.

After syncing, the log file will update, so the newfiles are moved to the TEMPNEW folder.

Next, the new files are processed and saved into the appropriate folders in TEMPPROC. After all files are processed, they will wait in those folders until the user uploads them into the appropriate Google Data Studio data sources.

Once the data is uploaded, the user can click on/ run the ReturnTEMPtoALL.bat file to move all files to their appropriate folders.
