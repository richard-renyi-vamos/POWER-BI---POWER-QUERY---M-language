= Table.AddColumn(#"XYZ", "Conditional formatting helper custom column", each if [#"CONDITION TRUE?"] = "YES" then "GREEN" else if [#"Zero Outage relevant?"] = "NO" then "RED" else null)
