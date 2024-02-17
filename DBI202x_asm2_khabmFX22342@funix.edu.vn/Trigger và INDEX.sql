use MYDB_ASM2;
SET SQL_SAFE_UPDATES=0;
-- -----------------
CREATE TABLE comment_count (
  NGUOI_COMMENT VARCHAR(255),
  COUNT INT,
  DATE_COMMENT DATE,
  PRIMARY KEY (NGUOI_COMMENT, DATE_COMMENT)
);
-- Bảng comment_count chứa số lần comment trong 1 ngày của mỗi user
DELIMITER //
CREATE TRIGGER comment_count_trigger
AFTER INSERT ON COMMENT
FOR EACH ROW
BEGIN
    DECLARE comment_count INT;
    
    -- Kiểm tra nếu người comment đã tồn tại trong bảng comment_count
    SELECT COUNT(*) INTO comment_count
    FROM comment_count
    WHERE NGUOI_COMMENT = NEW.NGUOI_COMMENT
    AND DATE_COMMENT = DATE(NEW.TIME_COMMENT);
    
    -- Nếu đã tồn tại, cập nhật giá trị số lần comment
    IF comment_count > 0 THEN
        UPDATE comment_count
        SET COUNT = COUNT + 1
        WHERE NGUOI_COMMENT = NEW.NGUOI_COMMENT
        AND DATE_COMMENT = DATE(NEW.TIME_COMMENT);
    ELSE
        -- Nếu chưa tồn tại, thêm mới bản ghi
        INSERT INTO comment_count (NGUOI_COMMENT, COUNT, DATE_COMMENT)
        VALUES (NEW.NGUOI_COMMENT, 1, DATE(NEW.TIME_COMMENT));
    END IF;
END //
DELIMITER;

DELIMITER //
-- -----------------
CREATE INDEX IDX_XD_TGD_POST
ON POST(XET_DUYET, THOI_GIAN_DANG) USING btree ;
SHOW INDEXES FROM POST;
-- CHỈ MỤC NÀY HỖ TRỢ TÌM BÀI VIẾT THEO TÌNH TRẠNG XÉT DUYỆT VÀ THỜI GIAN ĐĂNG NHANH HƠN

