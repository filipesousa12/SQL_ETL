/****** Object:  StoredProcedure [dbo].[InsertorUpdateaAI]    Script Date: 12/06/2023 16:00:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[InsertorUpdateaAI]
as
	Begin
MERGE INTO [dbo].[AI] AS Target
USING (
    SELECT DISTINCT
        [Respondent],
        [AIDangerous],
        [AIInteresting],
        [AIResponsible],
        [AIFuture],
        [EthicsChoice],
        [EthicsReport],
        [EthicsResponsible],
        [EthicalImplications]
    FROM [dbo].[SurveyData]
) AS Source ON Target.[Respondent] = Source.[Respondent]
WHEN MATCHED THEN
    UPDATE SET
        Target.[AIDangerous] = Source.[AIDangerous],
        Target.[AIInteresting] = Source.[AIInteresting],
        Target.[AIResponsible] = Source.[AIResponsible],
        Target.[AIFuture] = Source.[AIFuture],
        Target.[EthicsChoice] = Source.[EthicsChoice],
        Target.[EthicsReport] = Source.[EthicsReport],
        Target.[EthicsResponsible] = Source.[EthicsResponsible],
        Target.[EthicalImplications] = Source.[EthicalImplications]
WHEN NOT MATCHED BY TARGET THEN
    INSERT (
        [Respondent],
        [AIDangerous],
        [AIInteresting],
        [AIResponsible],
        [AIFuture],
        [EthicsChoice],
        [EthicsReport],
        [EthicsResponsible],
        [EthicalImplications]
    ) VALUES (
        Source.[Respondent],
        Source.[AIDangerous],
        Source.[AIInteresting],
        Source.[AIResponsible],
        Source.[AIFuture],
        Source.[EthicsChoice],
        Source.[EthicsReport],
        Source.[EthicsResponsible],
        Source.[EthicalImplications]
    );




END