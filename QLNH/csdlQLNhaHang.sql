USE [master]
GO
/****** Object:  Database [QLNHAHANG2]    Script Date: 12/25/2018 10:23:52 PM ******/
CREATE DATABASE [QLNHAHANG2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLNHAHANG2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSL\MSSQL\DATA\QLNHAHANG2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLNHAHANG2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSL\MSSQL\DATA\QLNHAHANG2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [QLNHAHANG2] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLNHAHANG2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLNHAHANG2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLNHAHANG2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLNHAHANG2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLNHAHANG2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLNHAHANG2] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLNHAHANG2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLNHAHANG2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLNHAHANG2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLNHAHANG2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLNHAHANG2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLNHAHANG2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLNHAHANG2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLNHAHANG2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLNHAHANG2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLNHAHANG2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLNHAHANG2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLNHAHANG2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLNHAHANG2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLNHAHANG2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLNHAHANG2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLNHAHANG2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLNHAHANG2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLNHAHANG2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLNHAHANG2] SET  MULTI_USER 
GO
ALTER DATABASE [QLNHAHANG2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLNHAHANG2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLNHAHANG2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLNHAHANG2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLNHAHANG2] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'QLNHAHANG2', N'ON'
GO
ALTER DATABASE [QLNHAHANG2] SET QUERY_STORE = OFF
GO
USE [QLNHAHANG2]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [QLNHAHANG2]
GO
/****** Object:  User [hiepoccho]    Script Date: 12/25/2018 10:23:52 PM ******/
CREATE USER [hiepoccho] FOR LOGIN [hiepoccho] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [hiepoccho]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 12/25/2018 10:23:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[UserName] [varchar](50) NOT NULL,
	[PassWords] [varchar](50) NULL,
	[Type] [int] NULL,
	[IdEmployee] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 12/25/2018 10:23:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdTable] [int] NULL,
	[DateCheckIn] [date] NULL,
	[Status] [int] NULL,
	[Total] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillInfo]    Script Date: 12/25/2018 10:23:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillInfo](
	[IdBill] [int] NOT NULL,
	[IdMenu] [int] NOT NULL,
	[Count] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdBill] ASC,
	[IdMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 12/25/2018 10:23:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Age] [int] NULL,
	[Address] [nvarchar](50) NULL,
	[PhoneNumber] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 12/25/2018 10:23:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Price] [int] NULL,
	[Status] [nvarchar](5) NULL,
	[IdCategory] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuCategory]    Script Date: 12/25/2018 10:23:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TableMenu]    Script Date: 12/25/2018 10:23:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableMenu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TableName] [nvarchar](100) NULL,
	[Status] [int] NULL,
	[Area] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([UserName], [PassWords], [Type], [IdEmployee]) VALUES (N'long', N'C5399149198A12F92E0DD4C3F22FC001', 1, NULL)
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([Id], [Name], [Age], [Address], [PhoneNumber]) VALUES (2, N'Phạm Ðức Long', 23, N'Học viện Kỹ thuật Quân sự', N'0983481417')
INSERT [dbo].[Employee] ([Id], [Name], [Age], [Address], [PhoneNumber]) VALUES (3, N'Hoàng Viết Thái Hiệp', 22, N'Học viện Kỹ thuật Quân sự', N'0983481417')
INSERT [dbo].[Employee] ([Id], [Name], [Age], [Address], [PhoneNumber]) VALUES (4, N'Phan Đức Dũng', 22, N'Học viện Kỹ thuật Quân sự', N'0983481417')
INSERT [dbo].[Employee] ([Id], [Name], [Age], [Address], [PhoneNumber]) VALUES (5, N'Đỗ Đức Anh', 22, N'Học viện Kỹ thuật Quân sự', N'0983481417')
INSERT [dbo].[Employee] ([Id], [Name], [Age], [Address], [PhoneNumber]) VALUES (6, N'Nguyễn Hoàng Trí', 22, N'Học viện Kỹ thuật Quân sự', N'0983481417')
INSERT [dbo].[Employee] ([Id], [Name], [Age], [Address], [PhoneNumber]) VALUES (7, N'Tăng Đại Dương', 22, N'Học viện Kỹ thuật Quân sự', N'0983481417')
INSERT [dbo].[Employee] ([Id], [Name], [Age], [Address], [PhoneNumber]) VALUES (8, N'Nguyễn Đình Hoàng', 22, N'Học viện Kỹ thuật Quân sự', N'0983481417')
INSERT [dbo].[Employee] ([Id], [Name], [Age], [Address], [PhoneNumber]) VALUES (9, N'Nguyễn Anh Việt', 22, N'Học viện Kỹ thuật Quân sự', N'0983481417')
INSERT [dbo].[Employee] ([Id], [Name], [Age], [Address], [PhoneNumber]) VALUES (10, N'Nguyễn Quý Thắng', 22, N'Học viện Kỹ thuật Quân sự', N'0983481417')
SET IDENTITY_INSERT [dbo].[Employee] OFF
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([Id], [Name], [Price], [Status], [IdCategory]) VALUES (1, N'Khoai tây chiên', 15000, N'Còn', 1)
INSERT [dbo].[Menu] ([Id], [Name], [Price], [Status], [IdCategory]) VALUES (2, N'Ngô chiên', 10000, N'Còn', 1)
INSERT [dbo].[Menu] ([Id], [Name], [Price], [Status], [IdCategory]) VALUES (3, N'Khoai lang kén', 20000, N'Còn', 1)
INSERT [dbo].[Menu] ([Id], [Name], [Price], [Status], [IdCategory]) VALUES (4, N'Thịt bò xào', 100000, N'Còn', 2)
INSERT [dbo].[Menu] ([Id], [Name], [Price], [Status], [IdCategory]) VALUES (5, N'Cá rán', 60000, N'Còn', 2)
INSERT [dbo].[Menu] ([Id], [Name], [Price], [Status], [IdCategory]) VALUES (6, N'Thịt lợn quay', 50000, N'Còn', 2)
INSERT [dbo].[Menu] ([Id], [Name], [Price], [Status], [IdCategory]) VALUES (7, N'Thịt lợn nướng', 80000, N'Còn', 2)
INSERT [dbo].[Menu] ([Id], [Name], [Price], [Status], [IdCategory]) VALUES (8, N'Thịt dê xào lăn', 150000, N'Còn', 2)
INSERT [dbo].[Menu] ([Id], [Name], [Price], [Status], [IdCategory]) VALUES (9, N'Đậu phụ nhồi thịt', 30000, N'Còn', 2)
INSERT [dbo].[Menu] ([Id], [Name], [Price], [Status], [IdCategory]) VALUES (11, N'Thịt trâu luộc', 200000, N'Còn', 2)
INSERT [dbo].[Menu] ([Id], [Name], [Price], [Status], [IdCategory]) VALUES (12, N'Thịt gà luộc', 100000, N'Còn', 2)
INSERT [dbo].[Menu] ([Id], [Name], [Price], [Status], [IdCategory]) VALUES (13, N'Thịt gà rang', 100000, N'Còn', 2)
INSERT [dbo].[Menu] ([Id], [Name], [Price], [Status], [IdCategory]) VALUES (14, N'Cá sốt cà chua', 70000, N'Còn', 2)
INSERT [dbo].[Menu] ([Id], [Name], [Price], [Status], [IdCategory]) VALUES (15, N'Thịt bò xào lăn', 85000, N'Còn', 2)
INSERT [dbo].[Menu] ([Id], [Name], [Price], [Status], [IdCategory]) VALUES (16, N'Rau muống luộc', 15000, N'Còn', 2)
INSERT [dbo].[Menu] ([Id], [Name], [Price], [Status], [IdCategory]) VALUES (17, N'Rau bắp cải luộc', 15000, N'Còn', 2)
INSERT [dbo].[Menu] ([Id], [Name], [Price], [Status], [IdCategory]) VALUES (18, N'Rau muống xào thịt', 30000, N'Còn', 2)
INSERT [dbo].[Menu] ([Id], [Name], [Price], [Status], [IdCategory]) VALUES (19, N'Táo', 20000, N'Còn', 3)
INSERT [dbo].[Menu] ([Id], [Name], [Price], [Status], [IdCategory]) VALUES (20, N'Lê', 20000, N'Còn', 3)
INSERT [dbo].[Menu] ([Id], [Name], [Price], [Status], [IdCategory]) VALUES (21, N'Ổi', 20000, N'Còn', 3)
INSERT [dbo].[Menu] ([Id], [Name], [Price], [Status], [IdCategory]) VALUES (22, N'Chuối', 20000, N'Còn', 3)
INSERT [dbo].[Menu] ([Id], [Name], [Price], [Status], [IdCategory]) VALUES (23, N'Dưa hấu', 20000, N'Còn', 3)
INSERT [dbo].[Menu] ([Id], [Name], [Price], [Status], [IdCategory]) VALUES (24, N'Thanh long', 20000, N'Còn', 3)
INSERT [dbo].[Menu] ([Id], [Name], [Price], [Status], [IdCategory]) VALUES (25, N'Coca cola', 10000, N'Còn', 4)
INSERT [dbo].[Menu] ([Id], [Name], [Price], [Status], [IdCategory]) VALUES (26, N'Pepsi', 10000, N'Còn', 4)
INSERT [dbo].[Menu] ([Id], [Name], [Price], [Status], [IdCategory]) VALUES (27, N'Nước cam', 10000, N'Còn', 4)
INSERT [dbo].[Menu] ([Id], [Name], [Price], [Status], [IdCategory]) VALUES (28, N'Nước chanh', 10000, N'Còn', 4)
INSERT [dbo].[Menu] ([Id], [Name], [Price], [Status], [IdCategory]) VALUES (29, N'Latte', 10000, N'Còn', 4)
INSERT [dbo].[Menu] ([Id], [Name], [Price], [Status], [IdCategory]) VALUES (30, N'7 Up', 10000, N'Còn', 4)
SET IDENTITY_INSERT [dbo].[Menu] OFF
SET IDENTITY_INSERT [dbo].[MenuCategory] ON 

INSERT [dbo].[MenuCategory] ([Id], [Name]) VALUES (1, N'Khai vị')
INSERT [dbo].[MenuCategory] ([Id], [Name]) VALUES (2, N'Món chính')
INSERT [dbo].[MenuCategory] ([Id], [Name]) VALUES (3, N'Tráng miệng')
INSERT [dbo].[MenuCategory] ([Id], [Name]) VALUES (4, N'Đồ uống')
SET IDENTITY_INSERT [dbo].[MenuCategory] OFF
SET IDENTITY_INSERT [dbo].[TableMenu] ON 

INSERT [dbo].[TableMenu] ([Id], [TableName], [Status], [Area]) VALUES (1, N'Bàn 1', 0, N'Tầng 1')
INSERT [dbo].[TableMenu] ([Id], [TableName], [Status], [Area]) VALUES (2, N'Bàn 2', 10, N'Tầng 1')
INSERT [dbo].[TableMenu] ([Id], [TableName], [Status], [Area]) VALUES (3, N'Bàn 3', 11, N'Tầng 1')
INSERT [dbo].[TableMenu] ([Id], [TableName], [Status], [Area]) VALUES (4, N'Bàn 4', 0, N'Tầng 1')
INSERT [dbo].[TableMenu] ([Id], [TableName], [Status], [Area]) VALUES (5, N'Bàn 5', 0, N'Tầng 1')
INSERT [dbo].[TableMenu] ([Id], [TableName], [Status], [Area]) VALUES (6, N'Bàn 6', 0, N'Tầng 1')
INSERT [dbo].[TableMenu] ([Id], [TableName], [Status], [Area]) VALUES (7, N'Bàn 7', 0, N'Tầng 1')
INSERT [dbo].[TableMenu] ([Id], [TableName], [Status], [Area]) VALUES (8, N'Bàn 8', 0, N'Tầng 1')
INSERT [dbo].[TableMenu] ([Id], [TableName], [Status], [Area]) VALUES (9, N'Bàn 9', 0, N'Tầng 1')
INSERT [dbo].[TableMenu] ([Id], [TableName], [Status], [Area]) VALUES (10, N'Bàn 10', 0, N'Tầng 1')
SET IDENTITY_INSERT [dbo].[TableMenu] OFF
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([IdEmployee])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD FOREIGN KEY([IdTable])
REFERENCES [dbo].[TableMenu] ([Id])
GO
ALTER TABLE [dbo].[BillInfo]  WITH CHECK ADD FOREIGN KEY([IdBill])
REFERENCES [dbo].[Bill] ([Id])
GO
ALTER TABLE [dbo].[BillInfo]  WITH CHECK ADD FOREIGN KEY([IdMenu])
REFERENCES [dbo].[Menu] ([Id])
GO
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD FOREIGN KEY([IdCategory])
REFERENCES [dbo].[MenuCategory] ([Id])
GO
/****** Object:  StoredProcedure [dbo].[ChuyenBan]    Script Date: 12/25/2018 10:23:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Proc [dbo].[ChuyenBan](@idOldTable int , @idNewTable int )
as 
begin
	declare @idBill int 
	select @idBill=Status from TableMenu where Id=@idOldTable
	update TableMenu set Status=0 where Id=@idOldTable
	
	update TableMenu set Status=@idBill where Id=@idNewTable
	
	update Bill set IdTable=@idNewTable where Id=@idBill 
end
GO
/****** Object:  StoredProcedure [dbo].[thanhToan]    Script Date: 12/25/2018 10:23:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


 -- proc thanh toan

 create proc [dbo].[thanhToan](@idTable int, @idBill int)
 as begin
	update TableMenu set Status=0 where id= @idTable
	update Bill set Status = 1 where id=@idBill
 end
GO
/****** Object:  StoredProcedure [dbo].[themMon]    Script Date: 12/25/2018 10:23:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 -- proc them mon

 create proc [dbo].[themMon](@idBill int ,@idMenu int, @SoLuong int)
 as begin
	if @idMenu in ( select IdMenu from BillInfo where IdBill=@idBill)
	begin
		update BillInfo set Count= Count + @SoLuong where IdBill= @idBill and IdMenu=@idMenu
	end 
	else
	begin
		insert BillInfo (IdBill, IdMenu, Count) values (@idBill, @idMenu, @SoLuong)
	 
	end
 end

GO
USE [master]
GO
ALTER DATABASE [QLNHAHANG2] SET  READ_WRITE 
GO
