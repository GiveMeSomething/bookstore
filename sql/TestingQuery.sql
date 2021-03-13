SELECT (DiaChi + ' ' + Phuong + ' ' + Quan + ' ' + ThanhPho) AS [ShippingAddr], Receiver, PhoneNum 
FROM HE150277_HoangTienMinh_ShippingInfo
WHERE UserId = '';

INSERT INTO HE150277_HoangTienMinh_ShippingInfo (UserId, ThanhPho, Quan, Phuong, DiaChi, PhoneNum)
VALUES (
	(SELECT UserId FROM HE150277_HoangTienMinh_Users WHERE Username = 'admin'),
	N'Hà Nội', N'Thanh Xuân', N'Nhân Chính', N'50, nghách 144/4, Nhân Chính', '0369568801'
);

SELECT CategoryId, CategoryName, [Description] FROM HE150277_HoangTienMinh_Categories;

SELECT BookId, BookName, Brand, UnitPrice, UnitsInStock, Suppliers FROM HE150277_HoangTienMinh_Books
WHERE BookName LIKE '%The%' OR Brand LIKE '%The%' OR Suppliers LIKE '%The%';