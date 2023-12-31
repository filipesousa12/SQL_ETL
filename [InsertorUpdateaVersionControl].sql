/****** Object:  StoredProcedure [dbo].[InsertorUpdateaVersionControl]    Script Date: 12/06/2023 16:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER   PROCEDURE [dbo].[InsertorUpdateaVersionControl]
as
	Begin
	with VersionControl_user as(
SELECT distinct Respondent,value AS VersionControl
FROM SurveyData
CROSS APPLY STRING_SPLIT(VersionControl, ';'))


	-- Merge DevType table
MERGE INTO VersionControl AS target
USING (select distinct VersionControl from VersionControl_user)  AS source ON target.VersionControl = source.VersionControl
WHEN NOT MATCHED THEN
    INSERT (VersionControl)
    VALUES (source.VersionControl);

with VersionControl_user as(
SELECT distinct Respondent,value AS VersionControl
FROM SurveyData
CROSS APPLY STRING_SPLIT(VersionControl, ';')),
user_adsid as (
	select Respondent, ID 
	FROM VersionControl_user ud
	LEFT JOIN VersionControl dt
	ON ud.VersionControl=dt.VersionControl
)

MERGE INTO dbo.VersionControl_user AS target
USING user_adsid AS source ON (target.Respondent = source.Respondent and  target.VersionControl = source.ID)
WHEN MATCHED THEN
    UPDATE SET target.VersionControl = source.ID
WHEN NOT MATCHED BY TARGET THEN
    INSERT (Respondent, VersionControl)
    VALUES (source.Respondent, source.ID);


END





