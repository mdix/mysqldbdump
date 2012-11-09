# mysqldbdump
## what does it do?
It dumps a db on the command line to a file (so that you can commit it to your scm) and may also import a mysql dump from a file.

## preparation
Open the shellscript and replace the strings in the angle brackets (and remove the angle brackets).

## run
Either run the shellscript without a parameter to export or with 'import' parameter to import a mysql database dump.

### export
`./dumpdb.sh` to make a dump

### import
`./dumpdb.sh import` to import a dump
