/****** Object:  StoredProcedure [dbo].[InsertorUpdateAssessBenefits]    Script Date: 12/06/2023 16:02:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[InsertorUpdateAssessBenefits]
as
	Begin
MERGE INTO [dbo].[AssessBenefits] AS Target
USING (
    SELECT DISTINCT
        [Respondent],
        [AssessBenefits1],
        [AssessBenefits2],
        [AssessBenefits3],
        [AssessBenefits4],
        [AssessBenefits5],
        [AssessBenefits6],
        [AssessBenefits7],
        [AssessBenefits8],
        [AssessBenefits9],
        [AssessBenefits10],
        [AssessBenefits11]
    FROM [dbo].[SurveyData]
) AS Source ON Target.[Respondent] = Source.[Respondent]
WHEN MATCHED THEN
    UPDATE SET
        Target.[AssessBenefits1] = Source.[AssessBenefits1],
        Target.[AssessBenefits2] = Source.[AssessBenefits2],
        Target.[AssessBenefits3] = Source.[AssessBenefits3],
        Target.[AssessBenefits4] = Source.[AssessBenefits4],
        Target.[AssessBenefits5] = Source.[AssessBenefits5],
        Target.[AssessBenefits6] = Source.[AssessBenefits6],
        Target.[AssessBenefits7] = Source.[AssessBenefits7],
        Target.[AssessBenefits8] = Source.[AssessBenefits8],
        Target.[AssessBenefits9] = Source.[AssessBenefits9],
        Target.[AssessBenefits10] = Source.[AssessBenefits10],
        Target.[AssessBenefits11] = Source.[AssessBenefits11]
WHEN NOT MATCHED BY TARGET THEN
    INSERT (
        [Respondent],
        [AssessBenefits1],
        [AssessBenefits2],
        [AssessBenefits3],
        [AssessBenefits4],
        [AssessBenefits5],
        [AssessBenefits6],
        [AssessBenefits7],
        [AssessBenefits8],
        [AssessBenefits9],
        [AssessBenefits10],
        [AssessBenefits11]
    ) VALUES (
        Source.[Respondent],
        Source.[AssessBenefits1],
        Source.[AssessBenefits2],
        Source.[AssessBenefits3],
        Source.[AssessBenefits4],
        Source.[AssessBenefits5],
        Source.[AssessBenefits6],
        Source.[AssessBenefits7],
        Source.[AssessBenefits8],
        Source.[AssessBenefits9],
        Source.[AssessBenefits10],
        Source.[AssessBenefits11]
    );


END