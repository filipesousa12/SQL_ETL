/****** Object:  StoredProcedure [dbo].[InsertorUpdateaErgonomicDevices]    Script Date: 12/06/2023 16:01:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER   PROCEDURE [dbo].[InsertorUpdateaErgonomicDevices]
as
	Begin
	with ErgonomicDevices_user as(
SELECT distinct Respondent,value AS ErgonomicDevices
FROM SurveyData
CROSS APPLY STRING_SPLIT(ErgonomicDevices, ';'))

	-- Merge DevType table
MERGE INTO ErgonomicDevices AS target
USING (select distinct ErgonomicDevices from ErgonomicDevices_user)  AS source ON target.ErgonomicDevices = source.ErgonomicDevices
WHEN NOT MATCHED THEN
    INSERT (ErgonomicDevices)
    VALUES (source.ErgonomicDevices);

with ErgonomicDevices_user as(
SELECT distinct Respondent,value AS ErgonomicDevices
FROM SurveyData
CROSS APPLY STRING_SPLIT(ErgonomicDevices, ';')),
user_adsid as (
	select Respondent, ID 
	FROM ErgonomicDevices_user ud
	LEFT JOIN ErgonomicDevices dt
	ON ud.ErgonomicDevices=dt.ErgonomicDevices
)

MERGE INTO dbo.ErgonomicDevices_user AS target
USING user_adsid AS source ON (target.Respondent = source.Respondent and  target.ErgonomicDevices = source.ID)
WHEN MATCHED THEN
    UPDATE SET target.ErgonomicDevices = source.ID
WHEN NOT MATCHED BY TARGET THEN
    INSERT (Respondent, ErgonomicDevices)
    VALUES (source.Respondent, source.ID);


END





