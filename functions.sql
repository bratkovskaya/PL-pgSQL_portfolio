-- ====================================================================
1. Write a PostgreSQL function that returns the string "Hello, PostgreSQL!" when called.
-- ====================================================================
CREATE OR REPLACE FUNCTION say()
RETURNS text
LANGUAGE plpgsql
AS $$
BEGIN 
    RETURN 'Hello, PostgreSQL!';	
END;
$$;

-- ====================================================================
2. Write a PostgreSQL function that always returns the current database name.
-- ====================================================================
CREATE OR REPLACE FUNCTION curr_data()
RETURNS text
LANGUAGE plpgsql
AS $$
BEGIN 
    RETURN current_database();
END;
$$;

-- ====================================================================
3. Write a PostgreSQL function that returns the sum of two hardcoded numbers (e.g., 15 and 25) without taking any input.
-- ====================================================================
CREATE OR REPLACE FUNCTION calc()
RETURNS integer 
LANGUAGE plpgsql
AS $$
DECLARE 
    number1 integer := 25;
    number2 integer :=15;
    result_sum integer;
BEGIN 
    result_sum = number1 + number2;
    RETURN result_sum;
END;
$$;

-- ====================================================================
4. Write a PostgreSQL function that takes an integer as input and returns its square.
-- ====================================================================
CREATE OR REPLACE FUNCTION calc(input_numb integer)
RETURNS integer
LANGUAGE plpgsql
AS $$
DECLARE 
    number_kv integer;
BEGIN
    number_kv = input_numb * input_numb;
    RETURN number_kv;
END;
$$;

-- ====================================================================
5. Write a PostgreSQL function that returns the cube of a given number.
-- ====================================================================
CREATE OR REPLACE FUNCTION calc_cub(numb integer)
RETURNS integer
LANGUAGE plpgsql
AS $$
DECLARE 
    res integer;
BEGIN 
    res = numb * numb * numb;
    RETURN res;
END;
$$;

-- ====================================================================
6. Write a PostgreSQL function that calculates the absolute difference between two integers.
-- ====================================================================
CREATE OR REPLACE FUNCTION calc_dif(numb1 integer, numb2 integer)
RETURNS integer 
LANGUAGE plpgsql
AS $$
DECLARE
    res integer;
BEGIN 
    res = abs(numb1 - numb2);
    RETURN res;
END;
$$;

-- ====================================================================
7. Write a PostgreSQL function that squares a number only if it is even, otherwise returns -1.
-- ====================================================================
CREATE OR REPLACE FUNCTION calc_if(num integer)
RETURNS integer
LANGUAGE plpgsql
AS $$
BEGIN 
    IF num % 2 = 0 THEN 
        RETURN num * num;
    ELSE 
        RETURN -1;  
    END IF;
END;
$$;

-- ====================================================================
8. Write a PostgreSQL function that returns the square root of a number rounded to two decimal places.
-- ====================================================================
CREATE OR REPLACE FUNCTION cal_sqrt(num integer)
RETURNS numeric
LANGUAGE plpgsql
AS $$
BEGIN 
    RETURN round(sqrt(num)::numeric,2);
END;
$$;

-- ====================================================================
9. Write a PostgreSQL function that concatenates an employee’s first name and last name from the Employees table.
-- ====================================================================
CREATE OR REPLACE FUNCTION full_n(empl_id integer)
RETURNS VARCHAR(50)
LANGUAGE plpgsql
AS $$
DECLARE 
    full_name VARCHAR(50);
BEGIN 
    SELECT concat(name,' ',surname) 
    INTO full_name 
    FROM employees 
    WHERE id = empl_id;
    RETURN full_name;
END;
$$;

-- ====================================================================
10. Write a PostgreSQL function that calculates the total monthly payroll for a given department.
-- ====================================================================
CREATE OR REPLACE FUNCTION get_dept_payroll(dept_id INTEGER)
RETURNS NUMERIC
LANGUAGE plpgsql    
AS $$
DECLARE
    total_payroll NUMERIC;
BEGIN
    SELECT COALESCE(SUM(salary), 0)
    INTO total_payroll
    FROM employees
    WHERE department = dept_id;

    RETURN total_payroll;
END;
$$;

