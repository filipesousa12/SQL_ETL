/****** Object:  StoredProcedure [dbo].[InsertorUpdateIDE]    Script Date: 12/06/2023 16:03:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER   PROCEDURE [dbo].[InsertorUpdateIDE]
as
	Begin
	with user_ide as(
SELECT distinct Respondent,value AS IDE
FROM SurveyData
CROSS APPLY STRING_SPLIT(IDE, ';'))
	-- Merge DevType table
MERGE INTO IDE AS target
USING (select distinct IDE from user_ide)  AS source ON target.IDE = source.IDE
WHEN NOT MATCHED THEN
    INSERT (IDE)
    VALUES (source.IDE);

with user_ide as(
SELECT distinct Respondent,value AS IDE
FROM SurveyData
CROSS APPLY STRING_SPLIT(IDE, ';')),
user_ideid as (
	select Respondent, ID 
	FROM user_ide ud
	LEFT JOIN IDE dt
	ON ud.IDE=dt.IDE
)
MERGE INTO dbo.user_ide AS target
USING user_ideid AS source ON(target.Respondent = source.Respondent and  target.IDE = source.ID)
WHEN MATCHED THEN
    UPDATE SET target.IDE = source.ID
WHEN NOT MATCHED BY TARGET THEN
    INSERT (Respondent, IDE)
    VALUES (source.Respondent, source.ID);


END





