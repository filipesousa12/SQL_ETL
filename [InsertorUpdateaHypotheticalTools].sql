/****** Object:  StoredProcedure [dbo].[InsertorUpdateaHypotheticalTools]    Script Date: 12/06/2023 16:01:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[InsertorUpdateaHypotheticalTools]
as
	Begin
MERGE INTO [dbo].[HypotheticalTools] AS Target
USING (
    SELECT DISTINCT
        [Respondent],
        [HypotheticalTools1],
        [HypotheticalTools2],
        [HypotheticalTools3],
        [HypotheticalTools4],
        [HypotheticalTools5]
    FROM [dbo].[SurveyData]
) AS Source ON Target.[Respondent] = Source.[Respondent]
WHEN MATCHED THEN
    UPDATE SET
        Target.[HypotheticalTools1] = Source.[HypotheticalTools1],
        Target.[HypotheticalTools2] = Source.[HypotheticalTools2],
        Target.[HypotheticalTools3] = Source.[HypotheticalTools3],
        Target.[HypotheticalTools4] = Source.[HypotheticalTools4],
        Target.[HypotheticalTools5] = Source.[HypotheticalTools5]
WHEN NOT MATCHED BY TARGET THEN
    INSERT (
        [Respondent],
        [HypotheticalTools1],
        [HypotheticalTools2],
        [HypotheticalTools3],
        [HypotheticalTools4],
        [HypotheticalTools5]
    ) VALUES (
        Source.[Respondent],
        Source.[HypotheticalTools1],
        Source.[HypotheticalTools2],
        Source.[HypotheticalTools3],
        Source.[HypotheticalTools4],
        Source.[HypotheticalTools5]
    );





END