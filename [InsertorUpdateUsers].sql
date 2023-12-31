/****** Object:  StoredProcedure [dbo].[InsertorUpdateUsers]    Script Date: 12/06/2023 16:04:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[InsertorUpdateUsers]
as
	Begin
	MERGE INTO [dbo].[Users] AS Target
	USING (
		SELECT DISTINCT
			[Respondent],
			[Age],
			[Dependents],
			[Gender],
			[SexualOrientation],
			[MilitaryUS],
			[Hobby],
			[OpenSource],
			[Country],
			[Student],
			[Employment],
			[FormalEducation],
			[UndergradMajor]
		FROM [dbo].[SurveyData]
	) AS Source ON Target.[Respondent] = Source.[Respondent]
	WHEN MATCHED THEN
		UPDATE SET
			Target.[Age] = Source.[Age],
			Target.[Dependents] = Source.[Dependents],
			Target.[Gender] = Source.[Gender],
			Target.[SexualOrientation] = Source.[SexualOrientation],
			Target.[MilitaryUS] = Source.[MilitaryUS],
			Target.[Hobby] = Source.[Hobby],
			Target.[OpenSource] = Source.[OpenSource],
			Target.[Country] = Source.[Country],
			Target.[Student] = Source.[Student],
			Target.[Employment] = Source.[Employment],
			Target.[FormalEducation] = Source.[FormalEducation],
			Target.[UndergradMajor] = Source.[UndergradMajor]
	WHEN NOT MATCHED BY TARGET THEN
		INSERT (
			[Respondent],
			[Age],
			[Dependents],
			[Gender],
			[SexualOrientation],
			[MilitaryUS],
			[Hobby],
			[OpenSource],
			[Country],
			[Student],
			[Employment],
			[FormalEducation],
			[UndergradMajor]
		) VALUES (
			Source.[Respondent],
			Source.[Age],
			Source.[Dependents],
			Source.[Gender],
			Source.[SexualOrientation],
			Source.[MilitaryUS],
			Source.[Hobby],
			Source.[OpenSource],
			Source.[Country],
			Source.[Student],
			Source.[Employment],
			Source.[FormalEducation],
			Source.[UndergradMajor]
		);
END