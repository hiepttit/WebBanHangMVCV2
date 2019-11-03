-- use master drop database WebBanHang
Create database WebBanHang
go
use WebBanHang
go
create table Roles
(
	ID int identity primary key,
	RolesName nvarchar(1000) not null
)
go
create table Account
(
	id int identity primary key,
	UserName varchar(100) unique not null,
	Pwd varchar(1000) not null,
	RoleID int references dbo.Roles(ID),
	CustomerID int default null -- if CustomerID != null, this account is customer's account
)
go
create table Customer
(
	ID int identity primary key,
	Name nvarchar(100) not null,
	Addresss nvarchar(1000),
	DateOfBirth datetime,
	Tel varchar(100),
	Email varchar(500)
)
go
create table Category
(
	ID int identity primary key,
	CategoryName nvarchar(1000) not null,
)
go
create table Products
(
	ID int identity primary key,
	CategoryID int references dbo.Category(ID),
	ProductName nvarchar(1000) not null,
	Prices float,
	Details nvarchar(max),
	Sales int,
	CreateAt DateTime,
	UpDateAt DateTime,
)
go
create table ProductsImg
(
	ID int identity primary key,
	ProductID int references dbo.Products(ID),
	ImgLink varchar(1000),
	ImgName nvarchar(1000)
)
create table Cart
(
	ID int identity primary key,
	CustomerID int references dbo.Customer(ID)
)
go
create table CartDetail
(
	ID int identity primary key,
	CartID int references dbo.Cart(ID),
	ProductsID int references dbo.Products(ID),
	TheCount int,
	Price float
)
go
create table Bill
(
	ID int identity primary key,
	CartID int references dbo.Cart(ID),
	TotalPrices float,
	DiscountPercent float,
	PayPrice float,
	CreateAt datetime,
	DeliveryDate datetime, 
)
go

--------------------------------------- Insert --------------------------------------
insert into Category values
(N'Váy đầm công sở'),
(N'Váy đầm suông'),
(N'Váy đầm maxi'),
(N'Váy đầm xòe'),
(N'Chân váy'),
(N'Quần dài'),
(N'Áo sơ mi'),
(N'Áo thun'),  ----- Từ đây chưa tìm dữ liệu
(N'Áo vest'),
(N'Áo khoác'),
(N'Áo dài')
go

--------------
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(1,N'ĐẦM HỌA TIẾT NƠ CỔ',495000,N'Đầm họa tiết nơ cổ
- Màu Sắc Sản Phẩm: Vàng
- Giá Bán Sản Phẩm: 495.000đ
- Số Đo Vòng Ngực: 84Cm
- Số Đo Vòng Eo: 64Cm
- Số Đo Dài Tay : 28Cm
- Số Đo Cửa Tay : 26Cm
- Chiều Dài Vai: 35Cm
- Chiều Dài Đầm: 87Cm
- Chất Liệu: Lainen Xô
* Chi Tiết Sản Phẩm:
- Có 2 Lớp
- Có Túi
- Size: XS - S - M - L - XL.
* Số Đo Sản Phẩm Size XS*                                            
','0','2016-10-26 03:00:16', '2016-10-24 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (1,'ms99081020192341432831.jpg')
insert into ProductsImg (ProductID,ImgLink) values (1,'ms99-1081020192341432831.jpg')
insert into ProductsImg (ProductID,ImgLink) values (1,'ms99-sau081020192341553455.jpg')
go
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(1,N'ĐẦM NHÚN BÈO THÊU LÁ',495000,N'Đầm nhún bèo thêu lá
- Màu Sắc Sản Phẩm: Trắng
- Giá Bán Sản Phẩm: 495.000đ
- Số Đo Vòng Ngực: 83Cm
- Số Đo Vòng Eo: 66Cm
- Chiều Dài Vai: 32Cm
- Chiều Dài Đầm: 91Cm
- Chất Liệu: Đũi Mịn
* Chi Tiết Sản Phẩm:
- Có 2 Lớp
- Không Có Túi
- Size: XS - S - M - L - XL.
* Số Đo Sản Phẩm Size XS*                                            
','1','2017-10-26 03:00:16', '2017-10-24 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (2,'ms96081020192341432831.jpg')
insert into ProductsImg (ProductID,ImgLink) values (2,'ms96-2081020192341432831.jpg')
insert into ProductsImg (ProductID,ImgLink) values (2,'ms96-4081020192341432831.jpg')
insert into ProductsImg (ProductID,ImgLink) values (2,'ms96-3081020192341432831.jpg')
go
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(1,N'ĐẦM CARO TAY PHỒNG',495000,N'Đầm caro tay phồng
- Giá Bán Sản Phẩm: 495.000đ
- Màu Sắc Sản Phẩm: Đen
- Số Đo Vòng Ngực: 82Cm
- Số Đo Vòng Eo: 70Cm
- Chiều Dài Đầm: 87Cm
- Số Đo Hông : 78Cm
- Số Đo Dài Tay : 49Cm
- Số Đo Cửa Tay : 22Cm
- Số Đo Ngang Vai : 34Cm
- Chất Liệu Vải: Bố Cotton 
* Chi Tiết Sản Phẩm*
- Có 1 Lớp
- Không Có Túi
( Số Đo Sản Phẩm Size XS)                                            
','1','2017-12-26 03:00:16', '2017-12-27 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (3,'ms95-2071020192340413961.jpg')
insert into ProductsImg (ProductID,ImgLink) values (3,'ms95-1071020192340413961.jpg')
insert into ProductsImg (ProductID,ImgLink) values (3,'ms95-sau071020192340413961.jpg')
insert into ProductsImg (ProductID,ImgLink) values (3,'ms95071020192340413805.jpg')
go
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(1,N'ĐẦM SỌC LAI BÈO',495000,N'Đầm sọc lai bèo
- Giá Bán Sản Phẩm: 495.000đ
- Màu Sắc Sản Phẩm: Đỏ
- Số Đo Vòng Ngực: 86Cm
- Số Đo Vòng Eo: 67Cm
- Số Đo Vòng Hông: 83Cm
- Số Đo Ra Vai: 35Cm
- Số Đo Cửa Tay: Bo Chun
- Chiều Dài Đầm: 93Cm
- Chất Liệu Vải: Lụa
* Chi Tiết Sản Phẩm*
- Có 1 Lớp
- Không Có Túi
( Số Đo Sản Phẩm Size XS)                                            
','0','2018-01-26 03:00:16', '2018-02-24 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (4,'ms89071020192340413805.jpg')
insert into ProductsImg (ProductID,ImgLink) values (4,'ms89-sau071020192340413805.jpg')
insert into ProductsImg (ProductID,ImgLink) values (4,'ms89-1071020192340413805.jpg')
go
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(1,N'ĐẦM HỌA TIẾT IN BƯỚM',495000,N'Đầm họa tiết in bướm
- Giá Bán Sản Phẩm: 495.000đ
- Màu Sắc Sản Phẩm: Xanh
- Số Đo Vòng Ngực: 82Cm
- Số Đo Vòng Eo: 63Cm
- Chiều Dài Đầm: 93Cm
- Số Đo Hạ Cổ: 17Cm
- Số Đo Dài Tay: 20Cm
- Số Đo Cửa Tay : 20Cm
- Số Đo Ngang Vai : 32Cm
- Chất Liệu Vải: Lụa Kate
* Chi Tiết Sản Phẩm*
- Có 2 Lớp
- Có Túi
( Số Đo Sản Phẩm Size XS)                                            
','0','2016-10-28 03:00:16', '2016-10-29 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (5,'ms88-1071020192340413805.jpg')
insert into ProductsImg (ProductID,ImgLink) values (5,'ms88-sau071020192340413805.jpg')
insert into ProductsImg (ProductID,ImgLink) values (5,'ms88071020192340413805.jpg')
go
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(1,N'ĐẦM ĐẮP CHÉO CỔ TIM',495000,N'Đầm đắp chéo cổ tim
- Giá Bán Sản Phẩm: 495.000đ
- Màu Sắc Sản Phẩm: Cam
- Số Đo Vòng Ngực: 84Cm
- Số Đo Vòng Eo: 64Cm
- Chiều Dài Đầm: 93Cm
- Số Đo Hạ Cổ: 16Cm
- Số Đo Ra Cổ : 21Cm
- Số Đo Dài Tay: 30Cm
- Số Đo Cửa Tay : 26Cm
- Chất Liệu Vải: Đũi Mịn
* Chi Tiết Sản Phẩm*
- Có 2 Lớp
- Có Túi
( Số Đo Sản Phẩm Size XS)                                            
','1','2017-09-26 03:00:16', '2017-09-28 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (6,'ms86-1071020192340413648.jpg')
insert into ProductsImg (ProductID,ImgLink) values (6,'ms86-sau071020192340413805.jpg')
insert into ProductsImg (ProductID,ImgLink) values (6,'ms86071020192340413648.jpg')
go
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(1,N'ĐẦM DÂY TẦNG THÊU HOA',495000,N'Đầm dây tầng thêu hoa
- Màu Sắc Sản Phẩm: Trắng
- Giá Bán Sản Phẩm: 495.000đ
- Số Đo Vòng Ngực: 83Cm
- Số Đo Vòng Eo: 70Cm
- Số Đo Dài Dây : Có Tăng Đơ
- Chiều Dài Đầm: 89Cm
- Chất Liệu: Xô
* Chi Tiết Sản Phẩm:
- Có 2 Lớp
- Có Túi
- Size: XS - S - M - L - XL.
* Số Đo Sản Phẩm Size XS*                                            
','0','2018-10-26 03:00:16', '2018-10-24 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (7,'ms84-2081020192341432675.jpg')
insert into ProductsImg (ProductID,ImgLink) values (7,'ms84-sau081020192341432675.jpg')
go
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(1,N'ĐẦM 2 DÂY NHÚN BÈO',495000,N'Đầm 2 dây nhún bèo
- Giá Bán Sản Phẩm: 495.000đ
- Màu Sắc Sản Phẩm: Hồng
- Số Đo Vòng Ngực: 83Cm
- Số Đo Vòng Eo: 63Cm
- Số Đo Hạ Cổ : 12Cm
- Chiều Dài Dây: 28Cm
- Chiều Dài Đầm: 91Cm
- Chất Liệu Vải: Xô Gãy
* Chi Tiết Sản Phẩm*
- Có 2 Lớp
- Có Túi
- Số Size: XS - S - M - L - XL.
( Số Đo Sản Phẩm Size XS)                                            
','1','2018-03-26 03:00:16', '2018-04-24 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (8,'ms83-2081020192341432675.jpg')
insert into ProductsImg (ProductID,ImgLink) values (8,'ms83081020192341432519.jpg')
insert into ProductsImg (ProductID,ImgLink) values (8,'ms83-sau081020192341432675.jpg')
go
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(1,N'ĐẦM HOA NÚT NGỌC TRAI',495000,N'Đầm hoa nút ngọc trai
- Giá Bán Sản Phẩm: 495.000đ
- Màu Sắc Sản Phẩm: Vàng
- Số Đo Vòng Ngực: 84Cm
- Số Đo Vòng Eo: 64Cm
- Chiều Dài Đầm: 95Cm
- Số Đo Hạ Cổ: 17Cm
- Số Đo Dài Tay: 19Cm
- Số Đo Cửa Tay : 34Cm
- Số Đo Ra Vai : 34Cm
- Chất Liệu Vải: Voan Cát
* Chi Tiết Sản Phẩm*
- Có 2 Lớp
- Không Có Túi
( Số Đo Sản Phẩm Size S)                                            
','1','2018-09-12 03:00:16', '2018-10-11 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (9,'ms82-1071020192340413648.jpg')
insert into ProductsImg (ProductID,ImgLink) values (9,'ms82071020192340413648.jpg')
insert into ProductsImg (ProductID,ImgLink) values (9,'ms82-sau071020192340413648.jpg')
insert into ProductsImg (ProductID,ImgLink) values (9,'ms82-1071020192340413648.jpg')
go
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(1,N'ĐẦM DÂY PHỐI MÀU',495000,N'Đầm dây phối màu
- Giá Bán Sản Phẩm: 495.000đ
- Màu Sắc Sản Phẩm: Xanh
- Số Đo Vòng Ngực: 82Cm
- Số Đo Vòng Eo: 66Cm
- Số Đo Hạ Cổ: 17Cm
- Chiều Dài Dây: 38Cm
- Chiều Dài Đầm: 95Cm
- Chất Liệu Vải: Lainen Xô
* Chi Tiết Sản Phẩm*
- Có 2 Lớp
- Không Có Túi
- Số Size: XS - S - M - L - XL.
( Số Đo Sản Phẩm Size S)                                            
','1','2016-10-26 03:00:16', '2016-10-24 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (10,'ms76-1081020192341346576.jpg')
insert into ProductsImg (ProductID,ImgLink) values (10,'ms76081020192341346420.jpg')
insert into ProductsImg (ProductID,ImgLink) values (10,'ms76-2081020192341346576.jpg')
insert into ProductsImg (ProductID,ImgLink) values (10,'ms76-3081020192341346576.jpg')
insert into ProductsImg (ProductID,ImgLink) values (10,'ms76-sau081020192341346576.jpg')
go
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(1,N'ĐẦM HỌA TIẾT BẢN EO',495000,N'Đầm họa tiết bản eo
- Giá Bán Sản Phẩm: 495.000đ
- Màu Sắc Sản Phẩm: Xanh
- Số Đo Vòng Ngực: 83Cm
- Số Đo Vòng Eo: 63Cm
- Số Đo Dài Tay: 14Cm
- Số Đo Vai: 32Cm
- Số Đo Cửa Tay: 30Cm
- Chiều Dài Đầm: 89Cm
- Chất Liệu Vải: Voan
* Chi Tiết Sản Phẩm*
- Có 2 Lớp
- Có Túi
( Số Đo Sản Phẩm Size XS)                                            
','0','2016-10-03 03:00:16', '2016-10-05 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (11,'ms75071020192340293492.jpg')
insert into ProductsImg (ProductID,ImgLink) values (11,'ms75-1071020192340293492.jpg')
insert into ProductsImg (ProductID,ImgLink) values (11,'ms75-sau071020192340293492.jpg')
insert into ProductsImg (ProductID,ImgLink) values (11,'ms75071020192340293492.jpg')
go
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(1,N'ĐẦM HOA PHỐI TAY VOAN',495000,N'Đầm hoa phối tay voan
- Màu Sắc Sản Phẩm: Hồng
- Giá Bán Sản Phẩm: 495.000đ
- Số Đo Vòng Ngực: 88Cm
- Số Đo Vòng Eo: 66Cm
- Số Đo Cửa Tay: Có Bo Chun
- Số Đo Hạ Cổ: 14Cm
- Chiều Dài Vai: 34Cm
- Chiều Dài Tay: 34Cm
- Chiều Dài Đầm: 98Cm
- Chất Liệu: Voan
* Chi Tiết Sản Phẩm:
- Có 2 Lớp
- Size: XS - S - M - L - XL.
* Số Đo Sản Phẩm Size S*                                            
','0','2016-11-02 03:00:16', '2016-11-09 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (12,'ms71-1081020192341346420.jpg')
insert into ProductsImg (ProductID,ImgLink) values (12,'ms71081020192341346420.jpg')
insert into ProductsImg (ProductID,ImgLink) values (12,'ms71-2081020192341346420.jpg')
insert into ProductsImg (ProductID,ImgLink) values (12,'ms71-sau081020192341346420.jpg')
go
-----
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(2,N'ĐẦM SUÔNG THÊU LAVENDER',495000,N'Đầm suông thêu Lavender
- Giá Bán Sản Phẩm: 495.000đ
- Màu Sắc Sản Phẩm: Trắng
- Số Đo Vòng Ngực: 84Cm
- Số Đo Vòng Eo: 72Cm
- Chiều Dài Đầm: 88Cm
- Số Đo Hạ Cổ: 12Cm
- Số Đo Dài Tay: 23Cm
- Số Đo Cửa Tay : 24Cm
- Số Đo Ngang Vai : 30Cm
- Chất Liệu Vải: Cotton Thái 
* Chi Tiết Sản Phẩm*
- Có 2 Lớp
- Có Túi
( Số Đo Sản Phẩm Size XS)                                            
','1','2016-08-26 03:00:16', '2016-07-24 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (13,'ms35071020192339355991.jpg')
insert into ProductsImg (ProductID,ImgLink) values (13,'ms35-1071020192339356147.jpg')
insert into ProductsImg (ProductID,ImgLink) values (13,'ms35-sau071020192339356147.jpg')
insert into ProductsImg (ProductID,ImgLink) values (13,'ms35071020192339355991.jpg')
go
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(2,N'ĐẦM SUÔNG TAY DƠI',495000,N'Đầm suông tay dơi

- Số Đo Vòng Ngực: 104 Cm
- Số Đo Vòng Eo: 84 Cm
- Chiều Dài Tay: 21 Cm
- Chiều Dài Đầm: 92 Cm
- Số Đo Cửa Tay: 34 Cm
- Màu sắc sản phẩm: Trắng
- Chi Tiết Sản Phẩm:
+ Đầm Có 2 Lớp
+ Có Túi
- Chất Liệu Vải: Voan Cát
- Số Size: XS - S - M - L - XL
( Số Đo Đầm Size XS)                                            
','1','2018-10-26 03:00:16', '2018-10-24 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (14,'ms76050920191344597539.jpg')
insert into ProductsImg (ProductID,ImgLink) values (14,'ms76-1050920191344597539.jpg')
insert into ProductsImg (ProductID,ImgLink) values (14,'ms76-sau050920191344597695.jpg')
insert into ProductsImg (ProductID,ImgLink) values (14,'ms76050920191344597539.jpg')
go
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(2,N'ĐẦM SUÔNG PHỐI ĐĂNG TEN',495000,N'Đầm suông phối đăng ten

- Số Đo Vòng Ngực: 85 Cm
- Số Đo Vòng Eo: 66 Cm
- Số Đo Ngang Vai: 36 Cm
- Số Đo Hạ Cổ: 15 Cm
- Chiều Dài Tay: 19 Cm
- Chiều Dài Đầm: 88 Cm
- Số Đo Cửa Tay: 30 Cm
- Màu sắc sản phẩm: Đỏ
- Chi Tiết Sản Phẩm:
+ Đầm Có 1 Lớp
+ Có Túi
- Chất Liệu Vải: Coton Chéo
- Số Size: XS - S - M - L - XL
( Số Đo Đầm Size S)                                            
','0','2017-10-26 03:00:16', '2017-10-24 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (15,'ms53-1050920191344597382.jpg')
insert into ProductsImg (ProductID,ImgLink) values (15,'ms53050920191344502709.jpg')
insert into ProductsImg (ProductID,ImgLink) values (15,'ms53-sau050920191344597382.jpg')
insert into ProductsImg (ProductID,ImgLink) values (15,'ms53-1050920191344597382.jpg')
go
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(2,N'ĐẦM SUÔNG PHỐI LƯỚI',495000,N'Đầm suông phối lưới

- Số Đo Vòng Eo: 68Cm- Số Đo Vòng Ngực: 86Cm
- Chiều Dài Tay: 39Cm
- Chiều Dài Đầm: 91Cm
- Số Đo Ngang Vai: 32Cm
- Số Đo Cửa Tay: 25Cm
- Số Đo Hạ Cổ: 18Cm
- Chi Tiết Sản Phẩm:
+ Đầm Có 1 Lớp
+ Có Túi
- Chất Liệu Vải: Tuyết Mưa Phối Lưới
( Số Đo Đầm Size S)
* Mẫu Thiên An: 1m67*                                           
','1','2018-12-26 03:00:16', '2018-12-28 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (16,'ms26080720191634482934.jpg')
insert into ProductsImg (ProductID,ImgLink) values (16,'ms26-1080720191634482934.jpg')
insert into ProductsImg (ProductID,ImgLink) values (16,'ms26-sau080720191634482934.jpg')
go
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(2,N'ĐẦM SUÔNG CARO',495000,N'Đầm suông caro','0','2018-12-26 03:00:16', '2018-12-28 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (17,'3908-(1)040320190858320916.jpg')
insert into ProductsImg (ProductID,ImgLink) values (17,'3908-(2)040320190858320916.jpg')
insert into ProductsImg (ProductID,ImgLink) values (17,'3908-(3)040320190858320916.jpg')
go
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(2,N'ĐẦM SUÔNG PHỐI REN',198000,N'Đầm suông phối ren

- Chất Liệu Vải: Cotton Lụa Phối Ren
- Màu Sắc: Đen
- Chi Tiết Sản Phẩm:
+ Độ Dài Tay 21cm
+ Có 2 Túi Sườn
- Size: XS - S - M - L - XL
- Chiều Dài Sản Phẩm Size S : 93cm
- Tăng "1Cm" Mỗi Size.                                            
','1','2018-10-26 03:00:16', '2018-10-24 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (18,'3906-(1)040320190858320760.jpg')
insert into ProductsImg (ProductID,ImgLink) values (18,'3906-(2)040320190858320916.jpg')
insert into ProductsImg (ProductID,ImgLink) values (18,'3906-(3)040320190858320916.jpg')
go
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(2,N'ĐẦM SUÔNG SƠ MI',495000,N'Đầm suông sơ mi

- Chất Liệu Vải: Cotton Lụa
- Màu Sắc: Đen
- Chi Tiết Sản Phẩm:
+ Độ Dài Tay 41cm
- Size: XS - S - M - L - XL
- Chiều Dài Sản Phẩm Size S : 85cm
- Tăng "1Cm" Mỗi Size.                                            
','1','2018-10-26 03:00:16', '2018-10-24 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (19,'3903-(1)040320190858320760.jpg')
insert into ProductsImg (ProductID,ImgLink) values (19,'3903-(2)040320190858320760.jpg')
insert into ProductsImg (ProductID,ImgLink) values (19,'3903-(3)040320190858320760.jpg')
insert into ProductsImg (ProductID,ImgLink) values (19,'3903-(4)040320190858320760.jpg')
go
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(2,N'ĐẦM SUÔNG PHỐI BÈO',495000,N'Đầm suông phối bèo

- Chất liệu vải: Cát Hàn
- Màu sắc: Đỏ
- Chi Tiết Sản Phẩm:
+ Dài tay 15cm
- Size: XS - S - M - L - XL
- Chiều dài sản phẩm size S : 87Cm
- Tăng "1Cm" mỗi size.                                            
','0','2018-10-26 03:00:16', '2018-10-24 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (20,'ms21040120190823141545.jpg')
insert into ProductsImg (ProductID,ImgLink) values (20,'ms21-1040120190823141545.jpg')
insert into ProductsImg (ProductID,ImgLink) values (20,'ms21-2040120190823310141.jpg')
go
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(2,N'ĐẦM SUÔNG CỔ 2 TẦNG',495000,N'Đầm suông cổ 2 tầng

- Chất liệu vải: VOAN
- Màu sắc: ĐEN
- Size: XS - S - M - L - Xl
- Chiều dài sản phẩm size S : 92Cm
- Tăng "1Cm" mỗi size.                                            
','0','2018-10-26 03:00:16', '2018-10-24 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (21,'dam-suong-co-2-tang-gia-re031120180859264778.jpg')
insert into ProductsImg (ProductID,ImgLink) values (21,'dam-suong-co-2-tang-mau-den031120180859264778.jpg')
insert into ProductsImg (ProductID,ImgLink) values (21,'dam-suong-co-2-tang-dep-gia-re031120180859264778.jpg')
go
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(2,N'ĐẦM SUÔNG 3 TẦNG',450000,N'Đầm suông 3 tầng

- Chất liệu vải: Tằm Ý
- Màu sắc: Đen
- Size: XS - S - M - L - Xl
- Chiều dài sản phẩm size S : 90Cm
- Tăng "1Cm" mỗi size.                                            
','1','2018-10-26 03:00:16', '2018-10-24 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (22,'dam-suong-3-tang-gia-re011120181354561046.jpg')
insert into ProductsImg (ProductID,ImgLink) values (22,'dam-suong-3-tang-mau-den011120181354561046.jpg')
insert into ProductsImg (ProductID,ImgLink) values (22,'dam-suong-3-tang-dep-gia-re011120181354561046.jpg')
go
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(2,N'ĐẦM SUÔNG CỔ NGỌC TRAI',480000,N'Đầm suông cổ ngọc trai

- Chất liệu vải: Tằm Ý 
- Màu sắc: Xanh
- Size: XS - S - M - L - Xl
- Chiều dài sản phẩm size S : 91Cm
- Tăng "1Cm" mỗi size.                                            
','0','2018-10-26 03:00:16', '2018-10-24 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (23,'dam-suong-co-ngoc-trai-gia-re031120180822423856.jpg')
insert into ProductsImg (ProductID,ImgLink) values (23,'dam-suong-co-ngoc-trai-dep-gia-re031120180822423856.jpg')
insert into ProductsImg (ProductID,ImgLink) values (23,'dam-suong-co-ngoc-trai-de-thuong031120180822423856.jpg')
go
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(2,N'ĐẦM SUÔNG HẠ EO',450000,N'Đầm suông hạ eo

- Chất liệu vải: Cotton Lụa
- Màu sắc: Cam 
- Size: XS - S - M - L - Xl
- Chiều dài sản phẩm size XS :87 Cm
- Tăng "1Cm" mỗi size.                                            
','1','2018-10-26 03:00:16', '2018-10-24 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (24,'dam-suong-ha-eo-mau-cam011120181028135009.jpg')
insert into ProductsImg (ProductID,ImgLink) values (24,'dam-suong-ha-eo-de-thuong011120181028135009.jpg')
insert into ProductsImg (ProductID,ImgLink) values (24,'dam-suong-ha-eo-gia-re011120181028135009.jpg')
go
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(2,N'ĐẦM SUÔNG CÁCH ĐIỆU TÚI',450000,N'Đầm suông cách điệu túi

- Chất liệu vải: Bố Cotton
- Màu sắc: Hồng
- Size: XS - S - M - L - Xl
- Chiều dài sản phẩm size XS : 88Cm
- Tăng "1Cm" mỗi size.                                            
','0','2018-10-26 03:00:16', '2018-10-24 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (25,'dam-suong-cach-dieu-tui-mau-tim011120181012509995.jpg')
insert into ProductsImg (ProductID,ImgLink) values (25,'dam-suong-cach-dieu-tui-gia-re011120181012509995.jpg')
insert into ProductsImg (ProductID,ImgLink) values (25,'dam-suong-cach-dieu-tui-de-thuong011120181012509995.jpg')
go
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(2,N'ĐẦM SUÔNG PHỐI REN LƯỚI',480000,N'Đầm suông phối ren lưới

- Chất liệu vải: Bố Cotton
- Màu sắc; Đen
- Size: XS - S - M - L - Xl
- Chiều dài sản phẩm size XS : 87 Cm
- Tăng "1Cm" mỗi size.                                            
','1','2018-10-26 03:00:16', '2018-10-24 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (26,'dam-suong-phoi-ren-luoi-mau-den311020181103064935.jpg')
insert into ProductsImg (ProductID,ImgLink) values (26,'dam-suong-phoi-ren-luoi-gia-re311020181103064935.jpg')
insert into ProductsImg (ProductID,ImgLink) values (26,'dam-suong-phoi-ren-luoi-de-thuong311020181103064935.jpg')
go
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(2,N'ĐẦM SUÔNG PHỐI ĐAI',480000,N'Đầm suông phối đai

- Chất liệu vải: Lụa Tuyết
- Màu sắc: Kem
- Size: XS - S - M - L - XL.
- Chiều dài sản phẩm size XS : 87 Cm
- Tăng "1Cm" mỗi size.                                            
','1','2018-12-26 03:00:16', '2018-12-28 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (27,'dam-suong-phoi-dai-gia-re311020181647346657.jpg')
insert into ProductsImg (ProductID,ImgLink) values (27,'dam-suong-phoi-dai-dep-gia-re311020181647346657.jpg')
insert into ProductsImg (ProductID,ImgLink) values (27,'dam-suong-phoi-dai-de-thuong311020181647346657.jpg')
go
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(2,N'ĐẦM FORM SUÔNG DẬP LY',480000,N'Đầm form suông dập ly

- Chất liệu vải: Lụa Thái
- Màu sắc sản phẩm: Xanh
- Số size XS - S - M - L - XL
- Chiều dài size S: 90cm
*Tăng 1cm mỗi size.                                            
','0','2018-10-26 03:00:16', '2018-10-24 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (28,'dam-form-suong-dap-ly-gia-re301020181517225133.jpg')
insert into ProductsImg (ProductID,ImgLink) values (28,'dam-form-suong-dap-ly-dep-gia-re301020181517225133.jpg')
insert into ProductsImg (ProductID,ImgLink) values (28,'dam-form-suong-dap-ly-de-thuong301020181517225133.jpg')
go
------------
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(3,N'ĐẦM MAXI KẾT HOA',318000,N'Đầm maxi kết hoa
- Số Đo Vòng Ngực: 86Cm
- Số Đo Vòng Eo: 67Cm
- Số Đo Hạ Cổ V: 16Cm
- Chiều Dài Đầm: 123Cm
- Màu sắc sản phẩm:  Cam, Xanh
- Chi Tiết Sản Phẩm:
+ Đầm Có 2 Lớp
+ Không Có Túi
- Chất Liệu Vải: Voan Gân
- Số Size: XS - S - M - L - XL
( Số Đo Đầm Size S)                                            
','0','2018-10-26 03:00:16', '2018-10-24 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (29,'ms38-hong-dau020820192006185453.jpg')
insert into ProductsImg (ProductID,ImgLink) values (29,'ms38-xanh-dau020820192006185433.jpg')
insert into ProductsImg (ProductID,ImgLink) values (29,'ms38-hong020820192006185463.jpg')
insert into ProductsImg (ProductID,ImgLink) values (29,'ms38-ngang020820192006185413.jpg')
insert into ProductsImg (ProductID,ImgLink) values (29,'ms38-xanh-1020820192006185403.jpg')
insert into ProductsImg (ProductID,ImgLink) values (29,'ms38-xanh020820192006185443.jpg')
insert into ProductsImg (ProductID,ImgLink) values (29,'ms38-sau020820192006185393.jpg')
go
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(3,N'ĐẦM MAXI BẸT VAI',192000,N'Đầm Maxi bẹt vai
- Chất liệu vải: Lụa
- Màu sắc: Kem
- Size: XS - S - M - L - Xl
- Chiều dài sản phẩm size XS : 104 Cm
- Tăng "1Cm" mỗi size.                                            
','0','2018-10-26 03:00:16', '2018-10-24 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (30,'dam-maxi-bet-vai-gia-re011120181113281166.jpg')
insert into ProductsImg (ProductID,ImgLink) values (30,'dam-maxi-bet-vai-de-thuong011120181113281166.jpg')
insert into ProductsImg (ProductID,ImgLink) values (30,'dam-maxi-bet-vai-dep-gia-re011120181113281166.jpg')
go
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(3,N'ĐẦM MAXI PHỐI DÂY',180000,N'Đầm maxi phối dây
- Chất liệu vải: Chiffon
- Màu sắc sản phẩm: Màu Xanh
- Số size XS - S - M - L - XL
- Chiều dài size XS: 101cm
*Tăng 1cm mỗi size.                                            
','0','2018-10-26 03:00:16', '2018-10-24 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (31,'dam-maxi-phoi-day-gia-re061120181657517728.jpg')
insert into ProductsImg (ProductID,ImgLink) values (31,'dam-maxi-phoi-day-mau-xanh061120181657517728.jpg')
insert into ProductsImg (ProductID,ImgLink) values (31,'dam-maxi-phoi-day-de-thuong061120181657517572.jpg')
go
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(3,N'ĐẦM THÊU HOA HỒNG',192000,N'Đầm thêu hoa hồng
- Chất liệu vải: Cotton Lạnh
- Màu sắc sản phẩm: Màu Đen
- Số size S - M - L - XL
- Chiều dài size S: 87Cm
*Tăng 1cm mỗi size.                                            
','0','2018-10-26 03:00:16', '2018-10-24 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (32,'9716-1021120171124181112.jpg')
insert into ProductsImg (ProductID,ImgLink) values (32,'9716-2021120171124300800.jpg')
insert into ProductsImg (ProductID,ImgLink) values (32,'9716-3021120171124500800.jpg')
go
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(4,N'ĐẦM HOA NÚT NGỌC TRAI',371250,N'Đầm hoa nút ngọc trai
- Giá Bán Sản Phẩm: 495.000đ
- Màu Sắc Sản Phẩm: Vàng
- Số Đo Vòng Ngực: 84Cm
- Số Đo Vòng Eo: 64Cm
- Chiều Dài Đầm: 95Cm
- Số Đo Hạ Cổ: 17Cm
- Số Đo Dài Tay: 19Cm
- Số Đo Cửa Tay : 34Cm
- Số Đo Ra Vai : 34Cm
- Chất Liệu Vải: Voan Cát
* Chi Tiết Sản Phẩm*
- Có 2 Lớp
- Không Có Túi
( Số Đo Sản Phẩm Size S)                                            
','1','2018-10-26 03:00:16', '2018-10-24 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (33,'ms82-1071020192340413648.jpg')
insert into ProductsImg (ProductID,ImgLink) values (33,'ms82071020192340413648.jpg')
insert into ProductsImg (ProductID,ImgLink) values (33,'ms82-sau071020192340413648.jpg')
insert into ProductsImg (ProductID,ImgLink) values (33,'ms82-1071020192340413648.jpg')
go
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(4,N'ĐẦM HOA NÚT NGỌC TRAI',371250,N'Đầm hoa nút ngọc trai
- Giá Bán Sản Phẩm: 495.000đ
- Màu Sắc Sản Phẩm: Vàng
- Số Đo Vòng Ngực: 84Cm
- Số Đo Vòng Eo: 64Cm
- Chiều Dài Đầm: 95Cm
- Số Đo Hạ Cổ: 17Cm
- Số Đo Dài Tay: 19Cm
- Số Đo Cửa Tay : 34Cm
- Số Đo Ra Vai : 34Cm
- Chất Liệu Vải: Voan Cát
* Chi Tiết Sản Phẩm*
- Có 2 Lớp
- Không Có Túi
( Số Đo Sản Phẩm Size S)                                            
','1','2018-10-26 03:00:16', '2018-10-24 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (34,'ms82-1071020192340413648.jpg')
insert into ProductsImg (ProductID,ImgLink) values (34,'ms82071020192340413648.jpg')
insert into ProductsImg (ProductID,ImgLink) values (34,'ms82-sau071020192340413648.jpg')
insert into ProductsImg (ProductID,ImgLink) values (34,'ms82-1071020192340413648.jpg')
go
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(4,N'ĐẦM BẢN EO PHỐI NÚT',371250,N'Đầm bản eo phối nút
- Giá Bán Sản Phẩm: 495.000đ
- Màu Sắc Sản Phẩm: Xanh
- Số Đo Vòng Ngực: 85Cm
- Số Đo Vòng Eo: 63Cm
- Số Đo Dài Tay : 24Cm
- Số Đo Vai : 36Cm
- Chiều Dài Đầm: 90Cm
- Chất Liệu Vải: Xô Gân
* Chi Tiết Sản Phẩm*
- Có 2 Lớp
- Có Túi
( Số Đo Sản Phẩm Size XS)                                            
','1','2018-10-26 03:00:16', '2018-10-24 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (35,'ms18-1071020192339215834.jpg')
insert into ProductsImg (ProductID,ImgLink) values (35,'ms18071020192339215834.jpg')
insert into ProductsImg (ProductID,ImgLink) values (35,'ms18-sau071020192339215834.jpg')
insert into ProductsImg (ProductID,ImgLink) values (35,'ms18-1071020192339215834.jpg')
go
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(4,N'ĐẦM XÒE TAY XẾP PHỒNG',371250,N'Đầm xòe tay xếp phồng
- Màu Sắc Sản Phẩm: Đen
- Số Đo Vòng Ngực: 85Cm
- Số Đo Vòng Eo: 64Cm
- Số Đo Ra Vai: 33Cm
- Số Đo Cửa Tay: 24Cm
- Chiều Dài Tay: 37Cm
- Chiều Dài Đầm: 93Cm
- Chất Liệu Vải: Tuyết Mưa Phối Tay Tằm Ý
* Chi Tiết Sản Phẩm*
- Có 1 Lớp
- Có Túi
( Số Đo Sản Phẩm Size XS)                                            
','0','2018-10-26 03:00:16', '2018-10-24 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (36,'ms07071020192339215365.jpg')
insert into ProductsImg (ProductID,ImgLink) values (36,'ms07-1071020192339215365.jpg')
insert into ProductsImg (ProductID,ImgLink) values (36,'ms07-sau071020192339215365.jpg')
insert into ProductsImg (ProductID,ImgLink) values (36,'ms07071020192339215365.jpg')
go
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(4,N'ĐẦM XÒE TAY PHỐI NƠ',198000,N'Đầm xòe tay phối nơ
- Chất Liệu Vải: Lụa Cotton Phối Voan
- Màu Sắc: Gạch
- Chi Tiết Sản Phẩm:
+ Có 2 Túi Sườn
+ Độ Dài Tay 30cm
- Size: XS - S - M - L - XL
- Chiều Dài Sản Phẩm Size S : 90cm
- Tăng "1Cm" Mỗi Size.                                            
','1','2018-10-26 03:00:16', '2018-10-24 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (37,'ms14190220191034220879.jpg')
insert into ProductsImg (ProductID,ImgLink) values (37,'ms14-1180220190938056918.jpg')
insert into ProductsImg (ProductID,ImgLink) values (37,'ms14-2180220190938056918.jpg')
go
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(4,N'ĐẦM BỐ DẠ RÃ ĐÔ',198000,N'Đầm bố dạ rã đô
- Chất liệu vải: Bố Da Phối Lưới
- Màu sắc: Đỏ
- Chi Tiết Sản Phẩm:
+ 2 Túi Sườn
+ Dài Tay 34cm
- Size: XS - S - M - L - XL
- Chiều dài sản phẩm size S : 91Cm
- Tăng "1Cm" mỗi size.                                            
','1','2018-10-26 03:00:16', '2018-10-24 22:11:00')													
insert into ProductsImg (ProductID,ImgLink) values (38,'ms74040120190826257953.jpg')
insert into ProductsImg (ProductID,ImgLink) values (38,'ms74-1040120190826257953.jpg')
insert into ProductsImg (ProductID,ImgLink) values (38,'ms74-2040120190826258109.jpg')
go
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(4,N'ĐẦM XÒE PHỐI HOA',198000,N'Đầm xòe phối hoa
- Chất Liệu Vải: Cotton Chéo
- Màu Sắc: Hồng
- Chi Tiết Sản Phẩm:
+ 2 Túi Sườn
- Size: XS - S - M - L - XL
- Chiều Dài Sản Phẩm Size S : 92cm
- Tăng "1Cm" Mỗi Size.                                            
','0','2018-10-26 03:00:16', '2018-10-24 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (39,'ms22040120190823310141.jpg')
insert into ProductsImg (ProductID,ImgLink) values (39,'ms22-1040120190823310141.jpg')
insert into ProductsImg (ProductID,ImgLink) values (39,'ms22-2040120190823310141.jpg')
go
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(4,N'ĐẦM XÒE CỔ NHÚN',198000,N'Đầm xòe cổ nhún
- Chất liệu vải: Cát nhật phối chiffon
- Màu sắc: Xanh Đen Phối Vàng
- Chi Tiết Sản Phẩm: Lót thun thân trên, Dài tay 27cm, 2 túi sườn
- Size: XS - S - M - L - XL
- Chiều dài sản phẩm size S : 96Cm
- Tăng "1Cm" mỗi size.
*Sản phẩm có phối màu, Nên lưu ý giặt ủi*                                            
','1','2018-10-26 03:00:16', '2018-10-24 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (40,'img_9071-1101220180910210727.jpg')
insert into ProductsImg (ProductID,ImgLink) values (40,'img_9058-1101220180910210727.jpg')
insert into ProductsImg (ProductID,ImgLink) values (40,'img_9074-1101220180910210727.jpg')
go
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(4,N'ĐẦM XÒE TAY DƠI',198000,N'Đầm xòe tay dơi
- Chất liệu vải: Tằm Ý
- Màu sắc: Hồng
- Chi Tiết Sản Phẩm: Lót thun cả đầm
- Size: XS - S - M - L - Xl
- Chiều dài sản phẩm size S : 88Cm
- Tăng "1Cm" mỗi size.                                            
','0','2018-10-26 03:00:16', '2018-10-24 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (41,'img_5372-1061120182345374754.jpg')
insert into ProductsImg (ProductID,ImgLink) values (41,'img_5369-1061120182345374754.jpg')
insert into ProductsImg (ProductID,ImgLink) values (41,'img_5379-1061120182345374754.jpg')
go
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(4,N'ĐẦM PHỐI REN XÒE',254000,N'Đầm phối ren xòe
- Chất liệu vải: Phi Lụa Cao Cấp
- Màu sắc: Xanh
- Size: XS - S - M - L - Xl
- Chiều dài sản phẩm size XS :102 Cm
- Tăng "1Cm" mỗi size.                                            
','0','2018-10-26 03:00:16', '2018-10-24 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (42,'dam-phoi-ren-xoe-mau-xah311020181710219082.jpg')
insert into ProductsImg (ProductID,ImgLink) values (42,'dam-phoi-ren-xoe-gia-re311020181710219082.jpg')
insert into ProductsImg (ProductID,ImgLink) values (42,'dam-phoi-ren-xoe-de-thuong311020181710219082.jpg')
go
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(4,N'ĐẦM REN XÒE CAO CẤP',254000,N'Đầm ren xòe cao cấp
- Chất liệu vải: Ren Cao Cấp
- Màu sắc sản phẩm: Trắng
- Số size XS - S - M - L - XL
- Chiều dài size S: 97cm
*Tăng 1cm mỗi size.                                            
','1','2018-10-26 03:00:16', '2018-10-24 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (43,'dam-ren-xoe-cao-cap-mau-trang301020181444234303.jpg')
insert into ProductsImg (ProductID,ImgLink) values (43,'dam-ren-xoe-cao-cap-de-thuong301020181444234303.jpg')
insert into ProductsImg (ProductID,ImgLink) values (43,'dam-ren-xoe-cao-cap-gia-re301020181444234303.jpg')
go
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(4,N'ĐẦM XÒE BASIC',192000,N'Đầm xòe basic
- Chất liệu vải: Lụa Hàn
- Màu sắc sản phẩm: Hồng
- Số size XS - S - M - L - XL
- Chiều dài size S: 101cm
*Tăng 1cm mỗi size.                                            
','0','2018-10-26 03:00:16', '2018-10-24 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (44,'dam-xoe-basic-mau-hong301020181145334191.jpg')
insert into ProductsImg (ProductID,ImgLink) values (44,'dam-xoe-basic-gia-re301020181145334191.jpg')
insert into ProductsImg (ProductID,ImgLink) values (44,'dam-xoe-basic-dep-gia-re301020181145334191.jpg')
go
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(5,N'CHÂN VÁY HỌA TIẾT',206250,N'Chân váy họa tiết
- Màu Sắc Sản Phẩm: Xanh
- Số Đo Vòng Eo: 62Cm
- Số Đo Vòng Mông: 85Cm
- Chiều Dài Váy: 44Cm
- Chất Liệu Vải: Lainen Thun
* Chi Tiết Sản Phẩm*
- Có Quần Bên Trong
- Có Túi.
- Số Size: XS - S - M - L - XL.
(Số Đo Sản Phẩm Size XS).                                            
','0','2018-10-26 03:00:16', '2018-10-24 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (45,'at25-trang-cv85-1071020192338392396.jpg')
insert into ProductsImg (ProductID,ImgLink) values (45,'at25-trang-cv85071020192338392396.jpg')
insert into ProductsImg (ProductID,ImgLink) values (45,'at25-trang-cv85-sau071020192338392396.jpg')
insert into ProductsImg (ProductID,ImgLink) values (45,'at25-trang-cv85-1071020192338392396.jpg')
go
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(5,N'CHÂN VÁY REN CHỮ A',206250,N'Chân váy ren chữ A
- Màu Sắc Sản Phẩm: Đen
- Số Đo Vòng Eo: 63Cm
- Số Đo Vòng Mông: 84Cm
- Chiều Dài Váy: 45Cm
- Chất Liệu Vải: Ren
* Chi Tiết Sản Phẩm*
- Có 2 Lớp
- Có Quần Bên Trong
- Không Có Túi.
- Số Size: XS - S - M - L - XL.
(Số Đo Sản Phẩm Size XS).                                            
','1','2018-10-26 03:00:16', '2018-10-24 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (46,'a17-cv74071020192338123020.jpg')
insert into ProductsImg (ProductID,ImgLink) values (46,'a17-cv74-sau071020192338123177.jpg')
go
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(5,N'CHÂN VÁY PHỐI KHÓA',213750,N'Chân váy phối khóa
- Màu Sắc Sản Phẩm: Xanh Đen
- Số Đo Vòng Eo: 68Cm
- Số Đo Vòng Mông: 94Cm
- Chiều Dài Váy: 43Cm
- Chất Liệu Vải: Bố Cotton
* Chi Tiết Sản Phẩm*
- Có Túi.
- Số Size: XS - S - M - L - XL.
(Số Đo Sản Phẩm Size S).                                            
','0','2018-10-26 03:00:16', '2018-10-24 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (47,'at23-trang-cv60071020192338392240.jpg')
insert into ProductsImg (ProductID,ImgLink) values (47,'at23-trang-cv60-1071020192338392240.jpg')
insert into ProductsImg (ProductID,ImgLink) values (47,'at23-trang-cv60-sau071020192338392240.jpg')
go
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(5,N'CHÂN VÁY LỆCH TÀ',213750,N'Chân váy lệch tà
- Màu Sắc Sản Phẩm: Xám
- Số Đo Vòng Eo: 63Cm
- Số Đo Vòng Mông: 88Cm
- Chiều Dài Váy: 43Cm
- Chất Liệu Vải: Bố Cotton
* Chi Tiết Sản Phẩm*
- Có Quần Lớp Trong
(Số Đo Sản Phẩm Size XS)                                            
','1','2018-10-26 03:00:16', '2018-10-24 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (48,'at42-xanh-1071020192338535209.jpg')
insert into ProductsImg (ProductID,ImgLink) values (48,'at42-xanh071020192338535209.jpg')
insert into ProductsImg (ProductID,ImgLink) values (48,'at42-xanh-sau071020192338535209.jpg')
insert into ProductsImg (ProductID,ImgLink) values (48,'at42-xanh-1071020192338535209.jpg')
go
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(5,N'CHÂN VÁY CHẠY CHỈ',165000,N'Chân váy chạy chỉ
- Số Đo Vòng Eo: 63Cm
- Chiều Dài Váy: 62Cm
- Số Đo Vòng Mông: 85Cm
- Số Đo xẻ: 17Cm
- Màu sắc sản phẩm: Đen , Gạch
- Chi Tiết Sản Phẩm:
+ Có Co Giãn Nhẹ
- Chất Liệu Vải: Bố Cotton
- Số Size: XS - S - M - L - XL
*Số Đo Sản Phẩm Size XS*                                            
','0','2018-10-26 03:00:16', '2018-10-24 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (49,'a31cv67050920191343461764.jpg')
insert into ProductsImg (ProductID,ImgLink) values (49,'at49cv67-1050920191344077854.jpg')
insert into ProductsImg (ProductID,ImgLink) values (49,'at49cv67-sau050920191344077854.jpg')
go
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(5,N'CHÂN VÁY PHỐI NÚT BỌC',165000,N'Chân váy phối nút bọc
- Số Đo Vòng Eo: 62Cm
- Chiều Dài Váy: 53Cm
- Số Đo Vòng Mông: 86Cm
- Chiều Dài Xẻ: 14Cm
- Màu sắc sản phẩm: Đen
- Chi Tiết Sản Phẩm:
+ Có 1 Lớp
- Chất Liệu Vải: Bố Cotton Mịn
- Số Size: XS - S - M - L - XL
*Số Đo Sản Phẩm Size XS*                                            
','1','2018-10-26 03:00:16', '2018-10-24 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (50,'a57cv60050920191343462077.jpg')
insert into ProductsImg (ProductID,ImgLink) values (50,'a57cv60-1050920191343462077.jpg')
insert into ProductsImg (ProductID,ImgLink) values (50,'a57cv60-sau050920191343462077.jpg')
insert into ProductsImg (ProductID,ImgLink) values (50,'a57cv60050920191343462077.jpg')
go
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(5,N'CHÂN VÁY XẾP XÉO TÀ',165000,N'Chân váy xếp xéo tà
- Số Đo Vòng Eo: 67Cm
- Chiều Dài Váy: 52Cm *Phần Tà Xéo*
- Số Đo Vòng Hông: 84Cm
- Màu sắc sản phẩm: Đen
- Chi Tiết Sản Phẩm:
+ Có Quần Lớp Trong
- Chất Liệu Vải: Cotton Lạnh
- Số Size: XS - S - M - L - XL
* Số Đo Sản Phẩm Size S*                                            
','0','2018-10-26 03:00:16', '2018-10-24 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (51,'at49cv51050920191344077854.jpg')
insert into ProductsImg (ProductID,ImgLink) values (51,'at49-cv51-2050920191344077854.jpg')
insert into ProductsImg (ProductID,ImgLink) values (51,'at49cv51050920191344077854.jpg')
insert into ProductsImg (ProductID,ImgLink) values (51,'at49cv51050920191344077854.jpg')
go
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(5,N'CHÂN VÁY PHỐI PHỤ KIỆN',165000,N'Chân váy phối phụ kiện
- Số Đo Vòng Eo: 63Cm
- Chiều Dài Váy: 41Cm
- Số Đo Vòng Hông: 82Cm
- Màu sắc sản phẩm: Đen
- Chi Tiết Sản Phẩm:
+ Có Quần Lớp Trong
- Chất Liệu Vải: Cotton Hàn
- Số Size: XS - S - M - L - XL
* Số Đo Sản Phẩm Size XS*                                            
','1','2018-10-26 03:00:16','2018-10-24 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (52,'at49cv37-1050920191344077698.jpg')
insert into ProductsImg (ProductID,ImgLink) values (52,'at04cv37050920191343462546.jpg')
go
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(7,N'CHÂN VÁY BÚT CHÌ',165000,N'Chân váy bút chì
- Số Đo Vòng Eo: 63Cm
- Chiều Dài Váy: 60Cm
- Số Đo Vòng Mông: 84Cm
- Số Đo Xẻ Sau: 18Cm
- Màu sắc sản phẩm: Hồng, Đen, Đỏ
- Chi Tiết Sản Phẩm:
+ Có 1 Lớp
- Chất Liệu Vải: Bố Cotton
- Số Size: XS - S - M - L - XL
* Số Đo Sản Phẩm Size XS*                                            
','0','2018-10-26 03:00:16', '2018-10-24 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (53,'cv21050920191344211605.jpg')
insert into ProductsImg (ProductID,ImgLink) values (53,'a59cv21050920191343462077.jpg')
insert into ProductsImg (ProductID,ImgLink) values (53,'a31cv21-1050920191343461764.jpg')
go
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(5,N'CHÂN VÁY REN CƠ BẢN',165000,N'Chân váy ren cơ bản
- Số Đo Vòng Eo: 68Cm
- Chiều Dài Váy: 55Cm
- Số Đo Vòng Mông: 89Cm
- Số Đo Xẻ Váy: 18Cm
- Màu sắc sản phẩm: Trắng
- Chi Tiết Sản Phẩm:
+ Có 2 Lớp
- Chất Liệu Vải: Ren Cotton
- Số Size: XS - S - M - L - XL
( Số Đo Áo Size S )                                            
','1','2018-10-26 03:00:16', '2018-10-24 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (54,'a72-cv99020820190901063551.jpg')
insert into ProductsImg (ProductID,ImgLink) values (54,'a72-cv99-1020820190901063707.jpg')
insert into ProductsImg (ProductID,ImgLink) values (54,'a72-sau020820190901063707.jpg')
go
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(5,N'CHÂN VÁY HỌA TIẾT LÁ',165000,N'Chân váy họa tiết lá
- Số Đo Vòng Eo: 65Cm
- Chiều Dài Váy: 43Cm
- Số Đo Vòng Hông: 82Cm
- Màu sắc sản phẩm: Xanh
- Chi Tiết Sản Phẩm:
+ Có Quần Lớp Trong
+ Có Túi
- Chất Liệu Vải: Linen Thun
- Số Size: XS - S - M - L - XL
*Số Đo Sản Phẩm Size S*                                            
','0','2018-10-26 03:00:16', '2018-10-24 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (55,'at02cv03-1050920191343462389.jpg')
insert into ProductsImg (ProductID,ImgLink) values (55,'at02cv03050920191343462389.jpg')
insert into ProductsImg (ProductID,ImgLink) values (55,'at02cv03-sau050920191343462546.jpg')
go
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(5,N'CHÂN VÁY PHỐI TÚI ĐẮP',165000,N'Chân váy phối túi đắp
- Số Đo Vòng Eo: 63Cm
- Chiều Dài Váy: 41Cm
- Số Đo Vòng Mông: 86Cm
- Màu sắc sản phẩm: Đen
- Chi Tiết Sản Phẩm:
+ Có Quần Lớp Trong
+ Có Túi Thật
- Chất Liệu Vải: Bố Cotton
- Số Size: XS - S - M - L - XL
( Số Đo Áo Size XS )                                            
','1','2018-10-26 03:00:16', '2018-10-24 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (56,'at67-hong020820190929177647.jpg')
insert into ProductsImg (ProductID,ImgLink) values (56,'at67-hong-1020820190929177647.jpg')
go
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(5,N'CHÂN VÁY CARO XÒE',171000,N'Chân váy caro xòe
- Số Đo Vòng Eo: 62Cm
- Chiều Dài Váy: 42Cm
- Màu sắc sản phẩm: Đen
- Chi Tiết Sản Phẩm:
+ Có Quần Lớp Trong
+ Không Có Túi
- Chất Liệu Vải: Bố Chéo
- Số Size: XS - S - M - L - XL
( Số Đo Size XS )                                            
','0','2018-10-26 03:00:16', '2018-10-24 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (57,'a68cv8912050920191343462389.jpg')
insert into ProductsImg (ProductID,ImgLink) values (57,'a68cv8912-1050920191343462389.jpg')
insert into ProductsImg (ProductID,ImgLink) values (57,'a68cv8912-sau050920191343462389.jpg')
insert into ProductsImg (ProductID,ImgLink) values (57,'a68cv8912050920191343462389.jpg')
go
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(5,N'CHÂN VÁY CHỈ NỔI',137500,N'Chân váy chỉ nổi
- Chi Tiết Sản Phẩm:
+ Chân Váy Form Chữ A
+ Bảng Lưng: 3.5Cm
+ Có Quần Bên Trong
+ Thân Trước Có Đắp Tà
- Màu Sắc: Đen
- Chất Liệu Vải: Cotton Misa
- Số Size: XS - S - M - L - XL                                            
','0','2018-10-26 03:00:16', '2018-10-24 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (58,'at68-xden-1080720191634321059.jpg')
insert into ProductsImg (ProductID,ImgLink) values (58,'at33-trang100720190923157635.jpg')
insert into ProductsImg (ProductID,ImgLink) values (58,'haveadream-xanhla080720191634321528.jpg')
go
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(5,N'CHÂN VÁY NÚT BỌC',137500,N'Chân váy nút bọc
- Số Đo Vòng Eo: 61Cm
- Chiều Dài Váy: 42Cm
- Số Đo Hông: 82Cm
- Chất Liệu Vải: Cotton Lạnh
- Màu Sắc: Xanh Đen
- Có Quần Lớp Trong May Vắt Sổ Quần Ra Ngoài
( Số Đo Sản Phẩm Size XS )
* Mẫu Lan Thy: 1.63m*                                            
','1','2018-10-26 03:00:16', '2018-10-24 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (59,'a56-cv44080720191633451527.jpg')
insert into ProductsImg (ProductID,ImgLink) values (59,'a56-cv44-1080720191633451527.jpg')
insert into ProductsImg (ProductID,ImgLink) values (59,'a56-cv44-sau080720191633451527.jpg')
go
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(5,N'CHÂN VÁY THÊU HOA',137500,N'Chân váy thêu hoa
- Số Đo Vòng Eo: 62Cm
- Chiều Dài Váy: 47Cm
- Số Đo Vòng Mông: 90Cm ( Phom A)
- Chất Liệu Vải: Bố Cotton Thái
- Màu Sắc: Đen
- Size: XS - S - M - L - XL
( Số Đo Sản Phẩm Size XS )                                            
','0','2018-10-26 03:00:16', '2018-10-24 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (60,'at73-cv27100620191519065804.jpg')
insert into ProductsImg (ProductID,ImgLink) values (60,'at73-cv27-sau100620191519065804.jpg')
go
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(6,N'QUẦN ỐNG ĐỨNG CƠ BẢN',247500,N'Quần ống đứng cơ bản
- Màu Sắc Sản Phẩm: Đen, Cam
- Số Đo Vòng Eo: 64Cm
- Chiều Dài Quần: 88Cm
- Số Đo Vòng Mông: 86Cm
- Số Đo Ống Quần: 30Cm
- Số Đo Đùi: 52Cm
- Chất Liệu Vải: Tuyết Mưa
* Chi Tiết Sản Phẩm*
- Có 1 Lớp
- Có Túi
- Số Size: XS - S - M - L - XL.
( Số Đo Sản Phẩm Size XS)                                            
','0','2018-10-26 03:00:16', '2018-10-24 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (61,'a31-qd97-cam-1071020192338123177.jpg')
insert into ProductsImg (ProductID,ImgLink) values (61,'a31-qd97-cam-sau071020192338123177.jpg')
insert into ProductsImg (ProductID,ImgLink) values (61,'a48071020192338123489.jpg')
go
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(6,N'QUẦN TÂY BASIC',262500,N'Quần tây basic
- Màu Sắc Sản Phẩm: Xám, Đen
- Số Đo Vòng Eo: 63Cm
- Chiều Dài Quần: 92Cm
- Số Đo Vòng Mông: 86Cm
- Số Đo Ống Quần: 38Cm
- Số Đo Đùi: 52Cm
- Chất Liệu Vải: Cotton
* Chi Tiết Sản Phẩm*
- Có Túi
- Có 1 Lớp
- Số Size: XS - S - M - L - XL.
( Số Đo Sản Phẩm Size XS)                                            
','1','2018-10-26 03:00:16', '2018-10-24 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (62,'a32-qd30071020192338123177.jpg')
insert into ProductsImg (ProductID,ImgLink) values (62,'a32-qd30-1071020192338123177.jpg')
insert into ProductsImg (ProductID,ImgLink) values (62,'a48-qd30-sau071020192338261302.jpg')
insert into ProductsImg (ProductID,ImgLink) values (62,'a48-qd30071020192338261302.jpg')
go
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(6,N'QUẦN TÂY CARO BASIC',247500,N'Quần tây caro basic
- Màu Sắc Sản Phẩm: Xám
- Số Đo Vòng Eo: 63Cm
- Chiều Dài Quần: 93Cm
- Số Đo Vòng Mông: 88Cm
- Số Đo Ống Quần: 30Cm
- Số Đo Đùi: 56Cm
- Chất Liệu Vải: Bố Cotton
* Chi Tiết Sản Phẩm*
- Có Túi
- Số Size: XS - S - M - L - XL.
( Số Đo Sản Phẩm Size XS)                                            
','0','2018-10-26 03:00:16', '2018-10-24 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (63,'at72-trang-qd29-1071020192339073178.jpg')
insert into ProductsImg (ProductID,ImgLink) values (63,'at72-trang-qd29-sau071020192339073178.jpg')
insert into ProductsImg (ProductID,ImgLink) values (63,'at72-trang-qd29071020192339073178.jpg')
go
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(6,N'QUẦN TÂY ỐNG SUÔNG',165000,N'Quần tây ống suông','0','2018-12-26 03:00:16', '2018-12-28 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (64,'a55-qd47080720191633451527.jpg')
insert into ProductsImg (ProductID,ImgLink) values (64,'a55-qd47-1080720191633451527.jpg')
insert into ProductsImg (ProductID,ImgLink) values (64,'a55-qd47-sau080720191633451527.jpg')
go
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(6,N'QUẦN TÂY LẬT LAI',165000,N'Quần tây lật lai
- Số Đo Vòng Eo: 64Cm
- Chiều Dài Quần: 55Cm
- Số Đo Mông: 86Cm
- Số Đo Đùi: 53Cm
- Số Đo Ống: 14Cm
- Chất Liệu Vải: Cotton Lạnh
+ Co Giãn Nhẹ
+ Có 2 Túi Xéo
- Màu Sắc: Đen, Cam
( Số Đo Sản Phẩm Size XS )
* Mẫu Thiên An 1m67*                                            
','1','2018-10-26 03:00:16', '2018-10-24 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (65,'a04-qd41080720191633371370.jpg')
insert into ProductsImg (ProductID,ImgLink) values (65,'qd41080720191639289346.jpg')
insert into ProductsImg (ProductID,ImgLink) values (65,'a61-qd41-1080720191633451683.jpg')
insert into ProductsImg (ProductID,ImgLink) values (65,'a56-qd41-sau080720191633451527.jpg')
go
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(6,N'QUẦN TÂY ỐNG NHỎ',175000,N'Quần tây ống nhỏ
- Chất Liệu Vải: Bố Cotton Thái
- Màu Sắc: Đen, Xám
- Chi Tiết Sản Phẩm:
+ 2 Túi Xéo
- Size: XS - S - M - L - XL
- Chiều Dài Sản Phẩm Size S : 90cm
- Tăng "1Cm" Mỗi Size.                                            
','0','2018-10-26 03:00:16', '2018-10-24 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (66,'at15-qd16020420190846475761.jpg')
insert into ProductsImg (ProductID,ImgLink) values (66,'at15-qd16-2020420190846475917.jpg')
go
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(7,N'ÁO KẺ ZICZAC',206250,N'Áo kẻ Ziczac
- Màu Sắc Sản Phẩm: Vàng
- Số Đo Vòng Ngực: 88Cm
- Số Đo Vòng Hông: 92Cm
- Chiều Dài Tay Áo: 57Cm
- Chiều Dài Ra Vai Áo: 34Cm
- Số Đo Cửa Tay: 19Cm
- Chiều Dài Áo: 60Cm
- Chất Liệu: Cát Giấy
- Áo Có 1 Lớp.
- Size: XS - S - M - L - XL.
* Số Đo Sản Phẩm Size XS*                                            
','1','2018-10-26 03:00:16', '2018-10-24 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (67,'a80071020192338261614.jpg')
insert into ProductsImg (ProductID,ImgLink) values (67,'a80-sau071020192338261614.jpg')
insert into ProductsImg (ProductID,ImgLink) values (67,'a80-1071020192338261614.jpg')
go
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(7,N'ÁO CROPTOP TAY PHỒNG',213750,N'Áo croptop tay phồng
- Màu Sắc Sản Phẩm: Đen
- Số Đo Vòng Ngực: 82Cm
- Số Đo Vòng Eo: 64Cm
- Số Đo Cửa Tay: Có Bo Chun
- Số Đo Vai: 26Cm
- Chiều Dài Tay Áo: 29Cm
- Chiều Dài Áo: 34Cm
- Chất Liệu: Lainen Gân
- Size: XS - S - M - L - XL.
* Số Đo Sản Phẩm Size XS*                                            
','0','2018-10-26 03:00:16', '2018-10-24 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (68,'a81-cv57071020192338261614.jpg')
insert into ProductsImg (ProductID,ImgLink) values (68,'a81-cv57-sau071020192338261614.jpg')
insert into ProductsImg (ProductID,ImgLink) values (68,'a81-cv57-1071020192338261614.jpg')
go
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(7,N'ÁO SƠ MI HỌA TIẾT',213750,N'Áo sơ mi họa tiết
- Màu Sắc Sản Phẩm: Trắng. Đen
- Số Đo Vòng Ngực: 94Cm
- Số Đo Vòng Hông: 98Cm
- Số Đo Cửa Tay: 20Cm
- Chiều Dài Vai Áo: 35Cm
- Chiều Dài Tay Áo: 54Cm
- Chiều Dài Áo: 59Cm
- Chất Liệu: Cotton Mịn
- Size: XS - S - M - L - XL.
* Số Đo Sản Phẩm Size S*                                            
','1','2018-10-26 03:00:16', '2018-10-24 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (69,'a48071020192338123489.jpg')
insert into ProductsImg (ProductID,ImgLink) values (69,'a48-sau071020192338261302.jpg')
insert into ProductsImg (ProductID,ImgLink) values (69,'a48-qd37-sau071020192338261302.jpg')
insert into ProductsImg (ProductID,ImgLink) values (69,'a48071020192338123489.jpg')
go
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(7,N'ÁO LAI TAY BÈO',206250,N'Áo lai tay bèo
- Màu Sắc Sản Phẩm: Hồng
- Số Đo Vòng Ngực: 88Cm
- Số Đo Vòng Hông: 94Cm
- Chiều Dài Tay Áo: 38Cm
- Chiều Dài Ra Vai Áo: 34Cm
- Số Đo Cửa Tay: 25Cm
- Chiều Dài Áo: 60Cm
- Chất Liệu: Cát Giấy
- Size: XS - S - M - L - XL.
* Số Đo Sản Phẩm Size XS*                                            
','0','2018-10-26 03:00:16', '2018-10-24 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (70,'a33-cv38071020192338123333.jpg')
insert into ProductsImg (ProductID,ImgLink) values (70,'a33-cv38-1071020192338123333.jpg')
insert into ProductsImg (ProductID,ImgLink) values (70,'a33-cv38-sau071020192338123333.jpg')
insert into ProductsImg (ProductID,ImgLink) values (70,'a33-cv38071020192338123333.jpg')
go
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(7,N'ÁO CỔ ĐẮP PHỤ KIỆN',206250,N'Áo cổ đắp phụ kiện
- Màu Sắc Sản Phẩm: Trắng.
- Số Đo Vòng Ngực: 88Cm
- Số Đo Vòng Eo: 78Cm
- Số Đo Hạ Cổ V: 23Cm
- Chiều Dài Vai Áo: 31Cm
- Chiều Dài Áo: 62Cm
- Chất Liệu: Đũi Xô
- Size: XS - S - M - L - XL.
* Số Đo Sản Phẩm Size XS*                                            
','0','2018-10-26 03:00:16', '2018-10-24 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (71,'a20-1071020192338123177.jpg')
insert into ProductsImg (ProductID,ImgLink) values (71,'a20-sau071020192338123177.jpg')
insert into ProductsImg (ProductID,ImgLink) values (71,'a20071020192338123177.jpg')
go
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(7,N'ÁO SƠ MI CHẠY CHỈ',171000,N'Áo sơ mi chạy chỉ
- Số Đo Vòng Ngực: 92cm
- Số Đo Vòng Hông: 96Cm
- Số Đo Ngang Vai: 35Cm
- Số Đo Lá Cổ: 6Cm
- Chiều Dài Tay: 17Cm
- Chiều Dài Áo: 60Cm
- Số Đo Cửa Tay: 30Cm
- Màu sắc sản phẩm: Xám
- Chất Liệu Vải: Cát Giấy
- Số Size: XS - S - M - L - XL
*Số Đo Sản Phẩm Size S*                                            
','1','2018-10-26 03:00:16', '2018-10-24 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (72,'a57cv60-1050920191343462077.jpg')
insert into ProductsImg (ProductID,ImgLink) values (72,'a57cv60-sau050920191343462077.jpg')
insert into ProductsImg (ProductID,ImgLink) values (72,'a57cv60050920191343462077.jpg')
go
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(7,N'ÁO VIỀN CARO',198000,N'Áo viền caro
- Số Đo Vòng Ngực: 104Cm
- Số Đo Vòng Hông: 104Cm
- Số Đo Ngang Vai: 40Cm
- Chiều Dài Tay: 55Cm
- Chiều Dài Áo: 62Cm
- Số Đo Cửa Tay: 24Cm
- Màu sắc sản phẩm: Trắng
- Chất Liệu Vải: Tuyết Mưa Lụa
- Số Size: XS - S - M - L - XL
( Số Đo Áo Size XL)                                            
','0','2018-10-26 03:00:16', '2018-10-24 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (73,'a31cv67050920191343461764.jpg')
insert into ProductsImg (ProductID,ImgLink) values (73,'a31cv21-1050920191343461764.jpg')
insert into ProductsImg (ProductID,ImgLink) values (73,'a31cv21-sau050920191343461764.jpg')
go
insert into Products(CategoryID,ProductName,Prices,Details,Sales,CreateAt,UpDateAt) values(7,N'ÁO SƠ MI 2 LỚP',198000,N'Áo sơ mi 2 lớp','1','2018-10-26 03:00:16', '2018-10-24 22:11:00')
insert into ProductsImg (ProductID,ImgLink) values (74,'a22050920191343461764.jpg')
insert into ProductsImg (ProductID,ImgLink) values (74,'a22-sau050920191343461764.jpg')
insert into ProductsImg (ProductID,ImgLink) values (74,'a22-1050920191343461764.jpg')
go

SET IDENTITY_INSERT Roles off
INSERT INTO Roles (ID, RolesName) VALUES ( 1,'User')
INSERT INTO Roles (ID, RolesName) VALUES ( 2,'Admin')
select *from Bill
select *from Customer
select *from Cart
select *from Account
SET IDENTITY_INSERT Account off
INSERT INTO Account(ID, UserName,Pwd,RoleID) VALUES ( 1,'admin','21232f297a57a5a743894a0e4a801fc3',2)