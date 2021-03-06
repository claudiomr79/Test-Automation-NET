USE [master]
GO

/****** Object:  Database [AutomateTesting] ******/
CREATE DATABASE [AutomateTesting] 
GO

USE [AutomateTesting]
GO

/****** Object:  Table [dbo].[Employee] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[HireDate] [datetime] NULL
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  StoredProcedure [dbo].[EmployeeFind] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EmployeeFind]
	@LastName NVarchar(100),
	@StartHireDate DateTime,
	@EndHireDate DateTime
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @Query AS NVarchar(4000)
    DECLARE @ParamDefinition AS NVarchar(2000)
    
	SET @Query = 'select Id, FirstName, LastName, HireDate from Employee Where (1=1)'
	
	IF @LastName IS NOT NULL
		SET @Query= @Query + ' And LastName=@LastName'
		
	IF @StartHireDate IS NOT NULL AND @EndHireDate IS NOT NULL
		SET @Query= @Query + ' And HireDate between @StartHireDate and @EndHireDate'
		
	SET @ParamDefinition = '@LastName NVarchar(100),
							@StartHireDate DateTime,
							@EndHireDate DateTime'
							
	Execute sp_Executesql @Query, 
				@ParamDefinition, 
                @LastName, 
                @StartHireDate, 
                @EndHireDate
END
GO
