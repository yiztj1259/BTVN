CREATE PROC DBH_DonViTinh_Select @MaDVT int = 0
AS
SELECT [MaDVT],
       [TenDVT]
FROM dbo.DonViTinh
WHERE IsDelete = 0
      AND @MaDVT = CASE @MaDVT
                      WHEN 0 THEN
                          0
                      ELSE
                          MaDVT
END;
GO
