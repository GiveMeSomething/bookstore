use SE1501_PRJ301;

create table HE150277_HoangTienMinh_Users (
	UserId int identity(1,1) PRIMARY KEY,
	Username nvarchar(30),
	[Password] nvarchar(100),
	Email nvarchar(50),
	PhoneNum nvarchar(24),
	Salt varchar(2),
	[Role] varchar(10) NOT NULL DEFAULT 'USER',
);

create table HE150277_HoangTienMinh_Categories (
	CategoryId int identity(1,1) PRIMARY KEY,
	CategoryName nvarchar(15),
	[Description] ntext,
)

create table HE150277_HoangTienMinh_ShippingInfo (
	ShippingInfoId int identity(1,1) PRIMARY KEY,
	UserId int FOREIGN KEY REFERENCES HE150277_HoangTienMinh_Users(UserId),
	ThanhPho nvarchar(20),
	Quan nvarchar(20),
	Phuong nvarchar(20),
	DiaChi nvarchar(200),
	PhoneNum nvarchar(24),
)

create table HE150277_HoangTienMinh_Books (
	BookId int identity(1,1) PRIMARY KEY,
	CategoryId int FOREIGN KEY REFERENCES HE150277_HoangTienMinh_Categories(CategoryId),
	BookName nvarchar(50),
	Brand nvarchar(24),
	UnitPrice float,
	UnitsInStock int,
	Suppliers nvarchar(50),
)

create table HE150277_HoangTienMinh_Posts (	
	PostId int identity(1,1) PRIMARY KEY,
	UserId int FOREIGN KEY REFERENCES HE150277_HoangTienMinh_Users(UserId),
	BookId int FOREIGN KEY REFERENCES HE150277_HoangTienMinh_Books(BookId), 
	Title nvarchar(50),
	Upvote int,
	PostContent ntext,
)

create table HE150277_HoangTienMinh_Comments (
	CommentId int identity(1, 1) PRIMARY KEY,
	UserId int FOREIGN KEY REFERENCES HE150277_HoangTienMinh_Users(UserId),
	BookId int FOREIGN KEY REFERENCES HE150277_HoangTienMinh_Books(BookId), 
	CommentContent ntext
)

create table HE150277_HoangTienMinh_Orders (
	OrderId int identity(1,1) PRIMARY KEY,
	UserId int FOREIGN KEY REFERENCES HE150277_HoangTienMinh_Users(UserId),
	ShippingInfoId int FOREIGN KEY REFERENCES HE150277_HoangTienMinh_ShippingInfo(ShippingInfoId),
	OrderDate datetime,
)

create table HE150277_HoangTienMinh_OrderDetail (
	OrderId int FOREIGN KEY REFERENCES HE150277_HoangTienMinh_Orders(OrderId),
	BookId int FOREIGN KEY REFERENCES HE150277_HoangTienMinh_Books(BookId),
	UserId int FOREIGN KEY REFERENCES HE150277_HoangTienMinh_Users(UserId),
	UnitPrice float,
	Quantity int,
	Discount int,
	PRIMARY KEY (OrderId, BookId),
)

create table HE150277_HoangTienMinh_City (
	CityId int identity(1,1) PRIMARY KEY,
	CityName nvarchar(30)
)

create table HE150277_HoangTienMinh_District (
	DistrictId int identity(1,1) PRIMARY KEY,
	CityId int FOREIGN KEY REFERENCES HE150277_HoangTienMinh_City(CityId),
	DistrictName nvarchar(30)
)

create table HE150277_HoangTienMinh_SubDistrict (
	SubDistrictId int identity(1,1) PRIMARY KEY,
	DistrictId int FOREIGN KEY REFERENCES HE150277_HoangTienMinh_District(DistrictId),
	SubDistrictName nvarchar(30)
)