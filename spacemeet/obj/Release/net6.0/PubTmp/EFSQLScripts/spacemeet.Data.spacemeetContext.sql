IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220823114751_ExtraInformation')
BEGIN
    CREATE TABLE [Booking] (
        [Id] int NOT NULL IDENTITY,
        [SpaceId] int NOT NULL,
        [UserId] int NOT NULL,
        [MerchantId] int NOT NULL,
        [ResourceId] int NOT NULL,
        [NoR] int NOT NULL,
        [Amount] int NOT NULL,
        [Status] nvarchar(max) NULL,
        [CreatedAt] datetime2 NOT NULL,
        [UpdatedAt] datetime2 NOT NULL,
        CONSTRAINT [PK_Booking] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220823114751_ExtraInformation')
BEGIN
    CREATE TABLE [Individual] (
        [Id] int NOT NULL IDENTITY,
        [userName] nvarchar(max) NOT NULL,
        [gender] nvarchar(max) NOT NULL,
        [companyName] nvarchar(max) NOT NULL,
        [UserId] nvarchar(max) NOT NULL,
        CONSTRAINT [PK_Individual] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220823114751_ExtraInformation')
BEGIN
    CREATE TABLE [Merchant] (
        [Id] int NOT NULL IDENTITY,
        [adminName] nvarchar(max) NOT NULL,
        [validId] nvarchar(max) NOT NULL,
        [UserId] nvarchar(max) NOT NULL,
        CONSTRAINT [PK_Merchant] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220823114751_ExtraInformation')
BEGIN
    CREATE TABLE [Review] (
        [Id] int NOT NULL IDENTITY,
        [UserId] int NOT NULL,
        [SpaceId] int NOT NULL,
        [Description] nvarchar(max) NULL,
        [Rating] int NOT NULL,
        [CreatedAt] datetime2 NOT NULL,
        CONSTRAINT [PK_Review] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220823114751_ExtraInformation')
BEGIN
    CREATE TABLE [Space] (
        [Id] int NOT NULL IDENTITY,
        [MerchantId] int NOT NULL,
        [Type] nvarchar(max) NULL,
        [Capacity] int NOT NULL,
        [Location] nvarchar(max) NULL,
        [Price] nvarchar(max) NULL,
        CONSTRAINT [PK_Space] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220823114751_ExtraInformation')
BEGIN
    CREATE TABLE [Transactions] (
        [Id] nvarchar(450) NOT NULL,
        [UserId] int NOT NULL,
        [Type] nvarchar(max) NULL,
        [Purpose] nvarchar(max) NULL,
        [Amount] int NOT NULL,
        [CreatedDate] datetime2 NOT NULL,
        CONSTRAINT [PK_Transactions] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220823114751_ExtraInformation')
BEGIN
    CREATE TABLE [Users] (
        [Id] int NOT NULL IDENTITY,
        [email] nvarchar(max) NOT NULL,
        [phoneNumber] nvarchar(max) NOT NULL,
        [companyName] nvarchar(max) NOT NULL,
        [passwordHash] varbinary(max) NOT NULL,
        [passwordSalt] varbinary(max) NOT NULL,
        [role] nvarchar(max) NOT NULL,
        [address] nvarchar(max) NOT NULL,
        CONSTRAINT [PK_Users] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220823114751_ExtraInformation')
BEGIN
    CREATE TABLE [Wallets] (
        [Id] int NOT NULL IDENTITY,
        [UserId] int NOT NULL,
        [Balance] float NOT NULL,
        [PendingBalance] float NOT NULL,
        [CreatedAt] datetime2 NOT NULL,
        [UpdatedAt] datetime2 NOT NULL,
        CONSTRAINT [PK_Wallets] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220823114751_ExtraInformation')
BEGIN
    CREATE TABLE [BookedDateModel] (
        [Date] datetime2 NOT NULL,
        [BookingId] int NULL,
        CONSTRAINT [PK_BookedDateModel] PRIMARY KEY ([Date]),
        CONSTRAINT [FK_BookedDateModel_Booking_BookingId] FOREIGN KEY ([BookingId]) REFERENCES [Booking] ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220823114751_ExtraInformation')
BEGIN
    CREATE TABLE [AssetsModel] (
        [Id] int NOT NULL IDENTITY,
        [Name] nvarchar(max) NOT NULL,
        [Description] nvarchar(max) NULL,
        [ImgUrl] nvarchar(max) NULL,
        [SpaceId] int NULL,
        CONSTRAINT [PK_AssetsModel] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_AssetsModel_Space_SpaceId] FOREIGN KEY ([SpaceId]) REFERENCES [Space] ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220823114751_ExtraInformation')
BEGIN
    CREATE TABLE [ImagesModel] (
        [ImgUrl] nvarchar(450) NOT NULL,
        [Name] nvarchar(max) NULL,
        [SpaceId] int NULL,
        CONSTRAINT [PK_ImagesModel] PRIMARY KEY ([ImgUrl]),
        CONSTRAINT [FK_ImagesModel_Space_SpaceId] FOREIGN KEY ([SpaceId]) REFERENCES [Space] ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220823114751_ExtraInformation')
BEGIN
    CREATE INDEX [IX_AssetsModel_SpaceId] ON [AssetsModel] ([SpaceId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220823114751_ExtraInformation')
BEGIN
    CREATE INDEX [IX_BookedDateModel_BookingId] ON [BookedDateModel] ([BookingId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220823114751_ExtraInformation')
BEGIN
    CREATE INDEX [IX_ImagesModel_SpaceId] ON [ImagesModel] ([SpaceId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220823114751_ExtraInformation')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220823114751_ExtraInformation', N'6.0.8');
END;
GO

COMMIT;
GO

