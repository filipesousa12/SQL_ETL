/****** Object:  StoredProcedure [dbo].[InsertorUpdateaAgreeDisagree]    Script Date: 12/06/2023 15:59:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[InsertorUpdateaAgreeDisagree]
as
	Begin
MERGE INTO [dbo].[AgreeDisagree] AS Target
USING (
    SELECT DISTINCT
        [Respondent],
        [AgreeDisagree1],
        [AgreeDisagree2],
        [AgreeDisagree3]
    FROM [dbo].[SurveyData]
) AS Source ON Target.[Respondent] = Source.[Respondent]
WHEN MATCHED THEN
    UPDATE SET
        Target.[AgreeDisagree1] = Source.[AgreeDisagree1],
        Target.[AgreeDisagree2] = Source.[AgreeDisagree2],
        Target.[AgreeDisagree3] = Source.[AgreeDisagree3]
WHEN NOT MATCHED BY TARGET THEN
    INSERT (
        [Respondent],
        [AgreeDisagree1],
        [AgreeDisagree2],
        [AgreeDisagree3]
    ) VALUES (
        Source.[Respondent],
        Source.[AgreeDisagree1],
        Source.[AgreeDisagree2],
        Source.[AgreeDisagree3]
    );





END