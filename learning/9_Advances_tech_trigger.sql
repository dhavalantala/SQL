CREATE TABLE salesdb.employeelogs (
    LogID INT AUTO_INCREMENT PRIMARY KEY,
    EmployeeID INT,
    LogMessage VARCHAR(255),
    LogDate DATETIME DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //

CREATE TRIGGER trg_AfterInsertEmployee
AFTER INSERT ON salesdb.employees
FOR EACH ROW
BEGIN
    INSERT INTO salesdb.employeelogs (EmployeeID, LogMessage, LogDate)
    VALUES (
        NEW.EmployeeID,
        CONCAT('New Employee Added = ', NEW.EmployeeID),
        NOW()
    );
END //

DELIMITER ;

select 
	*
from salesdb.employeelogs;

insert into salesdb.employees
value(7, 'Dhaval', 'Antala', 'AI', '1197-01-08', 'M', 81000, 3);

select *
	from salesdb.employees