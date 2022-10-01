--Ejercicio 1
SET SERVEROUTPUT ON

DECLARE
    nombre      varchar2(10) := 'alberto';
    apellido1   varchar2(10) := 'pérez';
    apellido2   varchar2(10) := 'Gracía';
BEGIN
    
   DBMS_OUTPUT.PUT_LINE( upper(substr(nombre, 1,1))||'.'|| upper(substr(apellido1, 1,1))||'.'|| upper(substr(apellido2, 1,1)));

END;



--Ejercicio 2
SET SERVEROUTPUT ON

DECLARE
    numero NUMBER := 7;
   
BEGIN
   
   IF
        MOD(numero,2) = 0
    THEN
        DBMS_OUTPUT.PUT_LINE('El numero es par');
    ELSE
        DBMS_OUTPUT.PUT_LINE('El numero es impar');
    END IF;
   

END;


--Ejercicio 3
SET SERVEROUTPUT ON
DECLARE
    sal_max number;
BEGIN
   SELECT MAX(SALARY) INTO sal_max
   FROM EMPLOYEES WHERE DEPARTMENT_ID=100;
   DBMS_OUTPUT.PUT_LINE(sal_max);    

END;

--Ejercicio 4

SET SERVEROUTPUT ON
DECLARE
  DEPARTMENTID DEPARTMENTS.DEPARTMENT_ID%type;
  nombre_department varchar2(20);
  n_empleados number;
  
BEGIN
   DEPARTMENTID:=10;
   SELECT DEPARTMENT_NAME INTO nombre_department
   FROM DEPARTMENTS WHERE DEPARTMENT_ID=DEPARTMENTID;

   SELECT count(EMPLOYEE_ID) INTO n_empleados
   FROM EMPLOYEES WHERE DEPARTMENT_ID=DEPARTMENTID;   
   
   
   DBMS_OUTPUT.PUT_LINE(n_empleados);
   DBMS_OUTPUT.PUT_LINE(nombre_department);
      
END;




--Ejercicio 5


SET SERVEROUTPUT ON
DECLARE
    sal_max integer;
    sal_min integer;
    dif integer;
BEGIN
   SELECT MAX(SALARY) INTO sal_max
   FROM EMPLOYEES ;
   
   SELECT MIN(SALARY) INTO sal_min
   FROM EMPLOYEES;
   dif:=sal_max-sal_min;
   DBMS_OUTPUT.PUT_LINE(dif);    

END;


