
# MySQL Output Converter

This is a short script that I wrote in order to convert
[the default output of MySQL command-line queries](https://dev.mysql.com/doc/refman/5.7/en/mysql-shell-output-formats.html)
to a CSV format for manipulation in a spreadsheet application.

### Inspiration

I often needed to execute custom SQL queries on a production database via SSH
and at the frequency that I was running these commands, it was easier to
just copy the results from the screen into a file locally and then run
this script to convert it to a CSV format than it would have been to
actually use MySQL's CSV export functionality to specify a
temporary storage location on the server, grab the file from the server
somehow, and then delete the temporary file from the server.
