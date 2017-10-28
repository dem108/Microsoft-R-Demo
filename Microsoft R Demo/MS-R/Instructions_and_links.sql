/*
# Step 1: Provision a SQL Server VM
# Step 2: Install R Services on the VM

Instructions:
https://msdn.microsoft.com/en-us/library/mt696069.aspx

*/
Exec sp_configure  'external scripts enabled', 1  
Reconfigure  with  override
--# Restart the SQL Server and double-check that R Services is enabled:
Exec sp_configure  'external scripts enabled'

--# Step 4: Give Non-Admin Users R Script Permissions
CREATE DATABASE [RevoDB]
GO

--Create a new user called ruser and add the proper permissions to it.
CREATE LOGIN ruser WITH PASSWORD = 'P@ssword'
use RevoDB
CREATE USER ruser FOR LOGIN ruser
GRANT EXECUTE ANY EXTERNAL SCRIPT TO [ruser]
GRANT CREATE TABLE TO [ruser]
GRANT ALTER TO [ruser]
GRANT INSERT TO [ruser]
GRANT CONTROL TO [ruser]
GO



/*
# Links:

RevoScaleR in SQL Server
http://packages.revolutionanalytics.com/doc/8.0.0/win/RevoScaleR_SqlServer_Getting_Started.pdf

Microsoft R Client
https://msdn.microsoft.com/en-us/library/mt696067.aspx

Set up SQL Server R Services (In-Database)
https://msdn.microsoft.com/en-us/library/mt696069.aspx

Getting Started with SQL Server R Services
https://msdn.microsoft.com/en-us/library/mt604885.aspx

Using R Code in Transact-SQL (SQL Server R Services)
https://msdn.microsoft.com/en-us/library/mt591996.aspx

SQL Server R Services Performance Tuning
https://msdn.microsoft.com/en-us/library/mt723573.aspx?f=255&MSPPError=-2147217396

In-Database Advanced Analytics for SQL Developers (Tutorial)
https://msdn.microsoft.com/en-us/library/mt683480.aspx

Doc for sp_execute_external_script:
https://msdn.microsoft.com/en-GB/library/mt604368.aspx

Basic SQL Server installer:
https://blogs.msdn.microsoft.com/bobsql/2016/07/13/the-sql-server-basic-installer-just-install-it-2/

Some details about what happens behind the scene:
https://msdn.microsoft.com/en-us/library/mt709082.aspx?f=255&MSPPError=-2147217396

Known Issues for SQL Server R Services
https://msdn.microsoft.com/en-gb/library/mt590540.aspx

SQL Server PowerShell
https://msdn.microsoft.com/en-us/library/hh245198.aspx

Set up SQL Server R Services (In-Database)
https://msdn.microsoft.com/en-us/library/mt696069.aspx


*/




DECLARE @it integer = 1;
WHILE @it < 16
BEGIN
	PRINT @it;

	exec ('CREATE DATABASE [RevoDB' + @it + ']' )
	exec ('CREATE LOGIN ruser' + @it + ' WITH PASSWORD = ''P@ssword''')
	exec ('use RevoDB' + @it + ']')
	exec ('CREATE USER ruser' + @it + ' FOR LOGIN ruser' + @it + '')
	exec ('GRANT EXECUTE ANY EXTERNAL SCRIPT TO [ruser' + @it + ']')
	exec ('GRANT CREATE TABLE TO [ruser' + @it + ']')
	exec ('GRANT ALTER TO [ruser' + @it + ']')
	exec ('GRANT INSERT TO [ruser' + @it + ']')
	exec ('GRANT CONTROL TO [ruser' + @it + ']')
	
	SET @it = @it + 1;
END;



