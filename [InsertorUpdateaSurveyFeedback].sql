/****** Object:  StoredProcedure [dbo].[InsertorUpdateaSurveyFeedback]    Script Date: 12/06/2023 16:02:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[InsertorUpdateaSurveyFeedback]
as
	Begin
MERGE INTO [dbo].[SurveyFeedback] AS Target
USING (
    SELECT DISTINCT
        [Respondent],
        [SurveyTooLong],
        [SurveyEasy]
    FROM [dbo].[SurveyData]
) AS Source ON Target.[Respondent] = Source.[Respondent]
WHEN MATCHED THEN
    UPDATE SET
        Target.[SurveyTooLong] = Source.[SurveyTooLong],
        Target.[SurveyEasy] = Source.[SurveyEasy]
WHEN NOT MATCHED BY TARGET THEN
    INSERT (
        [Respondent],
        [SurveyTooLong],
        [SurveyEasy]
    ) VALUES (
        Source.[Respondent],
        Source.[SurveyTooLong],
        Source.[SurveyEasy]
    );





END