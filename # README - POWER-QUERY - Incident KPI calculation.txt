CHATGPT CONVERSATION

--------

User
create a POWER BI M language code that calculates 5 different fields for incidents base on a datafile. all of them have a different category (column A), and it needs to calculate the KPI (90% ) (from column B)
ChatGPT
Sure, I can provide you with an example of M language code for Power BI that calculates five different fields for incidents based on a data file, where each incident has a different category, and it calculates the KPI (90%) from column B.

Let's assume you have a data file with two columns: Category (Column A) and KPI (Column B). Here's an example of M language code that calculates five different fields for incidents, each for a different category:

m
Copy code
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
This code assumes that your data is stored in an Excel file with a sheet named "Sheet1" and that the columns in your file are named "Category" and "KPI". Adjust the file path and sheet name accordingly if they are different in your case.

This code first loads the data from the Excel file, promotes headers, groups the rows by category, calculates the count and sum of KPI for each category, calculates the KPI (90%) for each category, and then renames and reorders the columns for better readability.

Feel free to modify this code according to your specific requirements and data structure!






