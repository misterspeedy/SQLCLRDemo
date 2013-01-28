SQLCLRDemo
==========

A demo of SQLCLR which exposes .NET's Regex.IsMatch as a SQL Server user defined function.

Requirements
============

Developed with Visual Studio 2012 and SQL Server 2012.  

Requires the existence of a database called 'Words' and a local SQL Server 2012 instance called .\SQLEXPRESS2012.  Edit the post-build task on the main project to change the instance name.

The project and function don't require any tables, but to get a demo table going, run 'create example table.sql'.  You can then populate the table with some interesting data - eg the contents of this file:

http://www.outpost9.com/files/wordlists/Family-Names.zip

To try calling the user defined function, open example.sql, edit the search pattern and run as desired.


