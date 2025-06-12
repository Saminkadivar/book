-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 11, 2025 at 01:09 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mini_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE admin (
  id SERIAL PRIMARY KEY,
  email VARCHAR(50) NOT NULL,
  password VARCHAR(255) NOT NULL,
  name VARCHAR(100) NOT NULL,
  role VARCHAR(30) CHECK (role IN ('Super Admin','Admin','manager')) DEFAULT 'Admin',
  created_at TIMESTAMP NOT NULL DEFAULT current_timestamp
);

-- --------------------------------------------------------

--
-- Table structure for table `books`
--
CREATE TABLE books (
  id SERIAL PRIMARY KEY,
  category_id INTEGER NOT NULL,
  ISBN VARCHAR(20) NOT NULL,
  name VARCHAR(255) NOT NULL,
  img VARCHAR(255) NOT NULL,
  author VARCHAR(75) NOT NULL,
  mrp INTEGER NOT NULL,
  security INTEGER NOT NULL,
  rent INTEGER NOT NULL,
  qty INTEGER NOT NULL,
  best_seller INTEGER,
  short_desc VARCHAR(2000) NOT NULL,
  description TEXT NOT NULL,
  status SMALLINT NOT NULL DEFAULT 1,
  price INTEGER GENERATED ALWAYS AS (coalesce(security, 0) + coalesce(rent, 0)) STORED,
  UNIQUE (ISBN)
);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE categories (
  id SERIAL PRIMARY KEY,
  category VARCHAR(50) NOT NULL,
  status SMALLINT NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--
CREATE TABLE contact_us (
  id SERIAL PRIMARY KEY,
  name VARCHAR(70) NOT NULL,
  email VARCHAR(70) NOT NULL,
  mobile VARCHAR(15),
  message TEXT NOT NULL,
  date TIMESTAMP
);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL,
  book_id INTEGER NOT NULL,
  address VARCHAR(100) NOT NULL,
  address2 VARCHAR(100),
  pin INTEGER NOT NULL,
  payment_method VARCHAR(20),
  total INTEGER NOT NULL,
  payment_status VARCHAR(20) NOT NULL,
  order_status INTEGER NOT NULL,
  date TIMESTAMP NOT NULL,
  duration INTEGER NOT NULL,
  transaction_id VARCHAR(50),
  deposit_refunded VARCHAR(30) CHECK (deposit_refunded IN ('pending', 'processing', 'completed')) DEFAULT 'pending',
  payment_id VARCHAR(255)
);

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE order_detail (
  id SERIAL PRIMARY KEY,
  order_id INTEGER NOT NULL,
  book_id INTEGER NOT NULL,
  price DOUBLE PRECISION NOT NULL,
  time INTEGER NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--
CREATE TABLE order_status (
  id SERIAL PRIMARY KEY,
  status_name VARCHAR(15) NOT NULL UNIQUE
);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE password_resets (
  id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL,
  token VARCHAR(100) NOT NULL UNIQUE,
  expiration INTEGER NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table `rental_returns`
--

CREATE TABLE rental_returns (
  id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL,
  book_id INTEGER NOT NULL,
  order_id INTEGER NOT NULL,
  return_date DATE NOT NULL,
  condition_status VARCHAR(30) CHECK (condition_status IN ('Good', 'Damaged', 'Lost')) DEFAULT 'Good',
  late_fee DECIMAL(10,2) DEFAULT 0.00,
  security_deposit_refund DECIMAL(10,2) DEFAULT 0.00,
  status VARCHAR(30) CHECK (status IN ('Pending', 'Approved', 'Rejected')) DEFAULT 'Pending',
  created_at TIMESTAMP NOT NULL DEFAULT current_timestamp,
  refund_id VARCHAR(255)
);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(80) NOT NULL,
  email VARCHAR(50) NOT NULL,
  mobile VARCHAR(15),
  doj TIMESTAMP NOT NULL,
  password VARCHAR(255) NOT NULL
);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE admin ADD PRIMARY KEY (id);

--
-- Indexes for table `books`
-- ✅ Only if not already defined
ALTER TABLE books ADD PRIMARY KEY (id); -- or use SERIAL in CREATE TABLE
ALTER TABLE books ADD CONSTRAINT isbn_unique UNIQUE (ISBN);

--
-- Indexes for table `categories`
--
ALTER TABLE categories
  ADD PRIMARY KEY (id);

--
-- Indexes for table `contact_us`
--
ALTER TABLE contact_us
  ADD PRIMARY KEY (id);

--
-- Indexes for table `orders`
--
ALTER TABLE orders
  ADD PRIMARY KEY (id);

--
-- Indexes for table `order_detail`
--
ALTER TABLE order_detail
  ADD PRIMARY KEY (id);

--
-- Indexes for table `order_status`
ALTER TABLE order_status
  ADD PRIMARY KEY (id),
  ADD CONSTRAINT order_status_name_uindex UNIQUE (status_name);

--
-- Indexes for table `password_resets`
--
-- Add primary key (if not already set in CREATE TABLE)
ALTER TABLE password_resets
  ADD PRIMARY KEY (id);

-- Add unique constraint on token
ALTER TABLE password_resets
  ADD CONSTRAINT password_token_unique UNIQUE (token);

-- Add index on user_id (for performance, not a constraint)
CREATE INDEX idx_password_user ON password_resets(user_id);

--
-- Indexes for table `rental_returns`
ALTER TABLE rental_returns
  ADD PRIMARY KEY (id);
  ALTER TABLE rental_returns
  ADD CONSTRAINT fk_rental_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  ADD CONSTRAINT fk_rental_book FOREIGN KEY (book_id) REFERENCES books(id) ON DELETE CASCADE,
  ADD CONSTRAINT fk_rental_order FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE;

--
-- Indexes for table `users`
--
ALTER TABLE users
  ADD PRIMARY KEY (id);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_status`
--
ALTER TABLE `order_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rental_returns`
--
ALTER TABLE `rental_returns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
-- Only if you didn't use SERIAL in CREATE TABLE
CREATE SEQUENCE users_id_seq;
ALTER TABLE users ALTER COLUMN id SET DEFAULT nextval('users_id_seq');
SELECT setval('users_id_seq', (SELECT MAX(id) FROM users));

-- Constraints for dumped tables
--

--
-- Constraints for table `password_resets`
--
ALTER TABLE password_resets
  ADD CONSTRAINT fk_password_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE;

--
-- Constraints for table `rental_returns`
--
ALTER TABLE rental_returns
  ADD CONSTRAINT fk_rental_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  ADD CONSTRAINT fk_rental_book FOREIGN KEY (book_id) REFERENCES books(id) ON DELETE CASCADE,
  ADD CONSTRAINT fk_rental_order FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
