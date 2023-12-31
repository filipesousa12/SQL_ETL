/****** Object:  StoredProcedure [dbo].[InsertorUpdateaDatabaseWorkedWith]    Script Date: 12/06/2023 16:00:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER   PROCEDURE [dbo].[InsertorUpdateaDatabaseWorkedWith]
as
	Begin
	with DatabaseWorkedWith_user as(
SELECT distinct Respondent,value AS DatabaseWorkedWith
FROM SurveyData
CROSS APPLY STRING_SPLIT(DatabaseWorkedWith, ';'))

	-- Merge DevType table
MERGE INTO DatabaseWorkedWith AS target
USING (select distinct DatabaseWorkedWith from DatabaseWorkedWith_user)  AS source ON target.DatabaseWorkedWith = source.DatabaseWorkedWith
WHEN NOT MATCHED THEN
    INSERT (DatabaseWorkedWith)
    VALUES (source.DatabaseWorkedWith);

with DatabaseWorkedWith_user as(
SELECT distinct Respondent,value AS DatabaseWorkedWith
FROM SurveyData
CROSS APPLY STRING_SPLIT(DatabaseWorkedWith, ';'))
,
user_adsid as (
	select Respondent, ID 
	FROM DatabaseWorkedWith_user ud
	LEFT JOIN DatabaseWorkedWith dt
	ON ud.DatabaseWorkedWith=dt.DatabaseWorkedWith
)

MERGE INTO dbo.DatabaseWorkedWith_user AS target
USING user_adsid AS source ON (target.Respondent = source.Respondent and target.DatabaseWorkedWith = source.ID)
WHEN MATCHED THEN
    UPDATE SET target.DatabaseWorkedWith = source.ID
WHEN NOT MATCHED BY TARGET THEN
    INSERT (Respondent, DatabaseWorkedWith)
    VALUES (source.Respondent, source.ID);


END





