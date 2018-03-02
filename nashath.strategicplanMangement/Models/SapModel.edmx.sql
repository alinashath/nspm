
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 12/09/2015 08:57:56
-- Generated from EDMX file: E:\2015 Projects\nashath.strategicplanMangement\nashath.strategicplanMangement\Models\SapModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [StrategicPlan];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_PillersStrategy]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Strategies] DROP CONSTRAINT [FK_PillersStrategy];
GO
IF OBJECT_ID(N'[dbo].[FK_SectionsStrategySections]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[StrategySections] DROP CONSTRAINT [FK_SectionsStrategySections];
GO
IF OBJECT_ID(N'[dbo].[FK_StrategicActionsStrategicActivity]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[StrategicActivities] DROP CONSTRAINT [FK_StrategicActionsStrategicActivity];
GO
IF OBJECT_ID(N'[dbo].[FK_StrategicActivitySchedule]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Schedules] DROP CONSTRAINT [FK_StrategicActivitySchedule];
GO
IF OBJECT_ID(N'[dbo].[FK_StrategicActivityStatus]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Status] DROP CONSTRAINT [FK_StrategicActivityStatus];
GO
IF OBJECT_ID(N'[dbo].[FK_StrategyStrategicActions]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[StrategicActions] DROP CONSTRAINT [FK_StrategyStrategicActions];
GO
IF OBJECT_ID(N'[dbo].[FK_StrategyStrategySections]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[StrategySections] DROP CONSTRAINT [FK_StrategyStrategySections];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Pillers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Pillers];
GO
IF OBJECT_ID(N'[dbo].[Schedules]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Schedules];
GO
IF OBJECT_ID(N'[dbo].[Sections]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Sections];
GO
IF OBJECT_ID(N'[dbo].[Status]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Status];
GO
IF OBJECT_ID(N'[dbo].[StrategicActions]', 'U') IS NOT NULL
    DROP TABLE [dbo].[StrategicActions];
GO
IF OBJECT_ID(N'[dbo].[StrategicActivities]', 'U') IS NOT NULL
    DROP TABLE [dbo].[StrategicActivities];
GO
IF OBJECT_ID(N'[dbo].[Strategies]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Strategies];
GO
IF OBJECT_ID(N'[dbo].[StrategySections]', 'U') IS NOT NULL
    DROP TABLE [dbo].[StrategySections];
GO
IF OBJECT_ID(N'[dbo].[sysdiagrams]', 'U') IS NOT NULL
    DROP TABLE [dbo].[sysdiagrams];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Schedules'
CREATE TABLE [dbo].[Schedules] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [StrategicActivityID] int  NOT NULL,
    [Year] int  NOT NULL,
    [Qt_One] bit  NULL,
    [Qt_Two] bit  NULL,
    [Qt_Three] bit  NULL,
    [Qt_Four] bit  NULL
);
GO

-- Creating table 'Sections'
CREATE TABLE [dbo].[Sections] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [SectionNameDV] nvarchar(max)  NOT NULL,
    [SectionNameEN] nvarchar(max)  NULL
);
GO

-- Creating table 'Status'
CREATE TABLE [dbo].[Status] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [StrategicActionID] int  NOT NULL,
    [DateTime] datetime  NOT NULL,
    [StatusDV] nvarchar(max)  NULL,
    [StatusEN] nvarchar(max)  NULL,
    [StatusUser] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'StrategicActions'
CREATE TABLE [dbo].[StrategicActions] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [RefCode] nvarchar(max)  NOT NULL,
    [ActionDV] nvarchar(max)  NULL,
    [ActionEN] nvarchar(max)  NULL,
    [StrategyID] int  NOT NULL
);
GO

-- Creating table 'StrategicActivities'
CREATE TABLE [dbo].[StrategicActivities] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [StrategicActionID] int  NOT NULL,
    [ActivityDV] nvarchar(max)  NULL,
    [ActivityEN] nvarchar(max)  NULL,
    [BudgetNB] decimal(18,0)  NULL,
    [BudgetGrant] decimal(18,0)  NULL
);
GO

-- Creating table 'Strategies'
CREATE TABLE [dbo].[Strategies] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [RefCode] nvarchar(max)  NOT NULL,
    [StrategyDV] nvarchar(max)  NULL,
    [StrategyEN] nvarchar(max)  NOT NULL,
    [Result] nvarchar(max)  NULL,
    [PillerID] int  NOT NULL
);
GO

-- Creating table 'StrategySections'
CREATE TABLE [dbo].[StrategySections] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [StrategyID] int  NOT NULL,
    [SectionID] int  NOT NULL
);
GO

-- Creating table 'Pillers'
CREATE TABLE [dbo].[Pillers] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [PillerDV] nvarchar(max)  NULL,
    [PillerEN] nvarchar(max)  NULL,
    [PillerDescDV] nvarchar(max)  NULL,
    [PillerDescEN] nvarchar(max)  NULL,
    [PillerNo] int  NULL
);
GO

-- Creating table 'sysdiagrams'
CREATE TABLE [dbo].[sysdiagrams] (
    [name] nvarchar(128)  NOT NULL,
    [principal_id] int  NOT NULL,
    [diagram_id] int IDENTITY(1,1) NOT NULL,
    [version] int  NULL,
    [definition] varbinary(max)  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Schedules'
ALTER TABLE [dbo].[Schedules]
ADD CONSTRAINT [PK_Schedules]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Sections'
ALTER TABLE [dbo].[Sections]
ADD CONSTRAINT [PK_Sections]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Status'
ALTER TABLE [dbo].[Status]
ADD CONSTRAINT [PK_Status]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'StrategicActions'
ALTER TABLE [dbo].[StrategicActions]
ADD CONSTRAINT [PK_StrategicActions]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'StrategicActivities'
ALTER TABLE [dbo].[StrategicActivities]
ADD CONSTRAINT [PK_StrategicActivities]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Strategies'
ALTER TABLE [dbo].[Strategies]
ADD CONSTRAINT [PK_Strategies]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'StrategySections'
ALTER TABLE [dbo].[StrategySections]
ADD CONSTRAINT [PK_StrategySections]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Pillers'
ALTER TABLE [dbo].[Pillers]
ADD CONSTRAINT [PK_Pillers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [diagram_id] in table 'sysdiagrams'
ALTER TABLE [dbo].[sysdiagrams]
ADD CONSTRAINT [PK_sysdiagrams]
    PRIMARY KEY CLUSTERED ([diagram_id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [StrategicActivityID] in table 'Schedules'
ALTER TABLE [dbo].[Schedules]
ADD CONSTRAINT [FK_StrategicActivitySchedule]
    FOREIGN KEY ([StrategicActivityID])
    REFERENCES [dbo].[StrategicActivities]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_StrategicActivitySchedule'
CREATE INDEX [IX_FK_StrategicActivitySchedule]
ON [dbo].[Schedules]
    ([StrategicActivityID]);
GO

-- Creating foreign key on [SectionID] in table 'StrategySections'
ALTER TABLE [dbo].[StrategySections]
ADD CONSTRAINT [FK_SectionsStrategySections]
    FOREIGN KEY ([SectionID])
    REFERENCES [dbo].[Sections]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SectionsStrategySections'
CREATE INDEX [IX_FK_SectionsStrategySections]
ON [dbo].[StrategySections]
    ([SectionID]);
GO

-- Creating foreign key on [StrategicActionID] in table 'Status'
ALTER TABLE [dbo].[Status]
ADD CONSTRAINT [FK_StrategicActivityStatus]
    FOREIGN KEY ([StrategicActionID])
    REFERENCES [dbo].[StrategicActivities]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_StrategicActivityStatus'
CREATE INDEX [IX_FK_StrategicActivityStatus]
ON [dbo].[Status]
    ([StrategicActionID]);
GO

-- Creating foreign key on [StrategicActionID] in table 'StrategicActivities'
ALTER TABLE [dbo].[StrategicActivities]
ADD CONSTRAINT [FK_StrategicActionsStrategicActivity]
    FOREIGN KEY ([StrategicActionID])
    REFERENCES [dbo].[StrategicActions]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_StrategicActionsStrategicActivity'
CREATE INDEX [IX_FK_StrategicActionsStrategicActivity]
ON [dbo].[StrategicActivities]
    ([StrategicActionID]);
GO

-- Creating foreign key on [StrategyID] in table 'StrategicActions'
ALTER TABLE [dbo].[StrategicActions]
ADD CONSTRAINT [FK_StrategyStrategicActions]
    FOREIGN KEY ([StrategyID])
    REFERENCES [dbo].[Strategies]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_StrategyStrategicActions'
CREATE INDEX [IX_FK_StrategyStrategicActions]
ON [dbo].[StrategicActions]
    ([StrategyID]);
GO

-- Creating foreign key on [PillerID] in table 'Strategies'
ALTER TABLE [dbo].[Strategies]
ADD CONSTRAINT [FK_PillersStrategy]
    FOREIGN KEY ([PillerID])
    REFERENCES [dbo].[Pillers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PillersStrategy'
CREATE INDEX [IX_FK_PillersStrategy]
ON [dbo].[Strategies]
    ([PillerID]);
GO

-- Creating foreign key on [StrategyID] in table 'StrategySections'
ALTER TABLE [dbo].[StrategySections]
ADD CONSTRAINT [FK_StrategyStrategySections]
    FOREIGN KEY ([StrategyID])
    REFERENCES [dbo].[StrategicActions]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_StrategyStrategySections'
CREATE INDEX [IX_FK_StrategyStrategySections]
ON [dbo].[StrategySections]
    ([StrategyID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------