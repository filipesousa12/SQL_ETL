/****** Object:  StoredProcedure [dbo].[InsertorUpdateaEducationTypes]    Script Date: 12/06/2023 16:01:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER   PROCEDURE [dbo].[InsertorUpdateaEducationTypes]
as
	Begin
	with EducationTypes_user as(
SELECT distinct Respondent,value AS EducationTypes
FROM SurveyData
CROSS APPLY STRING_SPLIT(EducationTypes, ';'))


	-- Merge DevType table
MERGE INTO EducationTypes AS target
USING (select distinct EducationTypes from EducationTypes_user)  AS source ON target.EducationTypes = source.EducationTypes
WHEN NOT MATCHED THEN
    INSERT (EducationTypes)
    VALUES (source.EducationTypes);

with EducationTypes_user as(
SELECT distinct Respondent,value AS EducationTypes
FROM SurveyData
CROSS APPLY STRING_SPLIT(EducationTypes, ';')),
user_adsid as (
	select Respondent, ID 
	FROM EducationTypes_user ud
	LEFT JOIN EducationTypes dt
	ON ud.EducationTypes=dt.EducationTypes
)

MERGE INTO dbo.EducationTypes_user AS target
USING user_adsid AS source ON (target.Respondent = source.Respondent and  target.EducationTypes = source.ID)
WHEN MATCHED THEN
    UPDATE SET target.EducationTypes = source.ID
WHEN NOT MATCHED BY TARGET THEN
    INSERT (Respondent, EducationTypes)
    VALUES (source.Respondent, source.ID);


END





