'File name: reformatMarco.vbs
'Written by: Serena Hansraj
'Date: 4/9/2019
'
'This script is used to reformat all freshly downloaded files from
'the people counter. Please use the comments to rewrite accordingly.
'This script works by using the macro module already saved in excel.
ProcessFiles()

Sub ProcessFiles()
    'Creating variable names
    Dim Files
    Dim Filename
    Dim Pathname
    Dim wb
    Dim FolderList(3)
    Dim FolderName

    'Listing which folders the user want the program to process
    'Note: The program will go through all files in the folder
    'and saveover old processed files. It is best practice to run this
    'script on folders contain only new files.
    FolderList(0) = "TEMPNEW"

    for each FolderName in FolderList

        Set objFSO = CreateObject("Scripting.FileSystemObject")

        'Find the folder hosting the data files, highlight the folder by
        'clicking on it once. Then select the home tab at the top of finder.
        'Select the option: "Copy path" and paste the path in between the
        'quotation marks below, they should look to my example.
        Pathname = "C:\Users\PeopleCounter\Data\" & FolderName & "\"

        '*.csv means that you are selecting all csv files from this folder.
        'To select more specific files, use part of the file name with
        ' *_APS8005C7-LymanWOW_data.csv
        Set folder = objFSO.GetFolder(Pathname)
        Set Files = folder.Files

        'This is a loop that will go through each file in the folder
        'Do this function while filename is not equal to blank/""/nothing
        For each Filename in Files
            Set objExcel = CreateObject("Excel.Application")
            Set wb = objExcel.Workbooks.Open(CStr(Filename))
            objExcel.visible = False
            objExcel.Application.Run "'C:\Users\AppData\Roaming\Microsoft\Excel\XLSTART\PERSONAL1.XLSB'!Module2.ProcessingMarco"
            objExcel.Application.Quit
            objExcel.Quit
        Next
    Next
End Sub
