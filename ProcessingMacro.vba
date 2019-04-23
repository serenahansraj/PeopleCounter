' Filename: ProcessingMarco.vba
' Written by: Serena Hansraj
' Date: April 23, 2019
'
' This function will seperate date and time into seperate columns.
' Then it will create a sum_in column which holds the value of the totatl sum
' from Polyline0_SUM_IN, and a similar column Sum_out for Polyline0_SUM_OUT.
' The second part of this function will save these changes to a new text file
' using the date column as the new file name. Using the funciton, it finds the
' correct location of the folder the new file should be in.
'
' At the end of the function, the changes are not saved to the original file
' and the program quits. After this, there should be the original file in its
' original location and the new file in the appropriate folder.
'
'
Sub ProcessingMarco()

    'create new column to the right and shift all other data to the right
    Columns(3).Select
    Selection.Insert Shift:=xlToRight, CopyOrigin:=xlFormatFromLeftOrAbove
    Columns("B:B").Select
    Selection.TextToColumns Destination:=Range("B1"), DataType:=xlFixedWidth, _
        FieldInfo:=Array(Array(0, 3), Array(10, 1)), TrailingMinusNumbers:=True
    Selection.NumberFormat = "yyyymmdd"
    Columns("C:C").Select
    Selection.NumberFormat = "[$-x-systime]h:mm:ss AM/PM"
    Range("C1").Select
    ActiveCell.FormulaR1C1 = "time"
    Range("C2").Select

    Range("H1").Select
    ActiveCell.FormulaR1C1 = "Sum_in"
    Range("H2").Select
    ActiveCell.FormulaR1C1 = "=SUM(RC[-2]:R[96]C[-2])"
    Range("I1").Select
    ActiveCell.FormulaR1C1 = "Sum_out"
    Range("I2").Select
    ActiveCell.FormulaR1C1 = "=SUM(RC[-2]:R[96]C[-2])"


    'Declare each variable before it is used anywhere in the code.
    Dim Path
    Dim NewPath
    Dim WBname
    Dim Destination
    Dim FolderName

    'We can get the filename without manually typing it in by using the currently active workbook.
    WBname = ActiveWorkbook.Name

    FolderName = Split(WBname, "-")
    FolderName = Split(FolderName(1), "_")
    FolderName = FolderName(0)

    'This is the Path of the current file, this will have to be have to be changed for the different files
    'Where each file is located. I will manually change these Path names for now, so there maybe
    'Five versions of this code with different Path names for each folder.

    Path = "C:\Users\PeopleCounter\Data\TEMPNEW\" & FolderName & "\"
    NewPath = "C:\Users\PeopleCounter\Data\TEMPPROC\" & FolderName & "_Processed\"

    Destination = NewPath & Range("B6").Text & Left(WBname, Len(WBname) - 4) & ".txt"

    'Save the new file with its name and location as decided above.
    'The current workbook quits without saving.
    ActiveWorkbook.SaveCopyAs Filename:=Destination
    ActiveWorkbook.Close SaveChanges:=False

End Sub
