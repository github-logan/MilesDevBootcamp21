*Special Note:

As of right now (9/20) everything is written in SQLite as opposed to regular
SQL because I don't have SQL Express on my computer right now.

Sorry for the inconvenience.

The biggest difference so far seems to be in
concatenation b/c SQL has a CONCAT function and uses + whereas SQLite
just uses SELECT and ||.


*Update:

As of (9/29), I've switched over to SQL Server Express 2019 b/c SQLite couldn't
handle some of the joins and making custom functions, so Assignment #5 was made
with SQL Server and not SQLite
