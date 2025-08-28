CREATE OR REPLACE STAGE MANAGE_DB.EXTERNAL_STAGES.JSONSTAGE
    url='s3://bucketsnowflake-jsondemo';

CREATE FILE FORMAT MANAGE_DB.FILE_FORMATS.JSONFORMAT
    TYPE= JSON;

CREATE DATABASE JSON_DB

CREATE OR REPLACE TABLE JSON_DB.PUBLIC.JSON_RAW(
RAW_FILE VARIANT);

COPY INTO JSON_DB.PUBLIC.JSON_RAW
FROM @MANAGE_DB.EXTERNAL_STAGES.JSONSTAGE
FILE_FORMAT=(type=json)
FILES=('HR_data.json');


select * from JSON_DB.PUBLIC.JSON_RAW
select  RAW_FILE:city, RAW_FILE:first_name from JSON_DB.PUBLIC.JSON_RAW

select  RAW_FILE:city CITY, RAW_FILE:first_name FIRSTNAME from JSON_DB.PUBLIC.JSON_RAW
select  $1:city CITY, $1:first_name:: string FIRSTNAME from JSON_DB.PUBLIC.JSON_RAW

SELECT
    RAW_FILE:id::int as id,
    RAW_FILE:first_name:: string as firstname,
    $1:last_name::string as lastname,
    $1:gender::string as gender,
FROM JSON_DB.PUBLIC.JSON_RAW;

SELECT RAW_FILE:job.salary as Job_salary, RAW_FILE:job.title as jobs from JSON_DB.PUBLIC.JSON_RAW

SELECT
RAW_FILE: prev_company[0]:: string as prevcompany
from JSON_DB.PUBLIC.JSON_RAW


select
RAW_FILE:spoken_languages as spoken_languages
from JSON_DB.PUBLIC.JSON_RAW

CREATE OR REPLACE TABLE LANGUAGE AS
SELECT
    RAW_FILE:first_name::string as firstname,
    f.value:language:: string as language,
    f.value:level:: string as level
from JSON_DB.PUBLIC.JSON_RAW, table(flatten(RAW_FILE:spoken_languages)) as f

select * from language
