/****** Object:  StoredProcedure [dbo].[InsertorUpdateaSelfTaughtTypes]    Script Date: 12/06/2023 16:01:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER   PROCEDURE [dbo].[InsertorUpdateaSelfTaughtTypes]
as
	Begin
	with SelfTaughtTypes_user as(
SELECT distinct Respondent,value AS SelfTaughtTypes
FROM SurveyData
CROSS APPLY STRING_SPLIT(SelfTaughtTypes, ';'))


	-- Merge DevType table
MERGE INTO SelfTaughtTypes AS target
USING (select distinct SelfTaughtTypes from SelfTaughtTypes_user)  AS source ON target.SelfTaughtTypes = source.SelfTaughtTypes
WHEN NOT MATCHED THEN
    INSERT (SelfTaughtTypes)
    VALUES (source.SelfTaughtTypes);

with SelfTaughtTypes_user as(
SELECT distinct Respondent,value AS SelfTaughtTypes
FROM SurveyData
CROSS APPLY STRING_SPLIT(SelfTaughtTypes, ';')),
user_adsid as (
	select Respondent, ID 
	FROM SelfTaughtTypes_user ud
	LEFT JOIN SelfTaughtTypes dt
	ON ud.SelfTaughtTypes=dt.SelfTaughtTypes
)

MERGE INTO dbo.SelfTaughtTypes_user AS target
USING user_adsid AS source ON (target.Respondent = source.Respondent and  target.SelfTaughtTypes = source.ID)
WHEN MATCHED THEN
    UPDATE SET target.SelfTaughtTypes = source.ID
WHEN NOT MATCHED BY TARGET THEN
    INSERT (Respondent, SelfTaughtTypes)
    VALUES (source.Respondent, source.ID);


END





