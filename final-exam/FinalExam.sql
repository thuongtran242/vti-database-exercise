-- FINAL EXAM 
-- Requirement 1:  
-- Để quản lý Thực tập của sinh viên, người ta xây dựng một cơ sở dữ liệu có tên là 
-- ThucTap gồm các sơ đồ quan hệ sau (trường có dấu gạch chân là PrimaryKey): 
--   giang_vien(magv, ho_ten, luong) 
--  sinh_vien(masv, ho_ten, namsinh, quequan) 
--  de_tai(madt, tendt, kinhphi, noi_thuc_tap) 
--  huong_dan(id, masv, madt, magv, ketqua)

-- 1. Tạo table với các ràng buộc và kiểu dữ liệu  
-- Thêm ít nhất 3 bản ghi vào table
drop database if exists thuc_tap;
create database thuc_tap;
use thuc_tap;
create table giang_vien(
ma_gv int auto_increment primary key,
ho_ten varchar(50),
luong float
);
create table sinh_vien(
ma_sv int auto_increment primary key,
ho_ten varchar(50),
nam_sinh date,
que_quan varchar(50)
);
create table de_tai(
ma_dt int auto_increment primary key,
ten_dt varchar(50),
kinh_phi float,
noi_thuc_tap varchar(50)
);
create table huong_dan(
id int auto_increment primary key,
ma_sv int,
ma_dt int,
ma_gv int,
ket_qua int,

foreign key (ma_sv) references sinh_vien(ma_sv),
foreign key (ma_gv) references giang_vien(ma_gv),
foreign key (ma_dt) references de_tai(ma_dt)
);

-- insert dữ liệu 
INSERT INTO thuc_tap.giang_vien(ho_ten,luong)
VALUES    					('Nguyễn Đàm' ,'5000000'),
							('Nguyễn Đạo', '4000000'),
                            ('Nguyễn Linh', '4560000'),
                            ('Vũ Trang',  '7000000');
                            

                            
INSERT INTO thuc_tap.sinh_vien ( ho_ten, nam_sinh, que_quan)
VALUES    						 ('sinh_vien 1',		 '1998-11-11 00:00:00',		 'ND'),
								 ('sinh_vien 2',		 '1999-02-22 00:00:00',		 'HN'),
                                 ('sinh_vien 3',		 '1997-01-01 00:00:00',		 'QN'),
                                 ('sinh_vien 4',		 '1999-01-12 00:00:00',		 'TH'),
                                 ('sinh_vien 5',		 '1998-03-30 00:00:00',		 'BG');

INSERT INTO thuc_tap.de_tai ( ten_dt, kinh_phi, noi_thuc_tap)
VALUES    					 ('de_tai 1' , ' 3000000', 'FPT'	),
							  ('de_tai 2', '5096600','VIETTEL'	),
                              ('de_tai 3'	, '2640250','VINAPHONE'),
                              ('CONG NGHE SINH HOC'	, '2630000','MOBIPHONE');
                            
INSERT INTO thuc_tap.huong_dan (ma_dt, ma_sv, ma_gv, ket_qua	)
 VALUES							 (	'1', 			'4', 			'3', 	 '7'	),
								 (	'2', 			'1', 			'4', 	 '8 '	),
                                 (	'3', 			'2', 			'1', 	 '9'	),
                                 (	'4', 			'1', 			'3', 	 '10'	);
                                 
-- Viết lệnh để 
-- a) Lấy tất cả các sinh viên chưa có đề tài hướng dẫn  
select ma_sv, ho_ten from sinh_vien left join huong_dan using (ma_sv) where id is null;
-- b) Lấy ra số sinh viên làm đề tài ‘CONG NGHE SINH HOC’
select count(ma_sv) from huong_dan join de_tai using (ma_dt) where ten_dt =  'CONG NGHE SINH HOC';

-- 3. Tạo view có tên là "SinhVienInfo" lấy các thông tin về học sinh bao gồm:  mã số, họ tên và tên đề tài 
-- (Nếu sinh viên chưa có đề tài thì column tên đề tài sẽ in ra "Chưa có") 
create view SinhVienInfo as select ma_sv, ho_ten, case when ten_dt is null then 'Chua co' end as ten_de_tai from sinh_vien left join huong_dan using (ma_sv) left join de_tai using (ma_dt)
-- 4. Tạo trigger cho table SinhVien khi insert sinh viên có năm sinh <= 1900 thì hiện ra thông báo "năm sinh phải > 1900" 
drop trigger if exists trigger_insert_nam_sinh;
delimiter $$
create trigger trigger_insert_nam_sinh 
before insert on `sinh_vien`
for each row 
begin
if year(new.nam_sinh) <=1990 then signal sqlstate '45000' set message_text='năm sinh phải > 1900' ; 
end if;
end $$
delimiter ;

INSERT INTO sinh_vien ( ho_ten, nam_sinh, que_quan)
VALUES    						 ('sinh_vien 10',		 '1988-11-11 00:00:00',		 'ND')

-- 5. Hãy cấu hình table sao cho khi xóa 1 sinh viên nào đó thì sẽ tất cả thông tin trong table HuongDan liên quan tới sinh viên đó sẽ bị xóa đi
ALTER TABLE huong_dan ADD CONSTRAINT fk_ma_sv FOREIGN KEY (ma_sv)  REFERENCES sinh_vien (ma_sv) ON DELETE CASCADE;
