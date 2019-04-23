:: File name: findNewLogs.bat
:: Written by: Serena Hansraj
:: Date: April 11, 2019
::
:: Purpose: This is a master script that will check if local files are synced
:: to remote files, will move all new files to the NEWTEMP folder, and then
:: will process all new files into TEMPPROC waiting to be uploaded to
:: Google Data Studio
::
::

@echo on

::This section calls WinSCP and runs the sync folders script to retrieve only new files.
"C:\Program Files (x86)\WinSCP\WinSCP.exe" /script="C:\Users\GitHub\FTPAutoDownload\winscpDownloadFTP.txt"

::This section will find and move only newly downloaded files to TEMPNEW using the log file.
::The log file is created by WinSCP. The allNewFiles.txt keeps the list of the new files
::and it is overwritten everytime the folders are synced.

findstr "new" "C:\Users\AppData\Local\Temp\CountBoxLogs\countbox1@bg-base.smith.edu.log" > allNewFiles.txt

findstr "Remote" "C:\Users\GitHub\FTPAutoDownload\allNewFiles.txt" > newFiles.txt

For /f "tokens=2 delims='" %%G in (newFiles.txt) Do ECHO %%G >> theFiles.txt
For /f "tokens=2 delims=/" %%H in (theFiles.txt) Do move "C:\Users\PeopleCounter\Data\ALL\%%H" "C:\Users\PeopleCounter\Data\TEMPNEW\%%H"

::This section will call the processing vbs script to run and process all files in the TEMPNEW folder.
::The processed files will go into TEMPPROC.

"C:\Users\GitHub\appMacroFolder\AutoFoldReform.vbs"

:: This is where the connector would live.
:: Following the connector, the code from ReturnTEMPToAll should be added.
