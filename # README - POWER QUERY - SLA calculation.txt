CLAUDE.AI conversation

-----------

Conditional Formatting for Power Query


R
POWER QUERY custom column.

Make an addition to this: if X column is NOT empty, then disregard the current RED conditions and make it GREEN

= Table.AddColumn(#"Changed Type1", "OUT OF SLA?", each 
    if [Estimated delivery difference vs today date] = null or 
       [Estimated delivery difference vs today date] < 0 
    then "RED" 
    else "GREEN")

Edit
Here's the modified Power Query custom column formula that incorporates your additional condition:


Copy
= Table.AddColumn(#"Changed Type1", "OUT OF SLA?", each 
    if [X] <> null and [X] <> "" then "GREEN"
    else if [Estimated delivery difference vs today date] = null or 
            [Estimated delivery difference vs today date] < 0 
    then "RED" 
    else "GREEN")
This formula does the following:

It first checks if the "X" column is not empty (assuming "X" is the name of your column; replace it with the actual column name if different).
If "X" is not empty, it sets the result to "GREEN", disregarding the other conditions.
If "X" is empty, it then checks the original conditions for "RED".
If none of the conditions are met, it defaults to "GREEN".
Would you like me to explain any part of this formula in more detail?
