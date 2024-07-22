= Table.AddColumn(#"Changed Type1", "OUT OF SLA?", each 
    if [X] <> null and [X] <> "" then "GREEN"
    else if [Estimated delivery difference vs today date] = null or 
            [Estimated delivery difference vs today date] < 0 
    then "RED" 
    else "GREEN")
