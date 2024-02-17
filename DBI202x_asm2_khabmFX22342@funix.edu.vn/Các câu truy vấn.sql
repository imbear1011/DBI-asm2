use MYDB_ASM2;
-- Truy vấn tất cả bảng POST và MANAGERS
SELECT * FROM POST;
SELECT*FROM MANAGERS;
-- Trong bảng POST, truy vấn những bài viết có LUOT_XEM lớn hơn 20
SELECT * FROM POST WHERE LUOT_XEM >= 20 ;
-- Trong bảng POST, viết truy vấn những bài viết đã được xét duyệt và sắp xếp kết quả theo thứ tự bảng chữ cái của cột tiêu đề
SELECT TIEU_DE , NOI_DUNG , LUOT_XEM , XET_DUYET ,NGUOI_DUYET, THOI_GIAN_DANG
FROM POST
WHERE XET_DUYET = 1 
ORDER BY  TIEU_DE;
-- Viết truy vấn để lấy tên các acount_name của user comment vào POST
SELECT COMMENT.NGUOI_COMMENT, USER.ACCOUNT_NAME, COMMENT.NOI_DUNG
FROM COMMENT
INNER JOIN USER ON COMMENT.NGUOI_COMMENT = USER.ID_USER;
-- Viết truy vấn để tìm nội dung bài viết bắt đầu bằng chữ ‘n’
SELECT * FROM POST
WHERE NOI_DUNG LIKE 'N%';
-- Tạo VIEW để lấy ra những bài viết đã được duyệt bởi những người quản lý.
CREATE
algorithm = merge
VIEW bai_duyet 
AS SELECT *
FROM POST
WHERE XET_DUYET = 1;
select * from bai_duyet;
-- Tạo VIEW để lấy ra các comment của user.
CREATE
algorithm = merge
VIEW show_comment 
AS SELECT COMMENT.NGUOI_COMMENT, USER.ACCOUNT_NAME, COMMENT.NOI_DUNG
FROM COMMENT
INNER JOIN USER ON COMMENT.NGUOI_COMMENT = USER.ID_USER;
select * from show_comment;




