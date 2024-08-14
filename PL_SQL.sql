--PL SQL CODE
-- --################################################################################################################
-- Varaible Intialization
-- --################################################################################################################

declare
	v_test  varchar2(15)  ;
begin
	v_test := 'Srinivas Raju' ;
	dbms_output.put_line(v_test);
end;
/

--################################################################################################################
-- Create a employee table and insert data
-- Create the table
CREATE TABLE employee (
  emp_id NUMBER , -- Unique identifier for employee
  emp_name VARCHAR2(50) , -- Employee name
  salary NUMBER(10,2), -- Salary with decimal places
  dept_id NUMBER -- Foreign key referencing department table
);

-- Assuming a department table already exists

-- Insert six records
INSERT ALL
    INTO employee (emp_id, emp_name, salary, dept_id) VALUES (1001, 'John Doe', 50000.00, 10)
    INTO employee (emp_id, emp_name, salary, dept_id) VALUES (1002, 'Jane Smith', 62345.78, 20)
    INTO employee (emp_id, emp_name, salary, dept_id) VALUES (1003, 'Mike Lee', 48129.95, 10)
    INTO employee (emp_id, emp_name, salary, dept_id) VALUES (1004, 'Alice Brown', 75421.00, 30)
    INTO employee (emp_id, emp_name, salary, dept_id) VALUES (1005, 'David Miller', 42785.32, 20)
    INTO employee (emp_id, emp_name, salary, dept_id) VALUES (1006, 'Sarah Wilson', 81932.65, 30)
    INTO employee (emp_id, emp_name, salary, dept_id) VALUES (1007, 'Chris Johnson', 59000.00, 10)
    INTO employee (emp_id, emp_name, salary, dept_id) VALUES (1008, 'Patricia Taylor', 68000.00, 20)
    INTO employee (emp_id, emp_name, salary, dept_id) VALUES (1009, 'Linda Martinez', 72000.00, 30)
    INTO employee (emp_id, emp_name, salary, dept_id) VALUES (1010, 'Robert Anderson', 56000.00, 10)
SELECT * FROM dual;

--################################################################################################################
-- select into statement
--################################################################################################################
declare
	v_salary number(6);
begin
	select salary into v_salary from employee where emp_id = 1001;
	dbms_output.put_line(v_salary);
end;
/

-- example2

declare
	v_salary number(6);
	v_emp_name  varchar2(20);
begin
	select salary, emp_name into v_salary, v_emp_name from employee where emp_id = 1001;
	dbms_output.put_line(v_salary);
	dbms_output.put_line(v_emp_name);
	dbms_output.put_line(v_salary || ' Has a salary ' || v_emp_name);
end;
/

--################################################################################################################
-- Anchored data type
--################################################################################################################
DECLARE
    v_fname students.first_name%TYPE;
BEGIN
    SELECT first_name INTO v_fname 
    FROM students 
    WHERE stu_id = 1;
    
    DBMS_OUTPUT.PUT_LINE(v_fname);
END;
/


DECLARE
    v_fname VARCHAR2(8);
BEGIN
    SELECT first_name INTO v_fname 
    FROM students 
    WHERE stu_id = 1;

    DBMS_OUTPUT.PUT_LINE(v_fname);
END;
/

--modifying the datatype
ALTER TABLE students MODIFY first_name CHAR(10);

---Constant in pl SQL
/*
Constant is a user defined identifier whose value remains unchanged throughout the program
Syntax

Constant-name CONSTANT datatype (dw) := value;

must declare in declaration block
*/

DECLARE
    v_pi CONSTANT NUMBER(7,6) := 3.141592;
BEGIN
    DBMS_OUTPUT.PUT_LINE(v_pi);
END;
/


--Default Constant
set serveroutput on;
DECLARE
    v_pi CONSTANT NUMBER(7,6) DEFAULT 3.141592;
BEGIN
    DBMS_OUTPUT.PUT_LINE(v_pi);
END;
/


-- PL/SQL block using a NOT NULL constant:

DECLARE
    v_pi CONSTANT NUMBER(7,6) NOT NULL DEFAULT 3.141592;
BEGIN
    DBMS_OUTPUT.PUT_LINE(v_pi);
END;
/

--################################################################################################################
/*
--Bind varaible types
1)User Varaibles
2)Bind or host varaible

Bind variables in Oracle database can be defined as the variables that we create in SQL* PLUS and then reference in PL/SQL.


*/
-- 1)User Varaibles
-- Method 1: Initialize Using the EXEC Command

VARIABLE v_bind VARCHAR2(30);
EXEC :v_bind := 'RebellionRider';
PRINT v_bind;


-- 2)Bind or host varaible
-- Method 2: Initialize Using a PL/SQL Block

VARIABLE v_bindl VARCHAR2(30);
BEGIN
    :v_bindl := 'Srinivas Sharma';
END;
/
PRINT v_bindl;


-- Display the bind VARIABLE in 3 ways
-- 1)dbms_output
DECLARE
  v_bind1 VARCHAR2(20);
BEGIN
  v_bind1 := 'RebellionRider'; -- Initializing bind variable
  DBMS_OUTPUT.PUT_LINE(v_bind1); -- Printing the value
END;
/

-- 2)Using print command
DECLARE
  v_bind1 VARCHAR2(20);
BEGIN
  v_bind1 := 'RebellionRider'; -- Initializing bind variable
  DBMS_OUTPUT.PUT_LINE(v_bind1); -- Printing the value
  
END;
/
PRINT v_bind1; -- Printing using PRINT statement


--3)using autoprint ON

SET AUTOPRINT ON;
VARIABLE v_bind2 VARCHAR2(30);
EXEC :v_bind2 := 'Srinivas' ;

---##################################################################################################################
/*
Conditional control statements are those which allow you to control the execution flow of the program depending 
on a condition.In other words the statements in the program are not necessarily executed in a sequence rather one 
or other group of statements are executed depending on the evaluation of a condition.

Types Of Conditional Control Statement in PL/SQL
In Oracle PL/SQL we have two types of conditional control statements which are

IF statements and
CASE statements
Both these statements can be further divided into different forms. For example IF statements has 3 different forms


IF THEN
IF THEN ELSE
IF THEN ELSEIF
And CASE statement has 2 different forms such as

SIMPLE CASE and
SEARCHED CASE
*/
-- ###############################
DECLARE
v_website VARCHAR2(30) := RebellionRider.com;
v_author  VARCHAR2(30) := Srinivas;
BEGIN
IF v_website =RebellionRider.com AND  v_author= Srinivas THEN
DBMS_OUTPUT.PUT_LINE('Everything is Awesome' );
END IF;
DBMS_OUTPUT.PUT_LINE('Give this Video a Thumbs Up');
END;
/

select * from dep;

-- ###############################
DECLARE
 v_num    NUMBER := &enter_a_number;
BEGIN
 IF MOD (v_num, 2) = 0 THEN
 DBMS_OUTPUT.PUT_LINE (v_num ||  'Is Even');
ELSE
 DBMS_OUTPUT.PUT_LINE (v_num || 'is odd');
END IF;
 DBMS_OUTPUT.PUT_LINE ('IF THEN ELSE Construct complete' );
END;


-- ###############################
DECLARE
     v_Place VARCHAR2(30) := &Enter_Place;
BEGIN
     IF v_Place = Metropolis THEN
         DBMS_OUTPUT.PUT_LINE('This City Is Protected By Superman');
    ELSIF v_Place = Gotham THEN
         DBMS_OUTPUT.PUT_LINE('This City is Protected By Batman');
    ELSIF v_Place = Amazon THEN
        DBMS_OUTPUT.PUT_LINE('This City is protected by Wonder Woman');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Please Call Avengers');
    END IF;
        DBMS_OUTPUT.PUT_LINE('Thanks For Contacting us');
END;
---##################################################################################################################
/*There are 4 types of Loops in Oracle PL/SQL
Simple Loop
While Loop
Numeric For Loop and
Cursor For loop
*/

-- Simple Loop
DECLARE
  v_counter   NUMBER :=0;
  v_result  NUMBER;
BEGIN
  LOOP
      v_counter := v_counter+1;
      v_result := 19*v_counter;
      DBMS_OUTPUT.PUT_LINE('19'|| ' x ' ||v_counter|| ' = ' || v_result);
      EXIT WHEN v_counter>=10;
  END LOOP;
END;
--While Loop
DECLARE
  v_test    BOOLEAN := TRUE;
  v_counter NUMBER  := 0;
BEGIN
    WHILE v_test LOOP
         v_counter := v_counter+1;
         DBMS_OUTPUT.PUT_LINE( v_counter );
         IF v_counter = 10 THEN
             v_test    := FALSE;
         END IF;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE ('This Statement is outside the loop and will always execute');
END;

--numeric for Loop
DECLARE
  v_result  NUMBER:= 0;
BEGIN
  FOR v_counter IN  1..10 LOOP
    v_result:= 19*v_counter;
    DBMS_OUTPUT.PUT_LINE('19 X ' || v_counter || ' = ' ||v_result);
  END LOOP;
END;
/

---##################################################################################################################
--Triggers
--DML TRIGGER
CREATE OR REPLACE TRIGGER tr_superheroes
BEFORE INSERT OR DELETE OR UPDATE ON DEP
FOR EACH ROW
ENABLE
DECLARE
  v_user  VARCHAR2(15);
BEGIN

  SELECT 
    user INTO v_user FROM dual;
  IF INSERTING THEN
    DBMS_OUTPUT.PUT_LINE('one line inserted by '||v_user);
  ELSIF DELETING THEN
    DBMS_OUTPUT.PUT_LINE('one line Deleted by '||v_user);
  ELSIF UPDATING THEN
    DBMS_OUTPUT.PUT_LINE('one line Updated by '||v_user);
  END IF;
END;
/

--Audit trigger using DML trigger
/*
This table sh_audit has 5 columns which will store the auditing information such as the new data inserted or updated,
 old data which is updated or deleted from the table, name of the user who did it along with the date and time, also 
 the type of DML operation performed.
Next we will write a trigger on the source table superheroes and will store the data into the auditing table sh_audit.
--TABLE CREATION
CREATE TABLE sh_audit (
    new_name VARCHAR2(50),
    old_name VARCHAR2(50),
    user_name VARCHAR2(50),
    entry_date DATE,
    operation VARCHAR2(20)
);

*/
CREATE OR REPLACE trigger superheroes_audit
BEFORE INSERT OR DELETE OR UPDATE ON DEP
FOR EACH ROW
ENABLE
DECLARE
  v_user varchar2 (30);
  v_date  varchar2(30);
BEGIN
  SELECT user, TO_CHAR(sysdate, 'DD/MON/YYYY HH24:MI:SS') INTO v_user, v_date  FROM dual;
  IF INSERTING THEN
    INSERT INTO sh_audit (new_name,old_name, user_name, entry_date, operation) 
    VALUES(:NEW.SH_NAME, Null , v_user, v_date, 'Insert');  
  ELSIF DELETING THEN
    INSERT INTO sh_audit (new_name,old_name, user_name, entry_date, operation)
    VALUES(NULL,:OLD.SH_NAME, v_user, v_date, 'Delete');
  ELSIF UPDATING THEN
    INSERT INTO sh_audit (new_name,old_name, user_name, entry_date, operation) 
    VALUES(:NEW.SH_NAME, :OLD.SH_NAME, v_user, v_date,'Update');
  END IF;
END;
/

--Create Synchronized Table Backup Using DML Trigger In Oracle PL/SQL
CREATE or REPLACE trigger Sh_Backup
BEFORE INSERT OR DELETE OR UPDATE ON superheroes
FOR EACH ROW
ENABLE 
BEGIN
  IF INSERTING THEN
    INSERT INTO superheroes_backup (SH_NAME) VALUES (:NEW.SH_NAME);  
  ELSIF DELETING THEN
    DELETE FROM superheroes_backup WHERE SH_NAME =:old.sh_name; 
  ELSIF UPDATING THEN
    UPDATE superheroes_backup 
    SET SH_NAME =:new.sh_name WHERE SH_NAME =:old.sh_name;
  END IF;
END;
/

-- DDL Trigger for Schema Auditing
CREATE OR REPLACE TRIGGER hr_audit_tr 
AFTER DDL ON SCHEMA
BEGIN
    INSERT INTO schema_audit VALUES (
sysdate, 
sys_context('USERENV','CURRENT_USER'), 
ora_dict_obj_type, 
ora_dict_obj_name, 
ora_sysevent);
END;
/

-- DDL Trigger for Database Auditing.
CREATE OR REPLACE TRIGGER db_audit_tr 
AFTER DDL ON DATABASE
BEGIN
    INSERT INTO schema_audit VALUES (
sysdate, 
sys_context('USERENV','CURRENT_USER'), 
ora_dict_obj_type, 
ora_dict_obj_name, 
ora_sysevent);
END;
/

---##########System event Triggers
CREATE OR REPLACE TRIGGER hr_lgon_audit
AFTER LOGON ON SCHEMA
BEGIN
  INSERT INTO hr_evnt_audit VALUES(
    ora_sysevent,
    sysdate,
    TO_CHAR(sysdate, 'hh24:mi:ss'),
    NULL,
    NULL
  );
  COMMIT;
END;
/

--log off Triggers
CREATE OR REPLACE TRIGGER db_lgof_audit
BEFORE LOGOFF ON DATABASE
BEGIN
  INSERT INTO db_evnt_audit 
  VALUES(
    user,
    ora_sysevent,
    NULL,
    NULL,
    SYSDATE,
    TO_CHAR(sysdate, 'hh24:mi:ss')
    );
END;
/

-- Startup & Shutdown Database Event Triggers In Oracle PL/SQL

CREATE OR REPLACE TRIGGER startup_audit
AFTER STARTUP ON DATABASE
BEGIN
  INSERT INTO startup_audit VALUES
(
    ora_sysevent,
    SYSDATE,
    TO_CHAR(sysdate, 'hh24:mm:ss')
  );
END;
/
--shutdown
CREATE OR REPLACE TRIGGER before_shutdown
BEFORE SHUTDOWN ON DATABASE
BEGIN
 gather_system_stats;
END;
/


-- How To Create Instead-Of Insert Trigger In Oracle PL/SQL
CREATE OR REPLACE TRIGGER tr_Io_Insert
INSTEAD OF INSERT ON vw_rebellionrider
FOR EACH ROW
BEGIN
  INSERT INTO trainer (full_name) VALUES (:new.full_name);
  INSERT INTO subject (subject_name) VALUES (:new.subject_name);
END;

-- How To Create Instead-Of Update Trigger In Oracle PL/SQL
CREATE OR REPLACE TRIGGER io_update
INSTEAD OF UPDATE ON vw_rebellionrider
FOR EACH ROW
BEGIN
  UPDATE trainer SET FULL_NAME = :new.full_name 
  WHERE FULL_NAME = :old.full_name;
  UPDATE subject SET subject_NAME = :new.subject_name 
  WHERE subject_NAME = :old.subject_name;
END;
/

-- How To Create Instead-Of DELETE Trigger In Oracle PL/SQL
CREATE OR REPLACE TRIGGER io_delete
INSTEAD OF DELETE ON vw_RebellionRider
FOR EACH ROW
BEGIN
  DELETE FROM trainer WHERE FULL_NAME = :old.FULL_NAME;
  DELETE FROM subject WHERE SUBJECT_NAME= :old.SUBJECT_NAME;
END;
/
---#################################################################################################################
---#######################################>>>CURSOR<<<##############################################################
---#################################################################################################################
-- How To Create An Explicit Cursor In Oracle Database
SET SERVEROUTPUT ON;
DECLARE
  v_name VARCHAR2(30);
  --Declare Cursor 
  CURSOR cur_RebellionRider IS 
  SELECT first_name FROM EMPLOYEES 
  WHERE employee_id < 105;
BEGIN
  OPEN cur_RebellionRider; 
  LOOP 
    FETCH cur_RebellionRider INTO v_name; 
    DBMS_OUTPUT.PUT_LINE (v_name); 
    EXIT WHEN cur_RebellionRider%NOTFOUND; 
  END LOOP;--Simple Loop End
  CLOSE cur_RebellionRider;
END;

-- How To Create Cursor Parameter In Oracle Database
SET SERVEROUTPUT ON;
DECLARE
  v_name VARCHAR2 (30);
  --Declare Cursor 
  CURSOR p_cur_RebellionRider (var_e_id VARCHAR2) IS 
  SELECT first_name FROM EMPLOYEES 
  WHERE employee_id < var_e_id;
BEGIN
  OPEN p_cur_RebellionRider (105); 
LOOP 
    FETCH p_cur_RebellionRider INTO v_name; 
    EXIT WHEN p_cur_RebellionRider%NOTFOUND; 
    DBMS_OUTPUT.PUT_LINE(v_name );  
  END LOOP;
  CLOSE p_cur_RebellionRider;
END;
/


-- How To Create Cursor Parameter With Default Value In Oracle Database
-- Example 1 of Cursor Parameter with Default Value
SET SERVEROUTPUT ON;
DECLARE
  v_name VARCHAR2(30);
  v_eid  NUMBER(10);
  CURSOR cur_RebellionRider(var_e_id NUMBER := 190 )
  IS
  SELECT first_name, employee_id FROM employees 
  WHERE employee_id > var_e_id; 
BEGIN
  OPEN cur_rebellionrider;
  LOOP
    FETCH cur_rebellionrider INTO v_name, v_eid; 
    EXIT WHEN cur_rebellionrider%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(v_name ||' '||v_eid); 
  END LOOP;
  CLOSE cur_rebellionrider;
END;
/

-- Example 2 of Cursor Parameter with Default ValueS
DECLARE
  v_name VARCHAR2(30);
  v_eid  NUMBER(10);
  CURSOR cur_RebellionRider(var_e_id NUMBER := 190 )
  IS
  SELECT first_name, employee_id FROM employees 
  WHERE employee_id > var_e_id; 
BEGIN
  OPEN cur_rebellionrider (200);
  LOOP
    FETCH cur_rebellionrider INTO v_name, v_eid; 
    EXIT WHEN cur_rebellionrider%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(v_name ||' '||v_eid); 
  END LOOP;
  CLOSE cur_rebellionrider;
END;
/

-- Cursor For Loop With Simple Explicit Cursor In Oracle Database
-- Example 1: Cursor For Loop With Simple Explicit Cursor
SET SERVEROUTPUT ON;
DECLARE
 CURSOR cur_RebellionRider IS 
 SELECT first_name, last_name FROM employees
 WHERE employee_id >200;
BEGIN
  FOR L_IDX IN cur_RebellionRider
  LOOP
    DBMS_OUTPUT.PUT_LINE(L_IDX.first_name||' '||L_IDX.last_name);
  END LOOP;
END;
/

-- Example 2: Cursor For Loop With Inline Cursor.
-- You can pass the cursor definition directly into the Cursor For Loop. The code for that is:

SET SERVEROUTPUT ON;
BEGIN
  FOR  L_IDX  IN (SELECT first_name, last_name FROM employees
  WHERE employee_id >200)
  LOOP
     DBMS_OUTPUT.PUT_LINE (L_IDX.first_name||' '||L_IDX.last_name);
  END LOOP;
END;
/


-- Cursor For Loop With Parameterized Explicit Cursor In Oracle Database
-- Example1. Cursor For Loop With Parameterized Cursor
DECLARE
  CURSOR cur_RebellionRider( var_e_id NUMBER) IS 
  SELECT first_name, employee_id FROM employees
  WHERE employee_id > var_e_id;
BEGIN
  FOR l_idx IN cur_RebellionRider(200) LOOP
    DBMS_OUTPUT.PUT_LINE(l_idx.employee_id||' '||l_idx.first_name);
  END LOOP;
END;


-- Example: Table based record type variable initialization with SELECT asterisk (*) statement.
SET SERVEROUTPUT ON;
DECLARE
  v_emp employees%ROWTYPE;
BEGIN
  SELECT * INTO v_emp FROM employees
  WHERE employee_id = 100;
    	  DBMS_OUTPUT.PUT_LINE (v_emp.first_name ||' '||v_emp.salary);
  DBMS_OUTPUT.PUT_LINE(v_emp.hire_date);
END;
/

-- Initialize the Record Datatype variable using data from Multiple Columns.

SET SERVEROUTPUT ON;
DECLARE
  v_emp employees%ROWTYPE;
BEGIN
  SELECT first_name,
    hire_date
  INTO v_emp.first_name,
    v_emp.hire_date
  FROM employees
  WHERE employee_id = 100;
  DBMS_OUTPUT.PUT_LINE (v_emp.first_name);
  DBMS_OUTPUT.PUT_LINE (v_emp.hire_date);
END;
/

-- How to Create Cursor Based Record Datatype Variables In Oracle Database

SET SERVEROUTPUT ON;
DECLARE
  CURSOR cur_RebellionRider
  IS 
  SELECT first_name, salary FROM employees 
  WHERE employee_id = 100;
  --Cursor Based Record Variable Declare
  var_emp cur_RebellionRider%ROWTYPE;
BEGIN
  OPEN cur_RebellionRider;
  FETCH cur_RebellionRider INTO var_emp;
  DBMS_OUTPUT.PUT_LINE (var_emp.first_name);
  DBMS_OUTPUT.PUT_LINE (var_emp.salary);
  CLOSE cur_RebellionRider;
END;

-- Cursor Based Record Datatype With Cursor Returning Multiple Values In Oracle Database

SET SERVEROUTPUT ON;
BEGIN
  FOR var_emp IN (SELECT first_name, salary FROM employees
 WHERE employee_id >200)
  LOOP
    DBMS_OUTPUT.PUT_LINE(var_emp.first_name||' '||var_emp.salary);
  END LOOP;
END; 

-- How To Create User defined Record Datatype Variable In Oracle Database
SET SERVEROUTPUT ON;
DECLARE
  TYPE rv_dept IS RECORD(
    f_name  VARCHAR2(20),
    d_name  departments.department_name%type 
  );
  var1 rv_dept;
BEGIN
  SELECT first_name , department_name 
  INTO var1.f_name, var1.d_name
  FROM employees  join departments
  Using (department_id) WHERE employee_id = 100;
  
  DBMS_OUTPUT.PUT_LINE(var1.f_name||' '||var1.d_name);
END;
/
-- ###################################################################################################################
-- Functions
-- Introduction To PL/SQL Functions In Oracle Database
-- How To Create PL/SQL Function In Oracle Database
-- PL/SQL function for calculating Area of the Circle?.
--Function Header
CREATE OR REPLACE FUNCTION circle_area (radius NUMBER) 
RETURN NUMBER IS
--Declare a constant and a variable
pi  	CONSTANT NUMBER(7,2) :=	3.141;
area 	NUMBER(7,2);
BEGIN
  --Area of Circle pi*r*r;
  area := pi * (radius * radius);
  RETURN area; 
END;
--execute function
begin
    DBMS_OUTPUT.PUT_LINE(circle_area (10));
end;

--select query
SELECT circle_area(10) AS area FROM DUAL;


--REERSE OF A NUMBER
CREATE OR REPLACE FUNCTION reverse_number (p_number IN NUMBER) RETURN NUMBER IS
    v_temp_number  NUMBER := p_number;
    v_reversed_number NUMBER := 0;
    v_last_digit   NUMBER;
BEGIN
    -- Loop until the number becomes 0
    WHILE v_temp_number > 0 LOOP
        -- Extract the last digit of the number
        v_last_digit := MOD(v_temp_number, 10);

        -- Add the last digit to the reversed number
        v_reversed_number := v_reversed_number * 10 + v_last_digit;

        -- Remove the last digit from the number
        v_temp_number := TRUNC(v_temp_number / 10);
    END LOOP;

    -- Return the reversed number
    RETURN v_reversed_number;
END;
/

-- ####################################################################################################################
-- PROCEDURE
-- What Are PL/SQL Stored Procedures In Oracle Database
-- How To Create PL/SQL Stored Procedures Without Parameters In Oracle Database
CREATE OR REPLACE PROCEDURE pr_RebellionRider IS
  var_name VARCHAR2 (30):= 'Srinivas';
  var_web VARCHAR2 (30) := 'RebellionRider.com';
BEGIN
  DBMS_OUTPUT.PUT_LINE('Whats Up Internet? I am '||var_name||' from '||var_web);
END Pr_RebellionRider;
/

EXECUTE PR_RebellionRider;

-- How To Create PL/SQL Stored Procedures With Parameters In Oracle Database
-- Stored Procedure for Department Wide Salary Raise
CREATE OR REPLACE PROCEDURE emp_sal( dep_id NUMBER, sal_raise NUMBER) 
IS
BEGIN
  UPDATE emp SET salary = salary * sal_raise WHERE department_id = dep_id;
END;
/

-- ######################################################################################################################
-- Calling Notation For PL/SQL Subroutines In Oracle Database
-- Example of Mixed calling notation for calling PL/SQL subroutines
-- Here is the anonymous block in which we are calling the same function add_num ( ) which we coded when doing named calling notation.

-- Example of Named Calling Notation for calling a PL/SQL Subroutines
CREATE OR REPLACE FUNCTION add_num
(var_1 NUMBER, var_2 NUMBER DEFAULT 0, var_3 NUMBER ) RETURN NUMBER 
IS
BEGIN
  RETURN var_1 + var_2 + var_3;
END;
/

-- PL/SQL Function call using Named Calling Notation in Oracle Database
DECLARE
  var_result  NUMBER;
BEGIN
  var_result := add_num(var_3 => 5, var_1 =>2);
  DBMS_OUTPUT.put_line('Result ->' || var_result);
END;
---

BEGIN
  DBMS_OUTPUT.PUT_LINE(ADD_NUM(var_3 => 5, var_1 => 2));
END;


-- Calling Notation For PL/SQL Subroutines In Oracle Database
-- Example: Positional Notation for calling PL/SQL Subroutines.
CREATE OR REPLACE PROCEDURE emp_sal
(dep_id NUMBER, sal_raise NUMBER) 
IS
BEGIN
	UPDATE employees 
SET salary = salary * sal_raise 
WHERE department_id = dep_id;
 
DBMS_OUTPUT.PUT_LINE ('salary updated successfully');
END;
/



-- Example of Mixed calling notation for calling PL/SQL subroutines
-- Here is the anonymous block in which we are calling the same function add_num ( ) which we coded when doing named calling notation.

DECLARE
  var_result  NUMBER;
BEGIN
  var_result := add_num(var_1 => 10, 30 ,var_3 =>19);
  DBMS_OUTPUT.put_line('Result ->' || var_result);
END;
-- ################################################################################################################3
-- ################################################ >>>Packages<<< ################################################3
-- ################################################################################################################3
-- How To Create PL/SQL Packages In Oracle Database
CREATE OR REPLACE PACKAGE pkg_RebellionRider IS
  FUNCTION prnt_strng RETURN VARCHAR2;
  PROCEDURE proc_superhero(f_name VARCHAR2, l_name VARCHAR2);
END pkg_RebellionRider;

--Package Body
CREATE OR REPLACE PACKAGE BODY pkg_RebellionRider IS
  --Function Implimentation
  FUNCTION prnt_strng RETURN VARCHAR2 IS
    BEGIN
      RETURN 'RebellionRider.com';
    END prnt_strng;
  
  --Procedure Implimentation
   PROCEDURE proc_superhero(f_name VARCHAR2, l_name VARCHAR2) IS
     BEGIN
      INSERT INTO new_superheroes (f_name, l_name) VALUES(f_name, l_name);
     END;
  
END pkg_rrdr;
-- #############################################################################################################
-- Exception Handling
-- How To Declare User-Define Exception Using An Exception Variable In Oracle Database
-- Divide by zero error using PL/SQL User-define Exception in Oracle Database
SET SERVEROUTPUT ON;
DECLARE
  var_dividend NUMBER := 24;
  var_divisor NUMBER := 0;
  var_result NUMBER;
  ex_DivZero EXCEPTION;
BEGIN
  IF var_divisor = 0 THEN
    RAISE ex_DivZero;
  END IF;
  var_result := var_dividend/var_divisor;
  DBMS_OUTPUT.PUT_LINE('Result = ' ||var_result);
  EXCEPTION WHEN ex_DivZero THEN
      DBMS_OUTPUT.PUT_LINE('Error Error - Your Divisor is Zero');
END;
/


-- Declare User-Define Exception Using RAISE_APPLICATION_ERROR Method In Oracle Database

-- User-Define Exception Using Raise_Application_Error Procedure
SET SERVEROUTPUT ON;
ACCEPT var_age NUMBER PROMPT 'Hi Srinivas Raju. What is your age';
DECLARE
  age   NUMBER := &var_age;
BEGIN
  IF age < 18 THEN
    RAISE_APPLICATION_ERROR (-20008, 'you should be 18 or above for the DRINK!');
  END IF; 
  DBMS_OUTPUT.PUT_LINE ('Sure, What would you like to have?'); 
  EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE (SQLERRM);
END;
/ 

-- How To Declare User Define Exception Using PRAGMA EXCEPTION_INIT
-- Example: Declare User-define exception using Pragma Exception_Init
DECLARE
  ex_age    EXCEPTION;
  age       NUMBER    := 17;
  PRAGMA EXCEPTION_INIT(ex_age, -20008);
BEGIN
  IF age<18 THEN
    RAISE_APPLICATION_ERROR(-20008, 'You should be 18 or above for the drinks!');
  END IF;
  
  DBMS_OUTPUT.PUT_LINE('Sure! What would you like to have?');
  
  EXCEPTION WHEN ex_age THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);   
END;
/

-- ######################################################################################################

-- Collections
-- Example: How to Create Nested Table inside a PL/SQL Block?

SET SERVEROUTPUT ON;
 DECLARE
   TYPE my_nested_table   IS TABLE OF number;
   var_nt  my_nested_table :=  my_nested_table (9,18,27,36,45,54,63,72,81,90);
 BEGIN
   FOR i IN 1..var_nt.COUNT
   LOOP
     DBMS_OUTPUT.PUT_LINE ('Value stored at index '||i||'is '||var_nt(i));
   END LOOP;
 END;
 /


-- Update single instance of nested table
UPDATE TABLE
  (SELECT sub_schedule_day FROM my_subject 
  WHERE sub_id = 101) A
SET A.COLUMN_VALUE   = 'Thur' 
WHERE A.COLUMN_VALUE = 'Sat';

CREATE OR REPLACE TYPE my_nested_table IS TABLE OF VARCHAR2 (10);
/
CREATE TABLE my_subject(
	  sub_id    	NUMBER,
	  sub_name  	VARCHAR2 (20),
	  sub_schedule_day    my_nested_table
) NESTED TABLE sub_schedule_day STORE AS nested_tab_space;
/
INSERT INTO my_subject (sub_id, sub_name, sub_schedule_day)
VALUES (101, 'Maths', my_nested_table('mon', 'Fri'));

SELECT * FROM TABLE (
  SELECT sub_schedule_day FROM my_subject WHERE sub_id = 101
);

-- How To Create Nested Table Using User-Define Datatype In Oracle Database
CREATE OR REPLACE TYPE object_type AS OBJECT (
  obj_id  NUMBER,
  obj_name  VARCHAR2(10)
);
/

CREATE TABLE Base_Table(
  tab_id  NUMBER,
  tab_ele My_NT
)NESTED TABLE tab_ele STORE AS stor_tab_1;
/

 INSERT INTO base_table (tab_id, tab_ele) VALUES
 (801,  -- value for 1st colum 
   My_NT (object_type (1,'Superman') -- values for 2nd column )
 );
 
 UPDATE base_table SET tab_ele = My_NT(object_type(1,'SpiderMan')) WHERE tab_id = 801; 
 
 
 
 SELECT * FROM TABLE(
  SELECT tab_ele FROM Base_Table WHERE tab_id = 801
)

--VARRAY
-- Declare a VARRAY type
DECLARE
    TYPE varray_type IS VARRAY(5) OF VARCHAR2(100);
    -- Declare a variable of the VARRAY type
    my_varray varray_type := varray_type('Apple', 'Banana', 'Cherry', 'Date', 'Elderberry');
BEGIN
    -- Loop through the VARRAY and print each element
    FOR i IN 1..my_varray.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE('Element at index ' || i || ': ' || my_varray(i));
    END LOOP;
END;
/


-- How to insert data into a VARRAY using PL/SQL Loop
BEGIN
		vry_obj.EXTEND(5); 
		vry_obj(1):= 10*2;
		DBMS_OUTPUT.PUT_LINE(vry_obj(1));    
	END;
	/



BEGIN
	FOR i IN 1 .. vry_obj.LIMIT
	LOOP
 		vry_obj.EXTEND;
		vry_obj (i):= 10*i;    
		DBMS_OUTPUT.PUT_LINE (vry_obj (i));    
	END LOOP;
	END;
	/
	
-- How to use VARRAY with PL/SQL block?
DECLARE
    vry_obj dbObj_vry    := dbObj_vry();
BEGIN
    FOR i IN 1..vry_obj.LIMIT
    LOOP
        vry_obj.EXTEND; 
        vry_obj(i):= 10*i;
        DBMS_OUTPUT.PUT_LINE(vry_obj(i));    
    END LOOP;
END;
/

-- How to retrieve data from the Collection- Associative array
-- how to retrieve data using key from associative array.  	
	  DBMS_OUTPUT.PUT_LINE ('Value '||isbn ('Oracle Database'));
	  
SET SERVEROUTPUT ON;
DECLARE
    TYPE books IS TABLE OF NUMBER
        INDEX BY VARCHAR2(20);
    isbn Books;
BEGIN
    	-- How to insert data into the associative array 
    	isbn('Oracle Database') := 1234;
    	isbn('MySQL') := 9876;
    	DBMS_OUTPUT.PUT_LINE('Value Before Updation '||isbn('MySQL'));

    	-- How to update data of associative array.
    	isbn('MySQL') := 1010;
    
-- how to retrieve data using key from associative array.  
    	DBMS_OUTPUT.PUT_LINE('Value After Updation '||isbn('MySQL'));
END;

-- How to retrieve data from the Collection- Associative array?

-- how to retrieve data using key from associative array.  	
	  DBMS_OUTPUT.PUT_LINE ('Value '||isbn ('Oracle Database'));



--###SIMPLE EXAMPLE FROM CHATGPT
SET SERVEROUTPUT ON;

DECLARE
    -- Declare an associative array type
    TYPE assoc_array_type IS TABLE OF VARCHAR2(100) INDEX BY PLS_INTEGER;
    
    -- Declare a variable of the associative array type
    my_assoc_array assoc_array_type;
BEGIN
    -- Initialize the associative array with key-value pairs
    my_assoc_array(1) := 'Apple';
    my_assoc_array(2) := 'Banana';
    my_assoc_array(3) := 'Cherry';
    my_assoc_array(4) := 'Date';
    my_assoc_array(5) := 'Elderberry';

    -- Loop through the associative array and print each element
    FOR i IN 1..my_assoc_array.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE('Element at index ' || i || ': ' || my_assoc_array(i));
    END LOOP;
END;
/



--SIMPLE ASSOCIATE ARRAY CODE

DECLARE
    TYPE assoc_array_type IS TABLE OF VARCHAR2(100) INDEX BY VARCHAR2(100);
    my_assoc_array assoc_array_type;
BEGIN
    my_assoc_array(1) := 'Apple';
    my_assoc_array(2) := 'Banana';
    my_assoc_array(3) := 'Cherry';
    my_assoc_array(4) := 'Date';
    my_assoc_array(5) := 'Elderberry';

    FOR i IN 1..my_assoc_array.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE('Element at index ' || i || ': ' || my_assoc_array(i));
    END LOOP;
END;
/


--



DECLARE
    TYPE books IS TABLE OF NUMBER
        INDEX BY VARCHAR2(20);
    isbn Books;
BEGIN
    	-- How to insert data into the associative array 
    	isbn('Oracle Database') := 1234;
    	isbn('MySQL') := 9876;
    	DBMS_OUTPUT.PUT_LINE('Value Before Updation '||isbn('MySQL'));

    	-- How to update data of associative array.
    	isbn('MySQL') := 1010;
    
-- how to retrieve data using key from associative array.  
    	DBMS_OUTPUT.PUT_LINE('Value After Updation '||isbn('MySQL'));
END;
/

-- #Collection Method
-- -- #COUNT
-- COUNT ( ) function with IF Condition
SET SERVEROUTPUT ON;
DECLARE
    TYPE my_nested_table IS TABLE OF number;
    var_nt my_nested_table := my_nested_table (9,18,27,36,45,54,63,72,81,90);
BEGIN
    IF var_nt.count >= 10 THEN
        DBMS_OUTPUT.PUT_LINE ('you have already inserted 10 elements in your Nested table.');
        DBMS_OUTPUT.PUT_LINE ('Are you sure you want to insert more?');
    END IF;
END;
/


-- Example of Collection Method EXISTS ( ).

SET SERVEROUTPUT ON;
DECLARE
        --Declare a local Nested Table
    	TYPE my_nested_table IS TABLE OF VARCHAR2 (20);
 --Declare collection variable and initialize the collection.	
col_var_1   my_nested_table := my_nested_table('Super Man','Iron Man','Bat Man');
BEGIN
    IF col_var_1.EXISTS (1) THEN
        DBMS_OUTPUT.PUT_LINE ('Hey we found '||col_var_1 (1));
    ELSE
        DBMS_OUTPUT.PUT_LINE ('Sorry, no data at this INDEX');
    END IF;
END;
/  


-- Can we see the data stored into the indexes of the collection using FIRST and LAST collection methods?

SET SERVEROUTPUT ON;
DECLARE
    TYPE nt_tab IS TABLE OF NUMBER;
    col_var nt_tab := nt_tab(10, 20, 30, 40, 50);
BEGIN
    -- This output statement will return 10 which is the value stored at the first index
    DBMS_OUTPUT.PUT_LINE ('Value stored at First Index is ' || col_var(col_var.FIRST));
    -- This output statement will return 50 which is the value stored at the last index
    DBMS_OUTPUT.PUT_LINE ('Value stored at First Index is ' || col_var(col_var.LAST));
END;
/


-- how to find out the total number of elements left un-used for us to store data into a varray using collection method
 -- LIMIT?
DECLARE
    --Create VARRAY of 5 element
    TYPE inblock_vry IS
        VARRAY ( 5 ) OF NUMBER;
    vry_obj   inblock_vry := inblock_vry ();
BEGIN
    --Insert into VARRAY
    vry_obj.extend;
    vry_obj(1) := 10 * 2;
    dbms_output.put_line('Total Number of Index ' || vry_obj.limit);
    dbms_output.put_line('Total Number of Index which are occupied ' || vry_obj.count);
    dbms_output.put_line('Total Number of Vacant index left for use '
                            || (vry_obj.limit - vry_obj.count) );
END;
/

-- Collection Method: PRIOR & NEXT Functions In Oracle Database

DECLARE
    TYPE my_nested_table IS
        TABLE OF NUMBER;
    var_nt   my_nested_table := my_nested_table(9,18,27,36,45,54,63,72,81,90);
BEGIN
        dbms_output.put_line('Next Higher Index to index 3 is '||var_nt.NEXT(3)); 
        dbms_output.put_line('Value after 3rd Index is '||var_nt(var_nt.NEXT(3))); 
END;
/

-- Collection Method: DELETE Procedure In Oracle Database
-- Example 1: Simple procedure call without argument.
DECLARE
    TYPE my_nested_table IS
        TABLE OF NUMBER;
    var_nt my_nested_table := my_nested_table(2,4,6,8,10,12,14,16,18,20);
BEGIN

    --Range Delete
    var_nt.DELETE;
    FOR i IN 1..var_nt.LAST LOOP
        IF var_nt.EXISTS(i) THEN
            DBMS_OUTPUT.PUT_LINE('Value at Index ['||i||'] is '|| var_nt(i));
        END IF;
    END LOOP;
END;

-- Example 2: Procedure call with a single parameter
DECLARE
    TYPE my_nested_table IS
        TABLE OF NUMBER;
    var_nt my_nested_table := my_nested_table(2,4,6,8,10,12,14,16,18,20);
BEGIN
    DBMS_OUTPUT.PUT_LINE('After Deleted');
    --Delete Specific Index
    var_nt.DELETE(5);
    IF var_nt.EXISTS(5) THEN
            DBMS_OUTPUT.PUT_LINE('Value at Index [5] is '|| var_nt(5));
    ELSE
        DBMS_OUTPUT.PUT_LINE('Data is Deleted');
    END IF;
END;

-- Example 3: Procedure call with two parameters.
DECLARE
    TYPE my_nested_table IS
        TABLE OF NUMBER;
    var_nt my_nested_table := my_nested_table(2,4,6,8,10,12,14,16,18,20);
BEGIN

    --Delete Range
    var_nt.DELETE(2,6);
    FOR i IN 1..var_nt.LAST LOOP
        IF var_nt.EXISTS(i) THEN
            DBMS_OUTPUT.PUT_LINE('Value at Index ['||i||'] is '|| var_nt(i));
        END IF;
    END LOOP;
END;
/


-- Collection Method: EXTEND Procedure In Oracle Database
-- 1. PL/SQL Collection Procedure EXTEND with No Argument.
SET SERVEROUTPUT ON;
DECLARE
    TYPE my_nestedTable IS TABLE OF number;
    nt_obj  my_nestedTable := my_nestedTable();
BEGIN
    nt_obj.EXTEND;
    nt_obj(1) := 10;
    DBMS_OUTPUT.PUT_LINE ('Data at index 1 is '||nt_obj(1));
END;
/

-- 2. Collection Procedure EXTEND with One Argument.
SET SERVEROUTPUT ON;
DECLARE
    TYPE my_nestedTable IS TABLE OF number;
    nt_obj  my_nestedTable := my_nestedTable();
BEGIN
    nt_obj.EXTEND(3);
    nt_obj(1) := 10;
    nt_obj(2) := 20;
    nt_obj(3) := 30;
    DBMS_OUTPUT.PUT_LINE ('Data at index 1 is '||nt_obj(1));
    DBMS_OUTPUT.PUT_LINE ('Data at index 2 is '||nt_obj(2)); 
    DBMS_OUTPUT.PUT_LINE ('Data at index 3 is '||nt_obj(3));
END;
/

-- 3. PL/SQL Collection Procedure EXTEND with Two Arguments.
SET SERVEROUTPUT ON;
DECLARE
    TYPE my_nestedTable IS TABLE OF number;
    nt_obj  my_nestedTable := my_nestedTable();
BEGIN
    nt_obj.EXTEND;
    nt_obj(1) := 28;
    DBMS_OUTPUT.PUT_LINE ('Data at index 1 is '||nt_obj(1));
    nt_obj.EXTEND(5,1);
    DBMS_OUTPUT.PUT_LINE ('Data at index 4 is '||nt_obj(4));
END;
/

-- 4. Collection Procedure EXTEND (No Argument) with VARRAY
SET SERVEROUTPUT ON;
DECLARE
    TYPE my_Varray IS VARRAY (5) OF NUMBER;
    vry_obj my_Varray := my_Varray();
BEGIN
    vry_obj.EXTEND;
    vry_obj(1) := 10;
    DBMS_OUTPUT.PUT_LINE('Data at index 1 is '||vry_obj(1));
END;
/

-- Collection Method: Trim Procedure In Oracle Database
-- 1. PL/SQL Collection Procedure TRIM without parameter.
SET SERVEROUTPUT ON;
DECLARE
    TYPE my_nestedTable IS TABLE OF number;
    nt_obj  my_nestedTable := my_nestedTable(1,2,3,4,5);
BEGIN
    nt_obj.TRIM;
    DBMS_OUTPUT.PUT_LINE ('After TRIM procedure');
    FOR i IN 1..nt_obj.COUNT
    LOOP
        DBMS_OUTPUT.PUT_LINE (nt_obj (i));
    END LOOP;
END;
/ 
-- 2. Collection Procedure TRIM with parameter.
SET SERVEROUTPUT ON;
DECLARE
    TYPE my_nestedTable IS TABLE OF number;
    nt_obj  my_nestedTable := my_nestedTable(1,2,3,4,5);
BEGIN
    nt_obj.TRIM (3);
    DBMS_OUTPUT.PUT_LINE ('After TRIM procedure');
    FOR i IN 1..nt_obj.COUNT
    LOOP
        DBMS_OUTPUT.PUT_LINE (nt_obj(i));
    END LOOP;
END;
/
-- 3. PL/SQL Collection Procedure TRIM SUBSCRIPT_BEYOND_COUNT exception.
SET SERVEROUTPUT ON;
DECLARE
    TYPE my_nestedTable IS TABLE OF number;
    nt_obj  my_nestedTable := my_nestedTable(1,2,3,4,5);
BEGIN
    nt_obj.TRIM(6);
    DBMS_OUTPUT.PUT_LINE ('After TRIM procedure');
    FOR i IN 1..nt_obj.COUNT
    LOOP
        DBMS_OUTPUT.PUT_LINE (nt_obj(i));
    END LOOP;
END;
/
-- SUBSCRIPT_BEYOND_COUNT exception occurs when we pass an argument greater than the total number of elements of the 
-- collection. In the above example the collection which we use is Nested table with the name my_nestedTable which has 
-- 5 numeric elements stored into it. However in the procedure call we instructed the compiler to TRIM 6 elements which 
-- is definitely impossible thus in this case compiler raises SUBSCRIPT_BEYOND_COUNT exception.

-- 4. Collection Procedure TRIM with VARRAY.
SET SERVEROUTPUT ON;
DECLARE
 TYPE inBlock_vry IS VARRAY (5) OF NUMBER;
 vry_obj inBlock_vry := inBlock_vry(1, 2, 3, 4, 5);
BEGIN
    --TRIM without parameter
    vry_obj.TRIM;
    DBMS_OUTPUT.PUT_LINE ('After TRIM procedure');
    FOR i IN 1..vry_obj.COUNT
    LOOP
        DBMS_OUTPUT.PUT_LINE (vry_obj(i));
    END LOOP;
    --TRIM with Parameter
    vry_obj.TRIM (2);
    DBMS_OUTPUT.PUT_LINE ('After TRIM procedure');
    FOR i IN 1..vry_obj.COUNT
    LOOP
        DBMS_OUTPUT.PUT_LINE (vry_obj(i));
    END LOOP;
END;
/



-- create a Strong Ref Cursor with Table Based Record Datatype.

 SET SERVEROUTPUT ON
 DECLARE
    	/*Create Ref Pointer Type*/
	TYPE	my_RefCur	IS REF CURSOR RETURN 	employees%ROWTYPE;
	/*Create Cursor Variable*/
	cur_var my_RefCur;
	rec_var     employees%ROWTYPE;
 BEGIN
	OPEN cur_var FOR SELECT * FROM employees WHERE employee_id = 100;
	FETCH cur_var INTO rec_var;
	CLOSE cur_var;
	DBMS_OUTPUT.PUT_LINE ('Employee '||rec_var.first_name||' has salary '||rec_var.salary||'.');
END;
/



-- PL/SQL Strong Ref Cursor With User Defined Record Datatype

SET SERVEROUTPUT ON;
DECLARE
	--Create User-Defined Record Datatype
    TYPE my_rec IS RECORD (
        emp_sal employees.salary%TYPE
        );
	--Declare Strong Ref Cursor
    TYPE RefCur IS REF CURSOR RETURN my_rec;
    cur_var REFCUR;
	--Another anchored datatype variable for holding data
    at_var  employees.salary%TYPE;
BEGIN
   OPEN cur_var FOR SELECT salary FROM employees WHERE employee_id = 100;
    FETCH cur_var INTO at_var;
    CLOSE cur_var;
    DBMS_OUTPUT.PUT_LINE ('Salary of the employee is '||at_var);
END;
/

-- How To Create PL/SQL Weak Ref Cursor In Oracle Database

-- Syntax of Weak Ref Cursor
TYPE ref_cursor_name IS REF CURSOR;



-- Example: How to create Weak Ref Cursor in Oracle Database
SET SERVEROUTPUT ON;
DECLARE
    /*Declare Weak Ref Cursor*/
    TYPE wk_RefCur IS REF CURSOR;
    /*Declare Cursor Variable of ref cursor type*/
    cur_var wk_RefCur;
    
     /*Declare two "Anchored Datatype Variable" for holding data from the cursor*/
    f_name  employees.first_name%TYPE;
    emp_sal employees.salary%TYPE;
BEGIN
    OPEN cur_var FOR SELECT first_name, Salary FROM employees WHERE employee_id = 100;
    FETCH cur_var INTO f_name, emp_sal;
    CLOSE cur_var;
    DBMS_OUTPUT.PUT_LINE (f_name ||' '||emp_sal);
END;
/



-- How to create PL/SQL SYS_REFCURSOR in Oracle Database?

SET SERVEROUTPUT ON;
DECLARE
    --Declare cursor variable of SYS_REFCURSOR type
    cur_var SYS_REFCURSOR;
    
    --Declare variables for holding data
    f_name  employees.first_name%TYPE;
    emp_sal employees.salary%TYPE;
BEGIN
OPEN cur_var FOR SELECT first_name, Salary FROM employees WHERE employee_id = 100;
    FETCH cur_var INTO f_name, emp_sal;
    CLOSE cur_var;
    DBMS_OUTPUT.PUT_LINE(f_name ||' '||emp_sal);
END;
/



-- How To Use Bulk Collect Clause With SELECT INTO Statement In Oracle Database

DECLARE
    TYPE nt_fName   IS TABLE OF VARCHAR2 (20);
    TYPE nt_lName   IS TABLE OF VARCHAR2 (20);
    
    fname   nt_fName;
    lName   nt_lName;
BEGIN
    SELECT first_name, last_name 
        BULK COLLECT INTO fName, lName 
    FROM employees; 
        
        --Print values from the collection--
    FOR idx IN 1..fName.COUNT
    LOOP
        DBMS_OUTPUT.PUT_LINE (idx||' - '||fName (idx) ||' '||lName (idx));
    END LOOP;
END;
/


-- How to use PL/SQL Bulk Collect with FETCH-INTO statement in Oracle Database.
SET SERVEROUTPUT ON;
DECLARE
--Create an explicit cursor
    CURSOR exp_cur IS
    SELECT first_name FROM employees;

    --Declare collection for holding the data 
    TYPE nt_fName   IS TABLE OF VARCHAR2 (20);
    fname   nt_fName;
BEGIN
    OPEN exp_cur;
    LOOP
        FETCH exp_cur BULK COLLECT INTO fname;
        EXIT WHEN fname.count=0;
        --Print data
        FOR idx IN fname.FIRST.. fname.LAST
        LOOP
            DBMS_OUTPUT.PUT_LINE (idx||' '||fname(idx) );
        END LOOP; 
    END LOOP;
    CLOSE exp_cur;
END;
/


-- PL/SQL Bulk Collect With LIMIT Clause In Oracle Database
-- How to use LIMIT clause with Bulk Collect statement in Oracle Database
-- Here is a very simple example showing you how you can work with the LIMIT clause.

SET SERVEROUTPUT ON;
DECLARE
    CURSOR exp_cur IS
    SELECT first_name FROM employees;
    
    TYPE nt_fName   IS TABLE OF VARCHAR2(20);
    fname   nt_fName;
BEGIN
    OPEN exp_cur;
    FETCH exp_cur   BULK COLLECT INTO fname     LIMIT 10;
    CLOSE exp_cur;
    --Print data
    FOR idx IN 1 .. fname.COUNT
    LOOP
        DBMS_OUTPUT.PUT_LINE (idx||' '||fname(idx) );
    END LOOP;
END;
/
-- FORALL Statement With Lower & Upper Bound in Oracle Database

SET SERVEROUTPUT ON;
CREATE TABLE tut_77 (
    Mul_tab    NUMBER(5)
);
-- That is going to be our table which will hold the data. Next we will write the PL/SQL block.

DECLARE
	-- Declare the collection
    TYPE My_Array IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    col_var My_Array;
	--Declare a variable for holding the total number of records of the table
    tot_rec NUMBER;
BEGIN
    --Populate the collection
    FOR i IN 1..10 LOOP
        col_var (i) := 9*i;
    END LOOP;
    -- Write the FORALL statement.
    FORALL idx IN 1..10
        INSERT INTO tut_77 (mul_tab)
        VALUES (col_var (idx));
    --Get the total number of records from the table     
    SELECT count (*) INTO tot_rec FROM tut_77;
    DBMS_OUTPUT.PUT_LINE ('Total records inserted are '||tot_rec);
END;
/



-- FORALL Statement With INDICES-OF Bound Clause In Oracle Database

SET SERVEROUTPUT ON;
CREATE TABLE tut_78(
    mul_tab NUMBER(5)
);
-- In order to keep the demonstration easy we created a very simple table with name tut_78. This table has only one column mul_tab of NUMBER data type.

DECLARE
    TYPE my_nested_table IS TABLE OF number;
    var_nt my_nested_table := my_nested_table (9,18,27,36,45,54,63,72,81,90);
    --Another variable for holding total number of record stored into the table 
    tot_rec NUMBER;
BEGIN
    var_nt.DELETE(3, 6);
    
    FORALL idx IN INDICES OF var_nt
        INSERT INTO tut_78 (mul_tab) VALUES (var_nt(idx));
        
    SELECT COUNT (*) INTO tot_rec FROM tut_78;
    DBMS_OUTPUT.PUT_LINE ('Total records inserted are '||tot_rec);
END;
/


-- FORALL Statement With VALUES-OF Bound Clause In Oracle Database
	Example of Values-of bound clause with FORALL statement in Oracle Database:
-- Step 1: Create table
CREATE TABLE tut_79 (
    selected_data     NUMBER(5)
);
-- Step 2: Write a PL/SQL block demonstrating how to use Values-of clause with FORALL statement in Oracle Database.
SET SERVEROUTPUT ON;
DECLARE
    --Source collection
    TYPE My_NestedTable IS TABLE OF NUMBER;
    source_col My_NestedTable := My_NestedTable (9,18,27,36,45,54,63,72,81,90);
    
    --Indexing collection
    TYPE My_Array IS TABLE OF PLS_INTEGER INDEX BY PLS_INTEGER;
    index_col My_Array;
BEGIN
    --Initializing indexing collection with the index numbers.
    index_col   (1) :=  3;
    index_col   (5) :=  7;
    index_col   (12):=  8;
    index_col   (28):=  10;
    --FORALL statement 
    FORALL idx IN VALUES OF index_col
        INSERT INTO tut_79 VALUES (source_col (idx));
END;
/

-- Execute Immediate with INTO clause.
SET SERVEROUTPUT ON;
DECLARE
    sql_qry     VARCHAR2 (150);
    emp_tot     NUMBER(3);
BEGIN
    
    sql_qry:= 'SELECT count (*) FROM employees';
    EXECUTE IMMEDIATE sql_qry INTO emp_tot;
    DBMS_OUTPUT.PUT_LINE ('Total employees are: '||emp_tot);

END;
/


-- How To Run Create Table DDL With EXECUTE IMMEDIATE In Oracle Database
CREATE TABLE tut_82 (
    tut_num    NUMBER (3),
    tut_name   VARCHAR2 (50)
) 


-- Run your DDL through PL/SQL program using Execute Immediate.
-- Once you have your DDL prepared next you have to write your PL/SQL program.

SET SERVEROUTPUT ON;
DECLARE
    ddl_qry     VARCHAR2 (150);
BEGIN
    ddl_qry := 'CREATE TABLE tut_82(
                tut_num     NUMBER(3),
                tut_name    VARCHAR2(50)
                )';
    EXECUTE IMMEDIATE ddl_qry;
END;
/


-- Create Table DDL With Execute Immediate In Oracle Database Part 2
SET SERVEROUTPUT ON;
DECLARE
    ddl_qry     VARCHAR2(150);
BEGIN
ddl_qry := 'CREATE TABLE tut_83('||
                'tut_num     NUMBER(3),'||
                'tut_name    VARCHAR2(50)'||
                ')';
EXECUTE IMMEDIATE ddl_qry;
END;
/

-- ALTER & DROP Table DDL With Execute Immediate In Oracle Database
SET SERVEROUTPUT ON;
DECLARE
 ddl_qry VARCHAR2(50);
BEGIN
 ddl_qry := 'ALTER TABLE tut_83
        	 ADD  tut_date DATE';
 EXECUTE IMMEDIATE ddl_qry;
END;
/  


SET SERVEROUTPUT ON;
DECLARE
    ddl_qry     VARCHAR2 (100);
BEGIN
    ddl_qry := 'DROP TABLE tut_83';
    EXECUTE IMMEDIATE ddl_qry;
END;
/


-- Insert DML With Bind Variable: USING Clause Of Execute Immediate Statement
SET SERVEROUTPUT ON;
DECLARE
    sql_smt VARCHAR2 (150);
BEGIN
    sql_smt :=  'INSERT INTO stu_info (student_name) VALUES (:stu_name)';
    EXECUTE IMMEDIATE sql_smt USING 'Steve';
END;
/


-- Multiple Bind Variables: USING Clause With Execute Immediate Statement In Oracle Database
Set Serveroutput On;
Declare
    Sql_Smt Varchar2(150);
Begin
    Sql_Smt := 'UPDATE stu_info SET student_name = :new_name 
    WHERE student_name = :old_name ';
    Execute Immediate Sql_Smt Using 'Strange','Leo';   
End;
/


-- Bulk Collect With Execute Immediate Of Dynamic SQL In Oracle Database
-- Example of Bulk Collect Into with Execute Immediate.
SET SERVEROUTPUT ON;
DECLARE
    TYPE nt_Fname IS TABLE OF VARCHAR2 (60);
    fname nt_Fname;
    sql_qry VARCHAR2(150);
BEGIN
    sql_qry := 'SELECT first_name FROM employees';
    EXECUTE IMMEDIATE sql_qry BULK COLLECT INTO fname;
    FOR idx IN 1..fname.COUNT
        LOOP
            DBMS_OUTPUT.PUT_LINE(idx||' - '||fname(idx));
        END LOOP;
END;
/



-- Prepare the named PL/SQL block for Dynamic SQL Execution.
CREATE OR REPLACE FUNCTION circle_area (radius NUMBER) 
RETURN NUMBER IS
    pi     CONSTANT NUMBER(7,2) := 3.141;
    area   NUMBER(7,2);
BEGIN
    area := pi * ( radius * radius );
    RETURN area;
END;


-- Write the Dynamic SQL program.
SET SERVEROUTPUT ON;
DECLARE
    plsql_blk   VARCHAR2 (500);
BEGIN
    plsql_blk :='
        CREATE OR REPLACE FUNCTION circle_area (radius NUMBER) 
        RETURN NUMBER IS
            pi CONSTANT NUMBER(7,2) :=	3.141;
            area NUMBER(7,2);'||
       'BEGIN
            area := pi * (radius * radius);
            RETURN area; 
        END;';
    EXECUTE IMMEDIATE plsql_blk;
END;







