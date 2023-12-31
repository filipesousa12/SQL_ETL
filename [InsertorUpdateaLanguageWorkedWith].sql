/****** Object:  StoredProcedure [dbo].[InsertorUpdateaLanguageWorkedWith]    Script Date: 12/06/2023 16:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER   PROCEDURE [dbo].[InsertorUpdateaLanguageWorkedWith]
as
	Begin
	with LanguageWorkedWith_user as(
SELECT distinct Respondent,value AS LanguageWorkedWith
FROM SurveyData
CROSS APPLY STRING_SPLIT(LanguageWorkedWith, ';'))


	-- Merge DevType table
MERGE INTO LanguageWorkedWith AS target
USING (select distinct LanguageWorkedWith from LanguageWorkedWith_user)  AS source ON target.LanguageWorkedWith = source.LanguageWorkedWith
WHEN NOT MATCHED THEN
    INSERT (LanguageWorkedWith)
    VALUES (source.LanguageWorkedWith);

with LanguageWorkedWith_user as(
SELECT distinct Respondent,value AS LanguageWorkedWith
FROM SurveyData
CROSS APPLY STRING_SPLIT(LanguageWorkedWith, ';'))
,
user_adsid as (
	select Respondent, ID 
	FROM LanguageWorkedWith_user ud
	LEFT JOIN LanguageWorkedWith dt
	ON ud.LanguageWorkedWith=dt.LanguageWorkedWith
)

MERGE INTO dbo.LanguageWorkedWith_user AS target
USING user_adsid AS source ON (target.Respondent = source.Respondent and  target.LanguageWorkedWith = source.ID)
WHEN MATCHED THEN
    UPDATE SET target.LanguageWorkedWith = source.ID
WHEN NOT MATCHED BY TARGET THEN
    INSERT (Respondent, LanguageWorkedWith)
    VALUES (source.Respondent, source.ID);


END





