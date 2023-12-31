/****** Object:  StoredProcedure [dbo].[InsertorUpdateRace]    Script Date: 12/06/2023 16:03:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER   PROCEDURE [dbo].[InsertorUpdateRace]
as
	Begin
	with user_race as(
SELECT distinct Respondent,value AS RaceEthnicity
FROM SurveyData
CROSS APPLY STRING_SPLIT(RaceEthnicity, ';'))
	-- Merge DevType table
MERGE INTO RaceEthnicity AS target
USING (select distinct RaceEthnicity from user_race)  AS source ON target.RaceEthnicity = source.RaceEthnicity
WHEN NOT MATCHED THEN
    INSERT (RaceEthnicity)
    VALUES (source.RaceEthnicity);

 with user_race as(
SELECT distinct Respondent,value AS RaceEthnicity
FROM SurveyData
CROSS APPLY STRING_SPLIT(RaceEthnicity, ';')),
user_raceid as (
	select Respondent, ID 
	FROM user_race ud
	LEFT JOIN RaceEthnicity dt
	ON ud.RaceEthnicity=dt.RaceEthnicity
)
MERGE INTO dbo.user_RaceEthnicity AS target
USING user_raceid AS source ON (target.Respondent = source.Respondent and target.RaceEthnicity = source.ID)
WHEN MATCHED THEN
    UPDATE SET target.RaceEthnicity = source.ID
WHEN NOT MATCHED BY TARGET THEN
    INSERT (Respondent, RaceEthnicity)
    VALUES (source.Respondent, source.ID);


END




