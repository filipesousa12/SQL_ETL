/****** Object:  StoredProcedure [dbo].[InsertorUpdateDevType]    Script Date: 12/06/2023 16:03:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER   PROCEDURE [dbo].[InsertorUpdateDevType]
as
	Begin
	with user_devtype as(
SELECT distinct Respondent,value AS DevType
FROM SurveyData
CROSS APPLY STRING_SPLIT(DevType, ';'))
	-- Merge DevType table
MERGE INTO DevType AS target
USING (select distinct DevType from user_devtype)  AS source ON target.DevType = source.DevType
WHEN NOT MATCHED THEN
    INSERT (DevType)
    VALUES (source.DevType);

 with user_devtyp as(
	SELECT distinct Respondent,value AS DevType
	FROM SurveyData
	CROSS APPLY STRING_SPLIT(DevType, ';')),
user_devid as (
	select Respondent, ID 
	FROM user_devtyp ud
	LEFT JOIN DevType dt
	ON ud.DevType=dt.DevType
)
MERGE INTO dbo.user_devtype AS target
USING user_devid AS source ON (target.Respondent = source.Respondent and  target.DevType = source.ID)
WHEN MATCHED THEN
    UPDATE SET target.DevType = source.ID
WHEN NOT MATCHED BY TARGET THEN
    INSERT (Respondent, DevType)
    VALUES (source.Respondent, source.ID);


END