USE master

DECLARE @OutPutList VARCHAR(MAX) = '';

EXEC dbo.Maint_IX_GetListOfDB_NAMES_BY_Size 10,20,@OutPutList OUTPUT;

SELECT @OutPutList AS ListOfDBs

EXECUTE master.dbo.IndexOptimize
@Databases = @OutPutList,
@Indexes = 'ALL_INDEXES',
@FragmentationLow = NULL,
@FragmentationMedium = NULL,
@FragmentationHigh = NULL,
@FillFactor = 100,
@UpdateStatistics = 'ALL',
@OnlyModifiedStatistics =  'Y',
@StatisticsResample = 'N',
@TimeLimit = 3600,
@Delay = 1,
@SortInTempdb = 'N',
@LogToTable = 'Y',
@Execute = 'Y';
