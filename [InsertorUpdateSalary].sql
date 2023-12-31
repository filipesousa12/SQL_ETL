/****** Object:  StoredProcedure [dbo].[InsertorUpdateSalary]    Script Date: 12/06/2023 16:03:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[InsertorUpdateSalary]
as
	Begin
	MERGE INTO [dbo].[Salary] AS Target
USING (
    SELECT DISTINCT
        [Respondent],
        [Currency],
        [CurrencySymbol],
        CASE
            WHEN SalaryType = 'Monthly' THEN [Salary] * 12
            WHEN SalaryType = 'Weekly' THEN [Salary] * 52
            ELSE [Salary]
        END AS [Salary],
        CASE
            WHEN SalaryType = 'Monthly' THEN [ConvertedSalary] * 12
            WHEN SalaryType = 'Weekly' THEN [ConvertedSalary] * 52
            ELSE [ConvertedSalary]
        END AS [ConvertedSalary]
    FROM [dbo].[SurveyData]
) AS Source ON Target.[Respondent] = Source.[Respondent]
WHEN MATCHED THEN
    UPDATE SET
        Target.[Salary] = Source.[Salary],
        Target.[CurrencySymbol] = Source.[CurrencySymbol],
        Target.[ConvertedSalary] = Source.[ConvertedSalary]
WHEN NOT MATCHED BY TARGET THEN
    INSERT (
        [Respondent],
        [Salary],
        [CurrencySymbol],
        [ConvertedSalary]
    ) VALUES (
        Source.[Respondent],
        Source.[Salary],
        Source.[CurrencySymbol],
        Source.[ConvertedSalary]
    );
END