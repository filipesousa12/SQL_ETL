/****** Object:  StoredProcedure [dbo].[InsertorUpdateaLanguageDesireNextYear]    Script Date: 12/06/2023 16:01:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER   PROCEDURE [dbo].[InsertorUpdateaLanguageDesireNextYear]
as
	Begin
	with LanguageDesireNextYear_user as(
SELECT distinct Respondent,value AS LanguageDesireNextYear
FROM SurveyData
CROSS APPLY STRING_SPLIT(LanguageDesireNextYear, ';'))

	-- Merge DevType table
MERGE INTO LanguageDesireNextYear AS target
USING (select distinct LanguageDesireNextYear from LanguageDesireNextYear_user)  AS source ON target.LanguageDesireNextYear = source.LanguageDesireNextYear
WHEN NOT MATCHED THEN
    INSERT (LanguageDesireNextYear)
    VALUES (source.LanguageDesireNextYear);

	with LanguageDesireNextYear_user as(
SELECT distinct Respondent,value AS LanguageDesireNextYear
FROM SurveyData
CROSS APPLY STRING_SPLIT(LanguageDesireNextYear, ';'))
,
user_adsid as (
	select Respondent, ID 
	FROM LanguageDesireNextYear_user ud
	LEFT JOIN LanguageDesireNextYear dt
	ON ud.LanguageDesireNextYear=dt.LanguageDesireNextYear
)

MERGE INTO dbo.LanguageDesireNextYear_user AS target
USING user_adsid AS source ON (target.Respondent = source.Respondent and  target.LanguageDesireNextYear = source.ID)
WHEN MATCHED THEN
    UPDATE SET target.LanguageDesireNextYear = source.ID
WHEN NOT MATCHED BY TARGET THEN
    INSERT (Respondent, LanguageDesireNextYear)
    VALUES (source.Respondent, source.ID);


END





