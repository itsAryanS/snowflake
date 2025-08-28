# Snowflake SQL Practice

This repository contains my practice with **Snowflake SQL** commands, covering both basic and advanced features.

---

## 📂 Current Files Included

### 1. `fileformat.sql`
Covers working with **JSON data** in Snowflake:
- Creating an external stage pointing to an S3 bucket.
- Defining a JSON file format.
- Creating a database (`JSON_DB`) and table (`JSON_RAW`) with `VARIANT` type.
- Copying JSON data into Snowflake from external stage.
- Querying JSON data using:
  - Dot and colon notation (`RAW_FILE:city`, `$1:first_name`).
  - Type casting (`::string`, `::int`).
- Extracting nested JSON fields (`RAW_FILE:job.salary`, `RAW_FILE:prev_company[0]`).
- Flattening arrays (e.g., `spoken_languages`) into rows with `table(flatten(...))`.

### 2. `stage&copy.sql`
Covers **staging and copying CSV data** in Snowflake:
- Creating a database and schema for external stages.
- Creating a stage (`AWS_STAGE`) pointing to an S3 bucket.
- Describing and listing files in the stage.
- Creating tables for storing order details (`orders`, `ordersx`, `orderspro`).
- Copying data from stage to Snowflake tables using `COPY INTO`.
- Selecting specific columns from staged files (`s.$1`, `s.$5`).
- Using transformations while copying:
  - Adding a **calculated profitability column** with `CASE WHEN` logic.

---

## 🚀 Key Concepts Practiced
- **Stages**: External stages referencing AWS S3.
- **File Formats**: JSON and CSV parsing.
- **Copy Command**: Loading structured/unstructured data into Snowflake.
- **VARIANT Type**: Storing semi-structured data.
- **Flatten Function**: Handling arrays within JSON.
- **Transformations on Load**: Conditional logic inside `COPY INTO`.

---

## 📖 Usage
1. Clone the repo:
   ```bash
   git clone https://github.com/itsAryanS/snowflake.git
