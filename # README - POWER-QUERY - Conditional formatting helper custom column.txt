CLAUDE.AI CONVERSATION

------------

Conditional Formatting in Power BIRcreate a custom column in POWER BI POWER QUERY.
► If a cell in COLUMN A = YES then the cell in the new column = GREEN
► If a cell in COLUMN A = n/a then the cell in the new column = GREY EditTo create a custom column in Power BI Power Query with the conditions you've described, follow these steps:

Open Power Query Editor in Power BI
Go to "Add Column" in the top menu
Click on "Custom Column"
In the "Custom Column" dialog box, enter a name for your new column
Use the following formula in the Custom column formula box:

Copyif [COLUMN A] = "YES" then "GREEN"
else if [COLUMN A] = "n/a" then "GREY"
else null

Click "OK" to create the new column

This formula will create a new column that:

Shows "GREEN" if COLUMN A contains "YES"
Shows "GREY" if COLUMN A contains "n/a"
Shows a null value for any other cases

Would you like me to explain how this formula works or provide any additional information?
