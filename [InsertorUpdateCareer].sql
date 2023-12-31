/****** Object:  StoredProcedure [dbo].[InsertorUpdateCareer]    Script Date: 12/06/2023 16:02:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[InsertorUpdateCareer]
as
	Begin
MERGE INTO [dbo].[Career] AS Target
USING (
    SELECT DISTINCT
        [Respondent],
        [CompanySize],
        [YearsCoding],
        [YearsCodingProf],
        [JobSatisfaction],
        [CareerSatisfaction],
        [HopeFiveYears],
        [JobSearchStatus],
        [LastNewJob],
        [UpdateCV]
    FROM [dbo].[SurveyData]
) AS Source ON Target.[Respondent] = Source.[Respondent]
WHEN MATCHED THEN
    UPDATE SET
        Target.[CompanySize] = Source.[CompanySize],
        Target.[YearsCoding] = Source.[YearsCoding],
        Target.[YearsCodingProf] = Source.[YearsCodingProf],
        Target.[JobSatisfaction] = Source.[JobSatisfaction],
        Target.[CareerSatisfaction] = Source.[CareerSatisfaction],
        Target.[HopeFiveYears] = Source.[HopeFiveYears],
        Target.[JobSearchStatus] = Source.[JobSearchStatus],
        Target.[LastNewJob] = Source.[LastNewJob],
        Target.[UpdateCV] = Source.[UpdateCV]
WHEN NOT MATCHED BY TARGET THEN
    INSERT (
        [Respondent],
        [CompanySize],
        [YearsCoding],
        [YearsCodingProf],
        [JobSatisfaction],
        [CareerSatisfaction],
        [HopeFiveYears],
        [JobSearchStatus],
        [LastNewJob],
        [UpdateCV]
    ) VALUES (
        Source.[Respondent],
        Source.[CompanySize],
        Source.[YearsCoding],
        Source.[YearsCodingProf],
        Source.[JobSatisfaction],
        Source.[CareerSatisfaction],
        Source.[HopeFiveYears],
        Source.[JobSearchStatus],
        Source.[LastNewJob],
        Source.[UpdateCV]
    );


END