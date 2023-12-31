/****** Object:  StoredProcedure [dbo].[InsertorUpdateadsactions]    Script Date: 12/06/2023 16:01:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER   PROCEDURE [dbo].[InsertorUpdateadsactions]
as
	Begin
	with user_AdsActions as(
SELECT distinct Respondent,value AS AdsActions
FROM SurveyData
CROSS APPLY STRING_SPLIT(AdsActions, ';'))

	-- Merge DevType table
MERGE INTO AdsActions AS target
USING (select distinct AdsActions from user_AdsActions)  AS source ON target.AdsActions = source.AdsActions
WHEN NOT MATCHED THEN
    INSERT (AdsActions)
    VALUES (source.AdsActions);

with user_AdsActions as(
SELECT distinct Respondent,value AS AdsActions
FROM SurveyData
CROSS APPLY STRING_SPLIT(AdsActions, ';')),
user_adsid as (
	select Respondent, ID 
	FROM user_AdsActions ud
	LEFT JOIN AdsActions dt
	ON ud.AdsActions=dt.AdsActions
)

MERGE INTO dbo.user_AdsActions AS target
USING user_adsid AS source ON (target.Respondent = source.Respondent and target.AdsActions = source.ID)
WHEN MATCHED THEN
    UPDATE SET target.AdsActions = source.ID
WHEN NOT MATCHED BY TARGET THEN
    INSERT (Respondent, AdsActions)
    VALUES (source.Respondent, source.ID);


END





