
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE DeliveryStatusHistories;
TRUNCATE TABLE FoodDeliveries;
TRUNCATE TABLE MatchedFoods;
TRUNCATE TABLE NeededFoods;
TRUNCATE TABLE Foods;
SET FOREIGN_KEY_CHECKS = 1;


INSERT INTO Users (EmailID, Username, password, role, city)
VALUES 
    ('abc@gmail.com', 'Tanmay Patel (Donor)', 'AQAAAAIAAYagAAAAEMeOMPuFZOYIT/yPdadIfQQ3l/YghrYr8FeJLWk8XBxtILwQNj5vqpmdB+SDSUVOYA==', 'Donor', 'Ahmedabad'),
    ('pqr@gmail.com', 'PQR Seva Trust (Receiver)', 'AQAAAAIAAYagAAAAEMeOMPuFZOYIT/yPdadIfQQ3l/YghrYr8FeJLWk8XBxtILwQNj5vqpmdB+SDSUVOYA==', 'Receiver', 'Ahmedabad'),
    ('transporter@gmail.com', 'Amit Patel (Transporter)', 'AQAAAAIAAYagAAAAEMeOMPuFZOYIT/yPdadIfQQ3l/YghrYr8FeJLWk8XBxtILwQNj5vqpmdB+SDSUVOYA==', 'Transporter', 'Ahmedabad')
ON DUPLICATE KEY UPDATE password='AQAAAAIAAYagAAAAEMeOMPuFZOYIT/yPdadIfQQ3l/YghrYr8FeJLWk8XBxtILwQNj5vqpmdB+SDSUVOYA==';


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 35, 'Fresh Vegetable Dum Biryani & Raita', '["Veg Biryani", "Mint Raita", "Papad"]', '2026-09-26 02:00:00', 'pending', 'Near Vaishnodevi Circle, SG Highway', 'Ahmedabad', 'Gujarat', 'Shivalik Business Hub');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 30, '2026-09-26 02:00:00', 'pending', 'Seva Relief Center Ahmedabad #1, Near Vaishnodevi Circle, SG Highway', 'Ahmedabad', 'Gujarat', 'Shivalik Business Hub');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 60, 'Dal Makhani with Jeera Basmati Rice', '["Dal Makhani", "Jeera Rice", "Sirka Pyaz"]', '2026-09-26 02:30:00', 'pending', 'Opposite Iscon Mega Mall, SG Highway', 'Ahmedabad', 'Gujarat', 'Iscon Cross Roads');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 30, '2026-09-26 02:30:00', 'pending', 'Seva Relief Center Ahmedabad #2, Opposite Iscon Mega Mall, SG Highway', 'Ahmedabad', 'Gujarat', 'Iscon Cross Roads');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 50, 'Traditional Gujarati Thali Meal Packs', '["Rotli (4 pcs)", "Gujarati Dal", "Shaak", "Rice"]', '2026-09-26 03:00:00', 'pending', 'Navrangpura Main Road', 'Ahmedabad', 'Gujarat', 'Commerce Six Roads');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 45, '2026-09-26 03:00:00', 'pending', 'Seva Relief Center Ahmedabad #3, Navrangpura Main Road', 'Ahmedabad', 'Gujarat', 'Commerce Six Roads');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 80, 'Paneer Butter Masala with Butter Naan', '["Paneer Butter Masala", "Butter Naan (2 pcs)"]', '2026-09-26 03:30:00', 'pending', 'Prahlad Nagar Corporate Road', 'Ahmedabad', 'Gujarat', 'Venus Atlantis');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 50, '2026-09-26 03:30:00', 'pending', 'Seva Relief Center Ahmedabad #4, Prahlad Nagar Corporate Road', 'Ahmedabad', 'Gujarat', 'Venus Atlantis');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 40, 'Amritsari Chole Bhature with Pickled Onions', '["Chole Gravy", "Bhature (2 pcs)", "Pickle"]', '2026-09-26 04:00:00', 'pending', 'Near Gota Flyover, SG Highway', 'Ahmedabad', 'Gujarat', 'Gota Chowkdi');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 40, '2026-09-26 04:00:00', 'pending', 'Seva Relief Center Ahmedabad #5, Near Gota Flyover, SG Highway', 'Ahmedabad', 'Gujarat', 'Gota Chowkdi');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 75, 'South Indian Idli Vada Sambar Combo', '["Idli (3 pcs)", "Medu Vada (2 pcs)", "Sambar"]', '2026-09-26 04:30:00', 'pending', 'Near Vaishnodevi Circle, SG Highway', 'Ahmedabad', 'Gujarat', 'Shivalik Business Hub');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 40, '2026-09-26 04:30:00', 'pending', 'Seva Relief Center Ahmedabad #6, Near Vaishnodevi Circle, SG Highway', 'Ahmedabad', 'Gujarat', 'Shivalik Business Hub');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 45, 'Khaman Dhokla & Khandvi Snack Box', '["Khaman Dhokla", "Khandvi Rolls", "Chutney"]', '2026-09-26 05:00:00', 'pending', 'Opposite Iscon Mega Mall, SG Highway', 'Ahmedabad', 'Gujarat', 'Iscon Cross Roads');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 40, '2026-09-26 05:00:00', 'pending', 'Seva Relief Center Ahmedabad #7, Opposite Iscon Mega Mall, SG Highway', 'Ahmedabad', 'Gujarat', 'Iscon Cross Roads');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 100, 'Mumbai Style Butter Pav Bhaji', '["Pav Bhaji Gravy", "Butter Pav (4 pcs)", "Onions"]', '2026-09-26 05:30:00', 'pending', 'Navrangpura Main Road', 'Ahmedabad', 'Gujarat', 'Commerce Six Roads');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 60, '2026-09-26 05:30:00', 'pending', 'Seva Relief Center Ahmedabad #8, Navrangpura Main Road', 'Ahmedabad', 'Gujarat', 'Commerce Six Roads');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 55, 'Punjabi Rajma Masala with Basmati Rice', '["Rajma Curry", "Basmati Rice", "Papad"]', '2026-09-26 06:00:00', 'pending', 'Prahlad Nagar Corporate Road', 'Ahmedabad', 'Gujarat', 'Venus Atlantis');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 50, '2026-09-26 06:00:00', 'pending', 'Seva Relief Center Ahmedabad #9, Prahlad Nagar Corporate Road', 'Ahmedabad', 'Gujarat', 'Venus Atlantis');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 90, 'Nutritious Moong Dal Khichdi & Kadhi', '["Khichdi", "Gujarati Kadhi", "Papad"]', '2026-09-26 06:30:00', 'pending', 'Near Gota Flyover, SG Highway', 'Ahmedabad', 'Gujarat', 'Gota Chowkdi');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 50, '2026-09-26 06:30:00', 'pending', 'Seva Relief Center Ahmedabad #10, Near Gota Flyover, SG Highway', 'Ahmedabad', 'Gujarat', 'Gota Chowkdi');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 35, 'Fresh Vegetable Dum Biryani & Raita', '["Veg Biryani", "Mint Raita", "Papad"]', '2026-09-26 07:00:00', 'pending', 'Near Vaishnodevi Circle, SG Highway', 'Ahmedabad', 'Gujarat', 'Shivalik Business Hub');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 30, '2026-09-26 07:00:00', 'pending', 'Seva Relief Center Ahmedabad #11, Near Vaishnodevi Circle, SG Highway', 'Ahmedabad', 'Gujarat', 'Shivalik Business Hub');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 60, 'Dal Makhani with Jeera Basmati Rice', '["Dal Makhani", "Jeera Rice", "Sirka Pyaz"]', '2026-09-26 07:30:00', 'pending', 'Opposite Iscon Mega Mall, SG Highway', 'Ahmedabad', 'Gujarat', 'Iscon Cross Roads');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 30, '2026-09-26 07:30:00', 'pending', 'Seva Relief Center Ahmedabad #12, Opposite Iscon Mega Mall, SG Highway', 'Ahmedabad', 'Gujarat', 'Iscon Cross Roads');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 50, 'Traditional Gujarati Thali Meal Packs', '["Rotli (4 pcs)", "Gujarati Dal", "Shaak", "Rice"]', '2026-09-26 08:00:00', 'pending', 'Navrangpura Main Road', 'Ahmedabad', 'Gujarat', 'Commerce Six Roads');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 45, '2026-09-26 08:00:00', 'pending', 'Seva Relief Center Ahmedabad #13, Navrangpura Main Road', 'Ahmedabad', 'Gujarat', 'Commerce Six Roads');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 80, 'Paneer Butter Masala with Butter Naan', '["Paneer Butter Masala", "Butter Naan (2 pcs)"]', '2026-09-26 08:30:00', 'pending', 'Prahlad Nagar Corporate Road', 'Ahmedabad', 'Gujarat', 'Venus Atlantis');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 50, '2026-09-26 08:30:00', 'pending', 'Seva Relief Center Ahmedabad #14, Prahlad Nagar Corporate Road', 'Ahmedabad', 'Gujarat', 'Venus Atlantis');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 40, 'Amritsari Chole Bhature with Pickled Onions', '["Chole Gravy", "Bhature (2 pcs)", "Pickle"]', '2026-09-26 09:00:00', 'pending', 'Near Gota Flyover, SG Highway', 'Ahmedabad', 'Gujarat', 'Gota Chowkdi');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 40, '2026-09-26 09:00:00', 'pending', 'Seva Relief Center Ahmedabad #15, Near Gota Flyover, SG Highway', 'Ahmedabad', 'Gujarat', 'Gota Chowkdi');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 75, 'South Indian Idli Vada Sambar Combo', '["Idli (3 pcs)", "Medu Vada (2 pcs)", "Sambar"]', '2026-09-26 09:30:00', 'pending', 'Near Vaishnodevi Circle, SG Highway', 'Ahmedabad', 'Gujarat', 'Shivalik Business Hub');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 40, '2026-09-26 09:30:00', 'pending', 'Seva Relief Center Ahmedabad #16, Near Vaishnodevi Circle, SG Highway', 'Ahmedabad', 'Gujarat', 'Shivalik Business Hub');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 45, 'Khaman Dhokla & Khandvi Snack Box', '["Khaman Dhokla", "Khandvi Rolls", "Chutney"]', '2026-09-26 10:00:00', 'pending', 'Opposite Iscon Mega Mall, SG Highway', 'Ahmedabad', 'Gujarat', 'Iscon Cross Roads');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 40, '2026-09-26 10:00:00', 'pending', 'Seva Relief Center Ahmedabad #17, Opposite Iscon Mega Mall, SG Highway', 'Ahmedabad', 'Gujarat', 'Iscon Cross Roads');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 100, 'Mumbai Style Butter Pav Bhaji', '["Pav Bhaji Gravy", "Butter Pav (4 pcs)", "Onions"]', '2026-09-26 10:30:00', 'pending', 'Navrangpura Main Road', 'Ahmedabad', 'Gujarat', 'Commerce Six Roads');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 60, '2026-09-26 10:30:00', 'pending', 'Seva Relief Center Ahmedabad #18, Navrangpura Main Road', 'Ahmedabad', 'Gujarat', 'Commerce Six Roads');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 55, 'Punjabi Rajma Masala with Basmati Rice', '["Rajma Curry", "Basmati Rice", "Papad"]', '2026-09-26 11:00:00', 'pending', 'Prahlad Nagar Corporate Road', 'Ahmedabad', 'Gujarat', 'Venus Atlantis');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 50, '2026-09-26 11:00:00', 'pending', 'Seva Relief Center Ahmedabad #19, Prahlad Nagar Corporate Road', 'Ahmedabad', 'Gujarat', 'Venus Atlantis');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 90, 'Nutritious Moong Dal Khichdi & Kadhi', '["Khichdi", "Gujarati Kadhi", "Papad"]', '2026-09-26 11:30:00', 'pending', 'Near Gota Flyover, SG Highway', 'Ahmedabad', 'Gujarat', 'Gota Chowkdi');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 50, '2026-09-26 11:30:00', 'pending', 'Seva Relief Center Ahmedabad #20, Near Gota Flyover, SG Highway', 'Ahmedabad', 'Gujarat', 'Gota Chowkdi');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 35, 'Fresh Vegetable Dum Biryani & Raita', '["Veg Biryani", "Mint Raita", "Papad"]', '2026-09-26 12:00:00', 'pending', 'Near Vaishnodevi Circle, SG Highway', 'Ahmedabad', 'Gujarat', 'Shivalik Business Hub');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 30, '2026-09-26 12:00:00', 'pending', 'Seva Relief Center Ahmedabad #21, Near Vaishnodevi Circle, SG Highway', 'Ahmedabad', 'Gujarat', 'Shivalik Business Hub');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 60, 'Dal Makhani with Jeera Basmati Rice', '["Dal Makhani", "Jeera Rice", "Sirka Pyaz"]', '2026-09-26 12:30:00', 'pending', 'Opposite Iscon Mega Mall, SG Highway', 'Ahmedabad', 'Gujarat', 'Iscon Cross Roads');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 30, '2026-09-26 12:30:00', 'pending', 'Seva Relief Center Ahmedabad #22, Opposite Iscon Mega Mall, SG Highway', 'Ahmedabad', 'Gujarat', 'Iscon Cross Roads');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 50, 'Traditional Gujarati Thali Meal Packs', '["Rotli (4 pcs)", "Gujarati Dal", "Shaak", "Rice"]', '2026-09-26 13:00:00', 'pending', 'Navrangpura Main Road', 'Ahmedabad', 'Gujarat', 'Commerce Six Roads');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 45, '2026-09-26 13:00:00', 'pending', 'Seva Relief Center Ahmedabad #23, Navrangpura Main Road', 'Ahmedabad', 'Gujarat', 'Commerce Six Roads');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 80, 'Paneer Butter Masala with Butter Naan', '["Paneer Butter Masala", "Butter Naan (2 pcs)"]', '2026-09-26 13:30:00', 'pending', 'Prahlad Nagar Corporate Road', 'Ahmedabad', 'Gujarat', 'Venus Atlantis');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 50, '2026-09-26 13:30:00', 'pending', 'Seva Relief Center Ahmedabad #24, Prahlad Nagar Corporate Road', 'Ahmedabad', 'Gujarat', 'Venus Atlantis');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 40, 'Amritsari Chole Bhature with Pickled Onions', '["Chole Gravy", "Bhature (2 pcs)", "Pickle"]', '2026-09-26 14:00:00', 'pending', 'Near Gota Flyover, SG Highway', 'Ahmedabad', 'Gujarat', 'Gota Chowkdi');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 40, '2026-09-26 14:00:00', 'pending', 'Seva Relief Center Ahmedabad #25, Near Gota Flyover, SG Highway', 'Ahmedabad', 'Gujarat', 'Gota Chowkdi');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 75, 'South Indian Idli Vada Sambar Combo', '["Idli (3 pcs)", "Medu Vada (2 pcs)", "Sambar"]', '2026-09-26 14:30:00', 'pending', 'Near Vaishnodevi Circle, SG Highway', 'Ahmedabad', 'Gujarat', 'Shivalik Business Hub');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 40, '2026-09-26 14:30:00', 'pending', 'Seva Relief Center Ahmedabad #26, Near Vaishnodevi Circle, SG Highway', 'Ahmedabad', 'Gujarat', 'Shivalik Business Hub');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 45, 'Khaman Dhokla & Khandvi Snack Box', '["Khaman Dhokla", "Khandvi Rolls", "Chutney"]', '2026-09-26 15:00:00', 'pending', 'Opposite Iscon Mega Mall, SG Highway', 'Ahmedabad', 'Gujarat', 'Iscon Cross Roads');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 40, '2026-09-26 15:00:00', 'pending', 'Seva Relief Center Ahmedabad #27, Opposite Iscon Mega Mall, SG Highway', 'Ahmedabad', 'Gujarat', 'Iscon Cross Roads');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 100, 'Mumbai Style Butter Pav Bhaji', '["Pav Bhaji Gravy", "Butter Pav (4 pcs)", "Onions"]', '2026-09-26 15:30:00', 'pending', 'Navrangpura Main Road', 'Ahmedabad', 'Gujarat', 'Commerce Six Roads');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 60, '2026-09-26 15:30:00', 'pending', 'Seva Relief Center Ahmedabad #28, Navrangpura Main Road', 'Ahmedabad', 'Gujarat', 'Commerce Six Roads');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 55, 'Punjabi Rajma Masala with Basmati Rice', '["Rajma Curry", "Basmati Rice", "Papad"]', '2026-09-26 16:00:00', 'pending', 'Prahlad Nagar Corporate Road', 'Ahmedabad', 'Gujarat', 'Venus Atlantis');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 50, '2026-09-26 16:00:00', 'pending', 'Seva Relief Center Ahmedabad #29, Prahlad Nagar Corporate Road', 'Ahmedabad', 'Gujarat', 'Venus Atlantis');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 90, 'Nutritious Moong Dal Khichdi & Kadhi', '["Khichdi", "Gujarati Kadhi", "Papad"]', '2026-09-26 16:30:00', 'pending', 'Near Gota Flyover, SG Highway', 'Ahmedabad', 'Gujarat', 'Gota Chowkdi');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 50, '2026-09-26 16:30:00', 'pending', 'Seva Relief Center Ahmedabad #30, Near Gota Flyover, SG Highway', 'Ahmedabad', 'Gujarat', 'Gota Chowkdi');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 35, 'Fresh Vegetable Dum Biryani & Raita', '["Veg Biryani", "Mint Raita", "Papad"]', '2026-09-26 17:00:00', 'pending', 'Near Vaishnodevi Circle, SG Highway', 'Ahmedabad', 'Gujarat', 'Shivalik Business Hub');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 30, '2026-09-26 17:00:00', 'pending', 'Seva Relief Center Ahmedabad #31, Near Vaishnodevi Circle, SG Highway', 'Ahmedabad', 'Gujarat', 'Shivalik Business Hub');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 60, 'Dal Makhani with Jeera Basmati Rice', '["Dal Makhani", "Jeera Rice", "Sirka Pyaz"]', '2026-09-26 17:30:00', 'pending', 'Opposite Iscon Mega Mall, SG Highway', 'Ahmedabad', 'Gujarat', 'Iscon Cross Roads');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 30, '2026-09-26 17:30:00', 'pending', 'Seva Relief Center Ahmedabad #32, Opposite Iscon Mega Mall, SG Highway', 'Ahmedabad', 'Gujarat', 'Iscon Cross Roads');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 50, 'Traditional Gujarati Thali Meal Packs', '["Rotli (4 pcs)", "Gujarati Dal", "Shaak", "Rice"]', '2026-09-26 18:00:00', 'pending', 'Navrangpura Main Road', 'Ahmedabad', 'Gujarat', 'Commerce Six Roads');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 45, '2026-09-26 18:00:00', 'pending', 'Seva Relief Center Ahmedabad #33, Navrangpura Main Road', 'Ahmedabad', 'Gujarat', 'Commerce Six Roads');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 80, 'Paneer Butter Masala with Butter Naan', '["Paneer Butter Masala", "Butter Naan (2 pcs)"]', '2026-09-26 18:30:00', 'pending', 'Prahlad Nagar Corporate Road', 'Ahmedabad', 'Gujarat', 'Venus Atlantis');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 50, '2026-09-26 18:30:00', 'pending', 'Seva Relief Center Ahmedabad #34, Prahlad Nagar Corporate Road', 'Ahmedabad', 'Gujarat', 'Venus Atlantis');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 40, 'Amritsari Chole Bhature with Pickled Onions', '["Chole Gravy", "Bhature (2 pcs)", "Pickle"]', '2026-09-26 19:00:00', 'pending', 'Near Gota Flyover, SG Highway', 'Ahmedabad', 'Gujarat', 'Gota Chowkdi');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 40, '2026-09-26 19:00:00', 'pending', 'Seva Relief Center Ahmedabad #35, Near Gota Flyover, SG Highway', 'Ahmedabad', 'Gujarat', 'Gota Chowkdi');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 75, 'South Indian Idli Vada Sambar Combo', '["Idli (3 pcs)", "Medu Vada (2 pcs)", "Sambar"]', '2026-09-26 19:30:00', 'pending', 'Near Vaishnodevi Circle, SG Highway', 'Ahmedabad', 'Gujarat', 'Shivalik Business Hub');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 40, '2026-09-26 19:30:00', 'pending', 'Seva Relief Center Ahmedabad #36, Near Vaishnodevi Circle, SG Highway', 'Ahmedabad', 'Gujarat', 'Shivalik Business Hub');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 45, 'Khaman Dhokla & Khandvi Snack Box', '["Khaman Dhokla", "Khandvi Rolls", "Chutney"]', '2026-09-26 20:00:00', 'pending', 'Opposite Iscon Mega Mall, SG Highway', 'Ahmedabad', 'Gujarat', 'Iscon Cross Roads');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 40, '2026-09-26 20:00:00', 'pending', 'Seva Relief Center Ahmedabad #37, Opposite Iscon Mega Mall, SG Highway', 'Ahmedabad', 'Gujarat', 'Iscon Cross Roads');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 100, 'Mumbai Style Butter Pav Bhaji', '["Pav Bhaji Gravy", "Butter Pav (4 pcs)", "Onions"]', '2026-09-26 20:30:00', 'pending', 'Navrangpura Main Road', 'Ahmedabad', 'Gujarat', 'Commerce Six Roads');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 60, '2026-09-26 20:30:00', 'pending', 'Seva Relief Center Ahmedabad #38, Navrangpura Main Road', 'Ahmedabad', 'Gujarat', 'Commerce Six Roads');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 55, 'Punjabi Rajma Masala with Basmati Rice', '["Rajma Curry", "Basmati Rice", "Papad"]', '2026-09-26 21:00:00', 'pending', 'Prahlad Nagar Corporate Road', 'Ahmedabad', 'Gujarat', 'Venus Atlantis');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 50, '2026-09-26 21:00:00', 'pending', 'Seva Relief Center Ahmedabad #39, Prahlad Nagar Corporate Road', 'Ahmedabad', 'Gujarat', 'Venus Atlantis');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 90, 'Nutritious Moong Dal Khichdi & Kadhi', '["Khichdi", "Gujarati Kadhi", "Papad"]', '2026-09-26 21:30:00', 'pending', 'Near Gota Flyover, SG Highway', 'Ahmedabad', 'Gujarat', 'Gota Chowkdi');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 50, '2026-09-26 21:30:00', 'pending', 'Seva Relief Center Ahmedabad #40, Near Gota Flyover, SG Highway', 'Ahmedabad', 'Gujarat', 'Gota Chowkdi');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 35, 'Fresh Vegetable Dum Biryani & Raita', '["Veg Biryani", "Mint Raita", "Papad"]', '2026-09-26 02:00:00', 'pending', 'Near Sardar Patel Bhavan, Santram Road', 'Nadiad', 'Gujarat', 'Santram Mandir Road');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 30, '2026-09-26 02:00:00', 'pending', 'Seva Relief Center Nadiad #1, Near Sardar Patel Bhavan, Santram Road', 'Nadiad', 'Gujarat', 'Santram Mandir Road');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 60, 'Dal Makhani with Jeera Basmati Rice', '["Dal Makhani", "Jeera Rice", "Sirka Pyaz"]', '2026-09-26 02:30:00', 'pending', 'Near College Road', 'Nadiad', 'Gujarat', 'Methodist Hospital Road');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 30, '2026-09-26 02:30:00', 'pending', 'Seva Relief Center Nadiad #2, Near College Road', 'Nadiad', 'Gujarat', 'Methodist Hospital Road');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 50, 'Traditional Gujarati Thali Meal Packs', '["Rotli (4 pcs)", "Gujarati Dal", "Shaak", "Rice"]', '2026-09-26 03:00:00', 'pending', 'Near Uttarsanda Crossings', 'Nadiad', 'Gujarat', 'Expressway Toll Road');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 45, '2026-09-26 03:00:00', 'pending', 'Seva Relief Center Nadiad #3, Near Uttarsanda Crossings', 'Nadiad', 'Gujarat', 'Expressway Toll Road');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 80, 'Paneer Butter Masala with Butter Naan', '["Paneer Butter Masala", "Butter Naan (2 pcs)"]', '2026-09-26 03:30:00', 'pending', 'Near Sardar Patel Bhavan, Santram Road', 'Nadiad', 'Gujarat', 'Santram Mandir Road');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 50, '2026-09-26 03:30:00', 'pending', 'Seva Relief Center Nadiad #4, Near Sardar Patel Bhavan, Santram Road', 'Nadiad', 'Gujarat', 'Santram Mandir Road');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 40, 'Amritsari Chole Bhature with Pickled Onions', '["Chole Gravy", "Bhature (2 pcs)", "Pickle"]', '2026-09-26 04:00:00', 'pending', 'Near College Road', 'Nadiad', 'Gujarat', 'Methodist Hospital Road');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 40, '2026-09-26 04:00:00', 'pending', 'Seva Relief Center Nadiad #5, Near College Road', 'Nadiad', 'Gujarat', 'Methodist Hospital Road');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 75, 'South Indian Idli Vada Sambar Combo', '["Idli (3 pcs)", "Medu Vada (2 pcs)", "Sambar"]', '2026-09-26 04:30:00', 'pending', 'Near Uttarsanda Crossings', 'Nadiad', 'Gujarat', 'Expressway Toll Road');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 40, '2026-09-26 04:30:00', 'pending', 'Seva Relief Center Nadiad #6, Near Uttarsanda Crossings', 'Nadiad', 'Gujarat', 'Expressway Toll Road');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 45, 'Khaman Dhokla & Khandvi Snack Box', '["Khaman Dhokla", "Khandvi Rolls", "Chutney"]', '2026-09-26 05:00:00', 'pending', 'Near Sardar Patel Bhavan, Santram Road', 'Nadiad', 'Gujarat', 'Santram Mandir Road');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 40, '2026-09-26 05:00:00', 'pending', 'Seva Relief Center Nadiad #7, Near Sardar Patel Bhavan, Santram Road', 'Nadiad', 'Gujarat', 'Santram Mandir Road');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 100, 'Mumbai Style Butter Pav Bhaji', '["Pav Bhaji Gravy", "Butter Pav (4 pcs)", "Onions"]', '2026-09-26 05:30:00', 'pending', 'Near College Road', 'Nadiad', 'Gujarat', 'Methodist Hospital Road');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 60, '2026-09-26 05:30:00', 'pending', 'Seva Relief Center Nadiad #8, Near College Road', 'Nadiad', 'Gujarat', 'Methodist Hospital Road');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 55, 'Punjabi Rajma Masala with Basmati Rice', '["Rajma Curry", "Basmati Rice", "Papad"]', '2026-09-26 06:00:00', 'pending', 'Near Uttarsanda Crossings', 'Nadiad', 'Gujarat', 'Expressway Toll Road');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 50, '2026-09-26 06:00:00', 'pending', 'Seva Relief Center Nadiad #9, Near Uttarsanda Crossings', 'Nadiad', 'Gujarat', 'Expressway Toll Road');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 90, 'Nutritious Moong Dal Khichdi & Kadhi', '["Khichdi", "Gujarati Kadhi", "Papad"]', '2026-09-26 06:30:00', 'pending', 'Near Sardar Patel Bhavan, Santram Road', 'Nadiad', 'Gujarat', 'Santram Mandir Road');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 50, '2026-09-26 06:30:00', 'pending', 'Seva Relief Center Nadiad #10, Near Sardar Patel Bhavan, Santram Road', 'Nadiad', 'Gujarat', 'Santram Mandir Road');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 35, 'Fresh Vegetable Dum Biryani & Raita', '["Veg Biryani", "Mint Raita", "Papad"]', '2026-09-26 07:00:00', 'pending', 'Near College Road', 'Nadiad', 'Gujarat', 'Methodist Hospital Road');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 30, '2026-09-26 07:00:00', 'pending', 'Seva Relief Center Nadiad #11, Near College Road', 'Nadiad', 'Gujarat', 'Methodist Hospital Road');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 60, 'Dal Makhani with Jeera Basmati Rice', '["Dal Makhani", "Jeera Rice", "Sirka Pyaz"]', '2026-09-26 07:30:00', 'pending', 'Near Uttarsanda Crossings', 'Nadiad', 'Gujarat', 'Expressway Toll Road');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 30, '2026-09-26 07:30:00', 'pending', 'Seva Relief Center Nadiad #12, Near Uttarsanda Crossings', 'Nadiad', 'Gujarat', 'Expressway Toll Road');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 50, 'Traditional Gujarati Thali Meal Packs', '["Rotli (4 pcs)", "Gujarati Dal", "Shaak", "Rice"]', '2026-09-26 08:00:00', 'pending', 'Near Sardar Patel Bhavan, Santram Road', 'Nadiad', 'Gujarat', 'Santram Mandir Road');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 45, '2026-09-26 08:00:00', 'pending', 'Seva Relief Center Nadiad #13, Near Sardar Patel Bhavan, Santram Road', 'Nadiad', 'Gujarat', 'Santram Mandir Road');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 80, 'Paneer Butter Masala with Butter Naan', '["Paneer Butter Masala", "Butter Naan (2 pcs)"]', '2026-09-26 08:30:00', 'pending', 'Near College Road', 'Nadiad', 'Gujarat', 'Methodist Hospital Road');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 50, '2026-09-26 08:30:00', 'pending', 'Seva Relief Center Nadiad #14, Near College Road', 'Nadiad', 'Gujarat', 'Methodist Hospital Road');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 40, 'Amritsari Chole Bhature with Pickled Onions', '["Chole Gravy", "Bhature (2 pcs)", "Pickle"]', '2026-09-26 09:00:00', 'pending', 'Near Uttarsanda Crossings', 'Nadiad', 'Gujarat', 'Expressway Toll Road');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 40, '2026-09-26 09:00:00', 'pending', 'Seva Relief Center Nadiad #15, Near Uttarsanda Crossings', 'Nadiad', 'Gujarat', 'Expressway Toll Road');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 75, 'South Indian Idli Vada Sambar Combo', '["Idli (3 pcs)", "Medu Vada (2 pcs)", "Sambar"]', '2026-09-26 09:30:00', 'pending', 'Near Sardar Patel Bhavan, Santram Road', 'Nadiad', 'Gujarat', 'Santram Mandir Road');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 40, '2026-09-26 09:30:00', 'pending', 'Seva Relief Center Nadiad #16, Near Sardar Patel Bhavan, Santram Road', 'Nadiad', 'Gujarat', 'Santram Mandir Road');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 45, 'Khaman Dhokla & Khandvi Snack Box', '["Khaman Dhokla", "Khandvi Rolls", "Chutney"]', '2026-09-26 10:00:00', 'pending', 'Near College Road', 'Nadiad', 'Gujarat', 'Methodist Hospital Road');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 40, '2026-09-26 10:00:00', 'pending', 'Seva Relief Center Nadiad #17, Near College Road', 'Nadiad', 'Gujarat', 'Methodist Hospital Road');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 100, 'Mumbai Style Butter Pav Bhaji', '["Pav Bhaji Gravy", "Butter Pav (4 pcs)", "Onions"]', '2026-09-26 10:30:00', 'pending', 'Near Uttarsanda Crossings', 'Nadiad', 'Gujarat', 'Expressway Toll Road');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 60, '2026-09-26 10:30:00', 'pending', 'Seva Relief Center Nadiad #18, Near Uttarsanda Crossings', 'Nadiad', 'Gujarat', 'Expressway Toll Road');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 55, 'Punjabi Rajma Masala with Basmati Rice', '["Rajma Curry", "Basmati Rice", "Papad"]', '2026-09-26 11:00:00', 'pending', 'Near Sardar Patel Bhavan, Santram Road', 'Nadiad', 'Gujarat', 'Santram Mandir Road');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 50, '2026-09-26 11:00:00', 'pending', 'Seva Relief Center Nadiad #19, Near Sardar Patel Bhavan, Santram Road', 'Nadiad', 'Gujarat', 'Santram Mandir Road');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 90, 'Nutritious Moong Dal Khichdi & Kadhi', '["Khichdi", "Gujarati Kadhi", "Papad"]', '2026-09-26 11:30:00', 'pending', 'Near College Road', 'Nadiad', 'Gujarat', 'Methodist Hospital Road');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 50, '2026-09-26 11:30:00', 'pending', 'Seva Relief Center Nadiad #20, Near College Road', 'Nadiad', 'Gujarat', 'Methodist Hospital Road');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 35, 'Fresh Vegetable Dum Biryani & Raita', '["Veg Biryani", "Mint Raita", "Papad"]', '2026-09-26 02:00:00', 'pending', 'Near Indoor Stadium, Athwa Lines', 'Surat', 'Gujarat', 'Athwa Gate Circle');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 30, '2026-09-26 02:00:00', 'pending', 'Seva Relief Center Surat #1, Near Indoor Stadium, Athwa Lines', 'Surat', 'Gujarat', 'Athwa Gate Circle');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 60, 'Dal Makhani with Jeera Basmati Rice', '["Dal Makhani", "Jeera Rice", "Sirka Pyaz"]', '2026-09-26 02:30:00', 'pending', 'VIP Road junction, Vesu', 'Surat', 'Gujarat', 'Vesu Canal Corridor');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 30, '2026-09-26 02:30:00', 'pending', 'Seva Relief Center Surat #2, VIP Road junction, Vesu', 'Surat', 'Gujarat', 'Vesu Canal Corridor');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 50, 'Traditional Gujarati Thali Meal Packs', '["Rotli (4 pcs)", "Gujarati Dal", "Shaak", "Rice"]', '2026-09-26 03:00:00', 'pending', 'Near Ring Road Textile Market', 'Surat', 'Gujarat', 'Ring Road Flyover');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 45, '2026-09-26 03:00:00', 'pending', 'Seva Relief Center Surat #3, Near Ring Road Textile Market', 'Surat', 'Gujarat', 'Ring Road Flyover');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 80, 'Paneer Butter Masala with Butter Naan', '["Paneer Butter Masala", "Butter Naan (2 pcs)"]', '2026-09-26 03:30:00', 'pending', 'Near Indoor Stadium, Athwa Lines', 'Surat', 'Gujarat', 'Athwa Gate Circle');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 50, '2026-09-26 03:30:00', 'pending', 'Seva Relief Center Surat #4, Near Indoor Stadium, Athwa Lines', 'Surat', 'Gujarat', 'Athwa Gate Circle');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 40, 'Amritsari Chole Bhature with Pickled Onions', '["Chole Gravy", "Bhature (2 pcs)", "Pickle"]', '2026-09-26 04:00:00', 'pending', 'VIP Road junction, Vesu', 'Surat', 'Gujarat', 'Vesu Canal Corridor');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 40, '2026-09-26 04:00:00', 'pending', 'Seva Relief Center Surat #5, VIP Road junction, Vesu', 'Surat', 'Gujarat', 'Vesu Canal Corridor');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 75, 'South Indian Idli Vada Sambar Combo', '["Idli (3 pcs)", "Medu Vada (2 pcs)", "Sambar"]', '2026-09-26 04:30:00', 'pending', 'Near Ring Road Textile Market', 'Surat', 'Gujarat', 'Ring Road Flyover');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 40, '2026-09-26 04:30:00', 'pending', 'Seva Relief Center Surat #6, Near Ring Road Textile Market', 'Surat', 'Gujarat', 'Ring Road Flyover');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 45, 'Khaman Dhokla & Khandvi Snack Box', '["Khaman Dhokla", "Khandvi Rolls", "Chutney"]', '2026-09-26 05:00:00', 'pending', 'Near Indoor Stadium, Athwa Lines', 'Surat', 'Gujarat', 'Athwa Gate Circle');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 40, '2026-09-26 05:00:00', 'pending', 'Seva Relief Center Surat #7, Near Indoor Stadium, Athwa Lines', 'Surat', 'Gujarat', 'Athwa Gate Circle');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 100, 'Mumbai Style Butter Pav Bhaji', '["Pav Bhaji Gravy", "Butter Pav (4 pcs)", "Onions"]', '2026-09-26 05:30:00', 'pending', 'VIP Road junction, Vesu', 'Surat', 'Gujarat', 'Vesu Canal Corridor');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 60, '2026-09-26 05:30:00', 'pending', 'Seva Relief Center Surat #8, VIP Road junction, Vesu', 'Surat', 'Gujarat', 'Vesu Canal Corridor');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 55, 'Punjabi Rajma Masala with Basmati Rice', '["Rajma Curry", "Basmati Rice", "Papad"]', '2026-09-26 06:00:00', 'pending', 'Near Ring Road Textile Market', 'Surat', 'Gujarat', 'Ring Road Flyover');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 50, '2026-09-26 06:00:00', 'pending', 'Seva Relief Center Surat #9, Near Ring Road Textile Market', 'Surat', 'Gujarat', 'Ring Road Flyover');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 90, 'Nutritious Moong Dal Khichdi & Kadhi', '["Khichdi", "Gujarati Kadhi", "Papad"]', '2026-09-26 06:30:00', 'pending', 'Near Indoor Stadium, Athwa Lines', 'Surat', 'Gujarat', 'Athwa Gate Circle');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 50, '2026-09-26 06:30:00', 'pending', 'Seva Relief Center Surat #10, Near Indoor Stadium, Athwa Lines', 'Surat', 'Gujarat', 'Athwa Gate Circle');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 35, 'Fresh Vegetable Dum Biryani & Raita', '["Veg Biryani", "Mint Raita", "Papad"]', '2026-09-26 07:00:00', 'pending', 'VIP Road junction, Vesu', 'Surat', 'Gujarat', 'Vesu Canal Corridor');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 30, '2026-09-26 07:00:00', 'pending', 'Seva Relief Center Surat #11, VIP Road junction, Vesu', 'Surat', 'Gujarat', 'Vesu Canal Corridor');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 60, 'Dal Makhani with Jeera Basmati Rice', '["Dal Makhani", "Jeera Rice", "Sirka Pyaz"]', '2026-09-26 07:30:00', 'pending', 'Near Ring Road Textile Market', 'Surat', 'Gujarat', 'Ring Road Flyover');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 30, '2026-09-26 07:30:00', 'pending', 'Seva Relief Center Surat #12, Near Ring Road Textile Market', 'Surat', 'Gujarat', 'Ring Road Flyover');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 50, 'Traditional Gujarati Thali Meal Packs', '["Rotli (4 pcs)", "Gujarati Dal", "Shaak", "Rice"]', '2026-09-26 08:00:00', 'pending', 'Near Indoor Stadium, Athwa Lines', 'Surat', 'Gujarat', 'Athwa Gate Circle');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 45, '2026-09-26 08:00:00', 'pending', 'Seva Relief Center Surat #13, Near Indoor Stadium, Athwa Lines', 'Surat', 'Gujarat', 'Athwa Gate Circle');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 80, 'Paneer Butter Masala with Butter Naan', '["Paneer Butter Masala", "Butter Naan (2 pcs)"]', '2026-09-26 08:30:00', 'pending', 'VIP Road junction, Vesu', 'Surat', 'Gujarat', 'Vesu Canal Corridor');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 50, '2026-09-26 08:30:00', 'pending', 'Seva Relief Center Surat #14, VIP Road junction, Vesu', 'Surat', 'Gujarat', 'Vesu Canal Corridor');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 40, 'Amritsari Chole Bhature with Pickled Onions', '["Chole Gravy", "Bhature (2 pcs)", "Pickle"]', '2026-09-26 09:00:00', 'pending', 'Near Ring Road Textile Market', 'Surat', 'Gujarat', 'Ring Road Flyover');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 40, '2026-09-26 09:00:00', 'pending', 'Seva Relief Center Surat #15, Near Ring Road Textile Market', 'Surat', 'Gujarat', 'Ring Road Flyover');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 75, 'South Indian Idli Vada Sambar Combo', '["Idli (3 pcs)", "Medu Vada (2 pcs)", "Sambar"]', '2026-09-26 09:30:00', 'pending', 'Near Indoor Stadium, Athwa Lines', 'Surat', 'Gujarat', 'Athwa Gate Circle');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 40, '2026-09-26 09:30:00', 'pending', 'Seva Relief Center Surat #16, Near Indoor Stadium, Athwa Lines', 'Surat', 'Gujarat', 'Athwa Gate Circle');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 45, 'Khaman Dhokla & Khandvi Snack Box', '["Khaman Dhokla", "Khandvi Rolls", "Chutney"]', '2026-09-26 10:00:00', 'pending', 'VIP Road junction, Vesu', 'Surat', 'Gujarat', 'Vesu Canal Corridor');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 40, '2026-09-26 10:00:00', 'pending', 'Seva Relief Center Surat #17, VIP Road junction, Vesu', 'Surat', 'Gujarat', 'Vesu Canal Corridor');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 100, 'Mumbai Style Butter Pav Bhaji', '["Pav Bhaji Gravy", "Butter Pav (4 pcs)", "Onions"]', '2026-09-26 10:30:00', 'pending', 'Near Ring Road Textile Market', 'Surat', 'Gujarat', 'Ring Road Flyover');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 60, '2026-09-26 10:30:00', 'pending', 'Seva Relief Center Surat #18, Near Ring Road Textile Market', 'Surat', 'Gujarat', 'Ring Road Flyover');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 55, 'Punjabi Rajma Masala with Basmati Rice', '["Rajma Curry", "Basmati Rice", "Papad"]', '2026-09-26 11:00:00', 'pending', 'Near Indoor Stadium, Athwa Lines', 'Surat', 'Gujarat', 'Athwa Gate Circle');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 50, '2026-09-26 11:00:00', 'pending', 'Seva Relief Center Surat #19, Near Indoor Stadium, Athwa Lines', 'Surat', 'Gujarat', 'Athwa Gate Circle');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 90, 'Nutritious Moong Dal Khichdi & Kadhi', '["Khichdi", "Gujarati Kadhi", "Papad"]', '2026-09-26 11:30:00', 'pending', 'VIP Road junction, Vesu', 'Surat', 'Gujarat', 'Vesu Canal Corridor');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 50, '2026-09-26 11:30:00', 'pending', 'Seva Relief Center Surat #20, VIP Road junction, Vesu', 'Surat', 'Gujarat', 'Vesu Canal Corridor');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 35, 'Fresh Vegetable Dum Biryani & Raita', '["Veg Biryani", "Mint Raita", "Papad"]', '2026-09-26 02:00:00', 'pending', 'Behind Vadodara Central Mall, Alkapuri', 'Vadodara', 'Gujarat', 'Alkapuri Club Road');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 30, '2026-09-26 02:00:00', 'pending', 'Seva Relief Center Vadodara #1, Behind Vadodara Central Mall, Alkapuri', 'Vadodara', 'Gujarat', 'Alkapuri Club Road');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 60, 'Dal Makhani with Jeera Basmati Rice', '["Dal Makhani", "Jeera Rice", "Sirka Pyaz"]', '2026-09-26 02:30:00', 'pending', 'Opposite MSU Arts Faculty, Sayajigunj', 'Vadodara', 'Gujarat', 'Sayajigunj Station Road');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 30, '2026-09-26 02:30:00', 'pending', 'Seva Relief Center Vadodara #2, Opposite MSU Arts Faculty, Sayajigunj', 'Vadodara', 'Gujarat', 'Sayajigunj Station Road');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 50, 'Traditional Gujarati Thali Meal Packs', '["Rotli (4 pcs)", "Gujarati Dal", "Shaak", "Rice"]', '2026-09-26 03:00:00', 'pending', 'Near Karelibaug Water Tank', 'Vadodara', 'Gujarat', 'Karelibaug Center');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 45, '2026-09-26 03:00:00', 'pending', 'Seva Relief Center Vadodara #3, Near Karelibaug Water Tank', 'Vadodara', 'Gujarat', 'Karelibaug Center');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 80, 'Paneer Butter Masala with Butter Naan', '["Paneer Butter Masala", "Butter Naan (2 pcs)"]', '2026-09-26 03:30:00', 'pending', 'Behind Vadodara Central Mall, Alkapuri', 'Vadodara', 'Gujarat', 'Alkapuri Club Road');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 50, '2026-09-26 03:30:00', 'pending', 'Seva Relief Center Vadodara #4, Behind Vadodara Central Mall, Alkapuri', 'Vadodara', 'Gujarat', 'Alkapuri Club Road');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 40, 'Amritsari Chole Bhature with Pickled Onions', '["Chole Gravy", "Bhature (2 pcs)", "Pickle"]', '2026-09-26 04:00:00', 'pending', 'Opposite MSU Arts Faculty, Sayajigunj', 'Vadodara', 'Gujarat', 'Sayajigunj Station Road');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 40, '2026-09-26 04:00:00', 'pending', 'Seva Relief Center Vadodara #5, Opposite MSU Arts Faculty, Sayajigunj', 'Vadodara', 'Gujarat', 'Sayajigunj Station Road');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 75, 'South Indian Idli Vada Sambar Combo', '["Idli (3 pcs)", "Medu Vada (2 pcs)", "Sambar"]', '2026-09-26 04:30:00', 'pending', 'Near Karelibaug Water Tank', 'Vadodara', 'Gujarat', 'Karelibaug Center');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 40, '2026-09-26 04:30:00', 'pending', 'Seva Relief Center Vadodara #6, Near Karelibaug Water Tank', 'Vadodara', 'Gujarat', 'Karelibaug Center');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 45, 'Khaman Dhokla & Khandvi Snack Box', '["Khaman Dhokla", "Khandvi Rolls", "Chutney"]', '2026-09-26 05:00:00', 'pending', 'Behind Vadodara Central Mall, Alkapuri', 'Vadodara', 'Gujarat', 'Alkapuri Club Road');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 40, '2026-09-26 05:00:00', 'pending', 'Seva Relief Center Vadodara #7, Behind Vadodara Central Mall, Alkapuri', 'Vadodara', 'Gujarat', 'Alkapuri Club Road');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 100, 'Mumbai Style Butter Pav Bhaji', '["Pav Bhaji Gravy", "Butter Pav (4 pcs)", "Onions"]', '2026-09-26 05:30:00', 'pending', 'Opposite MSU Arts Faculty, Sayajigunj', 'Vadodara', 'Gujarat', 'Sayajigunj Station Road');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 60, '2026-09-26 05:30:00', 'pending', 'Seva Relief Center Vadodara #8, Opposite MSU Arts Faculty, Sayajigunj', 'Vadodara', 'Gujarat', 'Sayajigunj Station Road');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 55, 'Punjabi Rajma Masala with Basmati Rice', '["Rajma Curry", "Basmati Rice", "Papad"]', '2026-09-26 06:00:00', 'pending', 'Near Karelibaug Water Tank', 'Vadodara', 'Gujarat', 'Karelibaug Center');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 50, '2026-09-26 06:00:00', 'pending', 'Seva Relief Center Vadodara #9, Near Karelibaug Water Tank', 'Vadodara', 'Gujarat', 'Karelibaug Center');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 90, 'Nutritious Moong Dal Khichdi & Kadhi', '["Khichdi", "Gujarati Kadhi", "Papad"]', '2026-09-26 06:30:00', 'pending', 'Behind Vadodara Central Mall, Alkapuri', 'Vadodara', 'Gujarat', 'Alkapuri Club Road');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 50, '2026-09-26 06:30:00', 'pending', 'Seva Relief Center Vadodara #10, Behind Vadodara Central Mall, Alkapuri', 'Vadodara', 'Gujarat', 'Alkapuri Club Road');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 35, 'Fresh Vegetable Dum Biryani & Raita', '["Veg Biryani", "Mint Raita", "Papad"]', '2026-09-26 07:00:00', 'pending', 'Opposite MSU Arts Faculty, Sayajigunj', 'Vadodara', 'Gujarat', 'Sayajigunj Station Road');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 30, '2026-09-26 07:00:00', 'pending', 'Seva Relief Center Vadodara #11, Opposite MSU Arts Faculty, Sayajigunj', 'Vadodara', 'Gujarat', 'Sayajigunj Station Road');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 60, 'Dal Makhani with Jeera Basmati Rice', '["Dal Makhani", "Jeera Rice", "Sirka Pyaz"]', '2026-09-26 07:30:00', 'pending', 'Near Karelibaug Water Tank', 'Vadodara', 'Gujarat', 'Karelibaug Center');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 30, '2026-09-26 07:30:00', 'pending', 'Seva Relief Center Vadodara #12, Near Karelibaug Water Tank', 'Vadodara', 'Gujarat', 'Karelibaug Center');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 50, 'Traditional Gujarati Thali Meal Packs', '["Rotli (4 pcs)", "Gujarati Dal", "Shaak", "Rice"]', '2026-09-26 08:00:00', 'pending', 'Behind Vadodara Central Mall, Alkapuri', 'Vadodara', 'Gujarat', 'Alkapuri Club Road');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 45, '2026-09-26 08:00:00', 'pending', 'Seva Relief Center Vadodara #13, Behind Vadodara Central Mall, Alkapuri', 'Vadodara', 'Gujarat', 'Alkapuri Club Road');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 80, 'Paneer Butter Masala with Butter Naan', '["Paneer Butter Masala", "Butter Naan (2 pcs)"]', '2026-09-26 08:30:00', 'pending', 'Opposite MSU Arts Faculty, Sayajigunj', 'Vadodara', 'Gujarat', 'Sayajigunj Station Road');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 50, '2026-09-26 08:30:00', 'pending', 'Seva Relief Center Vadodara #14, Opposite MSU Arts Faculty, Sayajigunj', 'Vadodara', 'Gujarat', 'Sayajigunj Station Road');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 40, 'Amritsari Chole Bhature with Pickled Onions', '["Chole Gravy", "Bhature (2 pcs)", "Pickle"]', '2026-09-26 09:00:00', 'pending', 'Near Karelibaug Water Tank', 'Vadodara', 'Gujarat', 'Karelibaug Center');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 40, '2026-09-26 09:00:00', 'pending', 'Seva Relief Center Vadodara #15, Near Karelibaug Water Tank', 'Vadodara', 'Gujarat', 'Karelibaug Center');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 75, 'South Indian Idli Vada Sambar Combo', '["Idli (3 pcs)", "Medu Vada (2 pcs)", "Sambar"]', '2026-09-26 09:30:00', 'pending', 'Behind Vadodara Central Mall, Alkapuri', 'Vadodara', 'Gujarat', 'Alkapuri Club Road');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 40, '2026-09-26 09:30:00', 'pending', 'Seva Relief Center Vadodara #16, Behind Vadodara Central Mall, Alkapuri', 'Vadodara', 'Gujarat', 'Alkapuri Club Road');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 45, 'Khaman Dhokla & Khandvi Snack Box', '["Khaman Dhokla", "Khandvi Rolls", "Chutney"]', '2026-09-26 10:00:00', 'pending', 'Opposite MSU Arts Faculty, Sayajigunj', 'Vadodara', 'Gujarat', 'Sayajigunj Station Road');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 40, '2026-09-26 10:00:00', 'pending', 'Seva Relief Center Vadodara #17, Opposite MSU Arts Faculty, Sayajigunj', 'Vadodara', 'Gujarat', 'Sayajigunj Station Road');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 100, 'Mumbai Style Butter Pav Bhaji', '["Pav Bhaji Gravy", "Butter Pav (4 pcs)", "Onions"]', '2026-09-26 10:30:00', 'pending', 'Near Karelibaug Water Tank', 'Vadodara', 'Gujarat', 'Karelibaug Center');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 60, '2026-09-26 10:30:00', 'pending', 'Seva Relief Center Vadodara #18, Near Karelibaug Water Tank', 'Vadodara', 'Gujarat', 'Karelibaug Center');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 55, 'Punjabi Rajma Masala with Basmati Rice', '["Rajma Curry", "Basmati Rice", "Papad"]', '2026-09-26 11:00:00', 'pending', 'Behind Vadodara Central Mall, Alkapuri', 'Vadodara', 'Gujarat', 'Alkapuri Club Road');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 50, '2026-09-26 11:00:00', 'pending', 'Seva Relief Center Vadodara #19, Behind Vadodara Central Mall, Alkapuri', 'Vadodara', 'Gujarat', 'Alkapuri Club Road');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 90, 'Nutritious Moong Dal Khichdi & Kadhi', '["Khichdi", "Gujarati Kadhi", "Papad"]', '2026-09-26 11:30:00', 'pending', 'Opposite MSU Arts Faculty, Sayajigunj', 'Vadodara', 'Gujarat', 'Sayajigunj Station Road');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 50, '2026-09-26 11:30:00', 'pending', 'Seva Relief Center Vadodara #20, Opposite MSU Arts Faculty, Sayajigunj', 'Vadodara', 'Gujarat', 'Sayajigunj Station Road');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 40, 'Ready Delivery Meal Box #1', '["Dal Makhani", "Jeera Rice", "Papad"]', '2026-09-25 22:48:31', 'Allocated', 'Near Vaishnodevi Circle', 'Ahmedabad', 'Gujarat', 'Shivalik Hub');
SET @DEL_FID_1 = LAST_INSERT_ID();

INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 40, '2026-09-25 22:48:31', 'Allocated', 'Santram Relief Center', 'Ahmedabad', 'Gujarat', 'Shivalik Hub');
SET @DEL_NFID_1 = LAST_INSERT_ID();

INSERT INTO MatchedFoods (FID, DonorId, Providedquntity, donationDateTime, city, state, fromperfectLocation, NFID, ReceiverId, requestDateTime, Neededquntity, toperfectLocation)
VALUES (@DEL_FID_1, 'abc@gmail.com', 40, '2026-09-25 22:48:31', 'Ahmedabad', 'Gujarat', 'Shivalik Hub', @DEL_NFID_1, 'pqr@gmail.com', '2026-09-25 22:48:31', 40, 'Shivalik Hub');
SET @DEL_MFID_1 = LAST_INSERT_ID();


INSERT INTO FoodDeliveries (MatchedFoodId, DonorId, ReceiverId, TransporterId, Status, CreatedAt, AssignedAt, AcceptedAt, DeliveredAt)
VALUES (@DEL_MFID_1, 'abc@gmail.com', 'pqr@gmail.com', NULL, 'AwaitingTransporter', '2026-09-25 22:48:31', NULL, NULL, NULL);
SET @DEL_ID_1 = LAST_INSERT_ID();

INSERT INTO DeliveryStatusHistories (DeliveryId, FromStatus, ToStatus, ChangedByUserId, ChangedByUserRole, ChangedAt, Notes)
VALUES (@DEL_ID_1, 'Allocated', 'AwaitingTransporter', 'System', 'System', '2026-09-25 22:48:31', 'Order matched and ready for transporter.');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 40, 'Ready Delivery Meal Box #2', '["Dal Makhani", "Jeera Rice", "Papad"]', '2026-09-25 21:48:31', 'Allocated', 'Near Vaishnodevi Circle', 'Ahmedabad', 'Gujarat', 'Shivalik Hub');
SET @DEL_FID_2 = LAST_INSERT_ID();

INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 40, '2026-09-25 21:48:31', 'Allocated', 'Santram Relief Center', 'Ahmedabad', 'Gujarat', 'Shivalik Hub');
SET @DEL_NFID_2 = LAST_INSERT_ID();

INSERT INTO MatchedFoods (FID, DonorId, Providedquntity, donationDateTime, city, state, fromperfectLocation, NFID, ReceiverId, requestDateTime, Neededquntity, toperfectLocation)
VALUES (@DEL_FID_2, 'abc@gmail.com', 40, '2026-09-25 21:48:31', 'Ahmedabad', 'Gujarat', 'Shivalik Hub', @DEL_NFID_2, 'pqr@gmail.com', '2026-09-25 21:48:31', 40, 'Shivalik Hub');
SET @DEL_MFID_2 = LAST_INSERT_ID();


INSERT INTO FoodDeliveries (MatchedFoodId, DonorId, ReceiverId, TransporterId, Status, CreatedAt, AssignedAt, AcceptedAt, DeliveredAt)
VALUES (@DEL_MFID_2, 'abc@gmail.com', 'pqr@gmail.com', NULL, 'AwaitingTransporter', '2026-09-25 21:48:31', NULL, NULL, NULL);
SET @DEL_ID_2 = LAST_INSERT_ID();

INSERT INTO DeliveryStatusHistories (DeliveryId, FromStatus, ToStatus, ChangedByUserId, ChangedByUserRole, ChangedAt, Notes)
VALUES (@DEL_ID_2, 'Allocated', 'AwaitingTransporter', 'System', 'System', '2026-09-25 21:48:31', 'Order matched and ready for transporter.');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 40, 'Ready Delivery Meal Box #3', '["Dal Makhani", "Jeera Rice", "Papad"]', '2026-09-25 20:48:31', 'Allocated', 'Near Vaishnodevi Circle', 'Ahmedabad', 'Gujarat', 'Shivalik Hub');
SET @DEL_FID_3 = LAST_INSERT_ID();

INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 40, '2026-09-25 20:48:31', 'Allocated', 'Santram Relief Center', 'Ahmedabad', 'Gujarat', 'Shivalik Hub');
SET @DEL_NFID_3 = LAST_INSERT_ID();

INSERT INTO MatchedFoods (FID, DonorId, Providedquntity, donationDateTime, city, state, fromperfectLocation, NFID, ReceiverId, requestDateTime, Neededquntity, toperfectLocation)
VALUES (@DEL_FID_3, 'abc@gmail.com', 40, '2026-09-25 20:48:31', 'Ahmedabad', 'Gujarat', 'Shivalik Hub', @DEL_NFID_3, 'pqr@gmail.com', '2026-09-25 20:48:31', 40, 'Shivalik Hub');
SET @DEL_MFID_3 = LAST_INSERT_ID();


INSERT INTO FoodDeliveries (MatchedFoodId, DonorId, ReceiverId, TransporterId, Status, CreatedAt, AssignedAt, AcceptedAt, DeliveredAt)
VALUES (@DEL_MFID_3, 'abc@gmail.com', 'pqr@gmail.com', NULL, 'AwaitingTransporter', '2026-09-25 20:48:31', NULL, NULL, NULL);
SET @DEL_ID_3 = LAST_INSERT_ID();

INSERT INTO DeliveryStatusHistories (DeliveryId, FromStatus, ToStatus, ChangedByUserId, ChangedByUserRole, ChangedAt, Notes)
VALUES (@DEL_ID_3, 'Allocated', 'AwaitingTransporter', 'System', 'System', '2026-09-25 20:48:31', 'Order matched and ready for transporter.');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 40, 'Ready Delivery Meal Box #4', '["Dal Makhani", "Jeera Rice", "Papad"]', '2026-09-25 19:48:31', 'Allocated', 'Near Vaishnodevi Circle', 'Ahmedabad', 'Gujarat', 'Shivalik Hub');
SET @DEL_FID_4 = LAST_INSERT_ID();

INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 40, '2026-09-25 19:48:31', 'Allocated', 'Santram Relief Center', 'Ahmedabad', 'Gujarat', 'Shivalik Hub');
SET @DEL_NFID_4 = LAST_INSERT_ID();

INSERT INTO MatchedFoods (FID, DonorId, Providedquntity, donationDateTime, city, state, fromperfectLocation, NFID, ReceiverId, requestDateTime, Neededquntity, toperfectLocation)
VALUES (@DEL_FID_4, 'abc@gmail.com', 40, '2026-09-25 19:48:31', 'Ahmedabad', 'Gujarat', 'Shivalik Hub', @DEL_NFID_4, 'pqr@gmail.com', '2026-09-25 19:48:31', 40, 'Shivalik Hub');
SET @DEL_MFID_4 = LAST_INSERT_ID();


INSERT INTO FoodDeliveries (MatchedFoodId, DonorId, ReceiverId, TransporterId, Status, CreatedAt, AssignedAt, AcceptedAt, DeliveredAt)
VALUES (@DEL_MFID_4, 'abc@gmail.com', 'pqr@gmail.com', NULL, 'AwaitingTransporter', '2026-09-25 19:48:31', NULL, NULL, NULL);
SET @DEL_ID_4 = LAST_INSERT_ID();

INSERT INTO DeliveryStatusHistories (DeliveryId, FromStatus, ToStatus, ChangedByUserId, ChangedByUserRole, ChangedAt, Notes)
VALUES (@DEL_ID_4, 'Allocated', 'AwaitingTransporter', 'System', 'System', '2026-09-25 19:48:31', 'Order matched and ready for transporter.');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 40, 'Ready Delivery Meal Box #5', '["Dal Makhani", "Jeera Rice", "Papad"]', '2026-09-25 18:48:31', 'Allocated', 'Near Vaishnodevi Circle', 'Ahmedabad', 'Gujarat', 'Shivalik Hub');
SET @DEL_FID_5 = LAST_INSERT_ID();

INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 40, '2026-09-25 18:48:31', 'Allocated', 'Santram Relief Center', 'Ahmedabad', 'Gujarat', 'Shivalik Hub');
SET @DEL_NFID_5 = LAST_INSERT_ID();

INSERT INTO MatchedFoods (FID, DonorId, Providedquntity, donationDateTime, city, state, fromperfectLocation, NFID, ReceiverId, requestDateTime, Neededquntity, toperfectLocation)
VALUES (@DEL_FID_5, 'abc@gmail.com', 40, '2026-09-25 18:48:31', 'Ahmedabad', 'Gujarat', 'Shivalik Hub', @DEL_NFID_5, 'pqr@gmail.com', '2026-09-25 18:48:31', 40, 'Shivalik Hub');
SET @DEL_MFID_5 = LAST_INSERT_ID();


INSERT INTO FoodDeliveries (MatchedFoodId, DonorId, ReceiverId, TransporterId, Status, CreatedAt, AssignedAt, AcceptedAt, DeliveredAt)
VALUES (@DEL_MFID_5, 'abc@gmail.com', 'pqr@gmail.com', NULL, 'AwaitingTransporter', '2026-09-25 18:48:31', NULL, NULL, NULL);
SET @DEL_ID_5 = LAST_INSERT_ID();

INSERT INTO DeliveryStatusHistories (DeliveryId, FromStatus, ToStatus, ChangedByUserId, ChangedByUserRole, ChangedAt, Notes)
VALUES (@DEL_ID_5, 'Allocated', 'AwaitingTransporter', 'System', 'System', '2026-09-25 18:48:31', 'Order matched and ready for transporter.');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 40, 'Ready Delivery Meal Box #6', '["Dal Makhani", "Jeera Rice", "Papad"]', '2026-09-25 17:48:31', 'Allocated', 'Near Vaishnodevi Circle', 'Ahmedabad', 'Gujarat', 'Shivalik Hub');
SET @DEL_FID_6 = LAST_INSERT_ID();

INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 40, '2026-09-25 17:48:31', 'Allocated', 'Santram Relief Center', 'Ahmedabad', 'Gujarat', 'Shivalik Hub');
SET @DEL_NFID_6 = LAST_INSERT_ID();

INSERT INTO MatchedFoods (FID, DonorId, Providedquntity, donationDateTime, city, state, fromperfectLocation, NFID, ReceiverId, requestDateTime, Neededquntity, toperfectLocation)
VALUES (@DEL_FID_6, 'abc@gmail.com', 40, '2026-09-25 17:48:31', 'Ahmedabad', 'Gujarat', 'Shivalik Hub', @DEL_NFID_6, 'pqr@gmail.com', '2026-09-25 17:48:31', 40, 'Shivalik Hub');
SET @DEL_MFID_6 = LAST_INSERT_ID();


INSERT INTO FoodDeliveries (MatchedFoodId, DonorId, ReceiverId, TransporterId, Status, CreatedAt, AssignedAt, AcceptedAt, DeliveredAt)
VALUES (@DEL_MFID_6, 'abc@gmail.com', 'pqr@gmail.com', 'transporter@gmail.com', 'Accepted', '2026-09-25 17:48:31', '2026-09-25 17:48:31', '2026-09-25 17:48:31', NULL);
SET @DEL_ID_6 = LAST_INSERT_ID();

INSERT INTO DeliveryStatusHistories (DeliveryId, FromStatus, ToStatus, ChangedByUserId, ChangedByUserRole, ChangedAt, Notes)
VALUES (@DEL_ID_6, 'Allocated', 'AwaitingTransporter', 'System', 'System', '2026-09-25 17:48:31', 'Order matched and ready for transporter.');


INSERT INTO DeliveryStatusHistories (DeliveryId, FromStatus, ToStatus, ChangedByUserId, ChangedByUserRole, ChangedAt, Notes)
VALUES (@DEL_ID_6, 'AwaitingTransporter', 'Accepted', 'transporter@gmail.com', 'Transporter', '2026-09-25 17:48:31', 'Status updated by transporter.');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 40, 'Ready Delivery Meal Box #7', '["Dal Makhani", "Jeera Rice", "Papad"]', '2026-09-25 16:48:31', 'Allocated', 'Near Vaishnodevi Circle', 'Ahmedabad', 'Gujarat', 'Shivalik Hub');
SET @DEL_FID_7 = LAST_INSERT_ID();

INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 40, '2026-09-25 16:48:31', 'Allocated', 'Santram Relief Center', 'Ahmedabad', 'Gujarat', 'Shivalik Hub');
SET @DEL_NFID_7 = LAST_INSERT_ID();

INSERT INTO MatchedFoods (FID, DonorId, Providedquntity, donationDateTime, city, state, fromperfectLocation, NFID, ReceiverId, requestDateTime, Neededquntity, toperfectLocation)
VALUES (@DEL_FID_7, 'abc@gmail.com', 40, '2026-09-25 16:48:31', 'Ahmedabad', 'Gujarat', 'Shivalik Hub', @DEL_NFID_7, 'pqr@gmail.com', '2026-09-25 16:48:31', 40, 'Shivalik Hub');
SET @DEL_MFID_7 = LAST_INSERT_ID();


INSERT INTO FoodDeliveries (MatchedFoodId, DonorId, ReceiverId, TransporterId, Status, CreatedAt, AssignedAt, AcceptedAt, DeliveredAt)
VALUES (@DEL_MFID_7, 'abc@gmail.com', 'pqr@gmail.com', 'transporter@gmail.com', 'Accepted', '2026-09-25 16:48:31', '2026-09-25 16:48:31', '2026-09-25 16:48:31', NULL);
SET @DEL_ID_7 = LAST_INSERT_ID();

INSERT INTO DeliveryStatusHistories (DeliveryId, FromStatus, ToStatus, ChangedByUserId, ChangedByUserRole, ChangedAt, Notes)
VALUES (@DEL_ID_7, 'Allocated', 'AwaitingTransporter', 'System', 'System', '2026-09-25 16:48:31', 'Order matched and ready for transporter.');


INSERT INTO DeliveryStatusHistories (DeliveryId, FromStatus, ToStatus, ChangedByUserId, ChangedByUserRole, ChangedAt, Notes)
VALUES (@DEL_ID_7, 'AwaitingTransporter', 'Accepted', 'transporter@gmail.com', 'Transporter', '2026-09-25 16:48:31', 'Status updated by transporter.');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 40, 'Ready Delivery Meal Box #8', '["Dal Makhani", "Jeera Rice", "Papad"]', '2026-09-25 15:48:31', 'Allocated', 'Near Vaishnodevi Circle', 'Ahmedabad', 'Gujarat', 'Shivalik Hub');
SET @DEL_FID_8 = LAST_INSERT_ID();

INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 40, '2026-09-25 15:48:31', 'Allocated', 'Santram Relief Center', 'Ahmedabad', 'Gujarat', 'Shivalik Hub');
SET @DEL_NFID_8 = LAST_INSERT_ID();

INSERT INTO MatchedFoods (FID, DonorId, Providedquntity, donationDateTime, city, state, fromperfectLocation, NFID, ReceiverId, requestDateTime, Neededquntity, toperfectLocation)
VALUES (@DEL_FID_8, 'abc@gmail.com', 40, '2026-09-25 15:48:31', 'Ahmedabad', 'Gujarat', 'Shivalik Hub', @DEL_NFID_8, 'pqr@gmail.com', '2026-09-25 15:48:31', 40, 'Shivalik Hub');
SET @DEL_MFID_8 = LAST_INSERT_ID();


INSERT INTO FoodDeliveries (MatchedFoodId, DonorId, ReceiverId, TransporterId, Status, CreatedAt, AssignedAt, AcceptedAt, DeliveredAt)
VALUES (@DEL_MFID_8, 'abc@gmail.com', 'pqr@gmail.com', 'transporter@gmail.com', 'Accepted', '2026-09-25 15:48:31', '2026-09-25 15:48:31', '2026-09-25 15:48:31', NULL);
SET @DEL_ID_8 = LAST_INSERT_ID();

INSERT INTO DeliveryStatusHistories (DeliveryId, FromStatus, ToStatus, ChangedByUserId, ChangedByUserRole, ChangedAt, Notes)
VALUES (@DEL_ID_8, 'Allocated', 'AwaitingTransporter', 'System', 'System', '2026-09-25 15:48:31', 'Order matched and ready for transporter.');


INSERT INTO DeliveryStatusHistories (DeliveryId, FromStatus, ToStatus, ChangedByUserId, ChangedByUserRole, ChangedAt, Notes)
VALUES (@DEL_ID_8, 'AwaitingTransporter', 'Accepted', 'transporter@gmail.com', 'Transporter', '2026-09-25 15:48:31', 'Status updated by transporter.');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 40, 'Ready Delivery Meal Box #9', '["Dal Makhani", "Jeera Rice", "Papad"]', '2026-09-25 14:48:31', 'Allocated', 'Near Vaishnodevi Circle', 'Ahmedabad', 'Gujarat', 'Shivalik Hub');
SET @DEL_FID_9 = LAST_INSERT_ID();

INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 40, '2026-09-25 14:48:31', 'Allocated', 'Santram Relief Center', 'Ahmedabad', 'Gujarat', 'Shivalik Hub');
SET @DEL_NFID_9 = LAST_INSERT_ID();

INSERT INTO MatchedFoods (FID, DonorId, Providedquntity, donationDateTime, city, state, fromperfectLocation, NFID, ReceiverId, requestDateTime, Neededquntity, toperfectLocation)
VALUES (@DEL_FID_9, 'abc@gmail.com', 40, '2026-09-25 14:48:31', 'Ahmedabad', 'Gujarat', 'Shivalik Hub', @DEL_NFID_9, 'pqr@gmail.com', '2026-09-25 14:48:31', 40, 'Shivalik Hub');
SET @DEL_MFID_9 = LAST_INSERT_ID();


INSERT INTO FoodDeliveries (MatchedFoodId, DonorId, ReceiverId, TransporterId, Status, CreatedAt, AssignedAt, AcceptedAt, DeliveredAt)
VALUES (@DEL_MFID_9, 'abc@gmail.com', 'pqr@gmail.com', 'transporter@gmail.com', 'InTransit', '2026-09-25 14:48:31', '2026-09-25 14:48:31', '2026-09-25 14:48:31', NULL);
SET @DEL_ID_9 = LAST_INSERT_ID();

INSERT INTO DeliveryStatusHistories (DeliveryId, FromStatus, ToStatus, ChangedByUserId, ChangedByUserRole, ChangedAt, Notes)
VALUES (@DEL_ID_9, 'Allocated', 'AwaitingTransporter', 'System', 'System', '2026-09-25 14:48:31', 'Order matched and ready for transporter.');


INSERT INTO DeliveryStatusHistories (DeliveryId, FromStatus, ToStatus, ChangedByUserId, ChangedByUserRole, ChangedAt, Notes)
VALUES (@DEL_ID_9, 'AwaitingTransporter', 'InTransit', 'transporter@gmail.com', 'Transporter', '2026-09-25 14:48:31', 'Status updated by transporter.');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 40, 'Ready Delivery Meal Box #10', '["Dal Makhani", "Jeera Rice", "Papad"]', '2026-09-25 13:48:31', 'Allocated', 'Near Vaishnodevi Circle', 'Ahmedabad', 'Gujarat', 'Shivalik Hub');
SET @DEL_FID_10 = LAST_INSERT_ID();

INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 40, '2026-09-25 13:48:31', 'Allocated', 'Santram Relief Center', 'Ahmedabad', 'Gujarat', 'Shivalik Hub');
SET @DEL_NFID_10 = LAST_INSERT_ID();

INSERT INTO MatchedFoods (FID, DonorId, Providedquntity, donationDateTime, city, state, fromperfectLocation, NFID, ReceiverId, requestDateTime, Neededquntity, toperfectLocation)
VALUES (@DEL_FID_10, 'abc@gmail.com', 40, '2026-09-25 13:48:31', 'Ahmedabad', 'Gujarat', 'Shivalik Hub', @DEL_NFID_10, 'pqr@gmail.com', '2026-09-25 13:48:31', 40, 'Shivalik Hub');
SET @DEL_MFID_10 = LAST_INSERT_ID();


INSERT INTO FoodDeliveries (MatchedFoodId, DonorId, ReceiverId, TransporterId, Status, CreatedAt, AssignedAt, AcceptedAt, DeliveredAt)
VALUES (@DEL_MFID_10, 'abc@gmail.com', 'pqr@gmail.com', 'transporter@gmail.com', 'InTransit', '2026-09-25 13:48:31', '2026-09-25 13:48:31', '2026-09-25 13:48:31', NULL);
SET @DEL_ID_10 = LAST_INSERT_ID();

INSERT INTO DeliveryStatusHistories (DeliveryId, FromStatus, ToStatus, ChangedByUserId, ChangedByUserRole, ChangedAt, Notes)
VALUES (@DEL_ID_10, 'Allocated', 'AwaitingTransporter', 'System', 'System', '2026-09-25 13:48:31', 'Order matched and ready for transporter.');


INSERT INTO DeliveryStatusHistories (DeliveryId, FromStatus, ToStatus, ChangedByUserId, ChangedByUserRole, ChangedAt, Notes)
VALUES (@DEL_ID_10, 'AwaitingTransporter', 'InTransit', 'transporter@gmail.com', 'Transporter', '2026-09-25 13:48:31', 'Status updated by transporter.');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 40, 'Ready Delivery Meal Box #11', '["Dal Makhani", "Jeera Rice", "Papad"]', '2026-09-25 12:48:31', 'Allocated', 'Near Vaishnodevi Circle', 'Ahmedabad', 'Gujarat', 'Shivalik Hub');
SET @DEL_FID_11 = LAST_INSERT_ID();

INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 40, '2026-09-25 12:48:31', 'Allocated', 'Santram Relief Center', 'Ahmedabad', 'Gujarat', 'Shivalik Hub');
SET @DEL_NFID_11 = LAST_INSERT_ID();

INSERT INTO MatchedFoods (FID, DonorId, Providedquntity, donationDateTime, city, state, fromperfectLocation, NFID, ReceiverId, requestDateTime, Neededquntity, toperfectLocation)
VALUES (@DEL_FID_11, 'abc@gmail.com', 40, '2026-09-25 12:48:31', 'Ahmedabad', 'Gujarat', 'Shivalik Hub', @DEL_NFID_11, 'pqr@gmail.com', '2026-09-25 12:48:31', 40, 'Shivalik Hub');
SET @DEL_MFID_11 = LAST_INSERT_ID();


INSERT INTO FoodDeliveries (MatchedFoodId, DonorId, ReceiverId, TransporterId, Status, CreatedAt, AssignedAt, AcceptedAt, DeliveredAt)
VALUES (@DEL_MFID_11, 'abc@gmail.com', 'pqr@gmail.com', 'transporter@gmail.com', 'Delivered', '2026-09-25 12:48:31', '2026-09-25 12:48:31', '2026-09-25 12:48:31', '2026-09-25 12:48:31');
SET @DEL_ID_11 = LAST_INSERT_ID();

INSERT INTO DeliveryStatusHistories (DeliveryId, FromStatus, ToStatus, ChangedByUserId, ChangedByUserRole, ChangedAt, Notes)
VALUES (@DEL_ID_11, 'Allocated', 'AwaitingTransporter', 'System', 'System', '2026-09-25 12:48:31', 'Order matched and ready for transporter.');


INSERT INTO DeliveryStatusHistories (DeliveryId, FromStatus, ToStatus, ChangedByUserId, ChangedByUserRole, ChangedAt, Notes)
VALUES (@DEL_ID_11, 'AwaitingTransporter', 'Delivered', 'transporter@gmail.com', 'Transporter', '2026-09-25 12:48:31', 'Status updated by transporter.');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 40, 'Ready Delivery Meal Box #12', '["Dal Makhani", "Jeera Rice", "Papad"]', '2026-09-25 11:48:31', 'Allocated', 'Near Vaishnodevi Circle', 'Ahmedabad', 'Gujarat', 'Shivalik Hub');
SET @DEL_FID_12 = LAST_INSERT_ID();

INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 40, '2026-09-25 11:48:31', 'Allocated', 'Santram Relief Center', 'Ahmedabad', 'Gujarat', 'Shivalik Hub');
SET @DEL_NFID_12 = LAST_INSERT_ID();

INSERT INTO MatchedFoods (FID, DonorId, Providedquntity, donationDateTime, city, state, fromperfectLocation, NFID, ReceiverId, requestDateTime, Neededquntity, toperfectLocation)
VALUES (@DEL_FID_12, 'abc@gmail.com', 40, '2026-09-25 11:48:31', 'Ahmedabad', 'Gujarat', 'Shivalik Hub', @DEL_NFID_12, 'pqr@gmail.com', '2026-09-25 11:48:31', 40, 'Shivalik Hub');
SET @DEL_MFID_12 = LAST_INSERT_ID();


INSERT INTO FoodDeliveries (MatchedFoodId, DonorId, ReceiverId, TransporterId, Status, CreatedAt, AssignedAt, AcceptedAt, DeliveredAt)
VALUES (@DEL_MFID_12, 'abc@gmail.com', 'pqr@gmail.com', 'transporter@gmail.com', 'Delivered', '2026-09-25 11:48:31', '2026-09-25 11:48:31', '2026-09-25 11:48:31', '2026-09-25 11:48:31');
SET @DEL_ID_12 = LAST_INSERT_ID();

INSERT INTO DeliveryStatusHistories (DeliveryId, FromStatus, ToStatus, ChangedByUserId, ChangedByUserRole, ChangedAt, Notes)
VALUES (@DEL_ID_12, 'Allocated', 'AwaitingTransporter', 'System', 'System', '2026-09-25 11:48:31', 'Order matched and ready for transporter.');


INSERT INTO DeliveryStatusHistories (DeliveryId, FromStatus, ToStatus, ChangedByUserId, ChangedByUserRole, ChangedAt, Notes)
VALUES (@DEL_ID_12, 'AwaitingTransporter', 'Delivered', 'transporter@gmail.com', 'Transporter', '2026-09-25 11:48:31', 'Status updated by transporter.');
