/****** Object:  StoredProcedure [dbo].[InsertorUpdateAssessJob]    Script Date: 12/06/2023 16:02:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[InsertorUpdateAssessJob]
as
	Begin
MERGE INTO [dbo].[AssessJob] AS Target
USING (
    SELECT DISTINCT
        [Respondent],
        [AssessJob1],
        [AssessJob2],
        [AssessJob3],
        [AssessJob4],
        [AssessJob5],
        [AssessJob6],
        [AssessJob7],
        [AssessJob8],
        [AssessJob9],
        [AssessJob10]
    FROM [dbo].[SurveyData]
) AS Source ON Target.[Respondent] = Source.[Respondent]
WHEN MATCHED THEN
    UPDATE SET
        Target.[AssessJob1] = Source.[AssessJob1],
        Target.[AssessJob2] = Source.[AssessJob2],
        Target.[AssessJob3] = Source.[AssessJob3],
        Target.[AssessJob4] = Source.[AssessJob4],
        Target.[AssessJob5] = Source.[AssessJob5],
        Target.[AssessJob6] = Source.[AssessJob6],
        Target.[AssessJob7] = Source.[AssessJob7],
        Target.[AssessJob8] = Source.[AssessJob8],
        Target.[AssessJob9] = Source.[AssessJob9],
        Target.[AssessJob10] = Source.[AssessJob10]
WHEN NOT MATCHED BY TARGET THEN
    INSERT (
        [Respondent],
        [AssessJob1],
        [AssessJob2],
        [AssessJob3],
        [AssessJob4],
        [AssessJob5],
        [AssessJob6],
        [AssessJob7],
        [AssessJob8],
        [AssessJob9],
        [AssessJob10]
    ) VALUES (
        Source.[Respondent],
        Source.[AssessJob1],
        Source.[AssessJob2],
        Source.[AssessJob3],
        Source.[AssessJob4],
        Source.[AssessJob5],
        Source.[AssessJob6],
        Source.[AssessJob7],
        Source.[AssessJob8],
        Source.[AssessJob9],
        Source.[AssessJob10]
    );

END