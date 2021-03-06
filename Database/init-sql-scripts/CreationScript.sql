USE [master]
GO
CREATE LOGIN [ppp_user] WITH PASSWORD=N'123456', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO

/****** Object:  Database [P3_DB]    Script Date: 21-Jun-22 10:06:21 PM ******/
/****** Script has been modified manually by Hasan Berkan Eroğlu ******/

CREATE DATABASE [P3_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'P3_DB', FILENAME = N'/var/opt/mssql/data/P3_DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'P3_DB_log', FILENAME = N'/var/opt/mssql/data/P3_DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [P3_DB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [P3_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [P3_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [P3_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [P3_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [P3_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [P3_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [P3_DB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [P3_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [P3_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [P3_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [P3_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [P3_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [P3_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [P3_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [P3_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [P3_DB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [P3_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [P3_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [P3_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [P3_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [P3_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [P3_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [P3_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [P3_DB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [P3_DB] SET  MULTI_USER 
GO
ALTER DATABASE [P3_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [P3_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [P3_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [P3_DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [P3_DB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [P3_DB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [P3_DB] SET QUERY_STORE = OFF
GO
USE [P3_DB]
GO
/****** Object:  User [ppp_user]    Script Date: 07-Jun-22 10:09:10 PM ******/
CREATE USER [ppp_user] FOR LOGIN [ppp_user] WITH DEFAULT_SCHEMA=[COMMON]
GO
/****** Object:  Schema [AUTH]    Script Date: 07-Jun-22 10:09:10 PM ******/
CREATE SCHEMA [AUTH]
GO
/****** Object:  Schema [COMMON]    Script Date: 07-Jun-22 10:09:10 PM ******/
CREATE SCHEMA [COMMON]
GO
/****** Object:  Schema [LT_COMMON]    Script Date: 07-Jun-22 10:09:10 PM ******/
CREATE SCHEMA [LT_COMMON]
GO
/****** Object:  Table [AUTH].[USERS]    Script Date: 07-Jun-22 10:09:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AUTH].[USERS](
	[User_ID] [uniqueidentifier] NOT NULL,
	[email] [varchar](100) NOT NULL,
	[password] [text] NOT NULL,
 CONSTRAINT [PK_USERS_1] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [COMMON].[Case]    Script Date: 07-Jun-22 10:09:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [COMMON].[CCase](
	[Case_ID] [uniqueidentifier] NOT NULL,
	[Manufacturer] [varchar](20) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Image] [image] NULL,
	[Price] [float] NOT NULL,
	[Form_Factor] [varchar](10) NOT NULL,
	[Fan_Size] [int] NOT NULL,
	[Fan_Count] [int] NOT NULL,
	[PSU_Inc] [bit] NOT NULL,
	[Wattage] [int] NULL,
	[TemperedGlassPanel_Inc] [bit] NOT NULL,
	[RGB_Inc] [bit] NOT NULL,
 CONSTRAINT [PK_CCase] PRIMARY KEY CLUSTERED 
(
	[Case_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [COMMON].[CPU]    Script Date: 07-Jun-22 10:09:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [COMMON].[CPU](
	[CPU_ID] [uniqueidentifier] NOT NULL,
	[Socket] [varchar](10) NOT NULL,
	[CoreCount] [int] NOT NULL,
	[Frequency] [float] NOT NULL,
	[Manufacturer] [varchar](20) NOT NULL,
	[CacheSize] [float] NOT NULL,
	[CoolerInc] [bit] NOT NULL,
	[TDP] [int] NOT NULL,
	[Family] [varchar](25) NULL,
	[Architecture] [varchar](25) NULL,
	[ModelNo] [varchar](10) NULL,
	[Image] [image] NULL,
	[Name] [varchar](30) NOT NULL,
	[BoostFrequency] [float] NOT NULL,
	[Price] [float] NOT NULL,
 CONSTRAINT [PK_CPU] PRIMARY KEY CLUSTERED 
(
	[CPU_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [COMMON].[CPU_COOLER]    Script Date: 07-Jun-22 10:09:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [COMMON].[CPU_COOLER](
	[Cooler_ID] [uniqueidentifier] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Manufacturer] [varchar](20) NOT NULL,
	[Image] [image] NULL,
	[Price] [float] NOT NULL,
	[Fan_Size] [int] NOT NULL,
	[Type] [varchar](15) NOT NULL,
	[Max_TDP] [int] NOT NULL,
	[Fan_Count] [int] NOT NULL,
	[Noise] [int] NOT NULL,
 CONSTRAINT [PK_CPU_COOLER] PRIMARY KEY CLUSTERED 
(
	[Cooler_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [COMMON].[GPU]    Script Date: 07-Jun-22 10:09:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [COMMON].[GPU](
	[GPU_ID] [uniqueidentifier] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Price] [float] NOT NULL,
	[Image] [image] NULL,
	[Manufacturer] [varchar](20) NOT NULL,
	[Partner_Firm] [varchar](50) NOT NULL,
	[VRAM_Type] [varchar](10) NOT NULL,
	[VRAM_Volume] [int] NOT NULL,
	[Family] [varchar](15) NOT NULL,
	[Model] [varchar](15) NOT NULL,
	[Recommended_Power] [int] NOT NULL,
	[Core_Count] [int] NOT NULL,
	[Core_Frequency] [int] NOT NULL,
	[Boost_Frequency] [int] NOT NULL,
	[Memory_Bandwidth] [int] NOT NULL,
	[Memory_Frequency] [int] NOT NULL,
 CONSTRAINT [PK_GPU] PRIMARY KEY CLUSTERED 
(
	[GPU_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [COMMON].[M2]    Script Date: 07-Jun-22 10:09:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [COMMON].[M2](
	[M2_ID] [uniqueidentifier] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Manufacturer] [varchar](20) NOT NULL,
	[Image] [image] NULL,
	[Price] [float] NOT NULL,
	[Volume] [int] NOT NULL,
	[Read_Speed] [int] NOT NULL,
	[Write_Speed] [int] NOT NULL,
	[PCIe_Version] [float] NOT NULL,
 CONSTRAINT [PK_M2] PRIMARY KEY CLUSTERED 
(
	[M2_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [COMMON].[Memory]    Script Date: 07-Jun-22 10:09:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [COMMON].[Memory](
	[Memory_ID] [uniqueidentifier] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Manufacturer] [varchar](20) NOT NULL,
	[Image] [image] NULL,
	[Price] [float] NOT NULL,
	[Memory_Type] [varchar](4) NOT NULL,
	[Memory_Frequency] [int] NOT NULL,
	[Memory_Volume] [int] NOT NULL,
	[Memory_Count] [int] NOT NULL,
	[Latency] [varchar](4) NOT NULL,
 CONSTRAINT [PK_Memory] PRIMARY KEY CLUSTERED 
(
	[Memory_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [COMMON].[Monitor]    Script Date: 07-Jun-22 10:09:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [COMMON].[Monitor](
	[Monitor_ID] [uniqueidentifier] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Manufacturer] [varchar](20) NOT NULL,
	[Image] [image] NULL,
	[Price] [float] NOT NULL,
	[Panel_Type] [varchar](5) NOT NULL,
	[Refresh_Rate] [int] NOT NULL,
	[Resolution] [varchar](10) NOT NULL,
	[Sync] [varchar](10) NULL,
	[Connection] [varchar](15) NOT NULL,
	[Brightness] [int] NOT NULL,
	[Has_HDR] [bit] NOT NULL,
	[HDR_Version] [varchar](10) NULL,
	[Screen_Size] [float] NOT NULL,
 CONSTRAINT [PK_Monitor] PRIMARY KEY CLUSTERED 
(
	[Monitor_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [COMMON].[MOTHERBOARD]    Script Date: 07-Jun-22 10:09:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [COMMON].[MOTHERBOARD](
	[MotherBoard_ID] [uniqueidentifier] NOT NULL,
	[Manufacturer] [varchar](20) NOT NULL,
	[MotherBoard_Socket] [varchar](10) NOT NULL,
	[Chipset] [varchar](10) NOT NULL,
	[MemorySlot_Count] [int] NOT NULL,
	[Memory_Frequency] [int] NOT NULL,
	[SoundCard] [varchar](30) NULL,
	[PCIe_Version] [float] NOT NULL,
	[PCIe_Max] [varchar](3) NOT NULL,
	[M2_Count] [int] NOT NULL,
	[SATA_Count] [int] NOT NULL,
	[USB_Version] [float] NOT NULL,
	[Image] [image] NULL,
	[Memory_Type] [varchar](4) NOT NULL,
	[Form_Factor] [varchar](10) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Price] [float] NOT NULL,
 CONSTRAINT [PK_MOTHERBOARD] PRIMARY KEY CLUSTERED 
(
	[MotherBoard_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [COMMON].[PSU]    Script Date: 07-Jun-22 10:09:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [COMMON].[PSU](
	[PSU_ID] [uniqueidentifier] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Manufacturer] [varchar](20) NOT NULL,
	[Image] [image] NULL,
	[Price] [float] NOT NULL,
	[Sertificate] [varchar](10) NULL,
	[Wattage] [int] NOT NULL,
	[Is_Modular] [bit] NOT NULL,
 CONSTRAINT [PK_PSU] PRIMARY KEY CLUSTERED 
(
	[PSU_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [COMMON].[SATA]    Script Date: 07-Jun-22 10:09:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [COMMON].[SATA](
	[SATA_ID] [uniqueidentifier] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Manufacturer] [varchar](20) NOT NULL,
	[Image] [image] NULL,
	[Price] [float] NOT NULL,
	[Volume] [int] NOT NULL,
	[Read_Speed] [int] NOT NULL,
	[Write_Speed] [int] NOT NULL,
	[RPM] [int] NULL,
 CONSTRAINT [PK_SATA] PRIMARY KEY CLUSTERED 
(
	[SATA_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [LT_COMMON].[BUILD]    Script Date: 07-Jun-22 10:09:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [LT_COMMON].[BUILD](
	[Build_ID] [uniqueidentifier] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[CPU_ID] [uniqueidentifier] NOT NULL,
	[MotherBoard_ID] [uniqueidentifier] NOT NULL,
	[Memory_ID] [uniqueidentifier] NOT NULL,
	[GPU_ID] [uniqueidentifier] NULL,
	[Cooler_ID] [uniqueidentifier] NULL,
	[M2_ID] [uniqueidentifier] NULL,
	[SATA_ID] [uniqueidentifier] NULL,
	[Monitor_ID] [uniqueidentifier] NULL,
	[PSU_ID] [uniqueidentifier] NULL,
	[Case_ID] [uniqueidentifier] NULL,
	[User_ID] [uniqueidentifier] NOT NULL,
	[Price] [float] NOT NULL,
 CONSTRAINT [PK_BUILD] PRIMARY KEY CLUSTERED 
(
	[Build_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [AUTH].[USERS] ([User_ID],  [email], [password]) VALUES (N'5db1c092-1934-4399-a599-312999630487',  N'example@example.com', N'duperhard123')
GO
INSERT [AUTH].[USERS] ([User_ID],  [email], [password]) VALUES (N'5efe2fb5-8acd-49dd-9d87-ad0a0b2e9dca',  N'admin@p3.com', N'yourStrongPassword')
GO
INSERT [COMMON].[CCase] ([Case_ID], [Manufacturer], [Name], [Image], [Price], [Form_Factor], [Fan_Size], [Fan_Count], [PSU_Inc], [Wattage], [TemperedGlassPanel_Inc], [RGB_Inc]) VALUES (N'93c02ded-3797-4b6a-a700-89a2bdb95dc1', N'Lian Li', N'O11 Dynamic Evo', NULL, 179.99, N'EATX', 120, 6, 0, NULL, 1, 1)
GO
INSERT [COMMON].[CCase] ([Case_ID], [Manufacturer], [Name], [Image], [Price], [Form_Factor], [Fan_Size], [Fan_Count], [PSU_Inc], [Wattage], [TemperedGlassPanel_Inc], [RGB_Inc]) VALUES (N'068ba998-2ad1-4ace-947f-c2960d470df9', N'Antec', N'DF700 Flux', NULL, 102.99, N'ATX', 120, 4, 0, NULL, 1, 1)
GO
INSERT [COMMON].[CPU] ([CPU_ID], [Socket], [CoreCount], [Frequency], [Manufacturer], [CacheSize], [CoolerInc], [TDP], [Family], [Architecture], [ModelNo], [Image], [Name], [BoostFrequency], [Price]) VALUES (N'f1fc81b4-1944-4697-b73f-5c78f1764ade', N'AM4', 6, 3.7, N'AMD', 32, 1, 65, N'Vermeer', N'Zen 3 ', N'5600X', NULL, N'Ryzen 5 5600X', 4.6, 199.99)
GO
INSERT [COMMON].[CPU] ([CPU_ID], [Socket], [CoreCount], [Frequency], [Manufacturer], [CacheSize], [CoolerInc], [TDP], [Family], [Architecture], [ModelNo], [Image], [Name], [BoostFrequency], [Price]) VALUES (N'730d2411-86bd-4c59-ae8b-948d9d452894', N'LGA1700', 12, 3.6, N'Intel', 25, 0, 125, N'Alder Lake', N'Alder Lake', N'12700K', NULL, N'Core i7-12700K', 5, 384.99)
GO
INSERT [COMMON].[CPU_COOLER] ([Cooler_ID], [Name], [Manufacturer], [Image], [Price], [Fan_Size], [Type], [Max_TDP], [Fan_Count], [Noise]) VALUES (N'bc77778c-4e6e-46fa-bc8f-55ab303ffc7f', N'Freezer 34 eSports Duo', N'ARCTIC', NULL, 52.99, 120, N'Tower', 65, 2, 24)
GO
INSERT [COMMON].[CPU_COOLER] ([Cooler_ID], [Name], [Manufacturer], [Image], [Price], [Fan_Size], [Type], [Max_TDP], [Fan_Count], [Noise]) VALUES (N'0f2f76be-4f7c-4139-9793-94f6990ecf3e', N'GALAHAD AIO 360 RGB UNI FAN SL120 EDITION ', N'Lian Li', NULL, 175.9, 120, N'Water Cooling', 120, 3, 32)
GO
INSERT [COMMON].[GPU] ([GPU_ID], [Name], [Price], [Image], [Manufacturer], [Partner_Firm], [VRAM_Type], [VRAM_Volume], [Family], [Model], [Recommended_Power], [Core_Count], [Core_Frequency], [Boost_Frequency], [Memory_Bandwidth], [Memory_Frequency]) VALUES (N'2f4952f7-5260-4ef6-aa9f-a0add5f7d15e', N'GeForce RTX 3080', 978.58, NULL, N'NVIDIA', N'Palit', N'GDDR6X', 10240, N'RTX 3000', N'3080', 320, 8704, 1440, 1740, 760, 19000)
GO
INSERT [COMMON].[GPU] ([GPU_ID], [Name], [Price], [Image], [Manufacturer], [Partner_Firm], [VRAM_Type], [VRAM_Volume], [Family], [Model], [Recommended_Power], [Core_Count], [Core_Frequency], [Boost_Frequency], [Memory_Bandwidth], [Memory_Frequency]) VALUES (N'1537bf80-ee2a-4923-b7e0-b93b2766a67b', N'Radeon RX 6600 XT Speedster SWFT 210', 359.99, NULL, N'AMD', N'XFX', N'GDDR6', 8192, N'RX 6000', N'6600', 160, 32, 2092, 2589, 256, 16000)
GO
INSERT [COMMON].[M2] ([M2_ID], [Name], [Manufacturer], [Image], [Price], [Volume], [Read_Speed], [Write_Speed], [PCIe_Version]) VALUES (N'cc560a26-b65c-40fd-b0cb-0ba2e3f44e2f', N'Rocket', N'Sabrent', NULL, 129.99, 1024, 5000, 4400, 4)
GO
INSERT [COMMON].[M2] ([M2_ID], [Name], [Manufacturer], [Image], [Price], [Volume], [Read_Speed], [Write_Speed], [PCIe_Version]) VALUES (N'caa4a3ba-5173-43a1-8aae-1cf214e15cda', N'Green', N'Western Digital', NULL, 74.98, 960, 2400, 1900, 3)
GO
INSERT [COMMON].[Memory] ([Memory_ID], [Name], [Manufacturer], [Image], [Price], [Memory_Type], [Memory_Frequency], [Memory_Volume], [Memory_Count], [Latency]) VALUES (N'd39b9230-ed95-49c1-9a70-36e103ceff22', N'Vengance LPX', N'Corsair', NULL, 76.99, N'DDR4', 3600, 8, 2, N'CL16')
GO
INSERT [COMMON].[Memory] ([Memory_ID], [Name], [Manufacturer], [Image], [Price], [Memory_Type], [Memory_Frequency], [Memory_Volume], [Memory_Count], [Latency]) VALUES (N'370e9345-bb99-45fa-82e0-63d4d5275c14', N'Vengence RGB RT', N'Corsair', NULL, 146.99, N'DDR4', 3600, 16, 2, N'CL16')
GO
INSERT [COMMON].[Monitor] ([Monitor_ID], [Name], [Manufacturer], [Image], [Price], [Panel_Type], [Refresh_Rate], [Resolution], [Sync], [Connection], [Brightness], [Has_HDR], [HDR_Version], [Screen_Size]) VALUES (N'1a05e9d9-4fb0-42ee-8757-1ed90ecb20ef', N'CQ32G1', N'AOC', NULL, 250.87, N'VA', 144, N'2560x1440', N'FreeSync', N'HDMI', 300, 0, NULL, 31.5)
GO
INSERT [COMMON].[MOTHERBOARD] ([MotherBoard_ID], [Manufacturer], [MotherBoard_Socket], [Chipset], [MemorySlot_Count], [Memory_Frequency], [SoundCard], [PCIe_Version], [PCIe_Max], [M2_Count], [SATA_Count], [USB_Version], [Image], [Memory_Type], [Form_Factor], [Name], [Price]) VALUES (N'1f0dd137-f943-4ba5-9091-53150764d3ee', N'Gigabyte', N'LGA1700', N'Z690', 4, 5333, N'Realtek ALC1220-VB', 5, N'3', 2, 1, 3.2, NULL, N'DDR4', N'ATX', N'AORUS ELITE AX', 297.26)
GO
INSERT [COMMON].[MOTHERBOARD] ([MotherBoard_ID], [Manufacturer], [MotherBoard_Socket], [Chipset], [MemorySlot_Count], [Memory_Frequency], [SoundCard], [PCIe_Version], [PCIe_Max], [M2_Count], [SATA_Count], [USB_Version], [Image], [Memory_Type], [Form_Factor], [Name], [Price]) VALUES (N'9e406478-0022-4960-8728-e853f87a5f51', N'ASRock', N'AM4', N'B550', 4, 4533, NULL, 4, N'2', 1, 4, 3.2, NULL, N'DDR4', N'ATX', N'Phantom Gaming 4/ac', 94.99)
GO
INSERT [COMMON].[PSU] ([PSU_ID], [Name], [Manufacturer], [Image], [Price], [Sertificate], [Wattage], [Is_Modular]) VALUES (N'5e6906c3-25fa-42e8-aa99-351b5f30a5e4', N'B5', N'EVGA', NULL, 69.98, N'Bronze', 550, 1)
GO
INSERT [COMMON].[PSU] ([PSU_ID], [Name], [Manufacturer], [Image], [Price], [Sertificate], [Wattage], [Is_Modular]) VALUES (N'4ca7d727-66f8-404c-97b9-89d9a7ad88e2', N'RMx (2021)', N'Corsair', NULL, 134.99, N'Gold', 850, 1)
GO
INSERT [COMMON].[SATA] ([SATA_ID], [Name], [Manufacturer], [Image], [Price], [Volume], [Read_Speed], [Write_Speed], [RPM]) VALUES (N'7c549ca2-9d85-4c4e-8c98-6b33a51f0883', N'Red Plus', N'Western Digital', NULL, 208.93, 8192, 210, 180, 7200)
GO
INSERT INTO [LT_COMMON].[BUILD] ([Build_ID],[Name],[CPU_ID],[MotherBoard_ID],[Memory_ID],[GPU_ID],[Cooler_ID],[M2_ID],[Monitor_ID],[PSU_ID],[Case_ID],[User_ID],[Price]) VALUES(N'a6378441-de42-4a6b-99cf-b0b1334a4a73', N'Example Build',N'F1FC81B4-1944-4697-B73F-5C78F1764ADE', N'9E406478-0022-4960-8728-E853F87A5F51', N'D39B9230-ED95-49C1-9A70-36E103CEFF22', N'1537BF80-EE2A-4923-B7E0-B93B2766A67B', N'0F2F76BE-4F7C-4139-9793-94F6990ECF3E', N'CC560A26-B65C-40FD-B0CB-0BA2E3F44E2F', N'1A05E9D9-4FB0-42EE-8757-1ED90ECB20EF', N'4CA7D727-66F8-404C-97B9-89D9A7AD88E2', N'93C02DED-3797-4B6A-A700-89A2BDB95DC1', N'5EFE2FB5-8ACD-49DD-9D87-AD0A0B2E9DCA', 3000.0);
GO
ALTER TABLE [LT_COMMON].[BUILD]  WITH CHECK ADD  CONSTRAINT [FK_BUILD_CCase] FOREIGN KEY([Case_ID])
REFERENCES [COMMON].[CCase] ([Case_ID])
GO
ALTER TABLE [LT_COMMON].[BUILD] CHECK CONSTRAINT [FK_BUILD_CCase]
GO
ALTER TABLE [LT_COMMON].[BUILD]  WITH CHECK ADD  CONSTRAINT [FK_BUILD_CPU] FOREIGN KEY([CPU_ID])
REFERENCES [COMMON].[CPU] ([CPU_ID])
GO
ALTER TABLE [LT_COMMON].[BUILD] CHECK CONSTRAINT [FK_BUILD_CPU]
GO
ALTER TABLE [LT_COMMON].[BUILD]  WITH CHECK ADD  CONSTRAINT [FK_BUILD_CPU_COOLER] FOREIGN KEY([Cooler_ID])
REFERENCES [COMMON].[CPU_COOLER] ([Cooler_ID])
GO
ALTER TABLE [LT_COMMON].[BUILD] CHECK CONSTRAINT [FK_BUILD_CPU_COOLER]
GO
ALTER TABLE [LT_COMMON].[BUILD]  WITH CHECK ADD  CONSTRAINT [FK_BUILD_GPU] FOREIGN KEY([GPU_ID])
REFERENCES [COMMON].[GPU] ([GPU_ID])
GO
ALTER TABLE [LT_COMMON].[BUILD] CHECK CONSTRAINT [FK_BUILD_GPU]
GO
ALTER TABLE [LT_COMMON].[BUILD]  WITH CHECK ADD  CONSTRAINT [FK_BUILD_M2] FOREIGN KEY([M2_ID])
REFERENCES [COMMON].[M2] ([M2_ID])
GO
ALTER TABLE [LT_COMMON].[BUILD] CHECK CONSTRAINT [FK_BUILD_M2]
GO
ALTER TABLE [LT_COMMON].[BUILD]  WITH CHECK ADD  CONSTRAINT [FK_BUILD_Memory] FOREIGN KEY([Memory_ID])
REFERENCES [COMMON].[Memory] ([Memory_ID])
GO
ALTER TABLE [LT_COMMON].[BUILD] CHECK CONSTRAINT [FK_BUILD_Memory]
GO
ALTER TABLE [LT_COMMON].[BUILD]  WITH CHECK ADD  CONSTRAINT [FK_BUILD_Monitor] FOREIGN KEY([Monitor_ID])
REFERENCES [COMMON].[Monitor] ([Monitor_ID])
GO
ALTER TABLE [LT_COMMON].[BUILD] CHECK CONSTRAINT [FK_BUILD_Monitor]
GO
ALTER TABLE [LT_COMMON].[BUILD]  WITH CHECK ADD  CONSTRAINT [FK_BUILD_MOTHERBOARD] FOREIGN KEY([MotherBoard_ID])
REFERENCES [COMMON].[MOTHERBOARD] ([MotherBoard_ID])
GO
ALTER TABLE [LT_COMMON].[BUILD] CHECK CONSTRAINT [FK_BUILD_MOTHERBOARD]
GO
ALTER TABLE [LT_COMMON].[BUILD]  WITH CHECK ADD  CONSTRAINT [FK_BUILD_PSU] FOREIGN KEY([PSU_ID])
REFERENCES [COMMON].[PSU] ([PSU_ID])
GO
ALTER TABLE [LT_COMMON].[BUILD] CHECK CONSTRAINT [FK_BUILD_PSU]
GO
ALTER TABLE [LT_COMMON].[BUILD]  WITH CHECK ADD  CONSTRAINT [FK_BUILD_SATA] FOREIGN KEY([SATA_ID])
REFERENCES [COMMON].[SATA] ([SATA_ID])
GO
ALTER TABLE [LT_COMMON].[BUILD] CHECK CONSTRAINT [FK_BUILD_SATA]
GO
ALTER TABLE [LT_COMMON].[BUILD]  WITH CHECK ADD  CONSTRAINT [FK_BUILD_USERS] FOREIGN KEY([User_ID])
REFERENCES [AUTH].[USERS] ([User_ID])
GO
ALTER TABLE [LT_COMMON].[BUILD] CHECK CONSTRAINT [FK_BUILD_USERS]
GO
USE [master]
GO
ALTER DATABASE [P3_DB] SET  READ_WRITE 
GO
USE [P3_DB]
GO
ALTER ROLE [db_datareader] ADD MEMBER [ppp_user]
GO
USE [P3_DB]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [ppp_user]
GO
