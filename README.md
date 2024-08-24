# Rails API Documentation

## Authentication

### User Authentication

- **Login:** `POST /auth/login`
- **Logout:** `DELETE /auth/logout`
- **Signup:** `POST /auth/signup`

## API Endpoints

All API endpoints are under the `/api/v1` namespace.

## Available Scopes for Filtering  Records

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

### Error Handling
- **Invalid Scope:**
  - **Description:** If no valid scope is provided, the system will raise an `ArgumentError`.
  - **Example:**
    ```http
    GET /ac_charging_stations?unknown_param=value
    ```

