CREATE PROCEDURE CleanTable(IN tableName VARCHAR(255), IN idColumn VARCHAR(255))
BEGIN
    -- Prepare and execute the query to delete rows with NULL values
    SET @query1 = CONCAT('DELETE FROM `', tableName, '` WHERE `', idColumn, '` IS NULL');
    PREPARE stmt1 FROM @query1;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;

    -- Prepare and execute the query to delete duplicate rows
    SET @query2 = CONCAT('DELETE t1 FROM `', tableName, '` t1
                          INNER JOIN `', tableName, '` t2 
                          WHERE t1.', idColumn, ' > t2.', idColumn, ' AND 
                          t1.', idColumn, ' = t2.', idColumn);
    PREPARE stmt2 FROM @query2;
    EXECUTE stmt2;
    DEALLOCATE PREPARE stmt2;
END