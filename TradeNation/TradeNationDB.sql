USE [master]
GO
/****** Object:  Database [TradeNationDB]    Script Date: 09.12.23 Сб 12:02 ******/
CREATE DATABASE [TradeNationDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TradeNationDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\TradeNationDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TradeNationDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\TradeNationDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [TradeNationDB] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TradeNationDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TradeNationDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TradeNationDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TradeNationDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TradeNationDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TradeNationDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [TradeNationDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TradeNationDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TradeNationDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TradeNationDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TradeNationDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TradeNationDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TradeNationDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TradeNationDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TradeNationDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TradeNationDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TradeNationDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TradeNationDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TradeNationDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TradeNationDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TradeNationDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TradeNationDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TradeNationDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TradeNationDB] SET RECOVERY FULL 
GO
ALTER DATABASE [TradeNationDB] SET  MULTI_USER 
GO
ALTER DATABASE [TradeNationDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TradeNationDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TradeNationDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TradeNationDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TradeNationDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TradeNationDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TradeNationDB] SET QUERY_STORE = OFF
GO
USE [TradeNationDB]
GO
/****** Object:  Table [dbo].[User]    Script Date: 09.12.23 Сб 12:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserSurname] [nvarchar](100) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[UserPatronymic] [nvarchar](100) NOT NULL,
	[UserLogin] [nvarchar](max) NOT NULL,
	[UserPassword] [nvarchar](max) NOT NULL,
	[UserRole] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 09.12.23 Сб 12:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime] NULL,
	[OrderDeliveryDate] [datetime] NOT NULL,
	[OrderPickupPoint] [int] NOT NULL,
	[OrderCode] [int] NULL,
	[OrderStatus] [nvarchar](max) NOT NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK__Order__C3905BAF74970EF4] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 09.12.23 Сб 12:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductArticleNumber] [nvarchar](255) NOT NULL,
	[ProductName] [nvarchar](max) NOT NULL,
	[ProductUnit] [nvarchar](50) NOT NULL,
	[ProductCost] [decimal](19, 4) NOT NULL,
	[ProductDiscountAmount] [tinyint] NOT NULL,
	[ProductManufacturer] [nvarchar](max) NOT NULL,
	[ProductProvider] [nvarchar](50) NOT NULL,
	[ProductCategory] [nvarchar](max) NOT NULL,
	[ProductCurrentDiscount] [int] NOT NULL,
	[ProductQuantityInStock] [int] NOT NULL,
	[ProductDescription] [nvarchar](max) NOT NULL,
	[ProductPhoto] [nvarchar](50) NULL,
 CONSTRAINT [PK__Product__2EA7DCD59CC77B7B] PRIMARY KEY CLUSTERED 
(
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 09.12.23 Сб 12:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[OrderID] [int] NOT NULL,
	[ProductArticleNumber] [nvarchar](255) NOT NULL,
	[ProductQuanity] [int] NULL,
 CONSTRAINT [PK__OrderPro__817A2662C9473819] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[_Product User]    Script Date: 09.12.23 Сб 12:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[_Product User]
AS
SELECT        dbo.Product.ProductName, dbo.Product.ProductCategory, dbo.OrderProduct.ProductQuanity, dbo.[User].UserSurname, dbo.[User].UserName, dbo.[User].UserPatronymic, dbo.OrderProduct.ProductArticleNumber, 
                         dbo.OrderProduct.OrderID
FROM            dbo.[Order] INNER JOIN
                         dbo.[User] ON dbo.[Order].UserID = dbo.[User].UserID INNER JOIN
                         dbo.OrderProduct ON dbo.[Order].OrderID = dbo.OrderProduct.OrderID INNER JOIN
                         dbo.Product ON dbo.OrderProduct.ProductArticleNumber = dbo.Product.ProductArticleNumber
GO
/****** Object:  View [dbo].[View_Product]    Script Date: 09.12.23 Сб 12:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_Product]
AS
SELECT      ProductArticleNumber AS Артикль, ProductName AS Название, ProductUnit AS Единица, ProductCost AS Цена, ProductDiscountAmount AS [Макс. скидка], ProductManufacturer AS Производитель, ProductProvider AS Поставщик, ProductCategory AS Категория, ProductCurrentDiscount AS Скидка, 
                   ProductQuantityInStock AS [Кол-во на складе], ProductDescription AS Описание, ProductPhoto AS Фото
FROM         dbo.Product
GO
/****** Object:  Table [dbo].[OrderPickupPoint]    Script Date: 09.12.23 Сб 12:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderPickupPoint](
	[OrderPickupPoint] [int] NOT NULL,
	[Index] [int] NULL,
	[City] [nvarchar](255) NULL,
	[Street] [nvarchar](255) NULL,
	[Home] [nvarchar](255) NULL,
 CONSTRAINT [PK_OrderPickupPoint] PRIMARY KEY CLUSTERED 
(
	[OrderPickupPoint] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 09.12.23 Сб 12:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Order] ON 
GO
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderCode], [OrderStatus], [UserID]) VALUES (1, CAST(N'2022-05-16T00:00:00.000' AS DateTime), CAST(N'2022-05-22T00:00:00.000' AS DateTime), 1, 801, N'Завершен', 52)
GO
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderCode], [OrderStatus], [UserID]) VALUES (2, CAST(N'2022-05-16T00:00:00.000' AS DateTime), CAST(N'2022-05-22T00:00:00.000' AS DateTime), 14, 802, N'Новый ', NULL)
GO
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderCode], [OrderStatus], [UserID]) VALUES (3, CAST(N'2022-05-17T00:00:00.000' AS DateTime), CAST(N'2022-05-23T00:00:00.000' AS DateTime), 2, 803, N'Новый ', 53)
GO
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderCode], [OrderStatus], [UserID]) VALUES (4, CAST(N'2022-05-17T00:00:00.000' AS DateTime), CAST(N'2022-05-23T00:00:00.000' AS DateTime), 22, 804, N'Новый ', NULL)
GO
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderCode], [OrderStatus], [UserID]) VALUES (5, CAST(N'2022-05-19T00:00:00.000' AS DateTime), CAST(N'2022-05-25T00:00:00.000' AS DateTime), 2, 805, N'Новый ', 54)
GO
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderCode], [OrderStatus], [UserID]) VALUES (6, CAST(N'2022-05-20T00:00:00.000' AS DateTime), CAST(N'2022-05-26T00:00:00.000' AS DateTime), 28, 806, N'Новый ', NULL)
GO
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderCode], [OrderStatus], [UserID]) VALUES (7, CAST(N'2022-05-22T00:00:00.000' AS DateTime), CAST(N'2022-05-28T00:00:00.000' AS DateTime), 3, 807, N'Новый ', NULL)
GO
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderCode], [OrderStatus], [UserID]) VALUES (8, CAST(N'2022-05-22T00:00:00.000' AS DateTime), CAST(N'2022-05-28T00:00:00.000' AS DateTime), 32, 808, N'Новый ', NULL)
GO
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderCode], [OrderStatus], [UserID]) VALUES (9, CAST(N'2022-05-24T00:00:00.000' AS DateTime), CAST(N'2022-05-30T00:00:00.000' AS DateTime), 5, 809, N'Новый ', NULL)
GO
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderCode], [OrderStatus], [UserID]) VALUES (10, CAST(N'2022-05-24T00:00:00.000' AS DateTime), CAST(N'2022-05-30T00:00:00.000' AS DateTime), 36, 810, N'Новый ', 55)
GO
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPoint], [Index], [City], [Street], [Home]) VALUES (1, 344288, N' г. Талнах', N' ул. Чехова', N'1')
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPoint], [Index], [City], [Street], [Home]) VALUES (2, 614164, N' г.Талнах', N'  ул. Степная', N'30')
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPoint], [Index], [City], [Street], [Home]) VALUES (3, 394242, N' г. Талнах', N' ул. Коммунистическая', N'43')
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPoint], [Index], [City], [Street], [Home]) VALUES (4, 660540, N' г. Талнах', N' ул. Солнечная', N'25')
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPoint], [Index], [City], [Street], [Home]) VALUES (5, 125837, N' г. Талнах', N' ул. Шоссейная', N'40')
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPoint], [Index], [City], [Street], [Home]) VALUES (6, 125703, N' г. Талнах', N' ул. Партизанская', N'49')
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPoint], [Index], [City], [Street], [Home]) VALUES (7, 625283, N' г. Талнах', N' ул. Победы', N'46')
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPoint], [Index], [City], [Street], [Home]) VALUES (8, 614611, N' г. Талнах', N' ул. Молодежная', N'50')
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPoint], [Index], [City], [Street], [Home]) VALUES (9, 454311, N' г.Талнах', N' ул. Новая', N'19')
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPoint], [Index], [City], [Street], [Home]) VALUES (10, 660007, N' г.Талнах', N' ул. Октябрьская', N'19')
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPoint], [Index], [City], [Street], [Home]) VALUES (11, 603036, N' г. Талнах', N' ул. Садовая', N'4')
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPoint], [Index], [City], [Street], [Home]) VALUES (12, 450983, N' г.Талнах', N' ул. Комсомольская', N'26')
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPoint], [Index], [City], [Street], [Home]) VALUES (13, 394782, N' г. Талнах', N' ул. Чехова', N'3')
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPoint], [Index], [City], [Street], [Home]) VALUES (14, 603002, N' г. Талнах', N' ул. Дзержинского', N'28')
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPoint], [Index], [City], [Street], [Home]) VALUES (15, 450558, N' г. Талнах', N' ул. Набережная', N'30')
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPoint], [Index], [City], [Street], [Home]) VALUES (16, 394060, N' г.Талнах', N' ул. Фрунзе', N'43')
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPoint], [Index], [City], [Street], [Home]) VALUES (17, 410661, N' г. Талнах', N' ул. Школьная', N'50')
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPoint], [Index], [City], [Street], [Home]) VALUES (18, 625590, N' г. Талнах', N' ул. Коммунистическая', N'20')
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPoint], [Index], [City], [Street], [Home]) VALUES (19, 625683, N' г. Талнах', N' ул. 8 Марта', N'1')
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPoint], [Index], [City], [Street], [Home]) VALUES (20, 400562, N' г. Талнах', N' ул. Зеленая', N'32')
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPoint], [Index], [City], [Street], [Home]) VALUES (21, 614510, N' г. Талнах', N' ул. Маяковского', N'47')
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPoint], [Index], [City], [Street], [Home]) VALUES (22, 410542, N' г. Талнах', N' ул. Светлая', N'46')
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPoint], [Index], [City], [Street], [Home]) VALUES (23, 620839, N' г. Талнах', N' ул. Цветочная', N'8')
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPoint], [Index], [City], [Street], [Home]) VALUES (24, 443890, N' г. Талнах', N' ул. Коммунистическая', N'1')
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPoint], [Index], [City], [Street], [Home]) VALUES (25, 603379, N' г. Талнах', N' ул. Спортивная', N'46')
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPoint], [Index], [City], [Street], [Home]) VALUES (26, 603721, N' г. Талнах', N' ул. Гоголя', N'41')
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPoint], [Index], [City], [Street], [Home]) VALUES (27, 410172, N' г. Талнах', N' ул. Северная', N'13')
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPoint], [Index], [City], [Street], [Home]) VALUES (28, 420151, N' г. Талнах', N' ул. Вишневая', N'32')
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPoint], [Index], [City], [Street], [Home]) VALUES (29, 125061, N' г. Талнах', N' ул. Подгорная', N'8')
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPoint], [Index], [City], [Street], [Home]) VALUES (30, 630370, N' г. Талнах', N' ул. Шоссейная', N'24')
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPoint], [Index], [City], [Street], [Home]) VALUES (31, 614753, N' г. Талнах', N' ул. Полевая', N'35')
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPoint], [Index], [City], [Street], [Home]) VALUES (32, 426030, N' г. Талнах', N' ул. Маяковского', N'44')
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPoint], [Index], [City], [Street], [Home]) VALUES (33, 450375, N' г. Талнах ', N'ул. Клубная', N'44')
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPoint], [Index], [City], [Street], [Home]) VALUES (34, 625560, N' г. Талнах', N' ул. Некрасова', N'12')
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPoint], [Index], [City], [Street], [Home]) VALUES (35, 630201, N' г. Талнах', N' ул. Комсомольская', N'17')
GO
INSERT [dbo].[OrderPickupPoint] ([OrderPickupPoint], [Index], [City], [Street], [Home]) VALUES (36, 190949, N' г. Талнах', N' ул. Мичурина', N'26')
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [ProductQuanity]) VALUES (1, N'T793T4', 3)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [ProductQuanity]) VALUES (1, N'А112Т4', 2)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [ProductQuanity]) VALUES (2, N'F573T5', 10)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [ProductQuanity]) VALUES (2, N'G387Y6', 16)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [ProductQuanity]) VALUES (3, N'B736H6', 20)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [ProductQuanity]) VALUES (3, N'D735T5', 20)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [ProductQuanity]) VALUES (4, N'H384H3', 2)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [ProductQuanity]) VALUES (4, N'K437E6', 2)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [ProductQuanity]) VALUES (5, N'E732R7', 4)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [ProductQuanity]) VALUES (5, N'R836H6', 3)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [ProductQuanity]) VALUES (6, N'F839R6', 4)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [ProductQuanity]) VALUES (6, N'G304H6', 4)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [ProductQuanity]) VALUES (7, N'C430T4', 10)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [ProductQuanity]) VALUES (7, N'C946Y6', 3)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [ProductQuanity]) VALUES (8, N'B963H5', 5)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [ProductQuanity]) VALUES (8, N'V403G6', 5)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [ProductQuanity]) VALUES (9, N'V026J4', 2)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [ProductQuanity]) VALUES (9, N'V727Y6', 2)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [ProductQuanity]) VALUES (10, N'C635Y6', 2)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [ProductQuanity]) VALUES (10, N'W405G6', 2)
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'B736H6', N'Набор вилок', N'шт.', CAST(220.0000 AS Decimal(19, 4)), 5, N'Alaska', N'LeroiMerlin', N'Вилки', 3, 4, N'Вилка столовая 21,2 см «Аляска бэйсик» сталь KunstWerk', N'B736H6.jpg')
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'B963H5', N'Набор ложек', N'шт.', CAST(800.0000 AS Decimal(19, 4)), 5, N'Smart Home', N'LeroiMerlin', N'Ложки', 3, 8, N'Ложка 21 мм металлическая (медная) (Упаковка 10 шт)', NULL)
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'C430T4', N'Набор вилок', N'шт.', CAST(1600.0000 AS Decimal(19, 4)), 30, N'Attribute', N'LeroiMerlin', N'наборы', 3, 6, N'Набор на одну персону (4 предмета) серия "Bistro", нерж. сталь, Was, Германия.', NULL)
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'C635Y6', N'Вилки столовые', N'шт.', CAST(1000.0000 AS Decimal(19, 4)), 15, N'Apollo', N'Максидом', N'наборы', 4, 25, N'Детский столовый набор Fissman «Зебра» ', NULL)
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'C730R7', N'Ложка чайная', N'шт.', CAST(300.0000 AS Decimal(19, 4)), 5, N'Smart Home', N'LeroiMerlin', N'Ложки', 3, 17, N'Ложка детская столовая', NULL)
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'C943G5', N'Вилка столовая', N'шт.', CAST(200.0000 AS Decimal(19, 4)), 5, N'Attribute', N'Максидом', N'наборы', 4, 12, N'Attribute Набор чайных ложек Baguette 3 предмета серебристый', NULL)
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'C946Y6', N'Набор столовых приборов', N'шт.', CAST(300.0000 AS Decimal(19, 4)), 15, N'Apollo', N'LeroiMerlin', N'Вилки', 2, 16, N'Вилка детская столовая', NULL)
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'D735T5', N'Набор вилок', N'шт.', CAST(220.0000 AS Decimal(19, 4)), 5, N'Alaska', N'LeroiMerlin', N'Ложки', 2, 13, N'Ложка чайная ALASKA Eternum', N'D735T5.jpg')
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'E732R7', N'Набор столовых приборов', N'шт.', CAST(990.0000 AS Decimal(19, 4)), 15, N'Smart Home', N'Максидом', N'наборы', 5, 6, N'Набор столовых приборов Smart Home20 Black в подарочной коробке, 4 шт', N'E732R7.jpg')
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'F392G6', N'Набор  столовых ножей', N'шт.', CAST(490.0000 AS Decimal(19, 4)), 10, N'Apollo', N'LeroiMerlin', N'наборы', 4, 9, N'Apollo Набор столовых приборов Chicago 4 предмета серебристый', NULL)
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'F573T5', N'Набор столовых приборов', N'шт.', CAST(650.0000 AS Decimal(19, 4)), 15, N'Davinci', N'Максидом', N'вилки', 3, 4, N'Вилки столовые на блистере / 6 шт.', N'F573T5.jpg')
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'F745K4', N'Ложка детская', N'шт.', CAST(2000.0000 AS Decimal(19, 4)), 10, N'Mayer & Boch', N'LeroiMerlin', N'наборы', 3, 2, N'Столовые приборы для салата Orskov Lava, 2шт', NULL)
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'F839R6', N'Ложка чайная', N'шт.', CAST(400.0000 AS Decimal(19, 4)), 15, N'Doria', N'Максидом', N'Ложки', 2, 6, N'Ложка чайная DORIA Eternum', NULL)
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'G304H6', N'Набор ложек', N'шт.', CAST(500.0000 AS Decimal(19, 4)), 5, N'Apollo', N'Максидом', N'Ложки', 4, 12, N'Набор ложек столовых APOLLO "Bohemica" 3 пр.', NULL)
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'G387Y6', N'Набор на одну персону', N'шт.', CAST(441.0000 AS Decimal(19, 4)), 5, N'Doria', N'Максидом', N'Ложки', 4, 23, N'Ложка столовая DORIA L=195/60 мм Eternum', N'G387Y6.jpg')
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'H384H3', N'Вилка столовая', N'шт.', CAST(600.0000 AS Decimal(19, 4)), 15, N'Apollo', N'Максидом', N'наборы', 2, 9, N'Набор столовых приборов для торта Palette 7 предметов серебристый', N'H384H3.jpg')
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'H495H6', N'Набор чайных ложек', N'шт.', CAST(7000.0000 AS Decimal(19, 4)), 15, N'Mayer & Boch', N'LeroiMerlin', N'ножи', 2, 15, N'Набор стейковых ножей 4 пр. в деревянной коробке', NULL)
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'K437E6', N'Набор чайных ложек', N'шт.', CAST(530.0000 AS Decimal(19, 4)), 5, N'Apollo', N'Максидом', N'наборы', 3, 16, N'Набор вилок столовых APOLLO "Aurora" 3шт.', N'K437E6.jpg')
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'L593H5', N'Нож для стейка', N'шт.', CAST(1300.0000 AS Decimal(19, 4)), 25, N'Mayer & Boch', N'Максидом', N'наборы', 5, 14, N'Набор ножей Mayer & Boch, 4 шт', NULL)
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'N493G6', N'Ложка чайная', N'шт.', CAST(2550.0000 AS Decimal(19, 4)), 15, N'Smart Home', N'LeroiMerlin', N'наборы', 4, 6, N'Набор для сервировки сыра Select', NULL)
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'R836H6', N'Ложка', N'шт.', CAST(250.0000 AS Decimal(19, 4)), 5, N'Attribute', N'LeroiMerlin', N'ножи', 3, 16, N'Attribute Набор столовых ножей Baguette 2 предмета серебристый', N'R836H6.jpg')
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'S394J5', N'Набор для серверовки', N'шт.', CAST(170.0000 AS Decimal(19, 4)), 5, N'Attribute', N'LeroiMerlin', N'наборы', 3, 4, N'Attribute Набор чайных ложек Chaplet 3 предмета серебристый', NULL)
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'S395B5', N'набор ножей', N'шт.', CAST(600.0000 AS Decimal(19, 4)), 10, N'Apollo', N'LeroiMerlin', N'ножи', 4, 15, N'Нож для стейка 11,5 см серебристый/черный', NULL)
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'T793T4', N'набор ножей', N'шт.', CAST(250.0000 AS Decimal(19, 4)), 10, N'Attribute', N'LeroiMerlin', N'Ложки', 3, 16, N'Набор столовых ложек Baguette 3 предмета серебристый', N'T793T4.jpg')
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'V026J4', N'Набор десертных ложек', N'шт.', CAST(700.0000 AS Decimal(19, 4)), 15, N'Apollo', N'Максидом', N'наборы', 3, 9, N'абор ножей для стейка и пиццы Swiss classic 2 шт. желтый', NULL)
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'V403G6', N'Набор стейковых ножей', N'шт.', CAST(600.0000 AS Decimal(19, 4)), 15, N'Doria', N'Максидом', N'Ложки', 5, 24, N'Ложка чайная DORIA Eternum', NULL)
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'V727Y6', N'Столовые приборы для салата', N'шт.', CAST(3000.0000 AS Decimal(19, 4)), 10, N'Mayer & Boch', N'LeroiMerlin', N'Ложки', 4, 8, N'Набор десертных ложек на подставке Размер: 7*7*15 см', NULL)
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'W295Y5', N'Детский столовый набор', N'шт.', CAST(1100.0000 AS Decimal(19, 4)), 15, N'Attribute', N'Максидом', N'наборы', 2, 16, N'Набор сервировочный для торта "Розанна"', NULL)
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'W405G6', N'Набор столовых приборов', N'шт.', CAST(1300.0000 AS Decimal(19, 4)), 25, N'Attribute', N'LeroiMerlin', N'наборы', 3, 4, N'Набор сервировочных столовых вилок Цветы', NULL)
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductCurrentDiscount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'А112Т4', N'Сервировочный набор для торта', N'шт.', CAST(1600.0000 AS Decimal(19, 4)), 30, N'Davinci', N'Максидом', N'Вилки', 2, 6, N'Набор столовых вилок Davinci, 20 см 6 шт.', N'А112Т4.jpg')
GO
SET IDENTITY_INSERT [dbo].[Role] ON 
GO
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Клиент')
GO
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'Менеджер')
GO
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (3, N'Администратор')
GO
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (1, N'Ефремов ', N'Сергей', N'Пантелеймонович', N'loginDEppn2018', N'6}i+FD', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (2, N'Родионова ', N'Тамара', N'Валентиновна', N'loginDElqb2018', N'RNynil', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (3, N'Миронова ', N'Галина', N'Улебовна', N'loginDEydn2018', N'34I}X9', 2)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (4, N'Сидоров ', N'Роман', N'Иринеевич', N'loginDEijg2018', N'4QlKJW', 2)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (5, N'Ситников ', N'Парфений', N'Всеволодович', N'loginDEdpy2018', N'MJ0W|f', 2)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (6, N'Никонов ', N'Роман', N'Геласьевич', N'loginDEwdm2018', N'&PynqU', 2)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (7, N'Щербаков ', N'Владимир', N'Матвеевич', N'loginDEdup2018', N'JM+2{s', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (8, N'Кулаков ', N'Мартын', N'Михаилович', N'loginDEhbm2018', N'9aObu4', 2)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (9, N'Сазонова ', N'Оксана', N'Лаврентьевна', N'loginDExvq2018', N'hX0wJz', 3)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (10, N'Архипов ', N'Варлам', N'Мэлорович', N'loginDErks2018', N'LQNSjo', 2)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (11, N'Устинова ', N'Ираида', N'Мэлоровна', N'loginDErvb2018', N'ceAf&R', 3)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (12, N'Лукин ', N'Георгий', N'Альбертович', N'loginDEulo2018', N'hFMG23', 3)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (13, N'Кононов ', N'Эдуард', N'Валентинович', N'loginDEgfw2018', N'3c2Ic1', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (14, N'Орехова ', N'Клавдия', N'Альбертовна', N'loginDEmxb2018', N'ZPXcRS', 2)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (15, N'Яковлев ', N'Яков', N'Эдуардович', N'loginDEgeq2018', N'&&Eim0', 2)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (16, N'Воронов ', N'Мэлс', N'Семёнович', N'loginDEkhj2018', N'Pbc0t{', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (17, N'Вишнякова ', N'Ия', N'Данииловна', N'loginDEliu2018', N'32FyTl', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (18, N'Третьяков ', N'Фёдор', N'Вадимович', N'loginDEsmf2018', N'{{O2QG', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (19, N'Макаров ', N'Максим', N'Ильяович', N'loginDEutd2018', N'GbcJvC', 2)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (20, N'Шубина ', N'Маргарита', N'Анатольевна', N'loginDEpgh2018', N'YV2lvh', 2)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (21, N'Блинова ', N'Ангелина', N'Владленовна', N'loginDEvop2018', N'pBP8rO', 2)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (22, N'Воробьёв ', N'Владлен', N'Фролович', N'loginDEwjo2018', N'EQaD|d', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (23, N'Сорокина ', N'Прасковья', N'Фёдоровна', N'loginDEbur2018', N'aZKGeI', 2)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (24, N'Давыдов ', N'Яков', N'Антонович', N'loginDEszw2018', N'EGU{YE', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (25, N'Рыбакова ', N'Евдокия', N'Анатольевна', N'loginDExsu2018', N'*2RMsp', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (26, N'Маслов ', N'Геннадий', N'Фролович', N'loginDEztn2018', N'nJBZpU', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (27, N'Цветкова ', N'Элеонора', N'Аристарховна', N'loginDEtmn2018', N'UObB}N', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (28, N'Евдокимов ', N'Ростислав', N'Александрович', N'loginDEhep2018', N'SwRicr', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (29, N'Никонова ', N'Венера', N'Станиславовна', N'loginDEevr2018', N'zO5l}l', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (30, N'Громов ', N'Егор', N'Антонович', N'loginDEnpa2018', N'M*QLjf', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (31, N'Суворова ', N'Валерия', N'Борисовна', N'loginDEgyt2018', N'Pav+GP', 3)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (32, N'Мишина ', N'Елизавета', N'Романовна', N'loginDEbrr2018', N'Z7L|+i', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (33, N'Зимина ', N'Ольга', N'Аркадьевна', N'loginDEyoo2018', N'UG1BjP', 3)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (34, N'Игнатьев ', N'Игнатий', N'Антонинович', N'loginDEaob2018', N'3fy+3I', 3)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (35, N'Пахомова ', N'Зинаида', N'Витальевна', N'loginDEwtz2018', N'&GxSST', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (36, N'Устинов ', N'Владимир', N'Федосеевич', N'loginDEctf2018', N'sjt*3N', 3)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (37, N'Кулаков ', N'Мэлор', N'Вячеславович', N'loginDEipm2018', N'MAZl6|', 2)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (38, N'Сазонов ', N'Авксентий', N'Брониславович', N'loginDEjoi2018', N'o}C4jv', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (39, N'Бурова ', N'Наина', N'Брониславовна', N'loginDEwap2018', N'4hny7k', 2)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (40, N'Фадеев ', N'Демьян', N'Федосеевич', N'loginDEaxm2018', N'BEc3xq', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (41, N'Бобылёва ', N'Дарья', N'Якуновна', N'loginDEsmq2018', N'ATVmM7', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (42, N'Виноградов ', N'Созон', N'Арсеньевич', N'loginDEeur2018', N'n4V{wP', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (43, N'Гордеев ', N'Владлен', N'Ефимович', N'loginDEvke2018', N'WQLXSl', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (44, N'Иванова ', N'Зинаида', N'Валерьевна', N'loginDEvod2018', N'0EW93v', 2)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (45, N'Гусев ', N'Руслан', N'Дамирович', N'loginDEjaw2018', N'h6z&Ky', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (46, N'Маслов ', N'Дмитрий', N'Иванович', N'loginDEpdp2018', N'8NvRfC', 2)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (47, N'Антонова ', N'Ульяна', N'Семёновна', N'loginDEjpp2018', N'oMOQq3', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (48, N'Орехова ', N'Людмила', N'Владимировна', N'loginDEkiy2018', N'BQzsts', 2)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (49, N'Авдеева ', N'Жанна', N'Куприяновна', N'loginDEhmn2018', N'a|Iz|7', 2)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (50, N'Кузнецов ', N'Фрол', N'Варламович', N'loginDEfmn2018', N'cw3|03', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (52, N'Ситникова', N'Эмилия', N'Степановна', N'login232131rf', N'frgr233', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (53, N'Воронцова', N'Виктория', N'Саввична', N'loginDrf321', N'jfhgbr23', 2)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (54, N'Егоров', N'Артём', N'Евгеньевич', N'loginfgkrg', N'jfhgr23', 3)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (55, N'Софронов ', N'Ярослав', N'Игоревич', N'loginGtfr', N'jgtrg23', 1)
GO
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_OrderPickupPoint] FOREIGN KEY([OrderPickupPoint])
REFERENCES [dbo].[OrderPickupPoint] ([OrderPickupPoint])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_OrderPickupPoint]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK__OrderProd__Order__2C3393D0] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK__OrderProd__Order__2C3393D0]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK__OrderProd__Produ__2D27B809] FOREIGN KEY([ProductArticleNumber])
REFERENCES [dbo].[Product] ([ProductArticleNumber])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK__OrderProd__Produ__2D27B809]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([UserRole])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([UserRole])
REFERENCES [dbo].[Role] ([RoleID])
GO
/****** Object:  StoredProcedure [dbo].[Add_Product]    Script Date: 09.12.23 Сб 12:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Add_Product]
@ProductArticleNumber nvarchar(255),
@ProductName nvarchar(MAX),
@ProductUnit nvarchar(50),
@ProductCost decimal(19, 4),
@ProductDiscountAmount tinyint,
@ProductManufacturer nvarchar(MAX),
@ProductProvider nvarchar(50),
@ProductCategory nvarchar(MAX),
@ProductCurrentDiscount int,
@ProductQuantityInStock int,
@ProductDescription nvarchar(MAX)

as 
begin
insert into Product(ProductArticleNumber,	ProductName,	ProductUnit,	ProductCost,	ProductDiscountAmount,	ProductManufacturer,	ProductProvider,	ProductCategory,	ProductCurrentDiscount,	ProductQuantityInStock,	ProductDescription) 
values(@ProductArticleNumber,	@ProductName,	@ProductUnit,	@ProductCost,	@ProductDiscountAmount,	@ProductManufacturer,	@ProductProvider,	@ProductCategory,	@ProductCurrentDiscount,	@ProductQuantityInStock,	@ProductDescription)
end
GO
/****** Object:  StoredProcedure [dbo].[Change_Product]    Script Date: 09.12.23 Сб 12:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Change_Product]
@ProductArticleNumber nvarchar(255),
@ProductName nvarchar(MAX),
@ProductUnit nvarchar(50),
@ProductCost decimal(19, 4),
@ProductDiscountAmount tinyint,
@ProductManufacturer nvarchar(MAX),
@ProductProvider nvarchar(50),
@ProductCategory nvarchar(MAX),
@ProductCurrentDiscount int,
@ProductQuantityInStock int,
@ProductDescription nvarchar(MAX)
as 
begin
update Product
set 
ProductArticleNumber=@ProductArticleNumber,
ProductName = @ProductName,
ProductUnit = @ProductUnit,
ProductCost = @ProductCost,
ProductDiscountAmount = @ProductDiscountAmount,
ProductManufacturer = @ProductManufacturer,
ProductProvider = @ProductProvider,
ProductCategory = @ProductCategory,
ProductCurrentDiscount = @ProductCurrentDiscount,
ProductQuantityInStock = @ProductQuantityInStock,
ProductDescription = @ProductDescription
where ProductArticleNumber = @ProductArticleNumber
end
GO
/****** Object:  StoredProcedure [dbo].[DELETE_Product]    Script Date: 09.12.23 Сб 12:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[Login]    Script Date: 27.04.23 Чт 05:18 ******/
CREATE procedure [dbo].[DELETE_Product]
@ProductAticle nvarchar(255)

AS
BEGIN
Delete  
FROM Product 
Where [ProductArticleNumber] = @ProductAticle;
end
GO
/****** Object:  StoredProcedure [dbo].[Login]    Script Date: 09.12.23 Сб 12:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[Login]
@logins nvarchar(MAX),
@passwords nvarchar(MAX)

AS
BEGIN
SELECT * 
FROM [dbo].[User]
Where BINARY_CHECKSUM(UserLogin) = BINARY_CHECKSUM(@logins) AND BINARY_CHECKSUM(UserPassword) = BINARY_CHECKSUM(@passwords)
end
GO
/****** Object:  StoredProcedure [dbo].[OrderAdd]    Script Date: 09.12.23 Сб 12:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[OrderAdd]
	-- Add the parameters for the stored procedure here
	@OrderID int output,
	@OrderDate datetime,
	@OrderDeliveryDate datetime,
	@OrderPickupPoint int,
	@OrderCode int,
	@OrderStatus nvarchar (max),
	@UserID int,
	@error_str varchar(100) output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	

    -- Insert statements for procedure here
	if exists (select top 1 1 from OrderID
				where OrderDate=@OrderDate and OrderDeliveryDate=@OrderDeliveryDate and OrderPickupPoint=@OrderPickupPoint and OrderCode=@OrderCode and OrderStatus=@OrderStatus and UserID=@UserID)
begin
set @error_str='Такая запись уже существует.'
return -1
end

	Insert into [Order] (OrderDate, OrderDeliveryDate, OrderPickupPoint, OrderCode, OrderStatus, UserID) 
	Values (@OrderDate, @OrderDeliveryDate, @OrderPickupPoint, @OrderCode, @OrderStatus, @UserID) 
	set @OrderID=@@Identity
set @error_str='Запись успешно добавлена.'
RETURN 0
	 
END
GO
/****** Object:  StoredProcedure [dbo].[OrderDelete]    Script Date: 09.12.23 Сб 12:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[OrderDelete]
	-- Add the parameters for the stored procedure here
	@OrderID int,
	@err varchar (200) output
AS
IF EXISTS (select top 1 1 from [OrderProduct] WHERE OrderID=@OrderID)
begin
	set @err = 'Ошибка удаления данных!'
	return -1
end
else
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete FROM [Order] WHERE OrderID=@OrderID
	set @err = 'Запись удалена'
	RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[OrderUpdate]    Script Date: 09.12.23 Сб 12:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[OrderUpdate] 
	-- Add the parameters for the stored procedure here
	@OrderID int,
	@OrderDate datetime,
	@OrderDeliveryDate datetime,
	@OrderPickupPoint int,
	@OrderCode int,
	@OrderStatus nvarchar (max),
	@UserID int,
	@error_str nvarchar (100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
if exists (select top 1 1 
		from [Order]
		where [OrderID]=@OrderID and
			[OrderDate]=@OrderDate and
			[OrderDeliveryDate]=@OrderDeliveryDate and
			[OrderPickupPoint]=@OrderPickupPoint and
			[OrderCode]=@OrderCode and
			[OrderStatus]=@OrderStatus and
			[UserID]=@UserID )
		begin
	  return 0
	  end

if exists (select top 1 1 
		from [Order]
		where [OrderID]<>@OrderID and
			[OrderDate]=@OrderDate and
			[OrderDeliveryDate]=@OrderDeliveryDate and
			[OrderPickupPoint]=@OrderPickupPoint and
			[OrderCode]=@OrderCode and
			[OrderStatus]=@OrderStatus and
			[UserID]=@UserID )
		begin
		set @error_str ='Такая запись уже существует.'
	  return -1
	  end

UPDATE [Order]
SET OrderDate=@OrderDate,
	OrderDeliveryDate=@OrderDeliveryDate,
    OrderPickupPoint=@OrderPickupPoint,
	OrderCode=@OrderCode,
	OrderStatus=@OrderStatus,
	UserID=@UserID
WHERE OrderID=@OrderID
set @error_str ='Запись успешно изменена.'
RETURN 0
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Product"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 260
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "User"
            Begin Extent = 
               Top = 208
               Left = 818
               Bottom = 338
               Right = 992
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Order"
            Begin Extent = 
               Top = 18
               Left = 597
               Bottom = 148
               Right = 782
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "OrderProduct"
            Begin Extent = 
               Top = 214
               Left = 290
               Bottom = 327
               Right = 499
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'_Product User'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'_Product User'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Product"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 167
               Right = 298
            End
            DisplayFlags = 280
            TopColumn = 8
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 3060
         Alias = 3690
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Product'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Product'
GO
USE [master]
GO
ALTER DATABASE [TradeNationDB] SET  READ_WRITE 
GO
