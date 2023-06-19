Create TABLE Users(
	[Respondent] INT PRIMARY KEY NOT NULL,
	[Hobby] [varchar](255) NULL,
	[OpenSource] [varchar](255) NULL,
	[Country] [varchar](255) NULL,
	[Student] [varchar](255) NULL,
	[Employment] [varchar](255) NULL,
	[FormalEducation] [varchar](255) NULL,
	[UndergradMajor] [varchar](255) NULL,
	[Age] [varchar](255) NULL,
	[Dependents] [varchar](255) NULL,
	[MilitaryUS] [varchar](255) NULL,
	[Gender] [varchar](255) NULL,
	[SexualOrientation] [varchar](255) NULL
)

CREATE TABLE Salary(
	ID INT IDENTITY(1,1) PRIMARY KEY, 
	[Respondent] INT,
	[Salary] DECIMAL(38, 2) NULL,
	[SalaryType] [varchar](255) NULL,
	[ConvertedSalary] DECIMAL(38, 2) NULL,
	[CurrencySymbol] [varchar](255) NULL
)

CREATE TABLE AssessJob(
	ID INT IDENTITY(1,1) PRIMARY KEY, 
	[Respondent] INT,
	[AssessJob1] INT NULL,
	[AssessJob2] INT NULL,
	[AssessJob3] INT NULL,
	[AssessJob4] INT NULL,
	[AssessJob5] INT NULL,
	[AssessJob6] INT NULL,
	[AssessJob7] INT NULL,
	[AssessJob8] INT NULL,
	[AssessJob9] INT NULL,
	[AssessJob10] INT NULL
)

CREATE TABLE AssessBenefits(
	ID INT IDENTITY(1,1) PRIMARY KEY, 
	[Respondent] INT,
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
	[AssessBenefits11] INT NULL
)


CREATE TABLE JobContactPriorities(
	ID INT IDENTITY(1,1) PRIMARY KEY, 
	[Respondent] INT,
	[JobContactPriorities1] INT NULL,
	[JobContactPriorities2] INT NULL,
	[JobContactPriorities3] INT NULL,
	[JobContactPriorities4] INT NULL,
	[JobContactPriorities5] INT NULL
)

CREATE TABLE JobEmailPriorities(
	ID INT IDENTITY(1,1) PRIMARY KEY, 
	[Respondent] INT,
	[JobEmailPriorities1] INT NULL,
	[JobEmailPriorities2] INT NULL,
	[JobEmailPriorities3] INT NULL,
	[JobEmailPriorities4] INT NULL,
	[JobEmailPriorities5] INT NULL,
	[JobEmailPriorities6] INT NULL,
	[JobEmailPriorities7] INT NULL
)

CREATE TABLE Career(
	ID INT IDENTITY(1,1) PRIMARY KEY, 
	[Respondent] INT,
	[CompanySize] [varchar](255) NULL,
	[YearsCoding] [varchar](255) NULL,
	[YearsCodingProf] [varchar](255) NULL,
	[JobSatisfaction] [varchar](255) NULL,
	[CareerSatisfaction] [varchar](255) NULL,
	[HopeFiveYears] [varchar](255) NULL,
	[JobSearchStatus] [varchar](255) NULL,
	[LastNewJob] [varchar](255) NULL,
	[UpdateCV] [varchar](255) NULL
)

CREATE TABLE AdBlocker(
	ID INT IDENTITY(1,1) PRIMARY KEY, 
	[Respondent] INT,
	[AdBlocker] [varchar](255) NULL,
	[AdBlockerDisable] [varchar](255) NULL
)

CREATE TABLE Ads(
	ID INT IDENTITY(1,1) PRIMARY KEY, 
	[Respondent] INT,
	[AdsAgreeDisagree1] [varchar](max) NULL,
	[AdsAgreeDisagree2] [varchar](max) NULL,
	[AdsAgreeDisagree3] [varchar](max) NULL,
	[AdsPriorities1] INT NULL,
	[AdsPriorities2] INT NULL,
	[AdsPriorities3] INT NULL,
	[AdsPriorities4] INT NULL,
	[AdsPriorities5] INT NULL,
	[AdsPriorities6] INT NULL,
	[AdsPriorities7] INT NULL
)

CREATE TABLE AI(
	ID INT IDENTITY(1,1) PRIMARY KEY, 
	[Respondent] INT,
	[AIDangerous] [varchar](255) NULL,
	[AIInteresting] [varchar](255) NULL,
	[AIResponsible] [varchar](255) NULL,
	[AIFuture] [varchar](255) NULL,
	[EthicsChoice] [varchar](255) NULL,
	[EthicsReport] [varchar](255) NULL,
	[EthicsResponsible] [varchar](255) NULL,
	[EthicalImplications] [varchar](255) NULL
)

CREATE TABLE StackOverflow(
	ID INT IDENTITY(1,1) PRIMARY KEY, 
	[Respondent] INT,
	[StackOverflowRecommend] [varchar](255) NULL,
	[StackOverflowVisit] [varchar](255) NULL,
	[StackOverflowHasAccount] [varchar](255) NULL,
	[StackOverflowParticipate] [varchar](255) NULL,
	[StackOverflowJobs] [varchar](255) NULL,
	[StackOverflowDevStory] [varchar](255) NULL,
	[StackOverflowJobsRecommend] [varchar](255) NULL,
	[StackOverflowConsiderMember] [varchar](255) NULL
)

CREATE TABLE HypotheticalTools(
	ID INT IDENTITY(1,1) PRIMARY KEY, 
	[Respondent] INT,
	[HypotheticalTools1] [varchar](255) NULL,
	[HypotheticalTools2] [varchar](255) NULL,
	[HypotheticalTools3] [varchar](255) NULL,
	[HypotheticalTools4] [varchar](255) NULL,
	[HypotheticalTools5] [varchar](255) NULL
)

CREATE TABLE DailyHabits(
	ID INT IDENTITY(1,1) PRIMARY KEY, 
	[Respondent] INT,
	[WakeTime] [varchar](255) NULL,
	[HoursComputer] [varchar](255) NULL,
	[HoursOutside] [varchar](255) NULL,
	[SkipMeals] [varchar](255) NULL,
	[Exercise] [varchar](255) NULL
)

CREATE TABLE SurveyFeedback(
	ID INT IDENTITY(1,1) PRIMARY KEY, 
	[Respondent] INT,
	[SurveyTooLong] [varchar](255) NULL,
	[SurveyEasy] [varchar](255) NULL
)

CREATE TABLE AgreeDisagree(
	ID INT IDENTITY(1,1) PRIMARY KEY, 
	[Respondent] INT,
	[AgreeDisagree1] [varchar](255) NULL,
	[AgreeDisagree2] [varchar](255) NULL,
	[AgreeDisagree3] [varchar](255) NULL
)

CREATE TABLE DevelopmentProcess(
	ID INT IDENTITY(1,1) PRIMARY KEY, 
	[Respondent] INT,
	[OperatingSystem] [varchar](255) NULL,
	[NumberMonitors] [varchar](255) NULL,
	[Methodology] [varchar](max) NULL,
	[CheckInCode] [varchar](255) NULL
)

CREATE TABLE DeveloperExperience(
	ID INT IDENTITY(1,1) PRIMARY KEY, 
	[Respondent] INT,
	[TimeFullyProductive] [varchar](255) NULL,
	[TimeAfterBootcamp] [varchar](255) NULL,
	[HackathonReasons] [varchar](max) NULL
)

CREATE TABLE DevType(
	ID INT IDENTITY(1,1) PRIMARY KEY, 
	[DevType] [varchar](255) NULL
)

CREATE TABLE user_devtype(
	[Respondent] INT,
	[DevType] INT
)

CREATE TABLE RaceEthnicity(
	ID INT IDENTITY(1,1) PRIMARY KEY, 
	RaceEthnicity [varchar](255) NULL
)

CREATE TABLE user_RaceEthnicity(
	[Respondent] INT,
	RaceEthnicity INT
)

CREATE TABLE IDE(
	ID INT IDENTITY(1,1) PRIMARY KEY, 
	IDE [varchar](255) NULL
)

CREATE TABLE user_ide(
	[Respondent] INT,
	IDE INT
)

CREATE TABLE AdsActions(
	ID INT IDENTITY(1,1) PRIMARY KEY, 
	AdsActions [varchar](255) NULL
)

CREATE TABLE user_AdsActions(
	[Respondent] INT,
	AdsActions INT
)

CREATE TABLE CommunicationTools(
	ID INT IDENTITY(1,1) PRIMARY KEY, 
	CommunicationTools [varchar](255) NULL
)

CREATE TABLE CommunicationTools_user(
	[Respondent] INT,
	CommunicationTools INT
)

CREATE TABLE ErgonomicDevices(
	ID INT IDENTITY(1,1) PRIMARY KEY, 
	ErgonomicDevices [varchar](255) NULL
)

CREATE TABLE ErgonomicDevices_user(
	[Respondent] INT,
	ErgonomicDevices INT
)

CREATE TABLE EducationTypes(
	ID INT IDENTITY(1,1) PRIMARY KEY, 
	EducationTypes [varchar](255) NULL
)

CREATE TABLE EducationTypes_user(
	[Respondent] INT,
	EducationTypes INT
)

CREATE TABLE VersionControl(
	ID INT IDENTITY(1,1) PRIMARY KEY, 
	VersionControl [varchar](255) NULL
)

CREATE TABLE VersionControl_user(
	[Respondent] INT,
	VersionControl INT
)

CREATE TABLE SelfTaughtTypes(
	ID INT IDENTITY(1,1) PRIMARY KEY, 
	SelfTaughtTypes [varchar](255) NULL
)

CREATE TABLE SelfTaughtTypes_user(
	[Respondent] INT,
	SelfTaughtTypes INT
)

CREATE TABLE LanguageWorkedWith(
	ID INT IDENTITY(1,1) PRIMARY KEY, 
	LanguageWorkedWith [varchar](255) NULL
)

CREATE TABLE LanguageWorkedWith_user(
	[Respondent] INT,
	LanguageWorkedWith INT
)

CREATE TABLE LanguageDesireNextYear(
	ID INT IDENTITY(1,1) PRIMARY KEY, 
	LanguageDesireNextYear [varchar](255) NULL
)

CREATE TABLE LanguageDesireNextYear_user(
	[Respondent] INT,
	LanguageDesireNextYear INT
)

CREATE TABLE DatabaseWorkedWith(
	ID INT IDENTITY(1,1) PRIMARY KEY, 
	DatabaseWorkedWith [varchar](255) NULL
)

CREATE TABLE DatabaseWorkedWith_user(
	[Respondent] INT,
	DatabaseWorkedWith INT
)

CREATE TABLE DatabaseDesireNextYear(
	ID INT IDENTITY(1,1) PRIMARY KEY, 
	DatabaseDesireNextYear [varchar](255) NULL
)

CREATE TABLE DatabaseDesireNextYear_user(
	[Respondent] INT,
	DatabaseDesireNextYear INT
)

CREATE TABLE PlatformWorkedWith(
	ID INT IDENTITY(1,1) PRIMARY KEY, 
	PlatformWorkedWith [varchar](255) NULL
)

CREATE TABLE PlatformWorkedWith_user(
	[Respondent] INT,
	PlatformWorkedWith INT
)

CREATE TABLE PlatformDesireNextYear(
	ID INT IDENTITY(1,1) PRIMARY KEY, 
	PlatformDesireNextYear [varchar](255) NULL
)

CREATE TABLE PlatformDesireNextYear_user(
	[Respondent] INT,
	PlatformDesireNextYear INT
)

CREATE TABLE FrameWorkWorkedWith(
	ID INT IDENTITY(1,1) PRIMARY KEY, 
	FrameWorkWorkedWith [varchar](255) NULL
)

CREATE TABLE FrameWorkWorkedWith_user(
	[Respondent] INT,
	FrameWorkWorkedWith INT
)

CREATE TABLE FrameWorkDesireNextYear(
	ID INT IDENTITY(1,1) PRIMARY KEY, 
	FrameWorkDesireNextYear [varchar](255) NULL
)

CREATE TABLE FrameWorkDesireNextYear_user(
	[Respondent] INT,
	FrameWorkDesireNextYear INT
)

