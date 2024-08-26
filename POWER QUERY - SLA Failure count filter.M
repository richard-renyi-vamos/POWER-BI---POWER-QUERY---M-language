SLA Failure Count = 
CALCULATE(
    COUNTROWS('YourTableName'),
    'YourTableName'[SLA outcome] = "SLA failure"
)
