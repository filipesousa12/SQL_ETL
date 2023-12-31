/****** Object:  StoredProcedure [dbo].[InsertorUpdateaStackOverflow]    Script Date: 12/06/2023 16:02:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[InsertorUpdateaStackOverflow]
as
	Begin
MERGE INTO [dbo].[StackOverflow] AS Target
USING (
    SELECT DISTINCT
        [Respondent],
        [StackOverflowRecommend],
        [StackOverflowVisit],
        [StackOverflowHasAccount],
        [StackOverflowParticipate],
        [StackOverflowJobs],
        [StackOverflowDevStory],
        [StackOverflowJobsRecommend],
        [StackOverflowConsiderMember]
    FROM [dbo].[SurveyData]
) AS Source ON Target.[Respondent] = Source.[Respondent]
WHEN MATCHED THEN
    UPDATE SET
        Target.[StackOverflowRecommend] = Source.[StackOverflowRecommend],
        Target.[StackOverflowVisit] = Source.[StackOverflowVisit],
        Target.[StackOverflowHasAccount] = Source.[StackOverflowHasAccount],
        Target.[StackOverflowParticipate] = Source.[StackOverflowParticipate],
        Target.[StackOverflowJobs] = Source.[StackOverflowJobs],
        Target.[StackOverflowDevStory] = Source.[StackOverflowDevStory],
        Target.[StackOverflowJobsRecommend] = Source.[StackOverflowJobsRecommend],
        Target.[StackOverflowConsiderMember] = Source.[StackOverflowConsiderMember]
WHEN NOT MATCHED BY TARGET THEN
    INSERT (
        [Respondent],
        [StackOverflowRecommend],
        [StackOverflowVisit],
        [StackOverflowHasAccount],
        [StackOverflowParticipate],
        [StackOverflowJobs],
        [StackOverflowDevStory],
        [StackOverflowJobsRecommend],
        [StackOverflowConsiderMember]
    ) VALUES (
        Source.[Respondent],
        Source.[StackOverflowRecommend],
        Source.[StackOverflowVisit],
        Source.[StackOverflowHasAccount],
        Source.[StackOverflowParticipate],
        Source.[StackOverflowJobs],
        Source.[StackOverflowDevStory],
        Source.[StackOverflowJobsRecommend],
        Source.[StackOverflowConsiderMember]
    );





END