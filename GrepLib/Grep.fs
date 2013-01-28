namespace Grep

open System.Text.RegularExpressions
open Microsoft.SqlServer.Server

/// Exposes .net regular expression functions for use from SQL Server user defined functions.
type SqlRegex =
    [<SqlFunction(DataAccess = DataAccessKind.Read)>]
    /// Exposes Regex.Ismatch.
    static member IsMatch (input : string, pattern : string) =
        Regex.IsMatch(input, pattern)