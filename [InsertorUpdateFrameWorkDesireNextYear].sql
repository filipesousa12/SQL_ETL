/****** Object:  StoredProcedure [dbo].[InsertorUpdateFrameWorkDesireNextYear]    Script Date: 12/06/2023 16:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER   PROCEDURE [dbo].[InsertorUpdateFrameWorkDesireNextYear]
as
	Begin
	with FrameWorkDesireNextYear_user as(
SELECT distinct Respondent,value AS FrameWorkDesireNextYear
FROM SurveyData
CROSS APPLY STRING_SPLIT(FrameWorkDesireNextYear, ';'))

	-- Merge DevType table
MERGE INTO FrameWorkDesireNextYear AS target
USING (select distinct FrameWorkDesireNextYear from FrameWorkDesireNextYear_user)  AS source ON target.FrameWorkDesireNextYear = source.FrameWorkDesireNextYear
WHEN NOT MATCHED THEN
    INSERT (FrameWorkDesireNextYear)
    VALUES (source.FrameWorkDesireNextYear);

	with FrameWorkDesireNextYear_user as(
SELECT distinct Respondent,value AS FrameWorkDesireNextYear
FROM SurveyData
CROSS APPLY STRING_SPLIT(FrameWorkDesireNextYear, ';'))
,
user_adsid as (
	select Respondent, ID
	FROM FrameWorkDesireNextYear_user ud
	LEFT JOIN FrameWorkDesireNextYear dt
	ON ud.FrameWorkDesireNextYear=dt.FrameWorkDesireNextYear
)


MERGE INTO dbo.FrameWorkDesireNextYear_user AS target
USING user_adsid AS source ON (target.Respondent = source.Respondent AND target.FrameWorkDesireNextYear = source.ID)
WHEN MATCHED THEN
    UPDATE SET target.FrameWorkDesireNextYear = source.ID
WHEN NOT MATCHED BY TARGET THEN
    INSERT (Respondent, FrameWorkDesireNextYear)
    VALUES (source.Respondent, source.ID);



END