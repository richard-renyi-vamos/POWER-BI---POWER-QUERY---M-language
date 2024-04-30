let
    Source = Excel.Workbook(File.Contents("C:\Path\To\Your\File.xlsx"), null, true),
    Sheet1_Sheet = Source{[Item="Sheet1",Kind="Sheet"]}[Data],
    #"Promoted Headers" = Table.PromoteHeaders(Sheet1_Sheet, [PromoteAllScalars=true]),
    #"Changed Type" = Table.TransformColumnTypes(#"Promoted Headers",{{"Category", type text}, {"KPI", type number}}),
    #"Grouped Rows" = Table.Group(#"Changed Type", {"Category"}, {{"Count", each Table.RowCount(_), type number}, {"Sum", each List.Sum([KPI]), type number}}),
    #"Added Custom" = Table.AddColumn(#"Grouped Rows", "KPI_90%", each [Sum] * 0.9),
    #"Renamed Columns" = Table.RenameColumns(#"Added Custom",{{"Count", "Incident_Count"}, {"Sum", "Total_KPI"}}),
    #"Reordered Columns" = Table.ReorderColumns(#"Renamed Columns",{"Category", "Incident_Count", "Total_KPI", "KPI_90%"}),
    #"Changed Type1" = Table.TransformColumnTypes(#"Reordered Columns",{{"KPI_90%", type number}})
in
    #"Changed Type1"
