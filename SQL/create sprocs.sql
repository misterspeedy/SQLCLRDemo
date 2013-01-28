USE Words

IF OBJECT_ID (N'IsMatch', N'FS') IS NOT NULL
    DROP FUNCTION IsMatch;
GO

IF EXISTS(SELECT * FROM sys.assemblies asms 
          WHERE asms.name = N'GrepLib')
	DROP ASSEMBLY GrepLib
GO

IF EXISTS(SELECT * FROM sys.assemblies asms 
          WHERE asms.name = N'DataLinq')
	DROP ASSEMBLY DataLinq
GO

IF EXISTS(SELECT * FROM sys.assemblies asms 
          WHERE asms.name = N'SMDiagnostics')
	DROP ASSEMBLY SMDiagnostics
GO

IF EXISTS(SELECT * FROM sys.assemblies asms 
          WHERE asms.name = N'FSCore')
	DROP ASSEMBLY FSCore
GO

-- Create everthing in order
CREATE Assembly FSCore FROM 'C:\Program Files (x86)\Reference Assemblies\Microsoft\FSharp\3.0\Runtime\v4.0\FSharp.Core.dll' 
WITH PERMISSION_SET = UNSAFE
GO

--CREATE Assembly SMDiagnostics FROM 'C:\Windows\Microsoft.NET\Framework\v4.0.30319\SMdiagnostics.dll' 
--WITH PERMISSION_SET = UNSAFE
--GO

--CREATE Assembly DataLinq FROM 'C:\Windows\Microsoft.NET\Framework\v4.0.30319\System.Data.Linq.dll' 
--WITH PERMISSION_SET = UNSAFE
--GO

CREATE Assembly GrepLib FROM 'C:\Users\kit\Documents\Visual Studio 11\Projects\SQLCLRDemo\GrepLib\bin\Debug\GrepLib.dll'
WITH PERMISSION_SET = UNSAFE
GO

--CREATE PROCEDURE [dbo].[IsMatch]
--(
--   @input [nvarchar](64),
--   @pattern [nvarchar](64)
--)
--AS
--	EXTERNAL NAME [GrepLib].[Grep.SqlRegex].[IsMatch]
--GO

-- External name is [SqlAssemblyName].[Full typename].[Method name]
CREATE FUNCTION [dbo].[IsMatch]
(
   @input [nvarchar](64),
   @pattern [nvarchar](64)
)
RETURNS bit
WITH EXECUTE AS CALLER
AS
	EXTERNAL NAME [GrepLib].[Grep.SqlRegex].[IsMatch]
GO