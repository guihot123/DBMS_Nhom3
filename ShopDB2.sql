USE [ShopDB]
GO
/****** Object:  Table [dbo].[CongTySX]    Script Date: 21-Nov-21 6:07:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CongTySX](
	[ID_company] [int] NOT NULL,
	[Company_name] [varchar](50) NOT NULL,
	[address] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_company] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 21-Nov-21 6:07:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Customer_Name] [varchar](50) NOT NULL,
	[PhoneNumber] [varchar](50) NOT NULL,
	[ID_customer] [int] NOT NULL,
	[VIP] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_customer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 21-Nov-21 6:07:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Name_product] [varchar](50) NOT NULL,
	[ID_product] [int] NOT NULL,
	[Price] [int] NOT NULL,
	[ID_company] [int] NOT NULL,
	[warranty_month] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 21-Nov-21 6:07:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[Name_Staff] [varchar](50) NOT NULL,
	[Phone] [varchar](50) NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[Posision] [varchar](50) NOT NULL,
	[Gender] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction_Details]    Script Date: 21-Nov-21 6:07:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction_Details](
	[quantity] [int] NOT NULL,
	[ID_transaction] [int] NOT NULL,
	[ID_product] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_transaction] ASC,
	[ID_product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 21-Nov-21 6:07:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[ID_transaction] [int] NOT NULL,
	[Total_price] [int] NOT NULL,
	[Dates] [date] NOT NULL,
	[ID_customer] [int] NOT NULL,
	[username] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_transaction] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([ID_company])
REFERENCES [dbo].[CongTySX] ([ID_company])
GO
ALTER TABLE [dbo].[Transaction_Details]  WITH CHECK ADD FOREIGN KEY([ID_product])
REFERENCES [dbo].[Product] ([ID_product])
GO
ALTER TABLE [dbo].[Transaction_Details]  WITH CHECK ADD FOREIGN KEY([ID_transaction])
REFERENCES [dbo].[Transactions] ([ID_transaction])
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD FOREIGN KEY([ID_customer])
REFERENCES [dbo].[Customer] ([ID_customer])
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[Staff] ([username])
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[Staff] ([username])
GO
