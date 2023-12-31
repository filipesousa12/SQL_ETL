/****** Object:  StoredProcedure [dbo].[InsertorUpdateaDailyHabits]    Script Date: 12/06/2023 16:00:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[InsertorUpdateaDailyHabits]
as
	Begin
	MERGE INTO [dbo].[DailyHabits] AS Target
USING (
    SELECT DISTINCT
        [Respondent],
        [WakeTime],
        [HoursComputer],
        [HoursOutside],
        [SkipMeals],
        [Exercise]
    FROM [dbo].[SurveyData]
) AS Source ON Target.[Respondent] = Source.[Respondent]
WHEN MATCHED THEN
    UPDATE SET
        Target.[WakeTime] = Source.[WakeTime],
        Target.[HoursComputer] = Source.[HoursComputer],
        Target.[HoursOutside] = Source.[HoursOutside],
        Target.[SkipMeals] = Source.[SkipMeals],
        Target.[Exercise] = Source.[Exercise]
WHEN NOT MATCHED BY TARGET THEN
    INSERT (
        [Respondent],
        [WakeTime],
        [HoursComputer],
        [HoursOutside],
        [SkipMeals],
        [Exercise]
    ) VALUES (
        Source.[Respondent],
        Source.[WakeTime],
        Source.[HoursComputer],
        Source.[HoursOutside],
        Source.[SkipMeals],
        Source.[Exercise]
    );





END