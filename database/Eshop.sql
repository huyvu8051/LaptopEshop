USE [master]
GO
/****** Object:  Database [EShop]    Script Date: 4/30/2021 12:01:21 PM ******/
CREATE DATABASE [EShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\EShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\EShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [EShop] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [EShop] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [EShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EShop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [EShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EShop] SET  MULTI_USER 
GO
ALTER DATABASE [EShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EShop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [EShop] SET QUERY_STORE = OFF
GO
USE [EShop]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 4/30/2021 12:01:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 4/30/2021 12:01:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 4/30/2021 12:01:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 4/30/2021 12:01:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 4/30/2021 12:01:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 4/30/2021 12:01:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carts]    Script Date: 4/30/2021 12:01:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carts](
	[UserId] [nvarchar](128) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_Carts] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 4/30/2021 12:01:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[NameVN] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 4/30/2021 12:01:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[UnitPrice] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Discount] [float] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 4/30/2021 12:01:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [nvarchar](128) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[Address] [nvarchar](60) NOT NULL,
	[Amount] [float] NOT NULL,
	[Description] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 4/30/2021 12:01:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](60) NOT NULL,
	[Image] [nvarchar](50) NOT NULL,
	[UnitPrice] [float] NOT NULL,
	[Discount] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
	[ProductDate] [date] NOT NULL,
	[Available] [bit] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202104070321008_InitialCreate', N'LaptopEshop.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5C5B6FE3B6127E3F40FF83A0A7F620B572E92EF604768BD449DAE0E48675B6E8DB82966847588954252A4D70D05FD687FEA4FE8533942859E245175BB19D628145440EBF190E87E47038F4DF7FFE35FEE1390CAC271C273E2513FB6874685B98B8D4F3C97262A76CF1ED07FB87EFBFFAD7F8C20B9FAD5F0ABA134E072D4932B11F198B4E1D27711F71889251E8BB314DE8828D5C1A3AC8A3CEF1E1E17F9CA3230703840D589635FE9812E68738FB80CF29252E8E588A821BEAE12011E55033CB50AD5B14E224422E9ED8D7286234BA481E6934CAA96DEB2CF0114832C3C1C2B61021942106729E7E4AF08CC5942C671114A0E0E125C240B740418285FCA72BF2AE5D393CE65D71560D0B28374D180D7B021E9D08DD3872F3B5346C97BA03ED5D8096D90BEF75A6C1897DE5E1ACE8230D400132C3D3691073E2897D53B2384BA25BCC4645C3510E791903DCEF34FE32AA221E589DDB1D94B6743C3AE4FF0EAC691AB034C613825316A3E0C0BA4FE781EFFE17BF3CD02F984C4E8EE68B930FEFDE23EFE4FD77F8E45DB5A7D057A0AB1540D17D4C231C836C7851F6DFB69C7A3B476E5836ABB4C9B502B604D3C2B66ED0F335264BF60813E6F8836D5DFACFD82B4A84717D223ECC2268C4E2143E6FD32040F30097F54E234FFE7F03D7E377EF07E17A8B9EFC6536F4127F983831CCAB8F38C86A93473FCAA7576DBC3F0BB2CB9886FCBB6E5F79EDE7194D639777861A491E50BCC4AC2EDDD859196F2793E650C39B7581BAFFA6CD2555CD5B4BCA3BB4CE4C28586C7B3614F2BE2EDFCE1677164530789969718D34199CBA598DA4D607568566653A475D4D874097FEC92BE14588FC6080A5B00317F042167E1CE2B2973F52303C447ACB7C8F92045602EF67943C36880E7F0E20FA0CBB690C063A63288C5E9DDBFD2325F8360DE7DCEEB7C76BB0A179F89D5E2297D1F882F0561BE35D53F70B4DD905F1CE11C39F985B00F2CF073FEC0E30883867AE8B93E4128C197B530A4E76017845D8C9716F38BE40EDDA159906C80FF5BE88B4947E2E4857FE889E42F1490C643ABFA449D46BBAF44937510B52B3A83945ABA882ACAFA81CAC9BA482D22C6846D02A674E3598A7978DD0F0AE5E06BBFFBEDE669BB7692DA8A871062B24FE09131CC332E6DD23C6704C5623D065DDD885B3900D1F67FAEA7B53C6E91714A443B35A6B36648BC0F0B32183DDFFD9908909C54FBEC7BD920E07A08218E03BD1EBCF56ED734E926CDBD3A1D6CD6D33DFCE1A609A2E6749425D3F9B059AD097085CD4E5071FCE6A8F62E4BD912321D03130749F6F7950027DB365A3BA23E738C00C5B676E1E1A9CA2C4459EAA46E890D743B06247D508B68A88D485FBB7C2132C1DC7BC11E287A00466AA4F983A2D7CE2FA110A5AB524B5ECB885F1BE973CE49A731C61C219B66AA20B737D00840B50F29106A54D4363A76271CD8668F05A4D63DEE6C2AEC65D894B6CC5265B7C67835D0AFFED550CB359635B30CE66957411C018CCDB85818AB34A5703900F2EFB66A0D289C960A0C2A5DA8A81D635B60303ADABE4CD19687E44ED3AFED27975DFCCB37E50DEFEB6DEA8AE1DD8664D1F7B669AB9EF096D18B4C0B16A9EE7735E899F99E67006728AF359225C5DD94438F80CB37AC866E5EF6AFD50A7194436A226C095A1B5808A6B40054899503D842B62798DD2092FA2076C11776B84156BBF045BB10115BB7A1D5A21345F9ACAC6D9E9F451F6ACB406C5C83B1D162A381A839017AF7AC73B28C514975515D3C517EEE30D573A2606A341412D9EAB4149456706D752619AED5AD239647D5CB28DB424B94F062D159D195C4BC246DB95A4710A7AB8051BA9A8BE850F34D98A4847B9DB94756327CF92120563C7904E35BE4151E4936525BD4A9458B33CB76AFAEDAC7FD2519863386EA2C93D2AA52D39311AA325966A8135487AE9C7093B470CCD118FF34CBD5021D3EEAD86E5BF6059DD3ED5412CF681829AFF2DA277EAE57D6DAF559D118171093D0CB9479385D135E3AF6F6EF1743714A05813B99FD2200D89D9C132B7CEEFEFAAEDF3121561EC48F22B0E94A22DC5CDADABBED3C0A89362A0412AFD97F507CA0C615277E17D56156EF248CD284580AA8A620A5AED6CE04C8E4CAFC1927DC4FE63D58AF03AF34A24A6540144514F8C4A6E830256A9EB8E5A4F3FA962D66BBA234A39265548A9AA8794D54C929A90D58AB5F00C1AD55374E7A0E68E54D1D5DAEEC89A2C922AB4A67A0D6C8DCC725D77544DA249155853DD1D7B9575222FA27BBC73194F2E6B6F5DF9E176B3BDCB80F13A2BE2305B5FE50EBF0A5429EE89256EE9153051BE97D6643CE1AD6D4D794C63336B326098579EDAED777DE169BCB23763D6AEB46B8B7BD395BE19AF9FCDBEAA6528073C99A4E45E1EF4A403DD581CAEDA1FD128A7AD9CC4B60A35C2C6FE92301C8E38C168F65B300D7CCC97F182E006117F811396A771D8C78747C7D23B9CFD7913E3248917680EA7A68731F531DB4246167942B1FB8862353F628377232B5025F47C453CFC3CB1FF97B53ACDA218FCAFACF8C0BA4A3E11FFB7142A1EE2145B7FA8F99EC3E4D1371FB2F6F4D54377AD5EFDFA396F7A60DDC530634EAD434997EB8C70FD2D442F69F2A61B48B3F60B89B73BA16ACF0FB4A8D28458FFB5C1DC6783BC3428A4FC3A44CFDFF4154DFB9A602344CD8B81A1F00651A1E945C03A58C6D7001E7CB2EC3540BFCEEA5F07AC239AF165804FFA83C9EF02BA2F4345CB1D6E359A33D13696A44CCFAD79D51B2559EE7A6F52D2AF379AE86A8A750FB80DD2A8D7B08C3796813CD8EEA849301E0C7B97A6FDEA59C5FB9248BC4AF1D86DFEF03653861BAE85FE5199C27B90DBA6C9D5D97D3EF0B66DCD14C7DDF3A4CA7E59BF7B666C22836BF7B9BDDB3636539877CF8DAD5706EF9ED9DAAEF6CF1D5B5AE72D74E7F9B86A6A91E13E46170B6ECBB7CD03E770C29F533082DCA3CC9F49EA13BC9A92535B18AE48CC4CCD9965326365E2287C158A66B6FDFA2A36FCC6CE0A9A66B6867CCC26DE62FD6FE42D689A791BB21C779129ACCD33D4656FB7AC634D49506F2933B8D6939644F4369FB5F172FD2D25020FA294DAEC31DC11BF9DBCDF415432E4D4E991E7AB5EF7C2DE59F96545D8BF137FB982E0BFB348B05BDB354B9A2BB2A0C5E62D49549048119A1BCC90075BEA59CCFC05721954F31873F6CE3B8BDBF19B8E39F6AEC85DCAA294419771380F6A012FEE0434F1CF9299EB328FEFA2EC274B86E80288E9F3D8FC1DF931F503AF94FB521313324070EF424474F958321ED95DBE9448B794740412EA2B9DA2071C460180257764869EF03AB281F95DE325725F5611401348FB40D4D53E3EF7D1324661223056EDE1136CD80B9FBFFF3F57FFCF6460540000, N'6.1.3-40302')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'd53fe4f4-5b97-45da-9f2f-3f176e02b01f', N'Admin')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'7089ccf7-3b0e-43f4-a74e-59a1eae0a9b1', N'd53fe4f4-5b97-45da-9f2f-3f176e02b01f')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'43dcdfb9-f5dc-4137-8c46-254abe261d1e', N'chungtacuahientai@gmail.com', 0, N'AC49AGbDXHvRhCFrWbpn5TTwKK3FpnUihAG4PomGI+ZokWVtFyQVosdI4pXMyZmstQ==', N'5b756ba6-c0e8-49ec-92e4-ebaf5246528b', NULL, 0, 0, NULL, 1, 0, N'chungtacuahientai@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'7089ccf7-3b0e-43f4-a74e-59a1eae0a9b1', N'Huyvu8051@gmail.com', 0, N'AL2H0LlWqC1b4mHRJr9sMhqbYS2RS8zHrcswQ7ion/WM9lQ4ITId22/lK8Xa/Heqiw==', N'75b30144-d754-4bd3-8292-ffb71862d737', NULL, 0, 0, NULL, 0, 0, N'Huyvu8051@gmail.com')
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (1, N'MSI', N'MSI')
INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (2, N'ACER', N'ACER')
INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (3, N'ASUS', N'ASUS')
INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (4, N'DELL', N'DELL')
INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (5, N'LENOVO', N'LENOVO')
INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (6, N'HP', N'HP')
INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (7, N'LG', N'LG')
INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (8, N'XIAOMI', N'XIAOMI')
INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (10, N'MACBOOK', N'MACBOOK')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (83, 36, 5, 11, 8, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (84, 36, 6, 12, 5, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (85, 37, 5, 11, 2, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (86, 37, 6, 12, 2, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (95, 42, 5, 11, 3, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (96, 42, 6, 12, 2, 0)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [CustomerId], [OrderDate], [Address], [Amount], [Description]) VALUES (36, N'43dcdfb9-f5dc-4137-8c46-254abe261d1e', CAST(N'2021-04-27T17:40:06.987' AS DateTime), N'địa chỉ 1', 148, N'ghi chú 1')
INSERT [dbo].[Orders] ([Id], [CustomerId], [OrderDate], [Address], [Amount], [Description]) VALUES (37, N'43dcdfb9-f5dc-4137-8c46-254abe261d1e', CAST(N'2021-04-27T17:43:22.567' AS DateTime), N'người theo hương hoa', 46, N'Mây mù giằng lối')
INSERT [dbo].[Orders] ([Id], [CustomerId], [OrderDate], [Address], [Amount], [Description]) VALUES (42, N'7089ccf7-3b0e-43f4-a74e-59a1eae0a9b1', CAST(N'2021-04-27T20:13:41.530' AS DateTime), N'dsfsf', 57, N'sdfds')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description]) VALUES (1, N'MSI GL65 9SDK 054VN', N'/Asset/img/product/files/3.png', 6999, 12, 645, CAST(N'2022-12-01' AS Date), 1, 1, N'<p>54335</p>
')
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description]) VALUES (2, N'MSI GT76 TITAN DT 9SF ', N'/Asset/img/product/files/GT76-TITAN.jpg', 104990000, 12, 12, CAST(N'2022-12-01' AS Date), 1, 1, N'<p>ewaffsfdaf</p>

<h2>M&ocirc; tả</h2>

<p><a href="https://xgear.vn/laptop-gaming-msi-gt76-titan-dt-9sg/"><strong>GT76 Titan DT 9SF</strong></a></p>

<p><strong>VGA:</strong>&nbsp;RTX2070 8GB |&nbsp;<strong>CPU:</strong>&nbsp;Intel Core i9 9900K |&nbsp;<strong>RAM:</strong>&nbsp;64GB |&nbsp;<strong>HDD:</strong>&nbsp;1TB |&nbsp;<strong>SSD:</strong>&nbsp;1TB|&nbsp;<strong>LCD:</strong>&nbsp;17.3&rdquo; FHD 144Hz</p>

<p><img alt="" data-ll-status="loaded" height="729" sizes="(max-width: 1904px) 100vw, 1904px" src="https://xgear.vn/wp-content/uploads/2019/06/GT76-6-1.jpg" srcset="https://xgear.vn/wp-content/uploads/2019/06/GT76-6-1.jpg 1904w, https://xgear.vn/wp-content/uploads/2019/06/GT76-6-1-300x115.jpg 300w, https://xgear.vn/wp-content/uploads/2019/06/GT76-6-1-768x294.jpg 768w, https://xgear.vn/wp-content/uploads/2019/06/GT76-6-1-1024x392.jpg 1024w, https://xgear.vn/wp-content/uploads/2019/06/GT76-6-1-193x74.jpg 193w, https://xgear.vn/wp-content/uploads/2019/06/GT76-6-1-568x217.jpg 568w" width="1904" /></p>

<table>
	<tbody>
		<tr>
			<td><img alt="" data-ll-status="loaded" height="617" sizes="(max-width: 949px) 100vw, 949px" src="https://xgear.vn/wp-content/uploads/2019/06/GT76-7-1.jpg" srcset="https://xgear.vn/wp-content/uploads/2019/06/GT76-7-1.jpg 949w, https://xgear.vn/wp-content/uploads/2019/06/GT76-7-1-300x195.jpg 300w, https://xgear.vn/wp-content/uploads/2019/06/GT76-7-1-768x499.jpg 768w, https://xgear.vn/wp-content/uploads/2019/06/GT76-7-1-370x240.jpg 370w, https://xgear.vn/wp-content/uploads/2019/06/GT76-7-1-193x125.jpg 193w, https://xgear.vn/wp-content/uploads/2019/06/GT76-7-1-568x369.jpg 568w" width="949" /></td>
			<td><img alt="" data-ll-status="loaded" height="617" sizes="(max-width: 949px) 100vw, 949px" src="https://xgear.vn/wp-content/uploads/2019/06/GT76-8-1.jpg" srcset="https://xgear.vn/wp-content/uploads/2019/06/GT76-8-1.jpg 949w, https://xgear.vn/wp-content/uploads/2019/06/GT76-8-1-300x195.jpg 300w, https://xgear.vn/wp-content/uploads/2019/06/GT76-8-1-768x499.jpg 768w, https://xgear.vn/wp-content/uploads/2019/06/GT76-8-1-370x240.jpg 370w, https://xgear.vn/wp-content/uploads/2019/06/GT76-8-1-193x125.jpg 193w, https://xgear.vn/wp-content/uploads/2019/06/GT76-8-1-568x369.jpg 568w" width="949" /></td>
			<td><img alt="" data-ll-status="loaded" height="617" sizes="(max-width: 949px) 100vw, 949px" src="https://xgear.vn/wp-content/uploads/2019/06/GT76-9-1.jpg" srcset="https://xgear.vn/wp-content/uploads/2019/06/GT76-9-1.jpg 949w, https://xgear.vn/wp-content/uploads/2019/06/GT76-9-1-300x195.jpg 300w, https://xgear.vn/wp-content/uploads/2019/06/GT76-9-1-768x499.jpg 768w, https://xgear.vn/wp-content/uploads/2019/06/GT76-9-1-370x240.jpg 370w, https://xgear.vn/wp-content/uploads/2019/06/GT76-9-1-193x125.jpg 193w, https://xgear.vn/wp-content/uploads/2019/06/GT76-9-1-568x369.jpg 568w" width="949" /></td>
			<td><img alt="" data-ll-status="loaded" height="617" sizes="(max-width: 949px) 100vw, 949px" src="https://xgear.vn/wp-content/uploads/2019/06/GT76-10-1.jpg" srcset="https://xgear.vn/wp-content/uploads/2019/06/GT76-10-1.jpg 949w, https://xgear.vn/wp-content/uploads/2019/06/GT76-10-1-300x195.jpg 300w, https://xgear.vn/wp-content/uploads/2019/06/GT76-10-1-768x499.jpg 768w, https://xgear.vn/wp-content/uploads/2019/06/GT76-10-1-370x240.jpg 370w, https://xgear.vn/wp-content/uploads/2019/06/GT76-10-1-193x125.jpg 193w, https://xgear.vn/wp-content/uploads/2019/06/GT76-10-1-568x369.jpg 568w" width="949" /></td>
		</tr>
	</tbody>
</table>

<p><iframe __idm_frm__="794" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen="" data-ll-status="loaded" data-rocket-lazyload="fitvidscompatible" frameborder="0" height="529" loading="lazy" src="https://www.youtube.com/embed/PQDsYhfIP8A?feature=oembed" width="100%"></iframe></p>

<h2>BORN OF THE NEW TITAN</h2>

<p><strong>GT76 Titan DT 9SF</strong>&nbsp;l&agrave; chiếc laptop Titan mạnh mẽ nhất từ trước đến nay. Với thiết kế được lấy cảm hứng từ những chiếc si&ecirc;u xe. Vỏ nh&ocirc;m sắp xếp theo kh&iacute; động học, th&acirc;n được l&agrave;m từ sợi carbon.&nbsp;C&aacute;c tấm lưới kim loại gi&uacute;p tăng lượng kh&iacute; tản, tận dụng tối đa m&atilde; lực tản nhiệt chưa từng c&oacute; của n&oacute;.</p>

<p><img alt="" data-ll-status="loaded" height="1057" sizes="(max-width: 2560px) 100vw, 2560px" src="https://xgear.vn/wp-content/uploads/2019/06/GT76-11-1.jpg" srcset="https://xgear.vn/wp-content/uploads/2019/06/GT76-11-1.jpg 2560w, https://xgear.vn/wp-content/uploads/2019/06/GT76-11-1-300x124.jpg 300w, https://xgear.vn/wp-content/uploads/2019/06/GT76-11-1-768x317.jpg 768w, https://xgear.vn/wp-content/uploads/2019/06/GT76-11-1-1024x423.jpg 1024w, https://xgear.vn/wp-content/uploads/2019/06/GT76-11-1-193x80.jpg 193w, https://xgear.vn/wp-content/uploads/2019/06/GT76-11-1-568x235.jpg 568w" width="2560" /></p>

<h2>EXTREME OVERCLOCK FOR PEAK DESKTOP PERFORMANCE</h2>

<p><strong>HIỆU NĂNG OVERCLOCK TUYỆT VỜI NHƯ DESKTOP</strong></p>

<p><strong>GT76 Titan DT 9SF&nbsp;</strong>ph&aacute; vỡ mọi kỉ lục với hiệu năng như m&aacute;y t&iacute;nh b&agrave;n. Được &eacute;p xung đến 5.0GHz tr&ecirc;n 8 nh&acirc;n để mang lại hiệu năng cao nhất m&agrave; bạn chưa từng thấy.</p>

<p><img alt="" data-ll-status="loaded" height="522" sizes="(max-width: 1220px) 100vw, 1220px" src="https://xgear.vn/wp-content/uploads/2019/06/GT76-12-1.jpg" srcset="https://xgear.vn/wp-content/uploads/2019/06/GT76-12-1.jpg 1220w, https://xgear.vn/wp-content/uploads/2019/06/GT76-12-1-300x128.jpg 300w, https://xgear.vn/wp-content/uploads/2019/06/GT76-12-1-768x329.jpg 768w, https://xgear.vn/wp-content/uploads/2019/06/GT76-12-1-1024x438.jpg 1024w, https://xgear.vn/wp-content/uploads/2019/06/GT76-12-1-193x83.jpg 193w, https://xgear.vn/wp-content/uploads/2019/06/GT76-12-1-568x243.jpg 568w" width="1220" /></p>

<p><img alt="" data-ll-status="loaded" height="736" sizes="(max-width: 1387px) 100vw, 1387px" src="https://xgear.vn/wp-content/uploads/2019/06/GT76-13-1.jpg" srcset="https://xgear.vn/wp-content/uploads/2019/06/GT76-13-1.jpg 1387w, https://xgear.vn/wp-content/uploads/2019/06/GT76-13-1-300x159.jpg 300w, https://xgear.vn/wp-content/uploads/2019/06/GT76-13-1-768x408.jpg 768w, https://xgear.vn/wp-content/uploads/2019/06/GT76-13-1-1024x543.jpg 1024w, https://xgear.vn/wp-content/uploads/2019/06/GT76-13-1-568x301.jpg 568w, https://xgear.vn/wp-content/uploads/2019/06/GT76-13-1-193x102.jpg 193w" width="1387" /></p>

<table>
	<tbody>
		<tr>
			<td>&nbsp;
			<p>&nbsp;</p>

			<p><img alt="" data-ll-status="loaded" src="https://storage-asset.msi.com/global/picture/image/feature/nb/GT/GT75/GT75-N18/NV-logo.png" /></p>
			</td>
			<td>
			<p>&nbsp;TRANG BỊ ĐỒ HỌA NVIDIA GeForce RTX&trade; 20 SERIES</p>

			<p>NVIDIA GeForce RTX sẽ mang đến cho bạn trải nghiệm laptop gaming tuyệt vời nhất. Với chiếc laptop&nbsp;<strong>GT76 Titan DT 9SF</strong>&nbsp;tuyệt đẹp sở hữu sức mạnh được cung cấp bởi kiến tr&uacute;c GPU NVIDIA Turing mới v&agrave; nền tảng RTX c&aacute;ch mạng.</p>
			</td>
		</tr>
	</tbody>
</table>

<p><img alt="" data-ll-status="loaded" height="861" sizes="(max-width: 1904px) 100vw, 1904px" src="https://xgear.vn/wp-content/uploads/2019/06/GT76-14-1.jpg" srcset="https://xgear.vn/wp-content/uploads/2019/06/GT76-14-1.jpg 1904w, https://xgear.vn/wp-content/uploads/2019/06/GT76-14-1-300x136.jpg 300w, https://xgear.vn/wp-content/uploads/2019/06/GT76-14-1-768x347.jpg 768w, https://xgear.vn/wp-content/uploads/2019/06/GT76-14-1-1024x463.jpg 1024w, https://xgear.vn/wp-content/uploads/2019/06/GT76-14-1-193x87.jpg 193w, https://xgear.vn/wp-content/uploads/2019/06/GT76-14-1-568x257.jpg 568w" width="1904" /></p>

<h2>COOLING FIT FOR A TITAN</h2>

<p>Hiệu suất cực cao nhờ khả năng l&agrave;m m&aacute;t cực độ. Cool Boost Titan mới được thiết kế lại để xử l&yacute; cả nhiệt độ cực cao, mang lại cho&nbsp;<strong>GT76 Titan DT 9SF</strong>&nbsp;mới hiệu năng &eacute;p xung mạnh mẽ.</p>

<p><img alt="" data-ll-status="loaded" height="825" sizes="(max-width: 1193px) 100vw, 1193px" src="https://xgear.vn/wp-content/uploads/2019/06/GT76-15-1.jpg" srcset="https://xgear.vn/wp-content/uploads/2019/06/GT76-15-1.jpg 1193w, https://xgear.vn/wp-content/uploads/2019/06/GT76-15-1-300x207.jpg 300w, https://xgear.vn/wp-content/uploads/2019/06/GT76-15-1-768x531.jpg 768w, https://xgear.vn/wp-content/uploads/2019/06/GT76-15-1-1024x708.jpg 1024w, https://xgear.vn/wp-content/uploads/2019/06/GT76-15-1-193x133.jpg 193w, https://xgear.vn/wp-content/uploads/2019/06/GT76-15-1-568x393.jpg 568w" width="1193" />tags:&nbsp;<a href="https://xgear.vn/">xgear</a>,&nbsp;<a href="https://xgear.vn/laptop-rtx">laptop rtx</a>,&nbsp;<a href="https://xgear.vn/danh-muc/laptop-msi/msi-gaming-series/gt-series/">gt series</a>,&nbsp;<a href="https://www.msi.com/Laptop/support/GT75-Titan-8SX">gt76 titan 8sg</a>,&nbsp;<a href="https://www.msi.com/Laptop/support/GT75-Titan-8SX">msi support</a>&nbsp;</p>
')
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description]) VALUES (3, N'Acer Nitro 5 AN515 56 79U2', N'/Asset/img/product/files/sadsdsa.png', 27990000, 34, 324, CAST(N'2022-12-01' AS Date), 1, 2, N'<h3><strong>Th&ocirc;ng số kỹ thuật:</strong></h3>

<table border="3" cellpadding="3" cellspacing="3" id="tblGeneralAttribute">
	<tbody>
		<tr>
			<td><a href="https://gearvn.com/collections/cpu-bo-vi-xu-ly"><strong>CPU</strong></a></td>
			<td>Intel Core i7-11370H up to 4.80GHz, 4 cores 8 threads</td>
		</tr>
		<tr>
			<td><a href="https://gearvn.com/collections/ram-laptop"><strong>RAM</strong></a></td>
			<td>8GB DDR4 3200MHz (2x SO-DIMM socket, up to 32GB SDRAM)</td>
		</tr>
		<tr>
			<td><a href="https://gearvn.com/collections/ssd-o-cung-the-ran"><strong>Ổ cứng</strong></a></td>
			<td>512GB SSD M.2 PCIE&nbsp;(n&acirc;ng cấp tối đa 1TB SSD PCIe Gen3, 8 Gb/s, NVMe v&agrave; 2TB HDD 2.5-inch 5400 RPM)</td>
		</tr>
		<tr>
			<td><a href="https://gearvn.com/collections/vga-card-man-hinh"><strong>Card đồ họa</strong></a></td>
			<td>NVIDIA GeForce GTX 1650 4GB GDDR6 + Intel UHD Graphics</td>
		</tr>
		<tr>
			<td><a href="https://gearvn.com/collections/man-hinh"><strong>M&agrave;n h&igrave;nh</strong></a></td>
			<td>15.6&quot; FHD (1920 x 1080) IPS, 144Hz, Anti-Glare</td>
		</tr>
		<tr>
			<td><strong>Cổng giao tiếp</strong></td>
			<td>3x USB 3.1 Gen 1, 1x USB 3.2 Gen 2 Type C, 1x HDMI, RJ45</td>
		</tr>
		<tr>
			<td><a href="https://gearvn.com/collections/hdd-o-cung-pc"><strong>Ổ quang</strong></a></td>
			<td>None</td>
		</tr>
		<tr>
			<td><a href="https://gearvn.com/collections/thiet-bi-tai-nghe-loa-audio-chuyen-nghiep"><strong>Audio</strong></a></td>
			<td>Waves MaxxAudio&reg;, Acer TrueHarmony&trade;</td>
		</tr>
		<tr>
			<td><a href="https://gearvn.com/collections/ban-phim-co-gaming"><strong>B&agrave;n ph&iacute;m</strong></a></td>
			<td>RGB 4 v&ugrave;ng</td>
		</tr>
		<tr>
			<td><strong>Đọc thẻ nhớ</strong></td>
			<td>None</td>
		</tr>
		<tr>
			<td><strong>Chuẩn LAN</strong></td>
			<td>10/100/1000/Gigabits Base T</td>
		</tr>
		<tr>
			<td><strong>Chuẩn WIFI</strong></td>
			<td>802.11AX (2x2)</td>
		</tr>
		<tr>
			<td><strong>Bluetooth</strong></td>
			<td>v5.0</td>
		</tr>
		<tr>
			<td><a href="https://gearvn.com/collections/webcam"><strong>Webcam</strong></a></td>
			<td>HD Webcam</td>
		</tr>
		<tr>
			<td><strong>Hệ điều h&agrave;nh</strong></td>
			<td><a href="https://gearvn.com/collections/window">Windows 10 Home</a></td>
		</tr>
		<tr>
			<td><strong>Pin</strong></td>
			<td>4 Cell 57.5WHr</td>
		</tr>
		<tr>
			<td><strong>Trọng lượng</strong></td>
			<td>2.30 kg</td>
		</tr>
		<tr>
			<td><strong>M&agrave;u sắc</strong></td>
			<td>Đen</td>
		</tr>
		<tr>
			<td><strong>K&iacute;ch thước</strong></td>
			<td>363.4 x 255 x 23.9 mm</td>
		</tr>
	</tbody>
</table>

<h3><img src="https://file.hstatic.net/1000026716/file/gearvn.com-laptop-gaming-acer-nitro-5-2020-144hz-13_aac4810a7f7f48bab38b14f3c6d84bee.jpg" /></h3>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>
')
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description]) VALUES (4, N'Acer Aspire 7 A715 42G R4ST', N'/Asset/img/product/files/ezgif-1-1e2d09aeee7b.jpg', 18490000, 4, 34, CAST(N'2022-12-01' AS Date), 1, 1, N'<h2><strong>Th&ocirc;ng số kỹ thuật:</strong></h2>

<table>
	<tbody>
		<tr>
			<td><a href="https://gearvn.com/collections/cpu-bo-vi-xu-ly">CPU</a></td>
			<td>AMD Ryzen 5 &ndash; 5500U</td>
		</tr>
		<tr>
			<td><a href="https://gearvn.com/collections/ram-laptop">RAM</a></td>
			<td>8GB DDR4 (2x SO-DIMM socket, up to 32GB SDRAM)</td>
		</tr>
		<tr>
			<td><a href="https://gearvn.com/collections/ssd-o-cung-the-ran">&Ocirc;̉ cứng</a></td>
			<td>256GB PCIe&reg; NVMe&trade; M.2 SSD</td>
		</tr>
		<tr>
			<td><a href="https://gearvn.com/collections/vga-card-man-hinh">Card đồ họa</a></td>
			<td>NVIDIA GeForce GTX 1650 4GB GDDR6</td>
		</tr>
		<tr>
			<td><a href="https://gearvn.com/collections/man-hinh">M&agrave;n h&igrave;nh</a></td>
			<td>15.6&quot; FHD (1920 x 1080) IPS, Anti-Glare, 60Hz</td>
		</tr>
		<tr>
			<td>Cổng giao tiếp</td>
			<td>1x USB 3.0<br />
			1x USB Type C<br />
			2x USB 2.0<br />
			1x HDMI<br />
			1x RJ45</td>
		</tr>
		<tr>
			<td><a href="https://gearvn.com/collections/hdd-o-cung-pc">Ổ quang</a></td>
			<td>None</td>
		</tr>
		<tr>
			<td><a href="https://gearvn.com/collections/thiet-bi-tai-nghe-loa-audio-chuyen-nghiep">Audio</a></td>
			<td>True Harmony; Dolby&reg; Audio Premium</td>
		</tr>
		<tr>
			<td>Đọc thẻ nhớ</td>
			<td>None</td>
		</tr>
		<tr>
			<td>Chu&acirc;̉n LAN</td>
			<td>10/100/1000/Gigabits Base T</td>
		</tr>
		<tr>
			<td>Chuẩn WIFI</td>
			<td>Wi-Fi 6(Gig+)(802.11ax) (2x2)</td>
		</tr>
		<tr>
			<td>Bluetooth</td>
			<td>v5.0</td>
		</tr>
		<tr>
			<td><a href="https://gearvn.com/collections/webcam">Webcam</a></td>
			<td>HD Webcam</td>
		</tr>
		<tr>
			<td>Hệ điều h&agrave;nh</td>
			<td><a href="https://gearvn.com/collections/window">Windows 10 Home</a></td>
		</tr>
		<tr>
			<td>Pin</td>
			<td>4 Cell 48Whr</td>
		</tr>
		<tr>
			<td>Trọng lượng</td>
			<td>2.1 kg</td>
		</tr>
		<tr>
			<td>M&agrave;u sắc</td>
			<td>Đen, C&oacute; đ&egrave;n b&agrave;n ph&iacute;m</td>
		</tr>
		<tr>
			<td>Kích thước</td>
			<td>363.4 x 254.5 x 23.25 (mm)</td>
		</tr>
	</tbody>
</table>

<h2>Đ&aacute;nh gi&aacute; chi tiết :&nbsp;</h2>

<p><img src="https://file.hstatic.net/1000026716/file/1_8adb7d38a9094a94a450be9b3a5c1d05.png" /></p>

<h3>LAPTOP GAMING TỐT NHẤT PH&Acirc;N KH&Uacute;C</h3>

<p><a href="https://gearvn.com/collections/laptop-acer-aspire-7">Acer Aspire 7</a>&nbsp;2020 A715 42G R4ST t&iacute;ch hợp card đồ họa NVIDIA GTX1650 4GB GDDR6 ra mắt năm 2020, l&agrave; laptop chơi game tốt nhất ph&acirc;n kh&uacute;c. Kh&ocirc;ng chỉ vậy, phi&ecirc;n bản n&agrave;y c&ograve;n mang thiết kế mới gọn g&agrave;ng v&agrave; sexy hơn.&nbsp;Aspire 7 2020&nbsp;được trang bị hệ thống tản nhiệt mạnh mẽ bậc nhất trong ph&acirc;n kh&uacute;c, thừa hưởng c&ocirc;ng nghệ từ c&aacute;c d&ograve;ng m&aacute;y cao cấp hơn của Acer, c&ugrave;ng cấu h&igrave;nh đỉnh cao, gi&uacute;p cho người d&ugrave;ng c&oacute; thể vừa chơi game vừa l&agrave;m việc ở bất cứ l&uacute;c n&agrave;o.</p>

<p><img src="https://file.hstatic.net/1000026716/file/2_5f8ab09ec95547a9ad2975be2f96300e.png" /></p>

<h3>THIẾT KẾ TỐI ƯU TRẢI NGHIỆM CHƠI GAME</h3>

<p>Hệ thống hai quạt tản nhiệt, 3 ống đồng fullsize, heatsink size lớn gi&uacute;p&nbsp;Acer Aspire 7 A715 2020&nbsp;tối ưu khả năng tản nhiệt. Bản lề thiết kế chắc chắn &iacute;t bị rung lắc khi chơi, c&oacute; khả năng mở g&oacute;c 180 độ gi&uacute;p bảo vệ m&aacute;y tốt hơn.</p>

<p><img src="https://file.hstatic.net/1000026716/file/3_21a5af15cbc64fdcab3dc6b881d31f76.png" /></p>

<h3>DỊCH VỤ BẢO H&Agrave;NH 3S1</h3>

<p>3S1 l&agrave; ch&iacute;nh s&aacute;ch bảo h&agrave;nh nhanh của Acer d&agrave;nh cho game thủ. Aspire 7 được hưởng Bảo h&agrave;nh 3S1 si&ecirc;u nhanh: bảo h&agrave;nh nhanh, trong v&ograve;ng 3 ng&agrave;y kể cả thứ 7 v&agrave; chủ nhật, qu&aacute; 3 ng&agrave;y 1 đổi 1 sản phẩm mới c&oacute; gi&aacute; trị tương đương hoặc cao hơn.</p>

<p><img src="https://file.hstatic.net/1000026716/file/4_52affae20b4c48aca92168ebd593d7c9.png" /></p>
')
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description]) VALUES (5, N'Asus ROG Strix G15 G512 IHN281T', N'/Asset/img/product/files/ezgif-1-23fb4ec5793b.jpg', 11, 423342, 243, CAST(N'2022-12-01' AS Date), 1, 3, N'<h3><strong><b>Th&ocirc;ng số kĩ thuật</b></strong></h3>

<table>
	<tbody>
		<tr>
			<td><a href="https://gearvn.com/collections/cpu-bo-vi-xu-ly">CPU</a></td>
			<td>Intel Core&nbsp;i7-10870H 2.2GHz up to 5.0GHz 16MB</td>
		</tr>
		<tr>
			<td><a href="https://gearvn.com/collections/ram-pc">RAM</a></td>
			<td>8GB DDR4 3200MHz&nbsp;(2x SO-DIMM socket, up to 32GB SDRAM)</td>
		</tr>
		<tr>
			<td><a href="https://gearvn.com/collections/ssd-laptop">&Ocirc;̉ cứng</a></td>
			<td>512GB SSD PCIE G3X4&nbsp;(C&ograve;n trống 2 khe SSD M.2 PCIE v&agrave; M.2 SATA3)</td>
		</tr>
		<tr>
			<td><a href="https://gearvn.com/collections/vga-card-man-hinh">Card đồ họa</a></td>
			<td>NVIDIA GeForce GTX 1650Ti 4GB GDDR6 + Intel UHD Graphics</td>
		</tr>
		<tr>
			<td><a href="https://gearvn.com/collections/man-hinh">M&agrave;n h&igrave;nh</a></td>
			<td>15.6&quot; FHD (1920 x 1080) IPS, 144Hz, Wide View, 250nits, Narrow Bezel, Non-Glare with&nbsp;45% NTSC, 67% sRGB</td>
		</tr>
		<tr>
			<td>Cổng giao tiếp</td>
			<td>1x USB3.2 Gen2 Type-C support DisplayPort&trade;<br />
			3x USB3.2 Gen 1 Type-A<br />
			1x HDMI (HDMI 2.0b support 4K HDR), HDCP SPEC 2.2<br />
			1x Audio combo jack: Mic-in and Head phone<br />
			1x LAN RJ-45 jack</td>
		</tr>
		<tr>
			<td>Audio</td>
			<td>2 x 1.5W speaker for W/O Smart AMP technology</td>
		</tr>
		<tr>
			<td><a href="https://gearvn.com/collections/ban-phim-co-gaming">B&agrave;n ph&iacute;m</a></td>
			<td>RGB KB</td>
		</tr>
		<tr>
			<td>Chu&acirc;̉n LAN</td>
			<td>10/100/1000 Base T</td>
		</tr>
		<tr>
			<td>Chuẩn WIFI</td>
			<td>Intel&nbsp;802.11AX (2x2)</td>
		</tr>
		<tr>
			<td>Bluetooth</td>
			<td>v5.1</td>
		</tr>
		<tr>
			<td><a href="https://gearvn.com/collections/webcam">Webcam</a></td>
			<td>None</td>
		</tr>
		<tr>
			<td>Hệ điều h&agrave;nh</td>
			<td>Windows 10 Home</td>
		</tr>
		<tr>
			<td>Pin</td>
			<td>3 Cell 48WHr</td>
		</tr>
		<tr>
			<td>Trọng lượng</td>
			<td>2.3 kg</td>
		</tr>
		<tr>
			<td>M&agrave;u sắc</td>
			<td>Black</td>
		</tr>
		<tr>
			<td>Kích thước</td>
			<td>360 x 275 x 21~25.8 (mm)</td>
		</tr>
	</tbody>
</table>

<h3>M&ocirc; tả sản phẩm</h3>

<h3><b>Thiết kế hiện đại chuẩn Gaming</b></h3>

<p>Với thiết kế của&nbsp;<a href="https://gearvn.com/collections/laptop-gaming-asus">laptop gaming Asus</a>&nbsp;ROG Strix G15 G512 IHN281T lấy cảm hứng từ BMW Designworks mang lại cảm gi&aacute;c độc đ&aacute;o, mạnh mẽ. Hơn nữa, với &aacute;nh s&aacute;ng Aura Sync&nbsp;chạy quanh cạnh m&aacute;y, LOGO v&agrave; b&agrave;n ph&iacute;m gi&uacute;p Asus ROG trở th&agrave;nh một con chiến m&atilde; thực sự khi chiến tốt cả ng&agrave;y&nbsp;lẫn đ&ecirc;m.</p>

<p><img src="https://file.hstatic.net/1000026716/file/gearvn.com-laptop-gaming-asus-rog-strix-g15-g512-ial001t-1_d624d64f915a477199fb107d685115e4.jpg" /></p>

<h3><b>C&ocirc;ng nghệ tản nhiệt th&ocirc;ng minh</b></h3>

<p>Để mang lại một hiệu suất tốt nhất trong mọi cuộc chơi,&nbsp;laptop gaming&nbsp;Asus ROG Strix G15 G512 IHN281T được thiết kế hệ thống l&agrave;m m&aacute;t th&ocirc;ng minh tăng cường cho ngoại thất th&ocirc;ng tho&aacute;ng. Thực hiện bằng cơ th&ecirc;m m&ocirc;-đun tản nhiệt tự l&agrave;m sạch, đẩy bụi bẩn ra b&ecirc;n ngo&agrave;i để k&eacute;o d&agrave;i tuổi thọ. Ngo&agrave;i ra, sản phẩm c&ograve;n được&nbsp;trang bị&nbsp;c&aacute;c quạt k&eacute;p c&aacute;nh chữ N quay 83 c&aacute;nh quạt để tăng cường lưu th&ocirc;ng kh&iacute;, đồng thời c&aacute;c l&aacute; tản nhiệt si&ecirc;u mỏng gi&uacute;p mở rộng diện t&iacute;ch bề mặt tho&aacute;ng nhiệt.</p>

<p><img src="https://file.hstatic.net/1000026716/file/gearvn.com-laptop-gaming-asus-rog-strix-g15-g512-ial001t-3_dca8c4dae9ee47768f6fea389564a521.jpg" /></p>

<h3><b>Hiệu năng tuyệt vời</b></h3>

<p>Xứng đ&aacute;ng l&agrave; laptop gaming được game thủ chọn khi&nbsp;Asus ROG StrixG15 G512 IHN281T&nbsp;được trang bị&nbsp;cấu h&igrave;nh khủng với CPU&nbsp;&nbsp;Intel Core&nbsp;i7 10870H&nbsp;v&agrave; RAM 8GB DDR4 3200Mhz th&igrave; việc xử l&yacute; th&ocirc;ng tin v&agrave; chạy những tựa game nặng kh&ocirc;ng c&ograve;n l&agrave; vấn đề. Kh&ocirc;ng những thế, để đ&aacute;p ứng nhiều hơn nữa chiếc laptop n&agrave;y c&ograve;n c&oacute; th&ecirc;m&nbsp;một khe cắm RAM v&agrave; một khe cắm SSD gi&uacute;p bạn c&oacute; thể linh hoạt mọi việc trong kho t&agrave;ng game của bạn. C&ugrave;ng với card đồ họa GTX 1650Ti khiến mọi tựa game kh&ocirc;ng c&ograve;n l&agrave; vấn đề phải đ&aacute;ng lo ngại.</p>

<p><img src="https://file.hstatic.net/1000026716/file/gearvn.com-laptop-gaming-asus-rog-strix-g15-g512-ial001t-2_222d4dfd96d04f08a723a7e2f9635a2f.jpg" /></p>

<h3><b>H&igrave;nh ảnh sống động, ch&acirc;n thực</b></h3>

<p>Để mang lại một trải nghiệm tuyệt vời khi đắm ch&igrave;m v&agrave;o game th&igrave; h&igrave;nh ảnh mang lại phải thật sống động. Với tấm m&agrave;n h&igrave;nh&nbsp;15.6-inch c&oacute; độ ph&acirc;n giải Full HD (1920x1080), cộng th&ecirc;m tấm nền IPS,&nbsp;tần số qu&eacute;t si&ecirc;u nhanh l&ecirc;n đến 144Hz th&igrave; gaming asus ROG đủ để tạo n&ecirc;n một kh&ocirc;ng gian h&igrave;nh ảnh si&ecirc;u sống động cho c&aacute;c gamer thỏa sức chinh phục vinh quang.</p>

<p>&nbsp;</p>

<h3><b>B&agrave;n ph&iacute;m nhận lệnh&nbsp;</b></h3>

<p>L&agrave; laptop gaming n&ecirc;n b&agrave;n ph&iacute;m của&nbsp;Asus&nbsp;ROG Strix G15 G512 IHN281T&nbsp;được lấy cảm hứng từ m&aacute;y t&iacute;nh để b&agrave;n x&acirc;y dựng h&igrave;nh ảnh game thủ chuy&ecirc;n nghiệp. Giữa c&aacute;c ph&iacute;m được bố tr&iacute; hợp l&yacute; tạo cho c&aacute;c game thủ tăng sự ch&iacute;nh x&aacute;c trong trận chiến. B&agrave;n ph&iacute;m c&oacute; trang bị c&aacute;c ph&iacute;m n&oacute;ng để tạo lệnh quan trọng nhanh hơn. M&aacute;y c&oacute; 5 ph&iacute;m n&oacute;ng được bố tr&iacute; t&aacute;ch biệt ph&iacute;a tr&ecirc;n b&agrave;n ph&iacute;m tạo sự thuận tiện cho người d&ugrave;ng. Từ đ&oacute;,&nbsp;<a href="https://gearvn.com/collections/laptop-asus-rog-series">Asus ROG</a>&nbsp;trở th&agrave;nh một chiếc laptop gaming thực sự tốt khi chiến game.</p>

<p><img src="https://file.hstatic.net/1000026716/file/gearvn.com-laptop-gaming-asus-rog-strix-g15-g512-ial001t-4_506a2078bf564da29ed4661259e99850.jpg" /></p>

<h3><b>Aura Sync</b></h3>

<p>Bạn sẽ thực sự l&agrave;m chủ được s&acirc;n khấu khi nhờ hệ thống đ&egrave;n Aura Sync mang lại. Hệ thống đ&egrave;n bao quanh cạnh m&aacute;y t&iacute;nh v&agrave; từng ph&iacute;m tạo n&ecirc;n sắc m&agrave;u kh&aacute;c nhau theo từng khoảng thời gian m&agrave; bạn chiến game tạo n&ecirc;n một phong c&aacute;ch ri&ecirc;ng cho chiếc laptop gaming v&agrave; đặc biệt l&agrave; ch&iacute;nh bạn.</p>

<h3><b>Kết nối mạnh mẽ</b></h3>

<p>Để thực sự ho&agrave;n hảo hơn,&nbsp;<a href="https://gearvn.com/collections/laptop-gaming">laptop gaming</a>&nbsp;Asus ROG Strix G15 G512 IHN281T được trang bị chuẩn&nbsp;Wi-Fi 802.11AX cho ph&eacute;p khả năng kết nối cực kỳ ổn định, tr&aacute;nh mất t&igrave;nh trạng kết nối để cuộc chiến của bạn được su&ocirc;n sẻ hơn.</p>

<p><img src="https://file.hstatic.net/1000026716/file/gearvn.com-laptop-gaming-asus-rog-strix-g15-g512-ial001t-6_1b0ef63b8ca24606b85568464e1b084a.jpg" /></p>
')
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description]) VALUES (6, N'Macbook pro 123', N'/Asset/img/product/files/GT76-TITAN.jpg', 12, 12, 3, CAST(N'2022-12-01' AS Date), 1, 10, N'<p>54243524354253</p>
')
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description]) VALUES (7, N'GAMING ASUS TUF F15 FX506LH-HN002T ', N'/Asset/img/product/files/fsd.jpg', 122, 12, 12, CAST(N'2021-04-27' AS Date), 1, 3, N'<h2>Th&ocirc;ng tin bổ sung</h2>

<table>
	<tbody>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://xgear.vn/cpu/intel-core-i5-10300h/" rel="tag">Intel Core i5 10300H</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://xgear.vn/he-dieu-hanh/windows-10-sl-64-bit/" rel="tag">Windows 10 SL 64 Bit</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://xgear.vn/ram/ddr4-8gb-1-x-8gb-3200mhz-2-slots-up-to-32gb/" rel="tag">DDR4 8GB (1 x 8GB) 3200MHz; 2 slots, up to 32GB</a></p>
			</td>
		</tr>
		<tr>
			<th>GPU</th>
			<td>
			<p><a href="https://xgear.vn/gpu/geforce-gtx-1650-4gb/" rel="tag">Geforce GTX 1650 4GB</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://xgear.vn/man-hinh/15-6-fullhd-1920-x-1080-144hz-ips-panel/" rel="tag">15.6&quot; FullHD (1920 x 1080). 144Hz, IPS Panel</a></p>
			</td>
		</tr>
		<tr>
			<th>Ổ cứng SSD</th>
			<td>
			<p><a href="https://xgear.vn/o-cung-ssd/512gb-ssd-nvme-m-2-pcie-gen-3-x-4/" rel="tag">512GB SSD NVMe M.2 PCIe Gen 3 x 4</a></p>
			</td>
		</tr>
		<tr>
			<th>Ổ cứng HDD</th>
			<td>
			<p><a href="https://xgear.vn/o-cung-hdd/1-slot-hdd-2-5/" rel="tag">1 slot HDD 2.5&#39;</a></p>
			</td>
		</tr>
		<tr>
			<th>Lan</th>
			<td>
			<p><a href="https://xgear.vn/lan/gigabit-lan/" rel="tag">Gigabit Lan</a></p>
			</td>
		</tr>
		<tr>
			<th>Wireless Lan</th>
			<td>
			<p><a href="https://xgear.vn/wireless-lan/intel-wi-fi-6-ax20122-ax-bt5/" rel="tag">Intel Wi-Fi 6 AX201(2*2 ax) + BT5</a></p>
			</td>
		</tr>
		<tr>
			<th>C&aacute;c cổng kết nối</th>
			<td>
			<p><a href="https://xgear.vn/cac-cong-ket-noi/1-x-3-5mm-audio-jack/" rel="tag">1 x 3.5mm Audio Jack</a>,&nbsp;<a href="https://xgear.vn/cac-cong-ket-noi/1-x-type-a-usb2-0/" rel="tag">1 x Type-A USB2.0</a>,&nbsp;<a href="https://xgear.vn/cac-cong-ket-noi/1x-4k-30hz-hdmi/" rel="tag">1x (4K @ 30Hz) HDMI</a>,&nbsp;<a href="https://xgear.vn/cac-cong-ket-noi/1x-rj45/" rel="tag">1x RJ45</a>,&nbsp;<a href="https://xgear.vn/cac-cong-ket-noi/2-x-type-a-usb-3-1-gen-1/" rel="tag">2 x Type-A USB 3.1 (Gen 1)</a></p>
			</td>
		</tr>
		<tr>
			<th>B&agrave;n ph&iacute;m</th>
			<td>
			<ul>
				<li>Backlight Keyboard Multicolor</li>
			</ul>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://xgear.vn/pin/4-cells-66whrs/" rel="tag">4 Cells, 66WHrs</a></p>
			</td>
		</tr>
		<tr>
			<th>K&iacute;ch thước</th>
			<td>
			<p><a href="https://xgear.vn/kich-thuoc/360-4-x-262-0-x-25-8-26-8-mm-wxdxh/" rel="tag">360.4 x 262.0 x 25.8 ~26.8 mm (WxDxH)</a></p>
			</td>
		</tr>
		<tr>
			<th>Trọng lượng</th>
			<td>
			<p><a href="https://xgear.vn/trong-luong/2-2-kg/" rel="tag">2.2 kg</a></p>
			</td>
		</tr>
	</tbody>
</table>

<ul>
	<li><a data-toggle="tab" href="https://xgear.vn/laptop-gaming-asus-tuf-f15-fx506lh-hn002t/#tab-description">M&ocirc; tả</a></li>
	<li><a data-toggle="tab" href="https://xgear.vn/laptop-gaming-asus-tuf-f15-fx506lh-hn002t/#tab-product_tag">Tags</a></li>
	<li><a data-toggle="tab" href="https://xgear.vn/laptop-gaming-asus-tuf-f15-fx506lh-hn002t/#tab-customtab_22000">N&acirc;ng cấp</a></li>
	<li><a data-toggle="tab" href="https://xgear.vn/laptop-gaming-asus-tuf-f15-fx506lh-hn002t/#tab-additional_information">Th&ocirc;ng tin bổ sung</a></li>
</ul>

<h2>M&ocirc; tả</h2>

<h1><a href="https://xgear.vn/laptop-gaming-asus-tuf-f15-fx506lh-hn002t/">Asus TUF F15 FX506LH-HN002T</a></h1>

<h2><strong>JOIN FORCES</strong></h2>

<h2>THAM CHIẾN</h2>

<p><strong>ASUS TUF F15 FX506LH-HN002T</strong>&nbsp;sẽ thay đổi c&aacute;ch bạn nh&igrave;n v&agrave;o laptop chơi game.&nbsp;<strong>ASUS TUF F15 FX506LI-HN039T</strong>&nbsp;được trang bị phần cứng ấn tượng, thiết kế gọn nhưng mạnh mẽ. Trang bị bộ vi xử l&yacute;&nbsp;<b>Intel</b>&nbsp;thế hệ mới nhất, hỗ trợ ram tối đa 32GB, VGA GTX 16 series, m&agrave;n h&igrave;nh&nbsp;<strong>IPS 144Hz</strong>&nbsp;với b&agrave;n ph&iacute;m c&oacute; đ&egrave;n nền RGB.</p>

<p><strong>ASUS TUF F15 FX506LH-HN002T</strong>&nbsp;c&oacute; b&agrave;n ph&iacute;m chuy&ecirc;n dụng&nbsp;chơi game với c&aacute;c ph&iacute;m&nbsp;<strong>RGB-backlit</strong>, cụm ph&iacute;m&nbsp;<strong>W</strong><strong>ASD</strong>&nbsp;nổi bật v&agrave; c&ocirc;ng nghệ&nbsp;<strong>Overstroke</strong>&nbsp;để thao t&aacute;c nhanh v&agrave; ch&iacute;nh x&aacute;c.&nbsp;Với m&agrave;n h&igrave;nh&nbsp;<strong>NanoEdge IPS</strong>&nbsp;cấp độ ti&ecirc;n tiến, v&agrave; độ bền được chứng nhận kiểm tra&nbsp;<strong>MIL-STD-810G.</strong>&nbsp;<strong>ASUS TUF F15&nbsp;FX506LH-HN002T&nbsp;</strong>mang đến trải nghiệm chơi game phong ph&uacute; mọi l&uacute;c mọi nơi!</p>

<h3><img alt="" data-ll-status="loaded" height="954" sizes="(max-width: 1891px) 100vw, 1891px" src="https://xgear.vn/wp-content/uploads/2019/05/Fx505ryzen-1_compressed.jpg" srcset="https://xgear.vn/wp-content/uploads/2019/05/Fx505ryzen-1_compressed.jpg 1891w, https://xgear.vn/wp-content/uploads/2019/05/Fx505ryzen-1_compressed-300x151.jpg 300w, https://xgear.vn/wp-content/uploads/2019/05/Fx505ryzen-1_compressed-768x387.jpg 768w, https://xgear.vn/wp-content/uploads/2019/05/Fx505ryzen-1_compressed-1024x517.jpg 1024w, https://xgear.vn/wp-content/uploads/2019/05/Fx505ryzen-1_compressed-193x97.jpg 193w, https://xgear.vn/wp-content/uploads/2019/05/Fx505ryzen-1_compressed-568x287.jpg 568w" width="1891" />Tối ưu h&oacute;a hiển thị với m&agrave;n h&igrave;nh viền mỏng IPS NANOEDGE.</h3>
')
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description]) VALUES (8, N'LAPTOP GAMING ASUS TUF A17 FA706II', N'/Asset/img/product/files/TUF-A17-.jpg', 50, 50, 46, CAST(N'2021-04-27' AS Date), 1, 3, N'<h2>Th&ocirc;ng tin bổ sung</h2>

<table>
	<tbody>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://xgear.vn/cpu/amd-ryzen-7-4800h/" rel="tag">AMD Ryzen 7 &ndash; 4800H</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://xgear.vn/he-dieu-hanh/windows-10-sl-64-bit/" rel="tag">Windows 10 SL 64 Bit</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://xgear.vn/ram/ddr4-8gb-1-x-8gb-3200mhz-2-slots-up-to-32gb/" rel="tag">DDR4 8GB (1 x 8GB) 3200MHz; 2 slots, up to 32GB</a></p>
			</td>
		</tr>
		<tr>
			<th>GPU</th>
			<td>
			<p><a href="https://xgear.vn/gpu/geforce-gtx-1650ti-4gb/" rel="tag">Geforce GTX 1650Ti 4GB</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://xgear.vn/man-hinh/17-3-full-hd-1920-x-1080-120hz-ips-panel/" rel="tag">17.3&quot; Full HD ( 1920 x 1080 ), 120Hz, IPS Panel</a></p>
			</td>
		</tr>
		<tr>
			<th>Ổ cứng SSD</th>
			<td>
			<p><a href="https://xgear.vn/o-cung-ssd/512gb-ssd-nvme-m-2-pcie-gen-3-x-4/" rel="tag">512GB SSD NVMe M.2 PCIe Gen 3 x 4</a></p>
			</td>
		</tr>
		<tr>
			<th>Lan</th>
			<td>
			<p><a href="https://xgear.vn/lan/gigabit-lan/" rel="tag">Gigabit Lan</a></p>
			</td>
		</tr>
		<tr>
			<th>Wireless Lan</th>
			<td>
			<p><a href="https://xgear.vn/wireless-lan/802-11ac-2x2-wi-fi/" rel="tag">802.11ac 2&times;2 Wi-Fi</a></p>
			</td>
		</tr>
		<tr>
			<th>C&aacute;c cổng kết nối</th>
			<td>
			<p><a href="https://xgear.vn/cac-cong-ket-noi/1-x-3-5mm-audio-jack/" rel="tag">1 x 3.5mm Audio Jack</a>,&nbsp;<a href="https://xgear.vn/cac-cong-ket-noi/1-x-type-c-usb3-1-gen2-support-dp-function/" rel="tag">1 x Type C USB3.1 (GEN2) support DP function</a>,&nbsp;<a href="https://xgear.vn/cac-cong-ket-noi/1-x-type-a-usb2-0/" rel="tag">1 x Type-A USB2.0</a>,&nbsp;<a href="https://xgear.vn/cac-cong-ket-noi/1x-4k-30hz-hdmi/" rel="tag">1x (4K @ 30Hz) HDMI</a>,&nbsp;<a href="https://xgear.vn/cac-cong-ket-noi/1x-rj45/" rel="tag">1x RJ45</a>,&nbsp;<a href="https://xgear.vn/cac-cong-ket-noi/2-x-type-a-usb-3-1-gen-1/" rel="tag">2 x Type-A USB 3.1 (Gen 1)</a></p>
			</td>
		</tr>
		<tr>
			<th>B&agrave;n ph&iacute;m</th>
			<td>
			<ul>
				<li>Backlight Keyboard Multicolor</li>
			</ul>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://xgear.vn/pin/4-cells-90whrs/" rel="tag">4 cells, 90Whrs</a></p>
			</td>
		</tr>
		<tr>
			<th>K&iacute;ch thước</th>
			<td>
			<p><a href="https://xgear.vn/kich-thuoc/wxdxh-39-9-x-26-9-x-2-52-2-52-cm/" rel="tag">(WxDxH) 39.9 x 26.9 x 2.52 ~ 2.52 cm</a></p>
			</td>
		</tr>
		<tr>
			<th>Trọng lượng</th>
			<td>
			<p><a href="https://xgear.vn/trong-luong/2-6-kg/" rel="tag">2.6 kg</a></p>
			</td>
		</tr>
	</tbody>
</table>

<ul>
	<li><a data-toggle="tab" href="https://xgear.vn/laptop-gaming-asus-tuf-a17-fa706ii-h7286t/#tab-description">M&ocirc; tả</a></li>
	<li><a data-toggle="tab" href="https://xgear.vn/laptop-gaming-asus-tuf-a17-fa706ii-h7286t/#tab-product_tag">Tags</a></li>
	<li><a data-toggle="tab" href="https://xgear.vn/laptop-gaming-asus-tuf-a17-fa706ii-h7286t/#tab-customtab_22000">N&acirc;ng cấp</a></li>
	<li><a data-toggle="tab" href="https://xgear.vn/laptop-gaming-asus-tuf-a17-fa706ii-h7286t/#tab-additional_information">Th&ocirc;ng tin bổ sung</a></li>
</ul>

<h2>M&ocirc; tả</h2>

<h1><a href="https://xgear.vn/laptop-gaming-asus-tuf-a17-fa706ii-h7286t/">ASUS TUF A17 FA706II-H7286T</a></h1>

<h2><strong>JOIN FORCES</strong></h2>

<h2>THAM CHIẾN</h2>

<p><strong>ASUS TUF A17&nbsp;FA706II-H7286T&nbsp;</strong>sẽ thay đổi c&aacute;ch bạn nh&igrave;n v&agrave;o laptop chơi game. Được trang bị phần cứng ấn tượng, thiết kế gọn nhưng mạnh mẽ. Trang bị&nbsp;<strong>CPU R7 4800H</strong>, hỗ trợ ram tối đa 32GB, VGA GTX 16 series, m&agrave;n h&igrave;nh&nbsp;<strong>IPS 120Hz</strong>&nbsp;với b&agrave;n ph&iacute;m c&oacute; đ&egrave;n nền RGB.</p>

<p><strong>ASUS TUF A17&nbsp;FA706II-H7286T&nbsp;</strong>c&oacute; b&agrave;n ph&iacute;m chuy&ecirc;n dụng&nbsp;chơi game với c&aacute;c ph&iacute;m&nbsp;<strong>RGB-backlit</strong>, cụm ph&iacute;m&nbsp;<strong>W</strong><strong>ASD</strong>&nbsp;nổi bật v&agrave; c&ocirc;ng nghệ&nbsp;<strong>Overstroke</strong>&nbsp;để thao t&aacute;c nhanh v&agrave; ch&iacute;nh x&aacute;c.&nbsp;Với m&agrave;n h&igrave;nh&nbsp;<strong>NanoEdge IPS</strong>&nbsp;cấp độ ti&ecirc;n tiến, v&agrave; độ bền được chứng nhận kiểm tra&nbsp;<strong>MIL-STD-810G.</strong>&nbsp;Sẽ&nbsp;mang đến trải nghiệm chơi game phong ph&uacute; mọi l&uacute;c mọi nơi!</p>

<h3><img alt="" data-ll-status="loaded" height="954" sizes="(max-width: 1891px) 100vw, 1891px" src="https://xgear.vn/wp-content/uploads/2019/05/Fx505ryzen-1_compressed.jpg" srcset="https://xgear.vn/wp-content/uploads/2019/05/Fx505ryzen-1_compressed.jpg 1891w, https://xgear.vn/wp-content/uploads/2019/05/Fx505ryzen-1_compressed-300x151.jpg 300w, https://xgear.vn/wp-content/uploads/2019/05/Fx505ryzen-1_compressed-768x387.jpg 768w, https://xgear.vn/wp-content/uploads/2019/05/Fx505ryzen-1_compressed-1024x517.jpg 1024w, https://xgear.vn/wp-content/uploads/2019/05/Fx505ryzen-1_compressed-193x97.jpg 193w, https://xgear.vn/wp-content/uploads/2019/05/Fx505ryzen-1_compressed-568x287.jpg 568w" width="1891" />Tối ưu h&oacute;a hiển thị với m&agrave;n h&igrave;nh viền mỏng IPS NANOEDGE.</h3>
')
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description]) VALUES (9, N'ENOVO LEGION 5 15IMH05', N'/Asset/img/product/files/sfd.jpg', 65, 456, 45, CAST(N'2021-04-27' AS Date), 1, 5, N'<h2>Th&ocirc;ng tin bổ sung</h2>

<table>
	<tbody>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://xgear.vn/cpu/intel-core-i5-10300h/" rel="tag">Intel Core i5 10300H</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://xgear.vn/he-dieu-hanh/windows-10-sl-64-bit/" rel="tag">Windows 10 SL 64 Bit</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://xgear.vn/ram/ddr4-8gb-1-x-8gb-3200mhz-2-slots-up-to-32gb/" rel="tag">DDR4 8GB (1 x 8GB) 3200MHz; 2 slots, up to 32GB</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://xgear.vn/man-hinh/15-6-full-hd-1920-x-1080-120hz-ips-panel/" rel="tag">15.6&quot; Full HD ( 1920 x 1080 ), 120Hz, IPS Panel</a></p>
			</td>
		</tr>
		<tr>
			<th>Ổ cứng SSD</th>
			<td>
			<p><a href="https://xgear.vn/o-cung-ssd/512gb-ssd-nvme-m-2-pcie-gen-3-x-4/" rel="tag">512GB SSD NVMe M.2 PCIe Gen 3 x 4</a></p>
			</td>
		</tr>
		<tr>
			<th>Ổ đĩa quang</th>
			<td>
			<p><a href="https://xgear.vn/o-dia-quang/no-odd/" rel="tag">No ODD</a></p>
			</td>
		</tr>
		<tr>
			<th>Lan</th>
			<td>
			<p><a href="https://xgear.vn/lan/dual-101001000mbps-ethernet/" rel="tag">Dual 10/100/1000Mbps Ethernet</a></p>
			</td>
		</tr>
		<tr>
			<th>Wireless Lan</th>
			<td>
			<p><a href="https://xgear.vn/wireless-lan/802-11-ac-wi-fi-bluetooth-v4-1/" rel="tag">802.11 ac Wi-Fi + Bluetooth v4.1</a></p>
			</td>
		</tr>
		<tr>
			<th>C&aacute;c cổng kết nối</th>
			<td>
			<p><a href="https://xgear.vn/cac-cong-ket-noi/1-x-usb-3-0-type-c-2-x-usb-3-0-1-x-usb-2-0-1-x-hdmi-audio-jack-microphone-jack-rj45-lan-4-in-1-card-reader-sd-sdhc-sdxc-mmc/" rel="tag">1 x USB 3.0 (Type-C); 2 x USB 3.0 ;1 x USB 2.0 ;1 x HDMI&trade; Audio Jack Microphone Jack RJ45 LAN 4-in-1 Card Reader (SD, SDHC, SDXC, MMC)</a></p>
			</td>
		</tr>
		<tr>
			<th>B&agrave;n ph&iacute;m</th>
			<td>
			<ul>
				<li>Backlight Keyboard Multicolor</li>
			</ul>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://xgear.vn/pin/3-cell/" rel="tag">3 Cell</a></p>
			</td>
		</tr>
		<tr>
			<th>K&iacute;ch thước</th>
			<td>
			<p><a href="https://xgear.vn/kich-thuoc/380-x-265-x-25-8-mm/" rel="tag">380 x 265 x 25.8 (mm)</a></p>
			</td>
		</tr>
		<tr>
			<th>Trọng lượng</th>
			<td>
			<p><a href="https://xgear.vn/trong-luong/2-4kg/" rel="tag">2.4kg</a></p>
			</td>
		</tr>
		<tr>
			<th>GPU</th>
			<td>
			<p><a href="https://xgear.vn/gpu/geforce-gtx-1650-4gb/" rel="tag">Geforce GTX 1650 4GB</a></p>
			</td>
		</tr>
	</tbody>
</table>

<ul>
	<li><a data-toggle="tab" href="https://xgear.vn/laptop-lenovo-legion-5-15imh05-82au004xvn/#tab-description">M&ocirc; tả</a></li>
	<li><a data-toggle="tab" href="https://xgear.vn/laptop-lenovo-legion-5-15imh05-82au004xvn/#tab-product_tag">Tags</a></li>
	<li><a data-toggle="tab" href="https://xgear.vn/laptop-lenovo-legion-5-15imh05-82au004xvn/#tab-additional_information">Th&ocirc;ng tin bổ sung</a></li>
</ul>

<h2>M&ocirc; tả</h2>

<p><a href="https://xgear.vn/laptop-lenovo-legion-5-15imh05-82au004xvn/"><strong>Legion 5 15IMH05 (82AU004XVN)</strong></a></p>

<p>Laptop chơi game, ph&aacute;t triển từ thế hệ tiền nhiệm</p>

<p><strong><img alt="" data-ll-status="loaded" height="849" sizes="(max-width: 1376px) 100vw, 1376px" src="https://xgear.vn/wp-content/uploads/2019/06/LenovoY540-12-1.jpg" srcset="https://xgear.vn/wp-content/uploads/2019/06/LenovoY540-12-1.jpg 1376w, https://xgear.vn/wp-content/uploads/2019/06/LenovoY540-12-1-300x185.jpg 300w, https://xgear.vn/wp-content/uploads/2019/06/LenovoY540-12-1-768x474.jpg 768w, https://xgear.vn/wp-content/uploads/2019/06/LenovoY540-12-1-1024x632.jpg 1024w, https://xgear.vn/wp-content/uploads/2019/06/LenovoY540-12-1-193x119.jpg 193w, https://xgear.vn/wp-content/uploads/2019/06/LenovoY540-12-1-568x350.jpg 568w" width="1376" />T&iacute;nh năng</strong></p>

<h2>Laptop chơi game với ng&ocirc;n ngữ thiết kế mới</h2>
')
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description]) VALUES (10, N'LENOVO LEGION 5 PRO 16ACH6H (82JQ005YVN)', N'/Asset/img/product/files/dsa.jpg', 54, 34, 43, CAST(N'2021-04-27' AS Date), 1, 5, N'<h2>Th&ocirc;ng tin bổ sung</h2>

<table>
	<tbody>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://xgear.vn/cpu/amd-ryzen-7-5800h/" rel="tag">AMD Ryzen 7 5800H</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://xgear.vn/he-dieu-hanh/windows-10-sl-64-bit/" rel="tag">Windows 10 SL 64 Bit</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://xgear.vn/ram/ddr4-16gb-2-x-8gb-3200mhz-2-slots-up-to-32gb/" rel="tag">DDR4 16GB (2 x 8GB) 3200MHz; 2 slots, up to 32GB</a></p>
			</td>
		</tr>
		<tr>
			<th>GPU</th>
			<td>
			<p><a href="https://xgear.vn/gpu/geforce-rtx-3070-8gb/" rel="tag">Geforce RTX 3070 8GB</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://xgear.vn/man-hinh/16-wqxga-2560x1600-ips-500nits-anti-glare-165hz-100-srgb-dolby-vision-hdr-400-free-sync-g-sync-dc-dimmer/" rel="tag">16&quot; WQXGA (2560&times;1600) IPS 500nits Anti-glare, 165Hz, 100% sRGB, Dolby Vision, HDR 400, Free-Sync, G-Sync, DC dimmer</a></p>
			</td>
		</tr>
		<tr>
			<th>Ổ cứng SSD</th>
			<td>
			<p><a href="https://xgear.vn/o-cung-ssd/1-slot-ssd-nvme-m-2-pcie/" rel="tag">1 slot SSD NVMe M.2 PCIe</a>,&nbsp;<a href="https://xgear.vn/o-cung-ssd/1tb-ssd-nvme-m-2-pcie-gen-3-x-4/" rel="tag">1TB SSD NVMe M.2 PCIe Gen 3 x 4</a></p>
			</td>
		</tr>
		<tr>
			<th>Lan</th>
			<td>
			<p><a href="https://xgear.vn/lan/gigabit-ethernet/" rel="tag">Gigabit Ethernet</a></p>
			</td>
		</tr>
		<tr>
			<th>Wireless Lan</th>
			<td>
			<p><a href="https://xgear.vn/wireless-lan/intel-wi-fi-6-ax20122-ax-bt5/" rel="tag">Intel Wi-Fi 6 AX201(2*2 ax) + BT5</a></p>
			</td>
		</tr>
		<tr>
			<th>C&aacute;c cổng kết nối</th>
			<td>
			<p><a href="https://xgear.vn/cac-cong-ket-noi/4-x-usb-3-0-1-x-usb-3-1-type-c-gen2-with-thunderbolt-1-x-headphone-out-audio-in-combo-jack-1-x-rj45-lan-jack-for-lan-insert-1-x-hdmi-1-x-mini-display-port/" rel="tag">4 x USB 3.0; 1 x USB 3.1 Type C (Gen2) with Thunderbolt; 1 x Headphone-out &amp; Audio-in Combo Jack; 1 x RJ45 LAN Jack for LAN insert; 1 x HDMI 1 x mini Display Port</a></p>
			</td>
		</tr>
		<tr>
			<th>B&agrave;n ph&iacute;m</th>
			<td>
			<ul>
				<li>RGB (4-Zone) Keyboard</li>
			</ul>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://xgear.vn/pin/80whrs/" rel="tag">80Whrs</a></p>
			</td>
		</tr>
		<tr>
			<th>K&iacute;ch thước</th>
			<td>
			<p><a href="https://xgear.vn/kich-thuoc/356-x-260-4-264-4-x-21-7-26-85-mm/" rel="tag">356 x 260.4-264.4 x 21.7-26.85 mm</a></p>
			</td>
		</tr>
		<tr>
			<th>Trọng lượng</th>
			<td>
			<p><a href="https://xgear.vn/trong-luong/2-45-kg/" rel="tag">2.45 kg</a></p>
			</td>
		</tr>
	</tbody>
</table>

<ul>
	<li><a data-toggle="tab" href="https://xgear.vn/laptop-lenovo-legion-5-pro-16ach6h-82jq005yvn/#tab-description">M&ocirc; tả</a></li>
	<li><a data-toggle="tab" href="https://xgear.vn/laptop-lenovo-legion-5-pro-16ach6h-82jq005yvn/#tab-additional_information">Th&ocirc;ng tin bổ sung</a></li>
</ul>

<h2>M&ocirc; tả</h2>

<p><a href="https://xgear.vn/laptop-lenovo-legion-5-pro-16ach6h-82jq005yvn/"><strong>Legion 5 Pro&nbsp;16ACH6H (82JQ005YVN)</strong></a></p>

<h2>Pro-level performance</h2>

<p>Được thiết kế để trở th&agrave;nh &ocirc;ng vua tr&ecirc;n đấu trường,&nbsp;<strong>Legion 5 Pro 16ACH6H (82JQ005YVN)</strong>&nbsp;kết hợp khả năng xử l&yacute; CPU AMD 5000H v&agrave; RTX 3000 để mang lại trải nghiệm chơi game độ ph&acirc;n giải cao. Laptop gaming QHD 16 &rdquo; 165Hz đầu ti&ecirc;n tr&ecirc;n thế giới. Kết hợp với &acirc;m thanh Nahimic 3D x&aacute;c định ch&iacute;nh x&aacute;c bước ch&acirc;n trong kh&ocirc;ng gian. Nghe v&agrave; đưa mục ti&ecirc;u v&agrave;o trong tầm bắn.</p>

<p><img alt="Lenovo Legion 5 Pro (16inch AMD), left front angle view" data-ll-status="loaded" src="https://www.lenovo.com/medias/lenovo-laptop-gaming-legion-5-pro-16in-amd-gallery-1.png?context=bWFzdGVyfHJvb3R8MTEyNzg3fGltYWdlL3BuZ3xoMjkvaGRjLzExMzcyNDk3MzM4Mzk4LnBuZ3w3MDYzMjQwMDQyYjFjM2EwNjJmNjQxOWI4NDdlNmY2MWFjOGJlYTcwMjY3NWMzZWMxMDZjZDRhZDIwNWJiMWNm" /></p>

<h2>Ultimate performance. Uncompromised battery life.</h2>
')
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description]) VALUES (11, N'DELL GAMING G3 15 3500 (70223130) ', N'/Asset/img/product/files/sad.jpg', 432, 42, 43, CAST(N'2021-04-27' AS Date), 1, 4, N'<h2>Th&ocirc;ng tin bổ sung</h2>

<table>
	<tbody>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://xgear.vn/cpu/intel-core-i5-10300h/" rel="tag">Intel Core i5 10300H</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://xgear.vn/he-dieu-hanh/windows-10-sl-64-bit/" rel="tag">Windows 10 SL 64 Bit</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://xgear.vn/ram/ddr4-8gb-2x4gb-3200mhz-2-slots-up-to-32gb/" rel="tag">DDR4 8GB (2x4GB) 3200MHz, 2 slots, up to 32GB</a></p>
			</td>
		</tr>
		<tr>
			<th>GPU</th>
			<td>
			<p><a href="https://xgear.vn/gpu/geforce-gtx-1650-4gb/" rel="tag">Geforce GTX 1650 4GB</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://xgear.vn/man-hinh/15-6-full-hd-1920-x-1080-120hz-ips-panel/" rel="tag">15.6&quot; Full HD ( 1920 x 1080 ), 120Hz, IPS Panel</a></p>
			</td>
		</tr>
		<tr>
			<th>Ổ cứng SSD</th>
			<td>
			<p><a href="https://xgear.vn/o-cung-ssd/256gb-ssd-nvme-m-2-pcie-gen-3x2/" rel="tag">256GB SSD NVMe M.2 PCIe Gen 3&times;2</a></p>
			</td>
		</tr>
		<tr>
			<th>Ổ cứng HDD</th>
			<td>
			<p><a href="https://xgear.vn/o-cung-hdd/1tb-hdd/" rel="tag">1TB HDD</a></p>
			</td>
		</tr>
		<tr>
			<th>Lan</th>
			<td>
			<p><a href="https://xgear.vn/lan/gigabit-ethernet/" rel="tag">Gigabit Ethernet</a></p>
			</td>
		</tr>
		<tr>
			<th>Wireless Lan</th>
			<td>
			<p><a href="https://xgear.vn/wireless-lan/802-11ac-2x2-wi-fi/" rel="tag">802.11ac 2&times;2 Wi-Fi</a></p>
			</td>
		</tr>
		<tr>
			<th>C&aacute;c cổng kết nối</th>
			<td>
			<p><a href="https://xgear.vn/cac-cong-ket-noi/1x-2-in-1-sd-micromedia-card-2x-superspeed-usb-3-1-gen-1-type-a-1x-power-dc-in-jack-1x-hdmi-2-0-1x-gigabit-ethernet-rj-45-1x-headphone-mic/" rel="tag">1x 2-in-1 SD/MicroMedia card 2x SuperSpeed USB 3.1 Gen 1 Type-A 1x Power/DC-in Jack 1x HDMI 2.0 1x Gigabit Ethernet RJ-45 1x Headphone/Mic</a></p>
			</td>
		</tr>
		<tr>
			<th>B&agrave;n ph&iacute;m</th>
			<td>
			<ul>
				<li>Backlit keyboard</li>
			</ul>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://xgear.vn/pin/4-cells-56whrs/" rel="tag">4 Cells, 56WHrs</a></p>
			</td>
		</tr>
		<tr>
			<th>K&iacute;ch thước</th>
			<td>
			<p><a href="https://xgear.vn/kich-thuoc/389-x-274-x-24-95-mm/" rel="tag">389 x 274 x 24.95 mm</a></p>
			</td>
		</tr>
		<tr>
			<th>Trọng lượng</th>
			<td>
			<p><a href="https://xgear.vn/trong-luong/2-5-kg/" rel="tag">2.5 kg</a></p>
			</td>
		</tr>
	</tbody>
</table>

<ul>
	<li><a data-toggle="tab" href="https://xgear.vn/laptop-dell-gaming-g3-15-3500-70223130/#tab-description">M&ocirc; tả</a></li>
	<li><a data-toggle="tab" href="https://xgear.vn/laptop-dell-gaming-g3-15-3500-70223130/#tab-product_tag">Tags</a></li>
	<li><a data-toggle="tab" href="https://xgear.vn/laptop-dell-gaming-g3-15-3500-70223130/#tab-additional_information">Th&ocirc;ng tin bổ sung</a></li>
</ul>

<h2>M&ocirc; tả</h2>

<hr />
<h2><a href="https://xgear.vn/laptop-dell-gaming-g3-15-3500-70223130/"><strong>Dell Gaming G3 15 3500 (70223130)&nbsp;</strong></a></h2>

<p><strong><em>D&ograve;ng Laptop Dell Gaming mỏng nhẹ nhưng vẫn mang sức mạnh đột ph&aacute;&nbsp;</em></strong></p>

<p><strong>GEFORCE&nbsp;GTX1650 4GB&nbsp;+ INTEL CORE&nbsp;I5 10300H&nbsp;+ DDR4&nbsp;8GB&nbsp;2933MHz +&nbsp;15.6&Prime;&nbsp;IPS 120Hz</strong></p>

<hr />
<h2>DELL GAMING</h2>

<p>Laptop gaming&nbsp;<strong>Dell Gaming G3 15 3500 (70223130)&nbsp;</strong>được với chip xử l&iacute; đồ họa rời&nbsp;<strong>NVIDIA</strong>&nbsp;v&agrave;&nbsp;<strong>bộ vi xử l&iacute; thế hệ thứ 10</strong>&nbsp;mới nhất c&ugrave;ng thiết kế mỏng nhưng vẫn mang đến trải nghiệm chơi game tuyệt vời.<img alt="" data-ll-status="loaded" height="960" sizes="(max-width: 960px) 100vw, 960px" src="https://xgear.vn/wp-content/uploads/2018/11/g3-1.jpg" srcset="https://xgear.vn/wp-content/uploads/2018/11/g3-1.jpg 960w, https://xgear.vn/wp-content/uploads/2018/11/g3-1-150x150.jpg 150w, https://xgear.vn/wp-content/uploads/2018/11/g3-1-300x300.jpg 300w, https://xgear.vn/wp-content/uploads/2018/11/g3-1-768x768.jpg 768w, https://xgear.vn/wp-content/uploads/2018/11/g3-1-20x20.jpg 20w, https://xgear.vn/wp-content/uploads/2018/11/g3-1-30x30.jpg 30w, https://xgear.vn/wp-content/uploads/2018/11/g3-1-40x40.jpg 40w, https://xgear.vn/wp-content/uploads/2018/11/g3-1-193x193.jpg 193w, https://xgear.vn/wp-content/uploads/2018/11/g3-1-568x568.jpg 568w, https://xgear.vn/wp-content/uploads/2018/11/g3-1-100x100.jpg 100w" width="960" /></p>
')
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description]) VALUES (12, N' DELL G5 5500 (70228123)', N'/Asset/img/product/files/sdf.jpg', 87, 56, 65, CAST(N'2021-04-27' AS Date), 1, 4, N'<h2>Th&ocirc;ng tin bổ sung</h2>

<table>
	<tbody>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://xgear.vn/cpu/intel-core-i7-10750h/" rel="tag">Intel Core i7 10750H</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://xgear.vn/he-dieu-hanh/windows-10-sl-64-bit/" rel="tag">Windows 10 SL 64 Bit</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://xgear.vn/ram/ddr4-16gb-2-x-8gb-3200mhz-2-slots-up-to-32gb/" rel="tag">DDR4 16GB (2 x 8GB) 3200MHz; 2 slots, up to 32GB</a></p>
			</td>
		</tr>
		<tr>
			<th>GPU</th>
			<td>
			<p><a href="https://xgear.vn/gpu/geforce-rtx-2060-6gb/" rel="tag">Geforce RTX 2060 6GB</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://xgear.vn/man-hinh/15-6-fullhd-1920-x-1080-144hz-ips-panel/" rel="tag">15.6&quot; FullHD (1920 x 1080). 144Hz, IPS Panel</a></p>
			</td>
		</tr>
		<tr>
			<th>Ổ cứng SSD</th>
			<td>
			<p><a href="https://xgear.vn/o-cung-ssd/512gb-ssd-nvme-m-2-pcie-gen-3-x-4/" rel="tag">512GB SSD NVMe M.2 PCIe Gen 3 x 4</a></p>
			</td>
		</tr>
		<tr>
			<th>Ổ đĩa quang</th>
			<td>
			<p><a href="https://xgear.vn/o-dia-quang/no-odd/" rel="tag">No ODD</a></p>
			</td>
		</tr>
		<tr>
			<th>Lan</th>
			<td>
			<p><a href="https://xgear.vn/lan/gigabit-ethernet/" rel="tag">Gigabit Ethernet</a></p>
			</td>
		</tr>
		<tr>
			<th>Wireless Lan</th>
			<td>
			<p><a href="https://xgear.vn/wireless-lan/802-11ac-2x2-wi-fi/" rel="tag">802.11ac 2&times;2 Wi-Fi</a></p>
			</td>
		</tr>
		<tr>
			<th>C&aacute;c cổng kết nối</th>
			<td>
			<p><a href="https://xgear.vn/cac-cong-ket-noi/1x-2-in-1-sd-micromedia-card-2x-superspeed-usb-3-1-gen-1-type-a-1x-power-dc-in-jack-1x-hdmi-2-0-1x-gigabit-ethernet-rj-45-1x-headphone-mic/" rel="tag">1x 2-in-1 SD/MicroMedia card 2x SuperSpeed USB 3.1 Gen 1 Type-A 1x Power/DC-in Jack 1x HDMI 2.0 1x Gigabit Ethernet RJ-45 1x Headphone/Mic</a></p>
			</td>
		</tr>
		<tr>
			<th>B&agrave;n ph&iacute;m</th>
			<td>
			<ul>
				<li>Backlit keyboard</li>
			</ul>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://xgear.vn/pin/4-cells-56whrs/" rel="tag">4 Cells, 56WHrs</a></p>
			</td>
		</tr>
		<tr>
			<th>K&iacute;ch thước</th>
			<td>
			<p><a href="https://xgear.vn/kich-thuoc/389-x-274-x-24-95-mm/" rel="tag">389 x 274 x 24.95 mm</a></p>
			</td>
		</tr>
		<tr>
			<th>Trọng lượng</th>
			<td>
			<p><a href="https://xgear.vn/trong-luong/2-5-kg/" rel="tag">2.5 kg</a></p>
			</td>
		</tr>
	</tbody>
</table>

<ul>
	<li><a data-toggle="tab" href="https://xgear.vn/laptop-dell-g5-5500-70225486/#tab-description">M&ocirc; tả</a></li>
	<li><a data-toggle="tab" href="https://xgear.vn/laptop-dell-g5-5500-70225486/#tab-product_tag">Tags</a></li>
	<li><a data-toggle="tab" href="https://xgear.vn/laptop-dell-g5-5500-70225486/#tab-additional_information">Th&ocirc;ng tin bổ sung</a></li>
</ul>

<h2>M&ocirc; tả</h2>

<h2><a href="https://xgear.vn/laptop-dell-g5-5500-70225486/">Dell G5 5500&nbsp;(70225486)</a></h2>

<p><strong><em>D&ograve;ng Laptop Dell Gaming mỏng nhẹ nhưng vẫn mang sức mạnh đột ph&aacute;&nbsp;</em></strong></p>

<p><strong>GEFORCE&nbsp;RTX 2060 6GB&nbsp;+ INTEL CORE&nbsp;i7 10750H&nbsp;+ DDR4&nbsp;16GB&nbsp;3200MHz&nbsp;+ SSD&nbsp;512GB&nbsp;+&nbsp;15.6&Prime;&nbsp;IPS 144Hz</strong></p>

<hr />
<h2>&nbsp;</h2>

<h2>DELL GAMING</h2>

<p><strong>Dell G5 5500 (70225486)</strong>&nbsp;được với chip xử l&iacute; đồ họa rời&nbsp;<strong>NVIDIA</strong>&nbsp;v&agrave;&nbsp;<strong>bộ vi xử l&iacute; thế hệ thứ 10</strong>&nbsp;mới nhất c&ugrave;ng thiết kế mỏng nhưng vẫn mang đến trải nghiệm chơi game tuyệt vời.<img alt="" data-ll-status="loaded" height="960" sizes="(max-width: 960px) 100vw, 960px" src="https://xgear.vn/wp-content/uploads/2018/11/g3-1.jpg" srcset="https://xgear.vn/wp-content/uploads/2018/11/g3-1.jpg 960w, https://xgear.vn/wp-content/uploads/2018/11/g3-1-150x150.jpg 150w, https://xgear.vn/wp-content/uploads/2018/11/g3-1-300x300.jpg 300w, https://xgear.vn/wp-content/uploads/2018/11/g3-1-768x768.jpg 768w, https://xgear.vn/wp-content/uploads/2018/11/g3-1-20x20.jpg 20w, https://xgear.vn/wp-content/uploads/2018/11/g3-1-30x30.jpg 30w, https://xgear.vn/wp-content/uploads/2018/11/g3-1-40x40.jpg 40w, https://xgear.vn/wp-content/uploads/2018/11/g3-1-193x193.jpg 193w, https://xgear.vn/wp-content/uploads/2018/11/g3-1-568x568.jpg 568w, https://xgear.vn/wp-content/uploads/2018/11/g3-1-100x100.jpg 100w" width="960" /></p>
')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 4/30/2021 12:01:21 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 4/30/2021 12:01:21 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 4/30/2021 12:01:21 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RoleId]    Script Date: 4/30/2021 12:01:21 PM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 4/30/2021 12:01:21 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 4/30/2021 12:01:21 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Carts] ADD  CONSTRAINT [DF_Carts_Quantity]  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[OrderDetails] ADD  CONSTRAINT [DF_Order_Details_UnitPrice]  DEFAULT ((0)) FOR [UnitPrice]
GO
ALTER TABLE [dbo].[OrderDetails] ADD  CONSTRAINT [DF_Order_Details_Quantity]  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[OrderDetails] ADD  CONSTRAINT [DF_OrderDetails_Discount]  DEFAULT ((0)) FOR [Discount]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_OrderDate]  DEFAULT (getdate()) FOR [OrderDate]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF__Orders__Amount__381A47C8]  DEFAULT ((0)) FOR [Amount]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Image]  DEFAULT (N'Product.gif') FOR [Image]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_UnitPrice]  DEFAULT ((0)) FOR [UnitPrice]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Discount]  DEFAULT ((0)) FOR [Discount]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Quantity]  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_ProductDate]  DEFAULT (getdate()) FOR [ProductDate]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Available]  DEFAULT ((1)) FOR [Available]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Carts_AspNetUsers]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Carts_Products]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK3ess0s7i9qs6sim1pf9kxhkpq] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK3ess0s7i9qs6sim1pf9kxhkpq]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã loại' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Categories', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tên loại hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Categories', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tên tiếng Việt' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Categories', @level2type=N'COLUMN',@level2name=N'NameVN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã hàng hóa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tên hàng hóa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hình ảnh' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Image'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Đơn giá' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'UnitPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngày sản xuất' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'ProductDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Đang kinh doanh ?' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Available'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã loại, FK' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'CategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mô tả hàng hóa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Description'
GO
USE [master]
GO
ALTER DATABASE [EShop] SET  READ_WRITE 
GO
