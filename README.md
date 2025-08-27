# 🚗 Full-Stack-Capstone-Backend: Vehicle Reservation App

An API backend for managing vehicle reservations, built with Ruby on Rails.


## 🐳 Docker Setup (Recommended)

1. **Build and start services:**
   ```bash
   docker compose build
   
   docker compose up

   docker compose exec backend bash
   
   // then inside the container app bash run following commands

   rails db:drop
   rails db:create
   rails db:migrate
   rails db:seed
   ```

2. **Access API documentation:**

http://127.0.0.1:3000/api-docs/index.html

2. **To run the frontend for this project, visit:**

https://github.com/bhushan354/Reservation-App-Frontend


## 🛠 Local Setup Instructions

1. **Clone the repository:**
   ```bash
   git clone git@github.com:bhushan354/Reservation-App-Backend.git
   cd Reservation-App-Backend
   ```

2. **Update database configuration:**
   - Edit `config/database.yml` with your local PostgreSQL credentials.

3. **Ensure Ruby version compatibility:**
   - Match the Ruby version in your system with the one in the `Gemfile`.

4. **Install dependencies and set up the database:**
   ```bash
   bundle install
   rails db:drop
   rails db:create
   rails db:migrate
   rails db:seed
   ```

5. **Start the Rails server:**
   ```bash
   rails server
   ```

6. **Access API documentation:**
   - Open your browser and go to:
     ```
     http://127.0.0.1:3000/api-docs/index.html
     ```
