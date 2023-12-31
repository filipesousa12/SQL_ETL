/****** Object:  StoredProcedure [dbo].[InsertorUpdateCommunicationTools_user]    Script Date: 12/06/2023 16:02:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER   PROCEDURE [dbo].[InsertorUpdateCommunicationTools_user]
as
	Begin
	with CommunicationTools_user as(
SELECT distinct Respondent,value AS CommunicationTools
FROM SurveyData
CROSS APPLY STRING_SPLIT(CommunicationTools, ';'))


	-- Merge DevType table
MERGE INTO CommunicationTools AS target
USING (select distinct CommunicationTools from CommunicationTools_user)  AS source ON target.CommunicationTools = source.CommunicationTools
WHEN NOT MATCHED THEN
    INSERT (CommunicationTools)
    VALUES (source.CommunicationTools);

with CommunicationTools_user as(
SELECT distinct Respondent,value AS CommunicationTools
FROM SurveyData
CROSS APPLY STRING_SPLIT(CommunicationTools, ';')),
user_adsid as (
	select Respondent, ID 
	FROM CommunicationTools_user ud
	LEFT JOIN CommunicationTools dt
	ON ud.CommunicationTools=dt.CommunicationTools
)

MERGE INTO dbo.CommunicationTools_user AS target
USING user_adsid AS source ON (target.Respondent = source.Respondent and target.CommunicationTools = source.ID)
WHEN MATCHED THEN
    UPDATE SET target.CommunicationTools = source.ID
WHEN NOT MATCHED BY TARGET THEN
    INSERT (Respondent, CommunicationTools)
    VALUES (source.Respondent, source.ID);


END


