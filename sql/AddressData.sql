INSERT INTO HE150277_HoangTienMinh_City (CityName) VALUES (N'Thành phố Hà Nội');
INSERT INTO HE150277_HoangTienMinh_City (CityName) VALUES (N'Thành phố Hồ Chí Minh');

DECLARE @CityId INT;
SET @CityId = (SELECT CityId FROM HE150277_HoangTienMinh_City WHERE CityName = N'Thành phố Hà Nội');

INSERT INTO HE150277_HoangTienMinh_District (DistrictName, CityId) VALUES (N'Quận Hoàn Kiếm', @CityId);
INSERT INTO HE150277_HoangTienMinh_District (DistrictName, CityId) VALUES (N'Quận Đống Đa', @CityId);
INSERT INTO HE150277_HoangTienMinh_District (DistrictName, CityId) VALUES (N'Quận Thanh Xuân', @CityId);
INSERT INTO HE150277_HoangTienMinh_District (DistrictName, CityId) VALUES (N'Quận Cầu Giấy', @CityId);

DECLARE @DistrictId INT;

SET @DistrictId = (SELECT DistrictId FROM HE150277_HoangTienMinh_District WHERE DistrictName = N'Quận Hoàn Kiếm');
INSERT INTO HE150277_HoangTienMinh_SubDistrict (SubDistrictName, DistrictId) VALUES(N'Chương Dương Độ',  @DistrictId);
INSERT INTO HE150277_HoangTienMinh_SubDistrict (SubDistrictName, DistrictId) VALUES(N'Cửa Đông', @DistrictId);   
INSERT INTO HE150277_HoangTienMinh_SubDistrict (SubDistrictName, DistrictId) VALUES(N'Cửa Nam', @DistrictId); 
INSERT INTO HE150277_HoangTienMinh_SubDistrict (SubDistrictName, DistrictId) VALUES(N'Đồng Xuân', @DistrictId); 
INSERT INTO HE150277_HoangTienMinh_SubDistrict (SubDistrictName, DistrictId) VALUES(N'Hàng Bạc', @DistrictId); 
INSERT INTO HE150277_HoangTienMinh_SubDistrict (SubDistrictName, DistrictId) VALUES(N'Hàng Bài', @DistrictId); 
INSERT INTO HE150277_HoangTienMinh_SubDistrict (SubDistrictName, DistrictId) VALUES(N'Hàng Bồ', @DistrictId); 
INSERT INTO HE150277_HoangTienMinh_SubDistrict (SubDistrictName, DistrictId) VALUES(N'Hàng Bông', @DistrictId); 
INSERT INTO HE150277_HoangTienMinh_SubDistrict (SubDistrictName, DistrictId) VALUES(N'Hàng Buồm', @DistrictId); 
INSERT INTO HE150277_HoangTienMinh_SubDistrict (SubDistrictName, DistrictId) VALUES(N'Hàng Đào', @DistrictId); 
INSERT INTO HE150277_HoangTienMinh_SubDistrict (SubDistrictName, DistrictId) VALUES(N'Hàng Gai', @DistrictId); 
INSERT INTO HE150277_HoangTienMinh_SubDistrict (SubDistrictName, DistrictId) VALUES(N'Hàng Mã', @DistrictId); 
INSERT INTO HE150277_HoangTienMinh_SubDistrict (SubDistrictName, DistrictId) VALUES(N'Hàng Trống', @DistrictId); 
INSERT INTO HE150277_HoangTienMinh_SubDistrict (SubDistrictName, DistrictId) VALUES(N'Lý Thái Tổ', @DistrictId); 
INSERT INTO HE150277_HoangTienMinh_SubDistrict (SubDistrictName, DistrictId) VALUES(N'Phan Chu Trinh', @DistrictId); 
INSERT INTO HE150277_HoangTienMinh_SubDistrict (SubDistrictName, DistrictId) VALUES(N'Phúc Tân', @DistrictId); 
INSERT INTO HE150277_HoangTienMinh_SubDistrict (SubDistrictName, DistrictId) VALUES(N'Trần Hưng Đạo', @DistrictId); 
INSERT INTO HE150277_HoangTienMinh_SubDistrict (SubDistrictName, DistrictId) VALUES(N'Tràng Tiền', @DistrictId);

SET @DistrictId = (SELECT DistrictId FROM HE150277_HoangTienMinh_District WHERE DistrictName = N'Quận Đống Đa');
INSERT INTO HE150277_HoangTienMinh_SubDistrict (SubDistrictName, DistrictId) VALUES(N'Văn Miếu', @DistrictId);
INSERT INTO HE150277_HoangTienMinh_SubDistrict (SubDistrictName, DistrictId) VALUES(N'Quốc Tử Giám', @DistrictId);
INSERT INTO HE150277_HoangTienMinh_SubDistrict (SubDistrictName, DistrictId) VALUES(N'Hàng Bột', @DistrictId);
INSERT INTO HE150277_HoangTienMinh_SubDistrict (SubDistrictName, DistrictId) VALUES(N'Nam Đồng', @DistrictId);
INSERT INTO HE150277_HoangTienMinh_SubDistrict (SubDistrictName, DistrictId) VALUES(N'Trung Liệt', @DistrictId);
INSERT INTO HE150277_HoangTienMinh_SubDistrict (SubDistrictName, DistrictId) VALUES(N'Khâm Thiên', @DistrictId);
INSERT INTO HE150277_HoangTienMinh_SubDistrict (SubDistrictName, DistrictId) VALUES(N'Phương Liên', @DistrictId);
INSERT INTO HE150277_HoangTienMinh_SubDistrict (SubDistrictName, DistrictId) VALUES(N'Phương Mai', @DistrictId);
INSERT INTO HE150277_HoangTienMinh_SubDistrict (SubDistrictName, DistrictId) VALUES(N'Khương Thượng', @DistrictId);
INSERT INTO HE150277_HoangTienMinh_SubDistrict (SubDistrictName, DistrictId) VALUES(N'Ngã Tư Sở', @DistrictId);
INSERT INTO HE150277_HoangTienMinh_SubDistrict (SubDistrictName, DistrictId) VALUES(N'Láng Thượng', @DistrictId);
INSERT INTO HE150277_HoangTienMinh_SubDistrict (SubDistrictName, DistrictId) VALUES(N'Cát Linh', @DistrictId);
INSERT INTO HE150277_HoangTienMinh_SubDistrict (SubDistrictName, DistrictId) VALUES(N'Văn Chương', @DistrictId);
INSERT INTO HE150277_HoangTienMinh_SubDistrict (SubDistrictName, DistrictId) VALUES(N'Ô Chợ Dừa', @DistrictId);
INSERT INTO HE150277_HoangTienMinh_SubDistrict (SubDistrictName, DistrictId) VALUES(N'Quang Trung', @DistrictId);
INSERT INTO HE150277_HoangTienMinh_SubDistrict (SubDistrictName, DistrictId) VALUES(N'Thổ Quan', @DistrictId);
INSERT INTO HE150277_HoangTienMinh_SubDistrict (SubDistrictName, DistrictId) VALUES(N'Trung Phụng', @DistrictId);
INSERT INTO HE150277_HoangTienMinh_SubDistrict (SubDistrictName, DistrictId) VALUES(N'Kim Liên', @DistrictId);
INSERT INTO HE150277_HoangTienMinh_SubDistrict (SubDistrictName, DistrictId) VALUES(N'Trung Tự', @DistrictId);
INSERT INTO HE150277_HoangTienMinh_SubDistrict (SubDistrictName, DistrictId) VALUES(N'Thịnh Quang', @DistrictId);
INSERT INTO HE150277_HoangTienMinh_SubDistrict (SubDistrictName, DistrictId) VALUES(N'Láng Hạ', @DistrictId);

SET @DistrictId = (SELECT DistrictId FROM HE150277_HoangTienMinh_District WHERE DistrictName = N'Quận Thanh Xuân');
INSERT INTO HE150277_HoangTienMinh_SubDistrict (SubDistrictName, DistrictId) VALUES(N'Hạ Đình', @DistrictId); 
INSERT INTO HE150277_HoangTienMinh_SubDistrict (SubDistrictName, DistrictId) VALUES(N'Kim Giang', @DistrictId); 
INSERT INTO HE150277_HoangTienMinh_SubDistrict (SubDistrictName, DistrictId) VALUES(N'Khương Đình', @DistrictId); 
INSERT INTO HE150277_HoangTienMinh_SubDistrict (SubDistrictName, DistrictId) VALUES(N'Khương Mai', @DistrictId); 
INSERT INTO HE150277_HoangTienMinh_SubDistrict (SubDistrictName, DistrictId) VALUES(N'Khương Trung', @DistrictId); 
INSERT INTO HE150277_HoangTienMinh_SubDistrict (SubDistrictName, DistrictId) VALUES(N'Nhân Chính', @DistrictId); 
INSERT INTO HE150277_HoangTienMinh_SubDistrict (SubDistrictName, DistrictId) VALUES(N'Phương Liệt', @DistrictId); 
INSERT INTO HE150277_HoangTienMinh_SubDistrict (SubDistrictName, DistrictId) VALUES(N'Thanh Xuân Bắc', @DistrictId); 
INSERT INTO HE150277_HoangTienMinh_SubDistrict (SubDistrictName, DistrictId) VALUES(N'Thanh Xuân Nam', @DistrictId); 
INSERT INTO HE150277_HoangTienMinh_SubDistrict (SubDistrictName, DistrictId) VALUES(N'Thanh Xuân Trung', @DistrictId); 
INSERT INTO HE150277_HoangTienMinh_SubDistrict (SubDistrictName, DistrictId) VALUES(N'Thượng Đình', @DistrictId);

SET @DistrictId = (SELECT DistrictId FROM HE150277_HoangTienMinh_District WHERE DistrictName = N'Quận Cầu Giấy');
INSERT INTO HE150277_HoangTienMinh_SubDistrict (SubDistrictName, DistrictId) VALUES(N'Nghĩa Đô', @DistrictId); 
INSERT INTO HE150277_HoangTienMinh_SubDistrict (SubDistrictName, DistrictId) VALUES(N'Quan Hoa', @DistrictId); 
INSERT INTO HE150277_HoangTienMinh_SubDistrict (SubDistrictName, DistrictId) VALUES(N'Dịch Vọng', @DistrictId); 
INSERT INTO HE150277_HoangTienMinh_SubDistrict (SubDistrictName, DistrictId) VALUES(N'Dịch Vọng Hậu', @DistrictId); 
INSERT INTO HE150277_HoangTienMinh_SubDistrict (SubDistrictName, DistrictId) VALUES(N'Trung Hòa', @DistrictId); 
INSERT INTO HE150277_HoangTienMinh_SubDistrict (SubDistrictName, DistrictId) VALUES(N'Nghĩa Tân', @DistrictId); 
INSERT INTO HE150277_HoangTienMinh_SubDistrict (SubDistrictName, DistrictId) VALUES(N'Mai Dịch', @DistrictId); 
INSERT INTO HE150277_HoangTienMinh_SubDistrict (SubDistrictName, DistrictId) VALUES(N'Yên Hòa', @DistrictId); 

