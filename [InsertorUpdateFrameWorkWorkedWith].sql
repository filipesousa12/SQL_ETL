/****** Object:  StoredProcedure [dbo].[InsertorUpdateFrameWorkWorkedWith]    Script Date: 12/06/2023 16:03:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER   PROCEDURE [dbo].[InsertorUpdateFrameWorkWorkedWith]
as
	Begin
	with FrameWorkWorkedWith_user as(
SELECT distinct Respondent,value AS FrameWorkWorkedWith
FROM SurveyData
CROSS APPLY STRING_SPLIT(FrameWorkWorkedWith, ';'))

	-- Merge DevType table
MERGE INTO FrameWorkWorkedWith AS target
USING (select distinct FrameWorkWorkedWith from FrameWorkWorkedWith_user)  AS source ON target.FrameWorkWorkedWith = source.FrameWorkWorkedWith
WHEN NOT MATCHED THEN
    INSERT (FrameWorkWorkedWith)
    VALUES (source.FrameWorkWorkedWith);

with FrameWorkWorkedWith_user as(
SELECT distinct Respondent,value AS FrameWorkWorkedWith
FROM SurveyData
CROSS APPLY STRING_SPLIT(FrameWorkWorkedWith, ';'))
,
user_adsid as (
	select Respondent, ID 
	FROM FrameWorkWorkedWith_user ud
	LEFT JOIN FrameWorkWorkedWith dt
	ON ud.FrameWorkWorkedWith=dt.FrameWorkWorkedWith
)

MERGE INTO dbo.FrameWorkWorkedWith_user AS target
USING user_adsid AS source ON (target.Respondent = source.Respondent and  target.FrameWorkWorkedWith = source.ID)
WHEN MATCHED THEN
    UPDATE SET target.FrameWorkWorkedWith = source.ID
WHEN NOT MATCHED BY TARGET THEN
    INSERT (Respondent, FrameWorkWorkedWith)
    VALUES (source.Respondent, source.ID);


END





