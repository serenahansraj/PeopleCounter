:: Filename: ReturnTEMPToAll.bat
:: Written by: Serena Hansraj
:: Date: April 23, 2019
::
:: Purpose: This script returns all files from any TEMP folder their ALL folder.
::
::
@echo on

move "C:\Users\PeopleCounter\Data\TEMPNEW\*.csv" "C:\Users\PeopleCounter\Data\ALL"

move "C:\Users\PeopleCounter\Data\TEMPPROC\LymanClassrooms_Processed\*.txt" "C:\Users\PeopleCounter\Data\LymanClassrooms_Processed"

move "C:\Users\PeopleCounter\Data\TEMPPROC\LymanExhibit_Processed\*.txt" "C:\Users\PeopleCounter\Data\LymanExhibit_Processed"

move "C:\Users\PeopleCounter\Data\TEMPPROC\LymanReception_Processed\*.txt" "C:\Users\PeopleCounter\Data\LymanReception_Processed"

move "C:\Users\PeopleCounter\Data\TEMPPROC\LymanWOW_Processed\*.txt" "C:\Users\PeopleCounter\Data\LymanWOW_Processed"
