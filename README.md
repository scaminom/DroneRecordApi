# DroneRecordApi
DroneRecordApi is an application developed in Ruby on Rails that provides an API for managing and querying drone-related records. 
The API allows filtering and retrieving detailed information about drones, drone-related data, and AC and DC charging stations, using scopes for specific queries.

## Dependencies

- Ruby 3.3.1
- Rails 7.1.3
- Postgres

## Local Development

1. Fork the project.

   ```bash
   $ git clone https://github.com/YOUR-USERNAME/DroneRecordApi.git
   $ cd DroneRecordApi
   $ git remote add upstream https://github.com/ORIGINAL-OWNER/DroneRecordApi.git
   ```
3. Setup the proyect.
   ```bash
   $ bin/setup
   ```   

2. Make sure the tests succeed.

   ```bash
   $ bundle exec rspec
   ```

1. Start the development server.

   ```bash
   $ bin/rails s
   ```

## Available Scopes for Filtering  Records
All API endpoints are under the `/api/v1` namespace.

The `FilteringsSearchQuery` class supports the following scopes for filtering records that include **Filterable** module. These scopes can be applied as query parameters in your API requests.

### 1. Filter by `drone_id`
- **Description:** Filters record by the `drone_id`.
- **Parameter:** `by_id`
- **Usage:**
  ```http
  GET /record?by_id=[drone_id]
  ```
- **Example:**
  ```http
  GET /record?by_id=1
  ```

### 2. Filter by Current Week
- **Description:** Filters record registered during the current week.
- **Parameter:** `by_week`
- **Usage:**
  ```http
  GET /record?by_week=true
  ```
- **Example:**
  ```http
  GET /record?by_week=true
  ```

### 3. Filter by Current Month
- **Description:** Filters record registered during the current month.
- **Parameter:** `by_month`
- **Usage:**
  ```http
  GET /record?by_month=true
  ```
- **Example:**
  ```http
  GET /record?by_month=true
  ```

### 4. Filter by Specific Day
- **Description:** Filters record registered on a specific day.
- **Parameter:** `by_day[date]`
- **Usage:**
  ```http
  GET /record?by_day[date]=[YYYY-MM-DD]
  ```
- **Example:**
  ```http
  GET /record?by_day[date]=2024-08-23
  ```

### 5. Filter by Most Recent
- **Description:** Returns the 5 most recent record.
- **Parameter:** `by_current`
- **Usage:**
  ```http
  GET /record?by_current=true
  ```
- **Example:**
  ```http
  GET /record?by_current=true
  ```

### 6. Filter by Personalized Date Range
- **Description:** Filters record within a specific date range.
- **Parameters:** `by_personalized[start_date]`, `by_personalized[end_date]`
- **Usage:**
  ```http
  GET /record?by_personalized[start_date]=[YYYY-MM-DD]&by_personalized[end_date]=[YYYY-MM-DD]
  ```
- **Example:**
  ```http
  GET /record?by_personalized[start_date]=2024-08-16&by_personalized[end_date]=2024-08-23
  ```

### 7. Combine Multiple Scopes
- **Description:** Combine multiple scopes to refine your search further.
- **Example:**
  - Filter by `drone_id` and Current Week:
    ```http
    GET /record?by_id=1&by_week=true
    ```
  - **Example:**
    ```http
    GET /ac_charging_stations?unknown_param=value
    ```

