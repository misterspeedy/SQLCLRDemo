namespace GrepTests

open NUnit.Framework
open Xunit
open Xunit.Extensions
open FsUnit
open Grep

[<TestFixture>]
type ``Given the IsMatch function``() = 
    [<Test>]
    member public this.``The function takes two string arguments``() =
        let s1, s2 = "", ""
        let expected = true
        let actual =
            try
                let x = SqlRegex.IsMatch(s1, s2)
                true
            with 
            | _ -> false
        actual |> should equal expected

    [<Test>]
    member public this.``The function returns a boolean result``() =
        let s1, s2 = "", ""
        let expected = true
        let actual =
            try
                let x : bool = SqlRegex.IsMatch(s1, s2)
                true
            with 
            | _ -> false
        actual |> should equal expected

    [<Theory>]
    // True:
    [<InlineData("a", "a", true)>]
    [<InlineData("Z", "Z", true)>]
    [<InlineData("abc", "a.c", true)>]
    [<InlineData("abc", "^a", true)>]
    [<InlineData("abc", "c$", true)>]
    // False:
    [<InlineData("a", "b", false)>]
    [<InlineData("A", "a", false)>]
    [<InlineData("abc", "a..c", false)>]
    [<InlineData("ba", "^a", false)>]
    [<InlineData("ba", "b$", false)>]
    member public this.``The function true when the pattern matches the input and false otherwise``(input, pattern, expected) =
        let actual = SqlRegex.IsMatch(input, pattern)
        actual |> should equal expected