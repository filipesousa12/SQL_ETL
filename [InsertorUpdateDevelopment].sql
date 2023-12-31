/****** Object:  StoredProcedure [dbo].[InsertorUpdateDevelopment]    Script Date: 12/06/2023 16:02:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[InsertorUpdateDevelopment]
as
	Begin

	MERGE INTO [dbo].[DevelopmentProcess] AS Target
USING (
    SELECT DISTINCT
        [Respondent],
        [OperatingSystem],
        [NumberMonitors],
        [Methodology],
        [CheckInCode]
    FROM [dbo].[SurveyData]
) AS Source ON Target.[Respondent] = Source.[Respondent]
WHEN MATCHED THEN
    UPDATE SET
        Target.[OperatingSystem] = Source.[OperatingSystem],
        Target.[NumberMonitors] = Source.[NumberMonitors],
        Target.[Methodology] = Source.[Methodology],
        Target.[CheckInCode] = Source.[CheckInCode]
WHEN NOT MATCHED BY TARGET THEN
    INSERT (
        [Respondent],
        [OperatingSystem],
        [NumberMonitors],
        [Methodology],
        [CheckInCode]
    ) VALUES (
        Source.[Respondent],
        Source.[OperatingSystem],
        Source.[NumberMonitors],
        Source.[Methodology],
        Source.[CheckInCode]
    );

	MERGE INTO [dbo].[DeveloperExperience] AS Target
USING (
    SELECT DISTINCT
        [Respondent],
        [TimeFullyProductive],
        [TimeAfterBootcamp],
        [HackathonReasons]
    FROM [dbo].[SurveyData]
) AS Source ON Target.[Respondent] = Source.[Respondent]
WHEN MATCHED THEN
    UPDATE SET
        Target.[TimeFullyProductive] = Source.[TimeFullyProductive],
        Target.[TimeAfterBootcamp] = Source.[TimeAfterBootcamp],
        Target.[HackathonReasons] = Source.[HackathonReasons]
WHEN NOT MATCHED BY TARGET THEN
    INSERT (
        [Respondent],
        [TimeFullyProductive],
        [TimeAfterBootcamp],
        [HackathonReasons]
    ) VALUES (
        Source.[Respondent],
        Source.[TimeFullyProductive],
        Source.[TimeAfterBootcamp],
        Source.[HackathonReasons]
    );





END