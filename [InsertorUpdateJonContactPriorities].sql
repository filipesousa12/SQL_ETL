/****** Object:  StoredProcedure [dbo].[InsertorUpdateJonContactPriorities]    Script Date: 12/06/2023 16:03:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[InsertorUpdateJonContactPriorities]
as
	Begin
MERGE INTO [dbo].[JobContactPriorities] AS Target
USING (
    SELECT DISTINCT
        [Respondent],
        [JobContactPriorities1],
        [JobContactPriorities2],
        [JobContactPriorities3],
        [JobContactPriorities4],
        [JobContactPriorities5]
    FROM [dbo].[SurveyData]
) AS Source ON Target.[Respondent] = Source.[Respondent]
WHEN MATCHED THEN
    UPDATE SET
        Target.[JobContactPriorities1] = Source.[JobContactPriorities1],
        Target.[JobContactPriorities2] = Source.[JobContactPriorities2],
        Target.[JobContactPriorities3] = Source.[JobContactPriorities3],
        Target.[JobContactPriorities4] = Source.[JobContactPriorities4],
        Target.[JobContactPriorities5] = Source.[JobContactPriorities5]
WHEN NOT MATCHED BY TARGET THEN
    INSERT (
        [Respondent],
        [JobContactPriorities1],
        [JobContactPriorities2],
        [JobContactPriorities3],
        [JobContactPriorities4],
        [JobContactPriorities5]
    ) VALUES (
        Source.[Respondent],
        Source.[JobContactPriorities1],
        Source.[JobContactPriorities2],
        Source.[JobContactPriorities3],
        Source.[JobContactPriorities4],
        Source.[JobContactPriorities5]
    );



END