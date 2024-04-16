let
    Source = YourDataSource,
    // Assuming the table is named "TeamMembers" and contains columns "TeamMemberID" and "Salary"
    Grouped = Table.Group(Source, {"TeamMemberID"}, {{"AverageSalary", each List.Average([Salary]), type number}})
in
    Grouped
