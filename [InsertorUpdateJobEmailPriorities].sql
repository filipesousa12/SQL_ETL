/****** Object:  StoredProcedure [dbo].[InsertorUpdateJobEmailPriorities]    Script Date: 12/06/2023 16:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[InsertorUpdateJobEmailPriorities]
as
	Begin
MERGE INTO [dbo].[JobEmailPriorities] AS Target
USING (
    SELECT DISTINCT
        [Respondent],
        [JobEmailPriorities1],
        [JobEmailPriorities2],
        [JobEmailPriorities3],
        [JobEmailPriorities4],
        [JobEmailPriorities5],
        [JobEmailPriorities6],
        [JobEmailPriorities7]
    FROM [dbo].[SurveyData]
) AS Source ON Target.[Respondent] = Source.[Respondent]
WHEN MATCHED THEN
    UPDATE SET
        Target.[JobEmailPriorities1] = Source.[JobEmailPriorities1],
        Target.[JobEmailPriorities2] = Source.[JobEmailPriorities2],
        Target.[JobEmailPriorities3] = Source.[JobEmailPriorities3],
        Target.[JobEmailPriorities4] = Source.[JobEmailPriorities4],
        Target.[JobEmailPriorities5] = Source.[JobEmailPriorities5],
        Target.[JobEmailPriorities6] = Source.[JobEmailPriorities6],
        Target.[JobEmailPriorities7] = Source.[JobEmailPriorities7]
WHEN NOT MATCHED BY TARGET THEN
    INSERT (
        [Respondent],
        [JobEmailPriorities1],
        [JobEmailPriorities2],
        [JobEmailPriorities3],
        [JobEmailPriorities4],
        [JobEmailPriorities5],
        [JobEmailPriorities6],
        [JobEmailPriorities7]
    ) VALUES (
        Source.[Respondent],
        Source.[JobEmailPriorities1],
        Source.[JobEmailPriorities2],
        Source.[JobEmailPriorities3],
        Source.[JobEmailPriorities4],
        Source.[JobEmailPriorities5],
        Source.[JobEmailPriorities6],
        Source.[JobEmailPriorities7]
    );


END