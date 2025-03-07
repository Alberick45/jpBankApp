USE [jpbank086]
GO
/****** Object:  User [appadmin]    Script Date: 3/7/2025 12:48:42 AM ******/
CREATE USER [appadmin] FOR LOGIN [appadmin] WITH DEFAULT_SCHEMA=[sysadmin]
GO
/****** Object:  User [hradmin]    Script Date: 3/7/2025 12:48:42 AM ******/
CREATE USER [hradmin] FOR LOGIN [hradmin] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  DatabaseRole [admin_role]    Script Date: 3/7/2025 12:48:42 AM ******/
CREATE ROLE [admin_role]
GO
/****** Object:  DatabaseRole [employee_role]    Script Date: 3/7/2025 12:48:42 AM ******/
CREATE ROLE [employee_role]
GO
/****** Object:  DatabaseRole [hr_manager_role]    Script Date: 3/7/2025 12:48:42 AM ******/
CREATE ROLE [hr_manager_role]
GO
ALTER ROLE [hr_manager_role] ADD MEMBER [hradmin]
GO
/****** Object:  Schema [clients]    Script Date: 3/7/2025 12:48:42 AM ******/
CREATE SCHEMA [clients]
GO
/****** Object:  Schema [hr]    Script Date: 3/7/2025 12:48:42 AM ******/
CREATE SCHEMA [hr]
GO
/****** Object:  Schema [sysadmin]    Script Date: 3/7/2025 12:48:42 AM ******/
CREATE SCHEMA [sysadmin]
GO
/****** Object:  Table [dbo].[tbl_account_details_086]    Script Date: 3/7/2025 12:48:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_account_details_086](
	[account_number] [int] IDENTITY(1,1) NOT NULL,
	[customer_id] [int] NOT NULL,
	[account_type] [varchar](20) NULL,
	[balance] [decimal](15, 2) NOT NULL,
	[status] [varchar](20) NULL,
	[account_pin] [int] NOT NULL,
	[created_on] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[account_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[account_pin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_address_086]    Script Date: 3/7/2025 12:48:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_address_086](
	[adr_address_idpk] [int] IDENTITY(1,1) NOT NULL,
	[adr_address] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_country_086]    Script Date: 3/7/2025 12:48:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_country_086](
	[cty_idpk] [int] IDENTITY(1,1) NOT NULL,
	[cty_name] [varchar](50) NULL,
	[cty_shortname] [varchar](6) NULL,
	[cty_nationality] [varchar](50) NULL,
	[cty_created_by_user_idfk] [int] NULL,
	[cty_edited_by_user_idfk] [int] NULL,
	[cty_created_on] [datetime] NULL,
	[cty_edited_on] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_customers_086]    Script Date: 3/7/2025 12:48:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_customers_086](
	[customer_id] [int] IDENTITY(1,1) NOT NULL,
	[full_name] [varchar](100) NOT NULL,
	[dob] [date] NOT NULL,
	[gender] [varchar](10) NULL,
	[nationality] [varchar](30) NULL,
	[marital_status] [varchar](30) NULL,
	[occupation] [varchar](30) NULL,
	[email] [varchar](100) NOT NULL,
	[phone] [varchar](20) NOT NULL,
	[address] [text] NOT NULL,
	[loyalty_points] [int] NULL,
	[created_on] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_employees_086]    Script Date: 3/7/2025 12:48:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_employees_086](
	[emp_idpk] [int] IDENTITY(1,1) NOT NULL,
	[emp_firstname] [varchar](15) NOT NULL,
	[emp_lastname] [varchar](15) NULL,
	[emp_othernames] [varchar](50) NULL,
	[emp_dob] [date] NOT NULL,
	[emp_gender_idfk] [int] NULL,
	[emp_nationality_idfk] [int] NULL,
	[emp_work_status_idfk] [int] NULL,
	[emp_marital_status_idfk] [int] NULL,
	[emp_email] [varchar](100) NULL,
	[emp_phone_nos] [varchar](20) NULL,
	[emp_address_idfk] [int] NULL,
	[emp_loyalty_point] [int] NULL,
	[emp_job_title_idfk] [int] NULL,
	[emp_created_on] [datetime] NULL,
	[emp_edited_on] [datetime] NULL,
	[emp_created_by_user_idfk] [nchar](10) NULL,
	[emp_edited_by_user_idfk] [nchar](10) NULL,
 CONSTRAINT [PK__employee__C52E0BA83A9044D2] PRIMARY KEY CLUSTERED 
(
	[emp_idpk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ__employee__AB6E6164209B41A2] UNIQUE NONCLUSTERED 
(
	[emp_email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ__employee__B43B145F234E040F] UNIQUE NONCLUSTERED 
(
	[emp_phone_nos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_gender_086]    Script Date: 3/7/2025 12:48:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_gender_086](
	[gnd_gender_idpk] [int] IDENTITY(1,1) NOT NULL,
	[gnd_geder_type] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_kyc_086]    Script Date: 3/7/2025 12:48:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_kyc_086](
	[kyc_id] [int] IDENTITY(1,1) NOT NULL,
	[customer_id] [int] NOT NULL,
	[id_type] [varchar](20) NULL,
	[id_number] [varchar](50) NOT NULL,
	[document_url] [varchar](255) NULL,
	[verified_by] [int] NULL,
	[verified_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[kyc_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[id_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_marital_status_086]    Script Date: 3/7/2025 12:48:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_marital_status_086](
	[mts_marital_status_idpk] [int] IDENTITY(1,1) NOT NULL,
	[mts_marital_status_type] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_security_logs_086]    Script Date: 3/7/2025 12:48:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_security_logs_086](
	[log_id] [int] IDENTITY(1,1) NOT NULL,
	[log_customer_account_number] [int] NULL,
	[log_employee_id] [int] NOT NULL,
	[log_action] [varchar](255) NOT NULL,
	[log_ip_address] [varchar](50) NULL,
	[log_device_info] [varchar](255) NULL,
	[log_timestamp] [datetime] NULL,
	[success] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[log_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_transactions_086]    Script Date: 3/7/2025 12:48:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_transactions_086](
	[tst_transaction_id] [int] IDENTITY(1,1) NOT NULL,
	[tst_account_number] [int] NOT NULL,
	[tst_amount] [decimal](15, 2) NOT NULL,
	[tst_transaction_type] [varchar](20) NULL,
	[tst_created_by_user_id] [int] NULL,
	[tst_created_on] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[tst_transaction_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_users_086]    Script Date: 3/7/2025 12:48:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_users_086](
	[usr_idpk] [int] IDENTITY(1,1) NOT NULL,
	[usr_username] [varchar](50) NULL,
	[usr_password] [varchar](256) NULL,
	[usr_empidfk] [int] NULL,
	[usr_start_date] [datetime] NULL,
	[usr_end_date] [datetime] NULL,
	[usr_created_by_userid] [int] NULL,
	[usr_edited_by_userid] [int] NULL,
	[usr_created_on] [datetime2](7) NULL,
	[usr_edited_on] [datetime2](7) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_account_details_086] ADD  DEFAULT ((0.00)) FOR [balance]
GO
ALTER TABLE [dbo].[tbl_account_details_086] ADD  DEFAULT ('Active') FOR [status]
GO
ALTER TABLE [dbo].[tbl_account_details_086] ADD  DEFAULT (getdate()) FOR [created_on]
GO
ALTER TABLE [dbo].[tbl_country_086] ADD  CONSTRAINT [DF_tbl_country_086_cty_created_on]  DEFAULT (getdate()) FOR [cty_created_on]
GO
ALTER TABLE [dbo].[tbl_customers_086] ADD  DEFAULT (getdate()) FOR [created_on]
GO
ALTER TABLE [dbo].[tbl_employees_086] ADD  CONSTRAINT [DF__employees__work___797309D9]  DEFAULT ('active') FOR [emp_work_status_idfk]
GO
ALTER TABLE [dbo].[tbl_employees_086] ADD  CONSTRAINT [DF__employees__creat__7B5B524B]  DEFAULT (getdate()) FOR [emp_created_on]
GO
ALTER TABLE [dbo].[tbl_kyc_086] ADD  DEFAULT (getdate()) FOR [verified_at]
GO
ALTER TABLE [dbo].[tbl_security_logs_086] ADD  DEFAULT (getdate()) FOR [log_timestamp]
GO
ALTER TABLE [dbo].[tbl_transactions_086] ADD  DEFAULT (getdate()) FOR [tst_created_on]
GO
ALTER TABLE [dbo].[tbl_users_086] ADD  CONSTRAINT [DF_tbl_users_086_usr_created_on]  DEFAULT (getdate()) FOR [usr_created_on]
GO
ALTER TABLE [dbo].[tbl_account_details_086]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[tbl_customers_086] ([customer_id])
GO
ALTER TABLE [dbo].[tbl_kyc_086]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[tbl_customers_086] ([customer_id])
GO
ALTER TABLE [dbo].[tbl_security_logs_086]  WITH CHECK ADD FOREIGN KEY([log_customer_account_number])
REFERENCES [dbo].[tbl_account_details_086] ([account_number])
GO
ALTER TABLE [dbo].[tbl_transactions_086]  WITH CHECK ADD FOREIGN KEY([tst_account_number])
REFERENCES [dbo].[tbl_account_details_086] ([account_number])
GO
ALTER TABLE [dbo].[tbl_account_details_086]  WITH CHECK ADD CHECK  (([account_type]='Fixed Deposit' OR [account_type]='Checking' OR [account_type]='Savings'))
GO
ALTER TABLE [dbo].[tbl_account_details_086]  WITH CHECK ADD CHECK  (([status]='Closed' OR [status]='Frozen' OR [status]='Active'))
GO
ALTER TABLE [dbo].[tbl_customers_086]  WITH CHECK ADD CHECK  (([gender]='female' OR [gender]='male'))
GO
ALTER TABLE [dbo].[tbl_kyc_086]  WITH CHECK ADD CHECK  (([id_type]='Driver License' OR [id_type]='Passport' OR [id_type]='National ID'))
GO
