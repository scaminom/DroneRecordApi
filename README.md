# Rails API Documentation

This documentation provides a brief overview of the available routes and how to use them.

## Authentication

### User Authentication

- **Login:** `POST /auth/login`
- **Logout:** `DELETE /auth/logout`
- **Signup:** `POST /auth/signup`

## API Endpoints

All API endpoints are under the `/api/v1` namespace.

### 1. Users

- **Index:** `GET /api/v1/users`  
  - Retrieve a list of users.

### 2. Drones

- **Index:** `GET /api/v1/drones`
- **Show:** `GET /api/v1/drones/:id`
- **Create:** `POST /api/v1/drones`
- **Update:** `PUT /api/v1/drones/:id`
- **Destroy:** `DELETE /api/v1/drones/:id`

### 3. Solar Panels

- **Index:** `GET /api/v1/solar_panels`  
  - Retrieve a list of solar panels.  
  - **Supported Scopes:**
    - `drone_id`: Filter by the associated drone ID.
    - `by_week`: Filter by the current week.
    - `by_month`: Filter by the current month.
    - `by_day[date]=YYYY-MM-DD`: Filter by a specific day (you **must** pass a date).
    - `by_current`: Retrieve the most recent 5 records.
    - `by_personalized[start_date]=YYYY-MM-DD&by_personalized[end_date]=YYYY-MM-DD`: Filter by a custom date range.

### 4. DC Charging Stations

- **Index:** `GET /api/v1/dc_charging_stations`  
  - Retrieve a list of DC charging stations.  
  - **Supported Scopes:**
    - `drone_id`: Filter by the associated drone ID.
    - `by_week`: Filter by the current week.
    - `by_month`: Filter by the current month.
    - `by_day[date]=YYYY-MM-DD`: Filter by a specific day (you **must** pass a date).
    - `by_current`: Retrieve the most recent 5 records.
    - `by_personalized[start_date]=YYYY-MM-DD&by_personalized[end_date]=YYYY-MM-DD`: Filter by a custom date range.

### 5. AC Charging Stations

- **Index:** `GET /api/v1/ac_charging_stations`  
  - Retrieve a list of AC charging stations.  
  - **Supported Scopes:**
    - `drone_id`: Filter by the associated drone ID.
    - `by_week`: Filter by the current week.
    - `by_month`: Filter by the current month.
    - `by_day[date]=YYYY-MM-DD`: Filter by a specific day (you **must** pass a date).
    - `by_current`: Retrieve the most recent 5 records.
    - `by_personalized[start_date]=YYYY-MM-DD&by_personalized[end_date]=YYYY-MM-DD`: Filter by a custom date range.

### 6. UAV Data (`DatosUAVs`)

- **Index:** `GET /api/v1/datos_uavs`  
  - Retrieve a list of UAV data.  
  - **Supported Scopes:**
    - `drone_id`: Filter by the associated drone ID.
    - `by_week`: Filter by the current week.
    - `by_month`: Filter by the current month.
    - `by_day[date]=YYYY-MM-DD`: Filter by a specific day (you **must** pass a date).
    - `by_current`: Retrieve the most recent 5 records.
    - `by_personalized[start_date]=YYYY-MM-DD&by_personalized[end_date]=YYYY-MM-DD`: Filter by a custom date range.

## Error Handling

- **No Route Found:**  
  - `ANY *unmatched` returns a `404 Not Found` error.
