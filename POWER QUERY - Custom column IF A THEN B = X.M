let
    Source = Excel.Workbook(File.Contents("C:\YourFilePath\YourFile.xlsx"), null, true),
    Sheet1 = Source{[Item="Sheet1",Kind="Sheet"]}[Data],
    #"Promoted Headers" = Table.PromoteHeaders(Sheet1, [PromoteAllScalars=true]),
    #"Added Custom" = Table.AddColumn(#"Promoted Headers", "NewColumn", each if [ColumnA] = "WHITE" then "CUBE" else [ColumnB])
in
    #"Added Custom"
