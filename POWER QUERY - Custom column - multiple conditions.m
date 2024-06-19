let
    // Load your data source here, this is just an example
    Source = Excel.Workbook(File.Contents("C:\path\to\your\file.xlsx"), null, true),
    Sheet1 = Source{[Name="Sheet1"]}[Data],

    // Promote headers if necessary
    PromotedHeaders = Table.PromoteHeaders(Sheet1, [PromoteAllScalars=true]),

    // Add Custom Column
    AddedCustom = Table.AddColumn(PromotedHeaders, "NewColumn", each 
        if [ColumnA] = "WHITE" then "CUBE"
        else if [ColumnA] = "BLACK" then "PYRAMID"
        else "BALL")
in
    AddedCustom
