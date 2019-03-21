SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE='BASE TABLE'

SELECT * FROM Employees

SELECT LastName, TerminationJson FROM Employees WHERE FirstName = 'test123'
SELECT * FROM AspNetUsers WHERE Id = '30a23795-8338-48ac-8f49-8a129156f127'
SELECT * FROM Employees WHERE Id = '6129a84f-50eb-40d9-9b50-7f42970d88a9'

SELECT * FROM AspNetUser

SELECT * FROM EmployeesOnBench

SELECT * FROM EmployeeStatuses

SELECT * FROM Employees WHERE RoleId IN(8, 12, 13, 16)

SELECT * FROM Employees WHERE firstname = 'Yuri'

SELECT * FROM Employees WHERE Email = '456@234.com'

INSERT INTO table_name (column1, ...)
VALUES (value1, ...);

UPDATE Customers
SET ContactName = 'Alfred Schmidt', City= 'Frankfurt'
WHERE CustomerID = 1;

DELETE From Employees WHERE FirstName = 'Yuri'

/* rates */
SELECT * FROM OtherChargeRates
SELECT * FROM DowntimeRates
SELECT * FROM ContainerRates
SELECT * FROM ContainerWorkTypes
SELECT * FROM ContainerParts
SELECT * FROM ContainerLoadTypes
SELECT * FROM ContainerSizes


/* Other Charge Types */
SELECT * FROM OtherChargeTypes

/* get container rate */
SELECT ContainerRates.PayWeekday
FROM ContainerRates
INNER JOIN ContainerParts ON ContainerRates.ContainerPartId = ContainerParts.Id
INNER JOIN ContainerLoadTypes ON ContainerRates.ContainerLoadTypeId = ContainerLoadTypes.Id
INNER JOIN ContainerSizes ON ContainerRates.ContainerSizeId = ContainerSizes.Id
INNER JOIN ContainerWorkTypes ON ContainerRates.ContainerWorkTypeId = ContainerWorkTypes.Id
WHERE ContainerParts.NameKey = 'ContainerPart_Full'
AND ContainerWorkTypes.NameKey = 'ContainerWorkType_Arnotts_FunSticks'
AND ContainerLoadTypes.NameKey = 'ContainerLoadType_Unload'
AND ContainerSizes.NameKey = 'ContainerSize_20'








(8)  SELECT (9) DISTINCT (11) TOP <top_specification> <select_list>
(1)  FROM <left_table>
(3)       <join_type> JOIN <right_table>
(2)       ON <join_condition>
(4)  WHERE <where_condition>
(5)  GROUP BY <group_by_list>
(6)  WITH {CUBE | ROLLUP}
(7)  HAVING <having_condition>
(10) ORDER BY <order_by_list>