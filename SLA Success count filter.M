SLA Success Count = 
CALCULATE(
    COUNTROWS('YourTableName'),
    'YourTableName'[SLA outcome] = "SLA success"
)
