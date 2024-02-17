use MYDB_ASM2;
-- Tạo thủ tục để lấy được những bài viết đã được duyệt
DELIMITER //
CREATE PROCEDURE get_duyet_bai()
BEGIN
    SELECT *
    FROM POST
    WHERE XET_DUYET = 1;
END;
-- Tạo thủ tục để lấy những bài viết chưa được duyệt trước ngày 01-02-2018.
CREATE PROCEDURE get_chua_duyet_bai()
BEGIN
    SELECT *
    FROM POST
    WHERE XET_DUYET = 0 AND THOI_GIAN_DANG < '2018-02-01';
END //
DELIMITER;
DELIMITER //
CALL get_duyet_bai()//
DELIMITER //
CALL get_chua_duyet_bai()//

-- -----------------------
DELIMITER //

CREATE FUNCTION GetMaxMonths()
RETURNS INT
READS SQL DATA
BEGIN
  DECLARE maxMonths INT;
  SELECT MAX(TIMESTAMPDIFF(MONTH, THOI_GIAN_DANG, '2019-01-01')) INTO maxMonths
  FROM POST;
  RETURN maxMonths;
END //

DELIMITER ;
SELECT GetMaxMonths();