USE [master]
GO
CREATE DATABASE [TiendaVirtual]
GO

USE [TiendaVirtual]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Precio] [decimal](18, 2) NOT NULL,
	[CategoriaId] [int] NOT NULL,
	[Imagen_Ruta] [nvarchar](100) NULL,
	[Imagen_Tipo] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Categoria] ON 

INSERT [dbo].[Categoria] ([Id], [Nombre]) VALUES (1, N'Libros')
INSERT [dbo].[Categoria] ([Id], [Nombre]) VALUES (2, N'DVDs')
INSERT [dbo].[Categoria] ([Id], [Nombre]) VALUES (3, N'Deportes')
SET IDENTITY_INSERT [dbo].[Categoria] OFF
SET IDENTITY_INSERT [dbo].[Producto] ON 

INSERT [dbo].[Producto] ([Id], [Nombre], [Precio], [CategoriaId], [Imagen_Ruta], [Imagen_Tipo]) VALUES (1, N'Hola Mundo! Computación para niños', CAST(25.50 AS Decimal(18, 2)), 1, NULL, NULL)
INSERT [dbo].[Producto] ([Id], [Nombre], [Precio], [CategoriaId], [Imagen_Ruta], [Imagen_Tipo]) VALUES (2, N'ASP.NET MVC Cookbook', CAST(38.00 AS Decimal(18, 2)), 1, NULL, NULL)
INSERT [dbo].[Producto] ([Id], [Nombre], [Precio], [CategoriaId], [Imagen_Ruta], [Imagen_Tipo]) VALUES (3, N'Avatar 3D', CAST(41.99 AS Decimal(18, 2)), 2, NULL, NULL)
INSERT [dbo].[Producto] ([Id], [Nombre], [Precio], [CategoriaId], [Imagen_Ruta], [Imagen_Tipo]) VALUES (4, N'The White Album - The Beatles', CAST(18.65 AS Decimal(18, 2)), 2, NULL, NULL)
INSERT [dbo].[Producto] ([Id], [Nombre], [Precio], [CategoriaId], [Imagen_Ruta], [Imagen_Tipo]) VALUES (5, N'Black BMX Bike', CAST(156.67 AS Decimal(18, 2)), 3, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Producto] OFF
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [Categoria_Productos] FOREIGN KEY([CategoriaId])
REFERENCES [dbo].[Categoria] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [Categoria_Productos]
GO