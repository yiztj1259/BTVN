USE [master]
GO
/****** Object:  Database [Data_BanHang_HocTap]    Script Date: 21/04/2023 14:14:14 ******/
CREATE DATABASE [Data_BanHang_HocTap]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Data_BanHang_HocTap', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Data_BanHang_HocTap.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Data_BanHang_HocTap_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Data_BanHang_HocTap_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Data_BanHang_HocTap] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Data_BanHang_HocTap].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Data_BanHang_HocTap] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Data_BanHang_HocTap] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Data_BanHang_HocTap] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Data_BanHang_HocTap] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Data_BanHang_HocTap] SET ARITHABORT OFF 
GO
ALTER DATABASE [Data_BanHang_HocTap] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Data_BanHang_HocTap] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Data_BanHang_HocTap] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Data_BanHang_HocTap] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Data_BanHang_HocTap] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Data_BanHang_HocTap] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Data_BanHang_HocTap] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Data_BanHang_HocTap] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Data_BanHang_HocTap] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Data_BanHang_HocTap] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Data_BanHang_HocTap] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Data_BanHang_HocTap] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Data_BanHang_HocTap] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Data_BanHang_HocTap] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Data_BanHang_HocTap] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Data_BanHang_HocTap] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Data_BanHang_HocTap] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Data_BanHang_HocTap] SET RECOVERY FULL 
GO
ALTER DATABASE [Data_BanHang_HocTap] SET  MULTI_USER 
GO
ALTER DATABASE [Data_BanHang_HocTap] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Data_BanHang_HocTap] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Data_BanHang_HocTap] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Data_BanHang_HocTap] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Data_BanHang_HocTap] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Data_BanHang_HocTap] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Data_BanHang_HocTap', N'ON'
GO
ALTER DATABASE [Data_BanHang_HocTap] SET QUERY_STORE = ON
GO
ALTER DATABASE [Data_BanHang_HocTap] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Data_BanHang_HocTap]
GO
/****** Object:  UserDefinedFunction [dbo].[YFC_SinhMaTuDong]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[YFC_SinhMaTuDong](
@MaxID VARCHAR(20),
@Start INT,
@Length INT,
@Assign VARCHAR(20),
@Format VARCHAR(20)
)
RETURNS VARCHAR(20)
AS
BEGIN
	DECLARE @Number INT
	DECLARE @Result VARCHAR(20)
	SET @Number = CONVERT(INT, SUBSTRING(@MaxID, @Start, @Length)) + 1

	SET @Result = @Assign + FORMAT(@Number, @Format)
	RETURN @Result
END
GO
/****** Object:  Table [dbo].[ChiTietGiaBan]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietGiaBan](
	[MaSP] [char](9) NOT NULL,
	[LanThayDoi] [int] NOT NULL,
	[NgayTao] [date] NOT NULL,
	[DonGia] [float] NOT NULL,
	[TinhTrang] [bit] NOT NULL,
	[NgayApDung] [date] NOT NULL,
 CONSTRAINT [PK_ChiTietGiaBan] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC,
	[LanThayDoi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[MaHD] [char](9) NOT NULL,
	[MaSP] [char](9) NOT NULL,
	[SoLuongBan] [int] NOT NULL,
	[DonGiaBan] [float] NOT NULL,
	[GiamGia] [float] NOT NULL,
 CONSTRAINT [PK_ChiTietHoaDon] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietPhieuNhap]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietPhieuNhap](
	[MaPhieuNhap] [char](9) NOT NULL,
	[MaSP] [char](9) NOT NULL,
	[SoLuongNhap] [int] NOT NULL,
	[DonGiaNhap] [float] NOT NULL,
	[SoLuongNhapTon] [int] NOT NULL,
 CONSTRAINT [pf_ChiTietPhieuNhap] PRIMARY KEY CLUSTERED 
(
	[MaPhieuNhap] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChucNang]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChucNang](
	[MaChucNang] [int] IDENTITY(1,1) NOT NULL,
	[TenChucNang] [nvarchar](100) NULL,
	[KyHieu] [varchar](50) NULL,
	[MaNhomChucNang] [int] NOT NULL,
	[IsDelete] [bit] NOT NULL,
 CONSTRAINT [PK_ChucNang] PRIMARY KEY CLUSTERED 
(
	[MaChucNang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonViTinh]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonViTinh](
	[MaDVT] [int] IDENTITY(1,1) NOT NULL,
	[TenDVT] [nvarchar](10) NOT NULL,
	[IsDelete] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDVT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHD] [char](9) NOT NULL,
	[NgayLap] [datetime] NULL,
	[MaNhanVien] [char](9) NOT NULL,
	[GiamGia] [float] NOT NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiChucNang]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiChucNang](
	[MaNhomChucNang] [int] IDENTITY(1,1) NOT NULL,
	[TenNhomChucNang] [nvarchar](50) NULL,
	[IsDelete] [bit] NOT NULL,
 CONSTRAINT [PK_LoaiChucNang] PRIMARY KEY CLUSTERED 
(
	[MaNhomChucNang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiSanPham]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSanPham](
	[MaLSP] [int] NOT NULL,
	[TenLSP] [nvarchar](50) NOT NULL,
	[IsDelete] [bit] NOT NULL,
 CONSTRAINT [PK_LoaiSanPham] PRIMARY KEY CLUSTERED 
(
	[MaLSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNhanVien] [char](9) NOT NULL,
	[TenNhanVien] [nvarchar](50) NOT NULL,
	[GioiTinh] [bit] NULL,
	[NgaySinh] [date] NULL,
	[DienThoai] [nvarchar](50) NULL,
	[TenDangNhap] [varchar](50) NULL,
	[MatKhau] [varbinary](128) NULL,
	[MaTaiKhoan] [char](9) NOT NULL,
	[TinhTrang] [bit] NOT NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNhanVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanQuyen]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanQuyen](
	[MaChucNang] [int] NOT NULL,
	[MaTaiKhoan] [char](9) NOT NULL,
	[GiaTriQuyen] [int] NOT NULL,
	[IsDelete] [bit] NOT NULL,
 CONSTRAINT [PK_PhanQuyen] PRIMARY KEY CLUSTERED 
(
	[MaChucNang] ASC,
	[MaTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuNhap]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuNhap](
	[MaPhieuNhap] [char](9) NOT NULL,
	[NgayNhap] [datetime] NOT NULL,
	[MaNhanVien] [char](9) NOT NULL,
	[StatusPhieuNhap] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPhieuNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [char](9) NOT NULL,
	[TenSP] [nvarchar](100) NOT NULL,
	[SoTon] [int] NOT NULL,
	[MaDVT] [int] NOT NULL,
	[MaLSP] [int] NOT NULL,
	[IsDelete] [bit] NOT NULL,
 CONSTRAINT [PK__SanPham__2725081C164452B1] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ__SanPham__4CF9DC141920BF5C] UNIQUE NONCLUSTERED 
(
	[TenSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[MaTaiKhoan] [char](9) NOT NULL,
	[TenTaiKhoan] [nvarchar](50) NOT NULL,
	[IsDelete] [bit] NOT NULL,
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[MaTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ChiTietGiaBan] ADD  CONSTRAINT [DF_ChiTietGiaBan_NgayTao]  DEFAULT (getdate()) FOR [NgayTao]
GO
ALTER TABLE [dbo].[ChiTietGiaBan] ADD  CONSTRAINT [DF_ChiTietGiaBan_DonGia]  DEFAULT ((0)) FOR [DonGia]
GO
ALTER TABLE [dbo].[ChiTietGiaBan] ADD  CONSTRAINT [DF_ChiTietGiaBan_TinhTrang]  DEFAULT ((1)) FOR [TinhTrang]
GO
ALTER TABLE [dbo].[ChiTietGiaBan] ADD  CONSTRAINT [DF_ChiTietGiaBan_NgayApDung]  DEFAULT (getdate()) FOR [NgayApDung]
GO
ALTER TABLE [dbo].[ChiTietHoaDon] ADD  CONSTRAINT [DF_ChiTietHoaDon_SoLuongBan]  DEFAULT ((0)) FOR [SoLuongBan]
GO
ALTER TABLE [dbo].[ChiTietHoaDon] ADD  CONSTRAINT [DF_ChiTietHoaDon_DonGiaBan]  DEFAULT ((0)) FOR [DonGiaBan]
GO
ALTER TABLE [dbo].[ChiTietHoaDon] ADD  CONSTRAINT [DF_ChiTietHoaDon_GiamGia]  DEFAULT ((0)) FOR [GiamGia]
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap] ADD  CONSTRAINT [DF__ChiTietPh__SoLuo__267ABA7A]  DEFAULT ((0)) FOR [SoLuongNhap]
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap] ADD  CONSTRAINT [DF__ChiTietPh__DonGi__276EDEB3]  DEFAULT ((0)) FOR [DonGiaNhap]
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap] ADD  CONSTRAINT [DF__ChiTietPh__SoLuo__286302EC]  DEFAULT ((0)) FOR [SoLuongNhapTon]
GO
ALTER TABLE [dbo].[ChucNang] ADD  CONSTRAINT [DF_ChucNang_MaNhomChucNang]  DEFAULT ((1)) FOR [MaNhomChucNang]
GO
ALTER TABLE [dbo].[ChucNang] ADD  CONSTRAINT [DF_ChucNang_IsDelete]  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[DonViTinh] ADD  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF_HoaDon_GiamGia]  DEFAULT ((0)) FOR [GiamGia]
GO
ALTER TABLE [dbo].[LoaiChucNang] ADD  CONSTRAINT [DF_LoaiChucNang_IsDelete]  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[PhanQuyen] ADD  CONSTRAINT [DF_PhanQuyen_IsDelete]  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[PhieuNhap] ADD  DEFAULT (getdate()) FOR [NgayNhap]
GO
ALTER TABLE [dbo].[PhieuNhap] ADD  CONSTRAINT [DF_PhieuNhap_StatusPhieuNhap]  DEFAULT ((0)) FOR [StatusPhieuNhap]
GO
ALTER TABLE [dbo].[SanPham] ADD  CONSTRAINT [DF__SanPham__SoTon__1B0907CE]  DEFAULT ((0)) FOR [SoTon]
GO
ALTER TABLE [dbo].[SanPham] ADD  CONSTRAINT [DF__SanPham__IsDelet__1BFD2C07]  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[TaiKhoan] ADD  CONSTRAINT [DF_TaiKhoan_IsDelete]  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[ChiTietGiaBan]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietGiaBan_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[ChiTietGiaBan] CHECK CONSTRAINT [FK_ChiTietGiaBan_SanPham]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_HoaDon] FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoaDon] ([MaHD])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_HoaDon]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_SanPham]
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap]  WITH CHECK ADD  CONSTRAINT [fk_ChiTietPhieuNhap_PhieuNhap] FOREIGN KEY([MaPhieuNhap])
REFERENCES [dbo].[PhieuNhap] ([MaPhieuNhap])
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap] CHECK CONSTRAINT [fk_ChiTietPhieuNhap_PhieuNhap]
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap]  WITH CHECK ADD  CONSTRAINT [fk_ChiTietPhieuNhap_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap] CHECK CONSTRAINT [fk_ChiTietPhieuNhap_SanPham]
GO
ALTER TABLE [dbo].[ChucNang]  WITH CHECK ADD  CONSTRAINT [FK_ChucNang_LoaiChucNang] FOREIGN KEY([MaNhomChucNang])
REFERENCES [dbo].[LoaiChucNang] ([MaNhomChucNang])
GO
ALTER TABLE [dbo].[ChucNang] CHECK CONSTRAINT [FK_ChucNang_LoaiChucNang]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_NhanVien] FOREIGN KEY([MaNhanVien])
REFERENCES [dbo].[NhanVien] ([MaNhanVien])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_NhanVien]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_TaiKhoan] FOREIGN KEY([MaTaiKhoan])
REFERENCES [dbo].[TaiKhoan] ([MaTaiKhoan])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_TaiKhoan]
GO
ALTER TABLE [dbo].[PhanQuyen]  WITH CHECK ADD  CONSTRAINT [FK_PhanQuyen_ChucNang] FOREIGN KEY([MaChucNang])
REFERENCES [dbo].[ChucNang] ([MaChucNang])
GO
ALTER TABLE [dbo].[PhanQuyen] CHECK CONSTRAINT [FK_PhanQuyen_ChucNang]
GO
ALTER TABLE [dbo].[PhanQuyen]  WITH CHECK ADD  CONSTRAINT [FK_PhanQuyen_TaiKhoan] FOREIGN KEY([MaTaiKhoan])
REFERENCES [dbo].[TaiKhoan] ([MaTaiKhoan])
GO
ALTER TABLE [dbo].[PhanQuyen] CHECK CONSTRAINT [FK_PhanQuyen_TaiKhoan]
GO
ALTER TABLE [dbo].[PhieuNhap]  WITH CHECK ADD  CONSTRAINT [fk_PhieuNhap_NhanVien] FOREIGN KEY([MaNhanVien])
REFERENCES [dbo].[NhanVien] ([MaNhanVien])
GO
ALTER TABLE [dbo].[PhieuNhap] CHECK CONSTRAINT [fk_PhieuNhap_NhanVien]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_DonViTinh] FOREIGN KEY([MaDVT])
REFERENCES [dbo].[DonViTinh] ([MaDVT])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_DonViTinh]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_LoaiSanPham] FOREIGN KEY([MaLSP])
REFERENCES [dbo].[LoaiSanPham] ([MaLSP])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_LoaiSanPham]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [Ck_SoTonLonHonHayBang0] CHECK  (([SoTon]>=(0)))
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [Ck_SoTonLonHonHayBang0]
GO
/****** Object:  StoredProcedure [dbo].[PSP_ChiTietGiaban_Select]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[PSP_ChiTietGiaban_Select]
AS
    SELECT  ROW_NUMBER() OVER ( ORDER BY ( SELECT   1
                                         ) ) AS STT,
            b.MaSP ,
            b.TenSP ,
           ISNULL( a.NgayTao ,GETDATE()) AS NgayTao,
             ISNULL( a.NgayApDung ,GETDATE()) AS NgayApDung,
           ISNULL( a.DonGia,0)AS DonGiaHienHanh
    FROM    dbo.SanPham b LEFT join dbo.ChiTietGiaBan a
            ON b.MaSP = a.MaSP
    WHERE   b.IsDelete = 0 AND a.TinhTrang=1
    ORDER BY b.TenSP;
GO
/****** Object:  StoredProcedure [dbo].[PSP_ChiTietGiaBan_UpdateGia]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROC [dbo].[PSP_ChiTietGiaBan_UpdateGia]
    @MaSP CHAR(9),
    @GiaBanHienHanh FLOAT
    AS
    SET XACT_ABORT ON
    BEGIN TRAN
    DECLARE @LanTaoMax INT
    SET @LanTaoMax=(SELECT MAX(LanThayDoi)+1 FROM dbo.ChiTietGiaBan WHERE MaSP=@MaSP)
    
		UPDATE	dbo.ChiTietGiaBan
		SET TinhTrang=0
		WHERE MaSP=@MaSP
		
		INSERT INTO dbo.ChiTietGiaBan
		        ( MaSP ,
		          LanThayDoi ,
		          NgayTao ,
		          DonGia ,
		          TinhTrang ,
		          NgayApDung
		        )
		VALUES  ( @MaSP , -- MaSP - char(9)
		          @LanTaoMax , -- LanThayDoi - int
		          GETDATE() , -- NgayTao - date
		          @GiaBanHienHanh , -- DonGia - float
		          1 , -- TinhTrang - bit
		          GETDATE()  -- NgayApDung - date
		        )
    COMMIT 
GO
/****** Object:  StoredProcedure [dbo].[PSP_ChiTietHoaDon_InsertChiTietHoaDon]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PSP_ChiTietHoaDon_InsertChiTietHoaDon]
    @MaHD CHAR(9) ,
    @MaSP CHAR(9) ,
    @SoLuongBan INT ,
    @DonGiaBan FLOAT ,
    @NgayLap DATE ,
    @MaNhanVien CHAR(9)
AS
SET XACT_ABORT ON 
BEGIN tran
IF EXISTS (SELECT 1 FROM dbo.HoaDon WHERE MaHD=@MaHD)
BEGIN
    IF EXISTS (SELECT 1 FROM dbo.ChiTietHoaDon WHERE MaHD=@MaHD AND MaSP=@MaSP)
    BEGIN
		UPDATE dbo.ChiTietHoaDon
		SET SoLuongBan+=@SoLuongBan
		WHERE MaHD=@MaHD AND MaSP=@MaSP
    END
    ELSE
    BEGIN
        INSERT INTO ChiTietHoaDon(MaHD, MaSP, SoLuongBan, DonGiaBan, GiamGia)
        VALUES (@MaHD, @MaSP, @SoLuongBan, @DonGiaBan, 0)
    END
END
ELSE
BEGIN
    INSERT INTO HoaDon(MaHD, NgayLap, MaNhanVien, GiamGia)
    VALUES(@MaHD, @NgayLap, @MaNhanVien, 0)
    
     INSERT INTO ChiTietHoaDon(MaHD, MaSP, SoLuongBan, DonGiaBan, GiamGia)
        VALUES (@MaHD, @MaSP, @SoLuongBan, @DonGiaBan, 0)
END
COMMIT
GO
/****** Object:  StoredProcedure [dbo].[PSP_ChiTietHoaDon_Select]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PSP_ChiTietHoaDon_Select] @MaHD CHAR(9)
AS
    SELECT  0 AS STT ,
            a.MaSP ,
            a.TenSP ,
            b.DonGiaBan ,
            b.SoLuongBan ,
            b.DonGiaBan * b.SoLuongBan AS ThanhTien
    FROM    dbo.SanPham a
            JOIN dbo.ChiTietHoaDon b ON b.MaSP = a.MaSP
            JOIN dbo.HoaDon c ON c.MaHD = b.MaHD
            WHERE b.MaHD=@MaHD
            ORDER BY a.TenSP
GO
/****** Object:  StoredProcedure [dbo].[PSP_ChiTietNhap_Insert]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PSP_ChiTietNhap_Insert]
    @MaPhieuNhap CHAR(9) ,
    @MaSP CHAR(9) ,
    @SoLuongNhap INT ,
    @DonGiaNhap FLOAT ,
    @MaDVT INT ,
    @TenSP NVARCHAR(100)
AS
    SET XACT_ABORT ON; 
    BEGIN TRAN;
    IF EXISTS ( SELECT  1
                FROM    dbo.ChiTietPhieuNhap
                WHERE   MaPhieuNhap = @MaPhieuNhap
                        AND MaSP = @MaSP )
        BEGIN --update so luong
            UPDATE  dbo.ChiTietPhieuNhap
            SET     SoLuongNhap+= @SoLuongNhap ,
                    SoLuongNhapTon = SoLuongNhap
            WHERE   MaPhieuNhap = @MaPhieuNhap
                    AND MaSP = @MaSP;
        END;--Update so luong
    ELSE
        BEGIN--Insert san pham moi
            IF NOT EXISTS ( SELECT  1
                            FROM    dbo.SanPham
                            WHERE   MaSP = @MaSP )
                BEGIN
                    INSERT  INTO dbo.SanPham
                            (MaSP, TenSP, SoTon, MaDVT, IsDelete )
                    VALUES  (@MaSP, @TenSP, 0, @MaDVT, 0 );
	
                END;
            INSERT  INTO ChiTietPhieuNhap
                    ( MaPhieuNhap ,
                      MaSP ,
                      SoLuongNhap ,
                      DonGiaNhap ,
                      SoLuongNhapTon
                    )
            VALUES  ( @MaPhieuNhap ,
                      @MaSP ,
                      @SoLuongNhap ,
                      @DonGiaNhap ,
                      @SoLuongNhap
                    );
        END;--insert san pham moi
--them vao so luong ton trong bang san pham
    UPDATE  dbo.SanPham
    SET     SoTon+= @SoLuongNhap
    WHERE   MaSP = @MaSP;
    COMMIT;
GO
/****** Object:  StoredProcedure [dbo].[PSP_ChiTietNhapHang_ChinhSuaPhieuNhap]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PSP_ChiTietNhapHang_ChinhSuaPhieuNhap]
    @MaPhieuNhap CHAR(9) ,
    @MaSP CHAR(9) ,
    @NgayNhap DATETIME ,
    @SoLuongNhap INT ,
    @DonGiaNhap FLOAT
AS
    SET XACT_ABORT ON; 
    BEGIN TRAN;
    UPDATE  dbo.PhieuNhap
    SET     NgayNhap = @NgayNhap
    WHERE   MaPhieuNhap = @MaPhieuNhap;
	
    UPDATE  dbo.ChiTietPhieuNhap
    SET     SoLuongNhap = @SoLuongNhap ,
            SoLuongNhapTon = @SoLuongNhap ,
            DonGiaNhap = @DonGiaNhap
    WHERE   MaPhieuNhap = @MaPhieuNhap
            AND MaSP = @MaSP;
    COMMIT;
GO
/****** Object:  StoredProcedure [dbo].[PSP_ChiTietPhieuNhap_Select]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Thực hiện thủ tục để lấy danh sách nhập hàng
CREATE PROC [dbo].[PSP_ChiTietPhieuNhap_Select]
AS
    SELECT  ROW_NUMBER() OVER ( ORDER BY ( SELECT   1
                                         ) ) AS STT ,
            a.MaSP ,
            a.TenSP ,
            d.NgayNhap,
            c.SoLuongNhap ,
            a.MaDVT ,
            b.TenDVT,
            c.DonGiaNhap,
            (c.SoLuongNhap*c.DonGiaNhap)AS ThanhTien,
            d.MaNhanVien,
            TenNhanVien,
            c.SoLuongNhapTon,c.MaPhieuNhap
    FROM    dbo.SanPham a
            JOIN dbo.DonViTinh b ON b.MaDVT = a.MaDVT
            JOIN dbo.ChiTietPhieuNhap c ON c.MaSP = a.MaSP
            JOIN dbo.PhieuNhap d ON d.MaPhieuNhap = c.MaPhieuNhap
            JOIN NhanVien e ON e.MaNhanVien = d.MaNhanVien
            WHERE a.IsDelete =0
            ORDER BY c.MaPhieuNhap DESC   
GO
/****** Object:  StoredProcedure [dbo].[PSP_ChiTietPhieuNhap_SelectByMaPhieu]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Thực hiện thủ tục để lấy danh sách nhập hàng
CREATE PROC [dbo].[PSP_ChiTietPhieuNhap_SelectByMaPhieu]
@MaPhieuNhap CHAR(9)
AS
    SELECT  ROW_NUMBER() OVER ( ORDER BY ( SELECT   1
                                         ) ) AS STT ,
            a.MaSP ,
            a.TenSP ,
            d.NgayNhap,
            c.SoLuongNhap ,
            a.MaDVT ,
            b.TenDVT,
            c.DonGiaNhap,
            (c.SoLuongNhap*c.DonGiaNhap)AS ThanhTien,
            d.MaNhanVien,
            TenNhanVien,
            c.SoLuongNhapTon,c.MaPhieuNhap
    FROM    dbo.SanPham a
            JOIN dbo.DonViTinh b ON b.MaDVT = a.MaDVT
            JOIN dbo.ChiTietPhieuNhap c ON c.MaSP = a.MaSP
            JOIN dbo.PhieuNhap d ON d.MaPhieuNhap = c.MaPhieuNhap
            JOIN NhanVien e ON e.MaNhanVien = d.MaNhanVien
            WHERE a.IsDelete =0 AND c.MaPhieuNhap=@MaPhieuNhap
            ORDER BY c.MaPhieuNhap DESC   
GO
/****** Object:  StoredProcedure [dbo].[PSP_DonViTinh_Delete]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROC [dbo].[PSP_DonViTinh_Delete]
    @MaDVT int
    AS
    UPDATE dbo.DonViTinh
    SET IsDelete=1
    WHERE MaDVT=@MaDVT
GO
/****** Object:  StoredProcedure [dbo].[PSP_DonViTinh_InsertUpdate]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PSP_DonViTinh_InsertUpdate]
    @MaDVT int, 
    @TenDVT nvarchar(50)
    AS
    IF EXISTS (SELECT 1 FROM dbo.DonViTinh WHERE MaDVT=@MaDVT)
    BEGIN
        UPDATE dbo.DonViTinh
        SET TenDVT=@TenDVT
        WHERE MaDVT=@MaDVT
    END
    ELSE
    BEGIN
    INSERT INTO dbo.DonViTinh
            ( TenDVT, IsDelete )
    VALUES  ( @TenDVT, -- TenDVT - nvarchar(10)
              0  -- IsDelete - bit
              )
    END	
GO
/****** Object:  StoredProcedure [dbo].[PSP_DonViTinh_Select]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROC [dbo].[PSP_DonViTinh_Select]
    AS
    SELECT MaDVT, TenDVT
    FROM dbo.DonViTinh
    WHERE IsDelete=0
    ORDER BY TenDVT 
GO
/****** Object:  StoredProcedure [dbo].[PSP_DonViTinh_SelectCbo]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROC [dbo].[PSP_DonViTinh_SelectCbo]
    AS
    SELECT MaDVT,TenDVT FROM dbo.DonViTinh WHERE IsDelete=0
GO
/****** Object:  StoredProcedure [dbo].[PSP_HoaDon_INHoaDon]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PSP_HoaDon_INHoaDon] @MaHD CHAR(9)
AS
    SELECT  ROW_NUMBER() OVER ( ORDER BY ( SELECT   1
                                         ) ) AS STT ,
            c.TenSP ,
            b.SoLuongBan ,
            b.DonGiaBan ,
            b.SoLuongBan * b.DonGiaBan AS ThanhTien ,
            d.TenNhanVien ,
            a.NgayLap,a.MaHD
    FROM    dbo.HoaDon a
            JOIN dbo.ChiTietHoaDon b ON b.MaHD = a.MaHD
            JOIN dbo.SanPham c ON c.MaSP = b.MaSP
            JOIN dbo.NhanVien d ON d.MaNhanVien = a.MaNhanVien
    WHERE   a.MaHD = @MaHD
    ORDER BY c.TenSP;
GO
/****** Object:  StoredProcedure [dbo].[PSP_HoaDon_MaxID]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PSP_HoaDon_MaxID]
@NgayLap DATE
AS
SELECT ISNULL(CONVERT(INT, SUBSTRING(MAX(MaHD),7,9)),0)+1 MaxID
FROM dbo.HoaDon
WHERE YEAR(NgayLap)=YEAR(@NgayLap) AND MONTH(NgayLap)=MONTH( @NgayLap)
GO
/****** Object:  StoredProcedure [dbo].[PSP_LoaiChucNang_Delete]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PSP_LoaiChucNang_Delete]
@MaNhomChucNang int
AS
UPDATE dbo.LoaiChucNang
SET IsDelete = 1
WHERE MaNhomChucNang = @MaNhomChucNang
GO
/****** Object:  StoredProcedure [dbo].[PSP_LoaiChucNang_InsertAndUpdate]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PSP_LoaiChucNang_InsertAndUpdate]
@MaNhomChucNang int,
@TenNhomChucNang nvarchar(50)
AS
IF EXISTS (SELECT 1 FROM dbo.LoaiChucNang WHERE @MaNhomChucNang = MaNhomChucNang)
BEGIN
	UPDATE dbo.LoaiChucNang
	SET TenNhomChucNang = @TenNhomChucNang, IsDelete = 0
	WHERE MaNhomChucNang = @MaNhomChucNang
END
ELSE
BEGIN
	INSERT INTO dbo.LoaiChucNang([TenNhomChucNang], [IsDelete])
	VALUES (@TenNhomChucNang, 0)
END
GO
/****** Object:  StoredProcedure [dbo].[PSP_LoaiChucNang_Select]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PSP_LoaiChucNang_Select] @MaNhomChucNang int = 0
AS
SELECT [MaNhomChucNang], [TenNhomChucNang]
FROM dbo.LoaiChucNang
WHERE [IsDelete] = 0
	AND @MaNhomChucNang = CASE @MaNhomChucNang
							WHEN 0 THEN 0
							ELSE MaNhomChucNang
						  END;
GO
/****** Object:  StoredProcedure [dbo].[PSP_LoaiSanPham_SelectCbo]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PSP_LoaiSanPham_SelectCbo]
AS
SELECT 0 as MaLSP, N'-- Tất cả --' as TenLSP
UNION
SELECT MaLSP, TenLSP FROM dbo.LoaiSanPham WHERE IsDelete=0
GO
/****** Object:  StoredProcedure [dbo].[PSP_NhanVien_CheckLogin]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--//////////////////////////////////////////////////////////
--Thủ tục kiểm tra đăng nhập.
CREATE PROC [dbo].[PSP_NhanVien_CheckLogin]
@TenDangNhap VARCHAR(50),
@MatKhau VARCHAR(50)
AS
IF EXISTS (SELECT 1 FROM dbo.NhanVien WHERE TenDangNhap=@TenDangNhap AND pwdCompare(@MatKhau,[MatKhau])=1)
BEGIN
    SELECT 1 AS result, MaNhanVien, TenNhanVien, TenDangNhap, MaTaiKhoan
	FROM dbo.NhanVien 
	WHERE TenDangNhap=@TenDangNhap AND pwdCompare(@MatKhau,[MatKhau])=1 
END
ELSE
BEGIN
    SELECT 0 AS result,'' as MaNhanVien, '' AS TenNhanVien,''as TenDangNhap,''as MaTaiKhoan
END
GO
/****** Object:  StoredProcedure [dbo].[PSP_NhanVien_Delete]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PSP_NhanVien_Delete]
@MaNhanVien CHAR(9)
AS
IF EXISTS (SELECT 1 FROM dbo.NhanVien WHERE MaNhanVien=@MaNhanVien AND TinhTrang=1)
BEGIN
    UPDATE dbo.NhanVien
	SET TinhTrang=0
	WHERE MaNhanVien=@MaNhanVien
END

GO
/****** Object:  StoredProcedure [dbo].[PSP_NhanVien_InsertUpdate]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PSP_NhanVien_InsertUpdate]
@MaNhanVien CHAR(9),
@TenNhanVien NVARCHAR(50),
@GioiTinh BIT,
@NgaySinh DATE,
@DienThoai VARCHAR(20),
@TenDangNhap VARCHAR(50),
@MatKhau VARCHAR(50),
@MaTaiKhoan CHAR(9) 
AS
IF EXISTS (SELECT 1 FROM dbo.NhanVien WHERE MaNhanVien=@MaNhanVien AND TinhTrang=1)
BEGIN--Update
   UPDATE dbo.NhanVien
   SET TenNhanVien=@TenNhanVien,
	GioiTinh=@GioiTinh,
	NgaySinh=@NgaySinh,
	DienThoai=@DienThoai
	WHERE MaNhanVien=@MaNhanVien
END--End Update
BEGIN
    INSERT INTO dbo.NhanVien ( MaNhanVien ,TenNhanVien ,GioiTinh ,NgaySinh ,
              DienThoai ,TenDangNhap , MatKhau , MaTaiKhoan)
    VALUES  ( @MaNhanVien , @TenNhanVien , @GioiTinh , @NgaySinh ,@DienThoai , @TenDangNhap ,pwdencrypt(@MatKhau) , @MaTaiKhoan)
END
GO
/****** Object:  StoredProcedure [dbo].[PSP_NhanVien_KiemTraDangNhap]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Viet thủ tục
--tham số: username và password
--output: trang thái (1,0), kèm thông tin của user 
CREATE PROC [dbo].[PSP_NhanVien_KiemTraDangNhap]
--tham so
@TenDangNhap VARCHAR(50),
@MatKhau VARCHAR(50)
AS
IF EXISTS (SELECT 1 FROM dbo.NhanVien WHERE TenDangNhap=@TenDangNhap AND PWDCOMPARE(@MatKhau,MatKhau)=1)
BEGIN
    --user name và password đúng
	SELECT 1 AS TrangThai, TenNhanVien
	FROM dbo.NhanVien
	WHERE TenDangNhap=@TenDangNhap AND PWDCOMPARE(@MatKhau,MatKhau)=1
END
ELSE
BEGIN
 --user name và password sai 
 SELECT 0 AS TrangThai,'' TenNhanVien
END
GO
/****** Object:  StoredProcedure [dbo].[PSP_NhanVien_LayMaxMaNV]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROC [dbo].[PSP_NhanVien_LayMaxMaNV] --2021,5
     AS
     SELECT ISNULL(CONVERT(INT,SUBSTRING(MAX(MaNhanVien),3,9)),0)+1 as MaxID
     FROM dbo.NhanVien
GO
/****** Object:  StoredProcedure [dbo].[PSP_NhanVien_LayNhanVienChoCombo]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PSP_NhanVien_LayNhanVienChoCombo]
       AS
       SELECT MaNhanVien,TenNhanVien
       FROM dbo.NhanVien
       WHERE TinhTrang=1
       ORDER BY TenNhanVien ASC
GO
/****** Object:  StoredProcedure [dbo].[PSP_NhanVien_Select]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PSP_NhanVien_Select]
AS
    SELECT ROW_NUMBER() OVER ( ORDER BY ( SELECT   1
                                         ) ) AS STT,  MaNhanVien ,
            TenNhanVien ,
            GioiTinh ,
			CASE GioiTinh WHEN 1 THEN N'Nam'ELSE N'Nữ'END AS GioiTinhText,
            NgaySinh ,
            DienThoai ,
            TenDangNhap ,
            MaTaiKhoan
    FROM    dbo.NhanVien
    WHERE   TinhTrang = 1;--1: nhan vien dang hoat dong; 0: nhân viên đã bị xóa
GO
/****** Object:  StoredProcedure [dbo].[PSP_PhanQuyen_CopyQuyen]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PSP_PhanQuyen_CopyQuyen]-- 'TK0000005','TK0000001'
   @MaTaiKhoanNguon CHAR(9),  @MaTaiKhoanDich CHAR(9) 
   
AS
    BEGIN
        DECLARE @MaChucNangNguon CHAR(9);
        DECLARE @GiaTriQuyen INT;
        DECLARE _Users_Cur CURSOR FAST_FORWARD
        FOR --cau leenh lay danh sach
            SELECT  MaChucNang ,
                    GiaTriQuyen
            FROM    dbo.PhanQuyen
            WHERE   IsDelete = 0
                    AND MaTaiKhoan = @MaTaiKhoanNguon;
 
        OPEN _Users_Cur;
        FETCH NEXT FROM _Users_Cur INTO @MaChucNangNguon, @GiaTriQuyen;
        WHILE @@FETCH_STATUS = 0
            BEGIN --cau lenh thuc th
                UPDATE  dbo.PhanQuyen
                SET     GiaTriQuyen = @GiaTriQuyen
                WHERE   MaTaiKhoan = @MaTaiKhoanDich
                        AND MaChucNang = @MaChucNangNguon;
                            
                FETCH NEXT FROM _Users_Cur INTO @MaChucNangNguon, @GiaTriQuyen;
            END;
        CLOSE _Users_Cur;
        DEALLOCATE _Users_Cur;
    END;
    
GO
/****** Object:  StoredProcedure [dbo].[PSP_PhanQuyen_HienThiChiTietPhanQuyen]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PSP_PhanQuyen_HienThiChiTietPhanQuyen] @MaTaiKhoan CHAR(9)
AS
    SELECT  ROW_NUMBER() OVER ( ORDER BY ( SELECT  b.TenChucNang
                                         ) ) AS STT ,
            a.MaTaiKhoan ,
            a.MaChucNang ,
            b.TenChucNang ,
            a.GiaTriQuyen ,
            CONVERT(BIT, 0) AS Xem ,
            CONVERT(BIT, 0) AS Them ,
            CONVERT(BIT, 0) AS Sua ,
            CONVERT(BIT, 0) AS Xoa
    FROM    dbo.PhanQuyen a
            JOIN dbo.ChucNang b ON b.MaChucNang = a.MaChucNang
            JOIN dbo.TaiKhoan c ON c.MaTaiKhoan = a.MaTaiKhoan
          WHERE a.MaTaiKhoan=@MaTaiKhoan
          ORDER BY b.TenChucNang
          
GO
/****** Object:  StoredProcedure [dbo].[PSP_PhanQuyen_LayBangPhanQuyen]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PSP_PhanQuyen_LayBangPhanQuyen]
          @MaNhanVien CHAR(9)
          AS 
          DECLARE @MaTaiKhoan CHAR(9)
          SET @MaTaiKhoan =(SELECT MaTaiKhoan FROM dbo.NhanVien WHERE MaNhanVien=@MaNhanVien AND TinhTrang=1)
          
          SELECT a.MaChucNang, MaTaiKhoan, GiaTriQuyen,KyHieu
          FROM dbo.PhanQuyen a JOIN dbo.ChucNang b ON b.MaChucNang = a.MaChucNang
          WHERE MaTaiKhoan=@MaTaiKhoan
          and a.IsDelete=0
          
GO
/****** Object:  StoredProcedure [dbo].[PSP_PhanQuyen_Update]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PSP_PhanQuyen_Update]
          @MaTaiKhoan CHAR(9),
          @MaChucNang INT,
          @TongQuyen INT
          AS UPDATE 
          dbo.PhanQuyen
          SET GiaTriQuyen=@TongQuyen
          WHERE MaChucNang=@MaChucNang AND MaTaiKhoan=@MaTaiKhoan
GO
/****** Object:  StoredProcedure [dbo].[PSP_PhieuNhap_CapNhatTrangThai]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PSP_PhieuNhap_CapNhatTrangThai]
     @MaPhieuNhap CHAR(9)
     as
     UPDATE dbo.PhieuNhap
     SET StatusPhieuNhap=1
     WHERE MaPhieuNhap=@MaPhieuNhap
GO
/****** Object:  StoredProcedure [dbo].[PSP_PhieuNhap_Delete]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PSP_PhieuNhap_Delete] --'210400001'
    @MaPhieuNhap CHAR(9)
AS
SET XACT_ABORT ON
BEGIN TRAN
    IF EXISTS ( SELECT  1
                FROM    PhieuNhap
                WHERE   MaPhieuNhap = @MaPhieuNhap )
        BEGIN
            IF EXISTS ( SELECT  1
                        FROM    [dbo].[ChiTietPhieuNhap]
                        WHERE   MaPhieuNhap = @MaPhieuNhap )
                BEGIN
					DELETE [dbo].[ChiTietPhieuNhap]
					where  MaPhieuNhap = @MaPhieuNhap
                END
            DELETE  [dbo].[PhieuNhap]
            WHERE   MaPhieuNhap = @MaPhieuNhap
        END
COMMIT;
GO
/****** Object:  StoredProcedure [dbo].[PSP_PhieuNhap_InPhieuNhap]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PSP_PhieuNhap_InPhieuNhap] @MaPhieuNhap CHAR(9)
AS
    SELECT  0 AS STT ,
            a.MaPhieuNhap ,
            c.TenNhanVien ,
            a.NgayNhap ,
            d.TenSP ,
            e.TenDVT ,
            b.SoLuongNhap ,
            b.DonGiaNhap ,
            ( b.SoLuongNhap * b.DonGiaNhap ) AS ThanhTien
    FROM    dbo.PhieuNhap a
            JOIN dbo.ChiTietPhieuNhap b ON b.MaPhieuNhap = a.MaPhieuNhap
            JOIN dbo.NhanVien c ON c.MaNhanVien = a.MaNhanVien
            JOIN dbo.SanPham d ON d.MaSP = b.MaSP
            JOIN dbo.DonViTinh e ON e.MaDVT = d.MaDVT
    WHERE   a.MaPhieuNhap = @MaPhieuNhap;
    
GO
/****** Object:  StoredProcedure [dbo].[PSP_PhieuNhap_Insert]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Tạo phiếu nhâp
CREATE PROC [dbo].[PSP_PhieuNhap_Insert]
@MaPhieuNhap CHAR(9), 
@MaNhanVien CHAR(9)
AS
IF NOT EXISTS (SELECT 1 FROM [dbo].[PhieuNhap] WHERE MaPhieuNhap=@MaPhieuNhap)
BEGIN
    INSERT INTO [dbo].[PhieuNhap](MaPhieuNhap, NgayNhap, MaNhanVien)
	VALUES(@MaPhieuNhap, GETDATE(), @MaNhanVien)
END
GO
/****** Object:  StoredProcedure [dbo].[PSP_PhieuNhap_KiemTraStatusPhieuNhap]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PSP_PhieuNhap_KiemTraStatusPhieuNhap]
AS
    IF EXISTS ( SELECT  1
                FROM    PhieuNhap
                WHERE   StatusPhieuNhap = 0 )
        BEGIN
            SET XACT_ABORT ON; 
            BEGIN TRAN;
            DECLARE @MaPhieuNhap CHAR(9);
	--SELECT TOP 1 @MaPhieuNhap =MaPhieuNhap FROM PhieuNhap WHERE StatusPhieuNhap=0
            SET @MaPhieuNhap = ( SELECT TOP 1
                                        MaPhieuNhap
                                 FROM   PhieuNhap
                                 WHERE  StatusPhieuNhap = 0
                               );
            DELETE  [dbo].[ChiTietPhieuNhap]
            WHERE   MaPhieuNhap = @MaPhieuNhap;

            DELETE  PhieuNhap
            WHERE   MaPhieuNhap = @MaPhieuNhap;
            COMMIT;
        END;
GO
/****** Object:  StoredProcedure [dbo].[PSP_PhieuNhap_LayMaxMaPhieuNhap]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
     --lay ma phieu nhập lớn nhất
     CREATE PROC [dbo].[PSP_PhieuNhap_LayMaxMaPhieuNhap] --2021,5
     @Year INT,
     @Month INT
     AS
     SELECT ISNULL(CONVERT(INT,SUBSTRING(MAX(MaPhieuNhap),5,9)),0)+1 as MaxID
     FROM dbo.PhieuNhap
     WHERE YEAR(NgayNhap)=@Year AND MONTH(NgayNhap)=@Month
     
GO
/****** Object:  StoredProcedure [dbo].[PSP_SanPham_InsertAndUpdate230304]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PSP_SanPham_InsertAndUpdate230304]
@MaSP CHAR(9),
@TenSP NVARCHAR(50),
@SoTon int,
@MaDVT int
AS
IF EXISTS (SELECT 1 FROM dbo.SanPham WHERE @MaSP = MaSP)
BEGIN
	-- Update
	UPDATE dbo.SanPham
	SET TenSP = @TenSP, SoTon = @SoTon, MaDVT = @MaDVT, IsDelete = 0
	WHERE MaSP = @MaSP
END
ELSE
BEGIN
	INSERT INTO dbo.SanPham([MaSP], [TenSP], [SoTon], [MaDVT], [IsDelete])
	VALUES (@MaSP, @TenSP, @SoTon, @MaDVT, 0)
END
GO
/****** Object:  StoredProcedure [dbo].[PSP_SanPham_KiemTraSanPhamTheoTen]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PSP_SanPham_KiemTraSanPhamTheoTen]
  @TenSanPham NVARCHAR(100)
  AS
  IF EXISTS (SELECT 1 FROM SanPham WHERE TenSP=@TenSanPham)
  BEGIN
      SELECT 1 AS result,MaSP, TenSP, SoTon, MaDVT FROM SanPham
	  WHERE  TenSP=@TenSanPham
  END
  ELSE
  BEGIN
       SELECT 0 AS result,''AS TenSP,0 AS SoTon,0 AS MaDVT
  END
 
GO
/****** Object:  StoredProcedure [dbo].[PSP_SanPham_LayDanhSachBan]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PSP_SanPham_LayDanhSachBan]
AS
    SELECT  0 AS STT ,
            a.MaSP ,
            a.TenSP ,
            b.DonGia ,
            a.SoTon
    FROM    dbo.SanPham a
            JOIN dbo.ChiTietGiaBan b ON b.MaSP = a.MaSP
    WHERE   a.IsDelete = 0 AND a.SoTon>0
    ORDER BY a.TenSP;

GO
/****** Object:  StoredProcedure [dbo].[PSP_SanPham_LayMaxMaSP]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE PROC [dbo].[PSP_SanPham_LayMaxMaSP] --2021,5
     AS
     SELECT ISNULL(CONVERT(INT,SUBSTRING(MAX(maSP),3,9)),0)+1 as MaxID
     FROM dbo.SanPham
GO
/****** Object:  StoredProcedure [dbo].[PSP_SanPham_MaxID]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PSP_SanPham_MaxID]
as
SELECT MAX(masp) AS MaxID
FROM dbo.SanPham
GO
/****** Object:  StoredProcedure [dbo].[PSP_SanPham_Select]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Template
--Câu lệnh select
--yêu cầu: Lấy tất cả sản phẩm hoặc lấy sản phẩm theo mã số
CREATE PROC [dbo].[PSP_SanPham_Select] @MaSP CHAR(9) = '0'
AS
SELECT [MaSP],
       [TenSP],
       [SoTon],
       [MaDVT]
FROM dbo.SanPham
WHERE IsDelete = 0
      AND @MaSP = CASE @MaSP
                      WHEN '0' THEN
                          '0'
                      ELSE
                          MaSP
                  END;
GO
/****** Object:  StoredProcedure [dbo].[PSP_SanPham_Select230204]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PSP_SanPham_Select230204]
@MaSP VARCHAR(9) = '0'
AS
SELECT [MaSP], [TenSP], [SoTon], a.MaDVT, b.TenDVT
FROM dbo.SanPham a JOIN dbo.DonViTinh b ON b.MaDVT = a.MaDVT
WHERE a.IsDelete = 0
		AND @MaSP = CASE @MaSP
						WHEN '0' THEN '0'
						ELSE MaSP
					END;
GO
/****** Object:  StoredProcedure [dbo].[PSP_SanPham_Select230225]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PSP_SanPham_Select230225]
@MaSP VARCHAR(9)='0'
AS
SELECT [MaSP], [TenSP], [SoTon]
FROM dbo.SanPham
WHERE IsDelete=0
AND @MaSP=CASE @MaSP WHEN '0' THEN '0'ELSE MaSP end
GO
/****** Object:  StoredProcedure [dbo].[PSP_SanPham_SelectMaDVT]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PSP_SanPham_SelectMaDVT] @MaDVT int = 0
AS
SELECT [MaSP], [TenSP], [SoTon], a.MaDVT, b.TenDVT
FROM dbo.SanPham a JOIN dbo.DonViTinh b ON b.MaDVT = a.MaDVT
WHERE a.IsDelete = 0
		AND @MaDVT = CASE @MaDVT
						WHEN 0 THEN 0
						ELSE a.MaDVT
					END;

GO
/****** Object:  StoredProcedure [dbo].[PSP_SanPham_SelectMaLSP]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PSP_SanPham_SelectMaLSP] @MaLSP int = 0
AS
SELECT [MaSP], [TenSP], [SoTon], b.TenDVT, c.TenLSP, b.MaDVT, c.MaLSP
FROM dbo.SanPham a JOIN dbo.DonViTinh b ON a.MaDVT = b.MaDVT
				   JOIN dbo.LoaiSanPham c ON a.MaLSP = c.MaLSP 
WHERE a.IsDelete = 0
		AND @MaLSP = CASE @MaLSP
						WHEN 0 THEN 0
						ELSE a.MaLSP
					END;
GO
/****** Object:  StoredProcedure [dbo].[PSP_SaoLuuDuLieu]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[PSP_SaoLuuDuLieu]
	@duongdan nvarchar(max)
as
begin
	declare @dbname nvarchar(50)
	set @dbname =  DB_NAME()
	BACKUP DATABASE @dbname
	TO  DISK = @duongdan
	WITH NOFORMAT, NOINIT,  
	SKIP, NOREWIND, NOUNLOAD,  STATS = 10
	select ErrorCode = 1
end
GO
/****** Object:  StoredProcedure [dbo].[PSP_TaiKhoan_CapLaiPass]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PSP_TaiKhoan_CapLaiPass]
@MaNhanVien CHAR(9)
AS
DECLARE @TenDangNhap VARCHAR(50)
SET @TenDangNhap=(SELECT TenDangNhap FROM dbo.NhanVien WHERE MaNhanVien=@MaNhanVien)

UPDATE dbo.NhanVien
SET MatKhau=pwdEncrypt(@TenDangNhap)
WHERE MaNhanVien=@MaNhanVien

GO
/****** Object:  StoredProcedure [dbo].[PSP_TaiKhoan_Delete]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PSP_TaiKhoan_Delete]
@MaTaiKhoan CHAR(9)
AS
UPDATE dbo.TaiKhoan
SET IsDelete=1
WHERE MaTaiKhoan=@MaTaiKhoan
GO
/****** Object:  StoredProcedure [dbo].[PSP_TaiKhoan_InsertUpdate]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PSP_TaiKhoan_InsertUpdate]
@MaTaiKhoan CHAR(9), @TenTaiKhoan NVARCHAR(50)
AS
IF EXISTS(SELECT 1 FROM dbo.TaiKhoan WHERE MaTaiKhoan=@MaTaiKhoan)
BEGIN
    --update
    UPDATE dbo.TaiKhoan
    SET TenTaiKhoan=@TenTaiKhoan
    WHERE MaTaiKhoan=@MaTaiKhoan
END
ELSE
BEGIN
    INSERT INTO TaiKhoan(MaTaiKhoan, TenTaiKhoan, IsDelete)
    VALUES(@MaTaiKhoan, @TenTaiKhoan, 0)
END
GO
/****** Object:  StoredProcedure [dbo].[PSP_TaiKhoan_MaxID]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PSP_TaiKhoan_MaxID]
AS
SELECT ISNULL(CONVERT(INT,SUBSTRING(MAX(MaTaiKhoan),3,9)),0)+1 AS MaxID
FROM dbo.TaiKhoan
GO
/****** Object:  StoredProcedure [dbo].[PSP_TaiKhoan_Select]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PSP_TaiKhoan_Select]
AS
SELECT 0 AS STT, MaTaiKhoan, TenTaiKhoan
FROM dbo.TaiKhoan
WHERE IsDelete=0
GO
/****** Object:  StoredProcedure [dbo].[PSP_TaiKhoan_SelectCbo]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROC [dbo].[PSP_TaiKhoan_SelectCbo]
          AS
          SELECT MaTaiKhoan, TenTaiKhoan
          FROM dbo.TaiKhoan WHERE IsDelete=0
GO
/****** Object:  StoredProcedure [dbo].[PSP_TaiKhoan_ThayDoiMatKhau]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PSP_TaiKhoan_ThayDoiMatKhau]
@MaNhanVien CHAR(9),
@MatKhau VARCHAR(20)
AS

UPDATE dbo.NhanVien
SET MatKhau=pwdEncrypt(@MatKhau)
WHERE MaNhanVien=@MaNhanVien
GO
/****** Object:  StoredProcedure [dbo].[PSP_ThongKe_DoanhThuTheoNgayThang]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PSP_ThongKe_DoanhThuTheoNgayThang]
    @BeginDate DATE ,
    @EndDate DATE
AS
    SELECT  0 AS STT ,
            c.TenSP ,
            a.NgayLap ,
            b.SoLuongBan ,
            b.DonGiaBan ,
            b.SoLuongBan * b.DonGiaBan AS ThanhTien ,
            d.TenNhanVien
    FROM    dbo.HoaDon a
            JOIN dbo.ChiTietHoaDon b ON b.MaHD = a.MaHD
            JOIN dbo.SanPham c ON c.MaSP = b.MaSP
            JOIN dbo.NhanVien d ON d.MaNhanVien = a.MaNhanVien
            WHERE CONVERT(DATE,a.NgayLap) BETWEEN @BeginDate AND @EndDate
       ORDER BY a.NgayLap DESC, d.TenNhanVien
GO
/****** Object:  StoredProcedure [dbo].[YSP_ChiTietNhapHang_LayChiTietNhapHang]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[YSP_ChiTietNhapHang_LayChiTietNhapHang]
    @NgayBatDau DATE,
    @NgayKetThuc DATE
AS
SELECT ROW_NUMBER() OVER (ORDER BY (SELECT 1)) AS STT,
       a.MaPhieuNhap,
       a.NgayNhap,
       a.MaNhanVien,
       c.TenNhanVien,
       b.MaSP,
       d.TenSP,
       b.SoLuongNhap,
       b.DonGiaNhap,
       b.SoLuongNhap * b.DonGiaNhap AS ThanhTien
FROM PhieuNhap a
    JOIN dbo.ChiTietPhieuNhap b
        ON b.MaPhieuNhap = a.MaPhieuNhap
    JOIN dbo.NhanVien c
        ON c.MaNhanVien = a.MaNhanVien
    JOIN dbo.SanPham d
        ON d.MaSP = b.MaSP
WHERE a.StatusPhieuNhap = 1 AND a.NgayNhap BETWEEN @NgayBatDau AND @NgayKetThuc;
GO
/****** Object:  StoredProcedure [dbo].[YSP_PhieuNhap_InPhieuNhapHang]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[YSP_PhieuNhap_InPhieuNhapHang] @MaPhieuNhap CHAR(9)
AS
SELECT ROW_NUMBER() OVER (ORDER BY (SELECT 1)) AS STT,
       a.MaPhieuNhap,
       c.TenSP,
       b.SoLuongNhap,
       b.DonGiaNhap,
       b.SoLuongNhap * b.DonGiaNhap AS ThanhTien,
       a.NgayNhap,
       d.TenNhanVien
FROM dbo.PhieuNhap a
    JOIN dbo.ChiTietPhieuNhap b
        ON b.MaPhieuNhap = a.MaPhieuNhap
    JOIN dbo.SanPham c
        ON c.MaSP = b.MaSP
    JOIN dbo.NhanVien d
        ON d.MaNhanVien = a.MaNhanVien
WHERE a.MaPhieuNhap = @MaPhieuNhap;
GO
/****** Object:  StoredProcedure [dbo].[YSP_PhieuNhap_Insert202303]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[YSP_PhieuNhap_Insert202303]
@MaPhieuNhap CHAR(9), 
@NgayNhap DATETIME, 
@MaNhanVien CHAR(9)
AS
BEGIN
    INSERT INTO PhieuNhap([MaPhieuNhap], [NgayNhap], [MaNhanVien], [StatusPhieuNhap])
	VALUES(@MaPhieuNhap, @NgayNhap, @MaNhanVien, 0)
END
GO
/****** Object:  StoredProcedure [dbo].[YSP_PhieuNhap_KiemTraPhieuTonTaiTheoUser]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[YSP_PhieuNhap_KiemTraPhieuTonTaiTheoUser]
@MaNhanVien CHAR(9)
AS
IF EXISTS(	SELECT 1 FROM dbo.PhieuNhap
			WHERE MaNhanVien = @MaNhanVien AND StatusPhieuNhap = 0)
BEGIN
	SELECT DISTINCT MaPhieuNhap FROM dbo.PhieuNhap
	WHERE MaNhanVien = @MaNhanVien AND StatusPhieuNhap = 0
END
ELSE
BEGIN
	SELECT 0
END
GO
/****** Object:  StoredProcedure [dbo].[YSP_PhieuNhap_NapThongTinPhieuNhapCu]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[YSP_PhieuNhap_NapThongTinPhieuNhapCu]
@MaPhieuNhap CHAR(9)
AS
SELECT		a.MaPhieuNhap,
			a.NgayNhap,
			a.MaNhanVien,
			b.MaSP,
			c.TenSP,
			c.MaDVT,
			d.TenDVT,
			b.SoLuongNhap,
			b.DonGiaNhap,
			b.SoLuongNhap * b.DonGiaNhap AS ThanhTien
FROM		PhieuNhap AS a
			INNER JOIN ChiTietPhieuNhap AS b ON a.MaPhieuNhap = b.MaPhieuNhap
			INNER JOIN SanPham AS c ON b.MaSP = c.MaSP
			INNER JOIN DonViTinh AS d ON c.MaDVT = d.MaDVT
WHERE		(a.MaPhieuNhap = @MaPhieuNhap)
GO
/****** Object:  StoredProcedure [dbo].[YSP_PhieuNhap_TaoPhieuMoi]    Script Date: 21/04/2023 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[YSP_PhieuNhap_TaoPhieuMoi]
AS
BEGIN
	DECLARE @Assign VARCHAR(20)
	SET @Assign= SUBSTRING(CONVERT(VARCHAR(4), YEAR(GETDATE())), 3, 2) + FORMAT(MONTH(GETDATE()), '00');

	DECLARE @MaxID VARCHAR(20);
	SET @MaxID = (	SELECT ISNULL(MAX(MaPhieuNhap), @Assign + '00000')
					FROM dbo.PhieuNhap
					WHERE YEAR(NgayNhap) = YEAR(GETDATE()) AND MONTH(ngayNhap) = MONTH(GETDATE()))
	SELECT dbo.YFC_SinhMaTuDong(@MaxID, 5, 9, @Assign, '00000') AS MaPhieuMoi
END
GO
USE [master]
GO
ALTER DATABASE [Data_BanHang_HocTap] SET  READ_WRITE 
GO
