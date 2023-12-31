/****** Object:  StoredProcedure [dbo].[InsertorUpdateads]    Script Date: 12/06/2023 16:00:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[InsertorUpdateads]
as
	Begin
MERGE INTO [dbo].[Ads] AS Target
USING (
    SELECT DISTINCT
        [Respondent],
        [AdsAgreeDisagree1],
        [AdsAgreeDisagree2],
        [AdsAgreeDisagree3],
        [AdsPriorities1],
        [AdsPriorities2],
        [AdsPriorities3],
        [AdsPriorities4],
        [AdsPriorities5],
        [AdsPriorities6],
        [AdsPriorities7]
    FROM [dbo].[SurveyData]
) AS Source ON Target.[Respondent] = Source.[Respondent]
WHEN MATCHED THEN
    UPDATE SET
        Target.[AdsAgreeDisagree1] = Source.[AdsAgreeDisagree1],
        Target.[AdsAgreeDisagree2] = Source.[AdsAgreeDisagree2],
        Target.[AdsAgreeDisagree3] = Source.[AdsAgreeDisagree3],
        Target.[AdsPriorities1] = Source.[AdsPriorities1],
        Target.[AdsPriorities2] = Source.[AdsPriorities2],
        Target.[AdsPriorities3] = Source.[AdsPriorities3],
        Target.[AdsPriorities4] = Source.[AdsPriorities4],
        Target.[AdsPriorities5] = Source.[AdsPriorities5],
        Target.[AdsPriorities6] = Source.[AdsPriorities6],
        Target.[AdsPriorities7] = Source.[AdsPriorities7]
WHEN NOT MATCHED BY TARGET THEN
    INSERT (
        [Respondent],
        [AdsAgreeDisagree1],
        [AdsAgreeDisagree2],
        [AdsAgreeDisagree3],
        [AdsPriorities1],
        [AdsPriorities2],
        [AdsPriorities3],
        [AdsPriorities4],
        [AdsPriorities5],
        [AdsPriorities6],
        [AdsPriorities7]
    ) VALUES (
        Source.[Respondent],
        Source.[AdsAgreeDisagree1],
        Source.[AdsAgreeDisagree2],
        Source.[AdsAgreeDisagree3],
        Source.[AdsPriorities1],
        Source.[AdsPriorities2],
        Source.[AdsPriorities3],
        Source.[AdsPriorities4],
        Source.[AdsPriorities5],
        Source.[AdsPriorities6],
        Source.[AdsPriorities7]
    );




END