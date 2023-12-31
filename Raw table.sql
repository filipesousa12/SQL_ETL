/****** Object:  Table [dbo].[SurveyData]    Script Date: 12/06/2023 10:26:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
DROP TABLE [dbo].[SurveyData]
CREATE TABLE [dbo].[SurveyData](
	[Respondent] [varchar](max) NULL,
	[Hobby] [varchar](max) NULL,
	[OpenSource] [varchar](max) NULL,
	[Country] [varchar](max) NULL,
	[Student] [varchar](max) NULL,
	[Employment] [varchar](max) NULL,
	[FormalEducation] [varchar](max) NULL,
	[UndergradMajor] [varchar](max) NULL,
	[CompanySize] [varchar](max) NULL,
	[DevType] [varchar](max) NULL,
	[YearsCoding] [varchar](max) NULL,
	[YearsCodingProf] [varchar](max) NULL,
	[JobSatisfaction] [varchar](max) NULL,
	[CareerSatisfaction] [varchar](max) NULL,
	[HopeFiveYears] [varchar](max) NULL,
	[JobSearchStatus] [varchar](max) NULL,
	[LastNewJob] [varchar](max) NULL,
	[AssessJob1] INT NULL,
	[AssessJob2] INT NULL,
	[AssessJob3] INT NULL,
	[AssessJob4] INT NULL,
	[AssessJob5] INT NULL,
	[AssessJob6] INT NULL,
	[AssessJob7] INT NULL,
	[AssessJob8] INT NULL,
	[AssessJob9] INT NULL,
	[AssessJob10] INT NULL,
	[AssessBenefits1] INT NULL,
	[AssessBenefits2] INT NULL,
	[AssessBenefits3] INT NULL,
	[AssessBenefits4] INT NULL,
	[AssessBenefits5] INT NULL,
	[AssessBenefits6] INT NULL,
	[AssessBenefits7] INT NULL,
	[AssessBenefits8] INT NULL,
	[AssessBenefits9] INT NULL,
	[AssessBenefits10] INT NULL,
	[AssessBenefits11] INT NULL,
	[JobContactPriorities1] INT NULL,
	[JobContactPriorities2] INT NULL,
	[JobContactPriorities3] INT NULL,
	[JobContactPriorities4] INT NULL,
	[JobContactPriorities5] INT NULL,
	[JobEmailPriorities1] INT NULL,
	[JobEmailPriorities2] INT NULL,
	[JobEmailPriorities3] INT NULL,
	[JobEmailPriorities4] INT NULL,
	[JobEmailPriorities5] INT NULL,
	[JobEmailPriorities6] INT NULL,
	[JobEmailPriorities7] INT NULL,
	[UpdateCV] [varchar](max) NULL,
	[Currency] [varchar](max) NULL,
	[Salary] DECIMAL(38, 2) NULL,
	[SalaryType] [varchar](max) NULL,
	[ConvertedSalary] DECIMAL(38, 2) NULL,
	[CurrencySymbol] [varchar](max) NULL,
	[CommunicationTools] [varchar](max) NULL,
	[TimeFullyProductive] [varchar](max) NULL,
	[EducationTypes] [varchar](max) NULL,
	[SelfTaughtTypes] [varchar](max) NULL,
	[TimeAfterBootcamp] [varchar](max) NULL,
	[HackathonReasons] [varchar](max) NULL,
	[AgreeDisagree1] [varchar](max) NULL,
	[AgreeDisagree2] [varchar](max) NULL,
	[AgreeDisagree3] [varchar](max) NULL,
	[LanguageWorkedWith] [varchar](max) NULL,
	[LanguageDesireNextYear] [varchar](max) NULL,
	[DatabaseWorkedWith] [varchar](max) NULL,
	[DatabaseDesireNextYear] [varchar](max) NULL,
	[PlatformWorkedWith] [varchar](max) NULL,
	[PlatformDesireNextYear] [varchar](max) NULL,
	[FrameworkWorkedWith] [varchar](max) NULL,
	[FrameworkDesireNextYear] [varchar](max) NULL,
	[IDE] [varchar](max) NULL,
	[OperatingSystem] [varchar](max) NULL,
	[NumberMonitors] [varchar](max) NULL,
	[Methodology] [varchar](max) NULL,
	[VersionControl] [varchar](max) NULL,
	[CheckInCode] [varchar](max) NULL,
	[AdBlocker] [varchar](max) NULL,
	[AdBlockerDisable] [varchar](max) NULL,
	[AdBlockerReasons] [varchar](max) NULL,
	[AdsAgreeDisagree1] [varchar](max) NULL,
	[AdsAgreeDisagree2] [varchar](max) NULL,
	[AdsAgreeDisagree3] [varchar](max) NULL,
	[AdsActions] [varchar](max) NULL,
	[AdsPriorities1] INT NULL,
	[AdsPriorities2] INT NULL,
	[AdsPriorities3] INT NULL,
	[AdsPriorities4] INT NULL,
	[AdsPriorities5] INT NULL,
	[AdsPriorities6] INT NULL,
	[AdsPriorities7] INT NULL,
	[AIDangerous] [varchar](max) NULL,
	[AIInteresting] [varchar](max) NULL,
	[AIResponsible] [varchar](max) NULL,
	[AIFuture] [varchar](max) NULL,
	[EthicsChoice] [varchar](max) NULL,
	[EthicsReport] [varchar](max) NULL,
	[EthicsResponsible] [varchar](max) NULL,
	[EthicalImplications] [varchar](max) NULL,
	[StackOverflowRecommend] [varchar](max) NULL,
	[StackOverflowVisit] [varchar](max) NULL,
	[StackOverflowHasAccount] [varchar](max) NULL,
	[StackOverflowParticipate] [varchar](max) NULL,
	[StackOverflowJobs] [varchar](max) NULL,
	[StackOverflowDevStory] [varchar](max) NULL,
	[StackOverflowJobsRecommend] [varchar](max) NULL,
	[StackOverflowConsiderMember] [varchar](max) NULL,
	[HypotheticalTools1] [varchar](max) NULL,
	[HypotheticalTools2] [varchar](max) NULL,
	[HypotheticalTools3] [varchar](max) NULL,
	[HypotheticalTools4] [varchar](max) NULL,
	[HypotheticalTools5] [varchar](max) NULL,
	[WakeTime] [varchar](max) NULL,
	[HoursComputer] [varchar](max) NULL,
	[HoursOutside] [varchar](max) NULL,
	[SkipMeals] [varchar](max) NULL,
	[ErgonomicDevices] [varchar](max) NULL,
	[Exercise] [varchar](max) NULL,
	[Gender] [varchar](max) NULL,
	[SexualOrientation] [varchar](max) NULL,
	[EducationParents] [varchar](max) NULL,
	[RaceEthnicity] [varchar](max) NULL,
	[Age] [varchar](max) NULL,
	[Dependents] [varchar](max) NULL,
	[MilitaryUS] [varchar](max) NULL,
	[SurveyTooLong] [varchar](max) NULL,
	[SurveyEasy] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


