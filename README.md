## Oracle XE 21c Database Setup Guide

**By [MUHAMMAD ABDUL REHMAN KHAN](https://github.com/mabdulrehmankhan)**

---

Welcome to the **Oracle XE 21c Database Setup Guide**—your comprehensive resource for effortlessly downloading, installing, and configuring Oracle XE 21c along with the Sample HR Database. Follow these steps to ensure a smooth installation process.

---

## 🚀 Installation Overview

### 1️⃣ Download Oracle XE 21c

1. **Access the Download Page:**  
   Visit the [Oracle XE 21c download page](https://www.oracle.com/database/technologies/xe-downloads.html).
2. **Select Your OS Version:**  
   Choose the version compatible with your operating system (Linux or Windows).
3. **Download the Installer:**  
   Download the installer package and unzip the file.
4. **Run the Setup:**  
   Locate and execute `setup.exe`.  
   *If you encounter any errors, navigate to the `ISSetupPrerequisites` folder and rerun the executable. Ensure not to install on the C drive.*
5. **Secure Your Credentials:**  
   Take note of the passwords for the `sys` and `system` users.
6. **Capture the Final Screen:**  
   Take a screenshot of the connection string details for future reference.

### 2️⃣ Configure the Sample HR Database

1. **Download HR Schema Files:**  
   Obtain `human_resources.zip` from the designated folder.
2. **Transfer Files:**  
   Move the contents to the Oracle installation folder (e.g., `OracleED21c\dbhomeXE\demo\schema`).  
   *Ensure you replace the path with the exact location on your system.*
3. **Prepare the SQL File:**  
   - Open the `hr-schema` folder.
   - Delete the existing `hr_main.sql` file.
   - Download the updated `hr_main.sql` and place it in the `hr-schema` folder.
4. **Launch SQL*Plus:**  
   Search for `SQLPLUS` in your Start menu and run it as an administrator.
5. **Connect to Oracle as SYSDBA:**
    ```sql
    connect sys as sysdba
    ```
6. **Execute HR Main Script:**  
   Provide the path to `hr_main.sql`:
    ```sql
    @D:\ABDULREHMAN\ORACLE_DB_XE_21C\dbhomeXE\demo\schema\human_resources\hr_main.sql
    ```
7. **Input Required Parameters:**  
   Follow the prompts to enter:
   - **HR Password:** `hrpwd`
   - **Default Tablespace:** `users`
   - **Temporary Tablespace:** `temp`
   - **SYS Password:** `db`
   - **Log Path:** `$ORACLE_HOME/demo/schema/log`
   - **Connection String:** `localhost:1521/XEPDB1`

### 3️⃣ Verify the Installation

1. **Connect to HR Schema:**
    ```sql
    conn hr/hrpwd@//localhost:1521/XEPDB1
    ```
2. **Run Schema Scripts:**  
   Execute the following commands sequentially:  
   *Ensure the path is accurate on your system.*
    ```sql
    @OracleED21c\dbhomeXE\demo\schema\human_resources\hr_cre.sql
    @OracleED21c\dbhomeXE\demo\schema\human_resources\hr_popul.sql
    @OracleED21c\dbhomeXE\demo\schema\human_resources\hr_idx.sql
    @OracleED21c\dbhomeXE\demo\schema\human_resources\hr_code.sql
    @OracleED21c\dbhomeXE\demo\schema\human_resources\hr_comnt.sql
    @OracleED21c\dbhomeXE\demo\schema\human_resources\hr_analz.sql
    ```
3. **Verify the Schema:**
    ```sql
    DESC employees;
    ```
   *If the query returns the schema of the `employees` table, your installation is successful.*

### 4️⃣ (Optional) Setup Oracle SQL Developer

**Skip this if you’re comfortable with SQL*Plus.**

1. **Download SQL Developer:**  
   Visit the [SQL Developer Download page](https://www.oracle.com/database/sqldeveloper/technologies/download/).
2. **Select Your Version:**  
   Download the version appropriate for your OS.  
   *For Windows 64-bit, opt for "Windows 64-bit with JDK 11 included."*
3. **Install SQL Developer:**  
   Unzip the file and run `sqldeveloper.exe`.
4. **Configure a New Connection:**
   - Click the "+" icon to create a new connection.
   - Enter the following details:
     - **Name:** HR_SCHEMA
     - **Username:** `hr`
     - **Password:** `hrpwd`
     - **Hostname:** `localhost`
     - **Port:** `1521`
     - **Service name:** `xepdb1`
   - Click "Test" to verify, then "Connect" to establish the connection.

---

By following these steps, you’ll have Oracle XE 21c up and running, ready for all your database needs. If you encounter any issues, feel free to reach out on [GitHub](https://github.com/mabdulrehmankhan).
