Oracle XE 21c Database Setup Guide


Steps to Download and Install Oracle XE 21c Database

1) Download ORACLE XE 21C:
	a) Visit the Oracle XE 21c download page. (link: https://www.oracle.com/database/technologies/xe-downloads.html).
	b) Choose the appropriate version for your operating system (Linux or Windows).
	c) Download the installer package.
	d) Unzip the downloaded file.
	e) Locate & Run setup.exe.
	f) If Error prompts, locate the pre-req folder (ISSetupPrerequisites).
	g) Run the exe again [Don’t install on C drive].
	h) Note down the password of sys and system user.
	i) Take the screen shot of final screen showing connection string information.



2) Download ORACLE SQL DEVELOPER:
	a) Visit the SQL Developer Download page. (link: https://www.oracle.com/database/sqldeveloper/technologies/download/).
	b) Choose the appropriate version for your operating system (Linux or Windows).
	c) Download the installer package. (if you have windows 64bit, go for: Windows 64-bit with JDK 11 included)
	d) Unzip the downloaded file.
	e) Run sqldeveloper.exe.



3) Configure SAMPLE HR DATABASE:
	a) Download "human_resources.zip" from the folder
	b) Copy folder containing human_resourse files and place it to the oracle installation folder e.g (OracleED21c\dbhomeXE\demo\schema)
	c) Click on hr-scehma folder
	d) Open hr_main.sql file with notepad
	e) Delete the hr_main.sql file in it
	f) Download "hr_main.sql" from the folder
	g) Place it in the hr_scehma folder
	h) Click START (windows button)
	i) Then search SQLPLUS
	j) Run as admin
	k) On sql prompt write: (username: sys as sysdba) (password: {YOUR_PASSWORD}) *write the password you setup while installation
	l) Session connected.
	m) Type: connect sys as sysdba
	n) On sql prompt write: (password: {YOUR_PASSWORD}) *write the password you setup while installation
	o) Give the path to hr_main.sql (e.g: @D:\ABDULREHMAN\ORACLE_DB_XE_21C\dbhomeXE\demo\schema\human_resources\hr_main.sql)
	p) Press Enter
	q) Give the values
	r) specify password for HR as parameter 1: 								hrpwd
	s) specify default tablespace for HR as parameter 2:						users
	t) specify temporary tablespace for HR as parameter 3:					temp
	u) specify password for SYS as parameter 4:								db
	v) specify log path as parameter 5:										$ORACLE_HOME/demo/schema/log
	w) specify connect string as parameter 6:									localhost:1521/XEPDB1
	x) This file will create hr schema and user.



4) Check the INSTALLATION:
	a) Run: conn hr/hrpwd@//localhost:1521/XEPDB1
	b) Connected
	c) Now execute these commands one by one.
	d) SQL> @OracleED21c\dbhomeXE\demo\schema\human_resources\hr_cre.sql
	e) SQL> @OracleED21c\dbhomeXE\demo\schema\human_resources\hr_popul.sql
	f) SQL> @OracleED21c\dbhomeXE\demo\schema\human_resources\hr_idx.sql
	g) SQL> @OracleED21c\dbhomeXE\demo\schema\human_resources\hr_code.sql
	h) SQL> @OracleED21c\dbhomeXE\demo\schema\human_resources\hr_comnt.sql
	i) SQL> @OracleED21c\dbhomeXE\demo\schema\human_resources\hr_analz.sql
	j) Run: Desc employees;
	k) If the query returns the schema of employees table thn installation is done successfully.



5) ORACLE SQL DEVELOPER:
	a) Open sqldeveloper.exe
	b) Click on "+" on the top left corner
	c) Now put name HR_SCEHMA
	d) Username: hr
	e) Password: hrpwd
	f) Hostname: localhost
	g) Port: 1521
	h) Service name: xepdb1
	i) Click on Test
	j) If Success, then connect
	