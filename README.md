<p align="center">
<img src="https://github.com/user-attachments/assets/5853a68d-df2d-4433-88c6-1ee7d9317bd7" width="300" height="300"/>
</p>

# DroneRecordApi

**DroneRecordApi** is an application developed in Ruby on Rails that provides a comprehensive API for managing and querying drone-related records. The API enables filtering and retrieval of detailed information about drones, drone-related data, and both AC and DC charging stations. The application leverages Rails scopes to facilitate specific, efficient queries.

## Dependencies

- **Ruby**: 3.3.1
- **Rails**: 7.1.3
- **Postgres**: (Ensure that Postgres is installed and running)

## Local Development

### 1. Fork and Clone the Project

   Fork the project repository to your own GitHub account, then clone it locally:

   ```bash
   git clone https://github.com/YOUR-USERNAME/DroneRecordApi.git
   cd DroneRecordApi
   git remote add upstream https://github.com/ORIGINAL-OWNER/DroneRecordApi.git
   ```

### 2. Setup the Project

   Run the setup script to install dependencies and prepare the database:

   ```bash
   bin/setup
   ```

### 3. Run the Tests

   Ensure that all tests pass before starting development:

   ```bash
   bundle exec rspec
   ```

### 4. Start the Development Server

   Launch the Rails development server:

   ```bash
   bin/rails s
   ```

## Available Scopes for Filtering Records

All API endpoints are under the `/api/v1` namespace. The `FilteringsSearchQuery` class supports the following scopes for filtering records that include the **Filterable** module. These scopes can be applied as query parameters in your API requests.

### 1. Filter by `drone_id`

- **Description:** Filters records by the `drone_id`.
- **Parameter:** `by_id`
- **Usage:**
  ```http
  GET /api/v1/records?by_id=[drone_id]
  ```
- **Example:**
  ```http
  GET /api/v1/records?by_id=1
  ```

### 2. Filter by Current Week

- **Description:** Filters records registered during the current week.
- **Parameter:** `by_week`
- **Usage:**
  ```http
  GET /api/v1/records?by_week=true
  ```
- **Example:**
  ```http
  GET /api/v1/records?by_week=true
  ```

### 3. Filter by Current Month

- **Description:** Filters records registered during the current month.
- **Parameter:** `by_month`
- **Usage:**
  ```http
  GET /api/v1/records?by_month=true
  ```
- **Example:**
  ```http
  GET /api/v1/records?by_month=true
  ```

### 4. Filter by Specific Day

- **Description:** Filters records registered on a specific day.
- **Parameter:** `by_day[date]`
- **Usage:**
  ```http
  GET /api/v1/records?by_day[date]=[YYYY-MM-DD]
  ```
- **Example:**
  ```http
  GET /api/v1/records?by_day[date]=2024-08-23
  ```

### 5. Filter by Most Recent

- **Description:** Returns the 5 most recent records.
- **Parameter:** `by_current`
- **Usage:**
  ```http
  GET /api/v1/records?by_current=true
  ```
- **Example:**
  ```http
  GET /api/v1/records?by_current=true
  ```

### 6. Filter by Personalized Date Range

- **Description:** Filters records within a specific date range.
- **Parameters:** `by_personalized[start_date]`, `by_personalized[end_date]`
- **Usage:**
  ```http
  GET /api/v1/records?by_personalized[start_date]=[YYYY-MM-DD]&by_personalized[end_date]=[YYYY-MM-DD]
  ```
- **Example:**
  ```http
  GET /api/v1/records?by_personalized[start_date]=2024-08-16&by_personalized[end_date]=2024-08-23
  ```

### 7. Combine Multiple Scopes

- **Description:** Combine multiple scopes to refine your search further.
- **Example:**
  - Filter by `drone_id` and Current Week:
    ```http
    GET /api/v1/records?by_id=1&by_week=true
    ```

## Error Handling

- **Description:** If you provide an unknown parameter, the API will ignore it and return results for recognized parameters.
- **Example:**
  ```http
  GET /api/v1/records?unknown_param=value
  ```
