/****** Object:  StoredProcedure [dbo].[InsertorUpdateadblcoker]    Script Date: 12/06/2023 16:00:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[InsertorUpdateadblcoker]
as
	Begin
MERGE INTO [dbo].[AdBlocker] AS Target
USING (
    SELECT DISTINCT
        [Respondent],
        [AdBlocker],
        [AdBlockerDisable]
    FROM [dbo].[SurveyData]
) AS Source ON Target.[Respondent] = Source.[Respondent]
WHEN MATCHED THEN
    UPDATE SET
        Target.[AdBlocker] = Source.[AdBlocker],
        Target.[AdBlockerDisable] = Source.[AdBlockerDisable]
WHEN NOT MATCHED BY TARGET THEN
    INSERT (
        [Respondent],
        [AdBlocker],
        [AdBlockerDisable]
    ) VALUES (
        Source.[Respondent],
        Source.[AdBlocker],
        Source.[AdBlockerDisable]
    );



END