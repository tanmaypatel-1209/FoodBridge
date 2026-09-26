
INSERT INTO Users (EmailID, Username, password, role, city)
VALUES ('abc@gmail.com', 'Tanmay Patel (Donor)', 'AQAAAAIAAYagAAAAEMeOMPuFZOYIT/yPdadIfQQ3l/YghrYr8FeJLWk8XBxtILwQNj5vqpmdB+SDSUVOYA==', 'Donor', 'Ahmedabad')
ON DUPLICATE KEY UPDATE password='AQAAAAIAAYagAAAAEMeOMPuFZOYIT/yPdadIfQQ3l/YghrYr8FeJLWk8XBxtILwQNj5vqpmdB+SDSUVOYA==', role='Donor';


INSERT INTO Users (EmailID, Username, password, role, city)
VALUES ('pqr@gmail.com', 'PQR Seva Trust (Receiver)', 'AQAAAAIAAYagAAAAEMeOMPuFZOYIT/yPdadIfQQ3l/YghrYr8FeJLWk8XBxtILwQNj5vqpmdB+SDSUVOYA==', 'Receiver', 'Nadiad')
ON DUPLICATE KEY UPDATE password='AQAAAAIAAYagAAAAEMeOMPuFZOYIT/yPdadIfQQ3l/YghrYr8FeJLWk8XBxtILwQNj5vqpmdB+SDSUVOYA==', role='Receiver';


INSERT INTO Users (EmailID, Username, password, role, city)
VALUES ('transporter@gmail.com', 'Amit Patel (Transporter)', 'AQAAAAIAAYagAAAAEMeOMPuFZOYIT/yPdadIfQQ3l/YghrYr8FeJLWk8XBxtILwQNj5vqpmdB+SDSUVOYA==', 'Transporter', 'Ahmedabad')
ON DUPLICATE KEY UPDATE password='AQAAAAIAAYagAAAAEMeOMPuFZOYIT/yPdadIfQQ3l/YghrYr8FeJLWk8XBxtILwQNj5vqpmdB+SDSUVOYA==', role='Transporter';


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 83, 'Masala Dosa Combo with Sambar & Chutneys', '["Crispy Masala Dosa", "Mixed Veg Sambar", "Coconut Chutney", "Tomato Chutney"]', '2026-09-24 05:01:16', 'pending', 'Near Varachha Main Road, Varachha', 'Surat', 'Gujarat', 'Mini Bazar Cross Roads, Varachha');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 116, 'Chole Kulche Street Style Combo', '["Pindi Chole", "Soft Butter Kulcha (2 pcs)", "Pickled Onions", "Green Chutney"]', '2026-09-24 17:49:16', 'Allocated', 'Near Uttarsanda Road Crossings', 'Nadiad', 'Gujarat', 'Expressway Toll Approach Road');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 79, 'Sambar Vada & Upma Breakfast Box', '["Rava Upma Bowl", "Crispy Medu Vada (2 pcs)", "Sambar Bowl"]', '2026-09-24 05:10:16', 'pending', 'Near Karelibaug Water Tank, Karelibaug', 'Vadodara', 'Gujarat', 'Vrundavan Vruddhashram, Karelibaug');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 94, 'Kathiyawadi Sev Tameta & Bajra Rotla', '["Sev Tameta Nu Shaak", "Bajra No Rotlo (2 pcs)", "Garlic Chutney", "Gud & Ghee"]', '2026-09-26 04:25:16', 'pending', 'VIP Road junction, Vesu', 'Surat', 'Gujarat', 'Vesu Canal Corridor, Near GD Goenka School');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 26, 'Fresh Steamed Khaman Dhokla & Khandvi', '["Khaman Dhokla", "Spiced Khandvi Roll", "Papaya Sambharo", "Sweet Kadhi"]', '2026-09-26 05:31:16', 'available', 'Near Shyamal Cross Roads, Satellite', 'Ahmedabad', 'Gujarat', 'Shyamal Row Houses, Satellite');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 103, 'Mumbai Style Butter Pav Bhaji', '["Butter Pav Bhaji Gravy", "Toasted Butter Pav (4 pcs)", "Lemon Wedges", "Diced Onions"]', '2026-09-25 14:28:16', 'Allocated', 'Near Gh-5 Circle, Sector 16', 'Gandhinagar', 'Gujarat', 'Sector 16 Government Colony Community Hall');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 86, 'Assorted Fresh Bakery Breads & Dinner Rolls', '["Whole Wheat Sandwich Loaves", "Dinner Butter Rolls", "Multigrain Breads"]', '2026-09-26 00:30:16', 'pending', 'Opposite Iscon Mega Mall, SG Highway', 'Ahmedabad', 'Gujarat', 'Iscon Cross Roads, SG Highway');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 77, 'Matar Paneer with Jeera Rice', '["Matar Paneer Curry", "Jeera Rice", "Papad", "Pickle"]', '2026-09-25 13:30:16', 'pending', 'Near Indoor Stadium, Athwa Lines', 'Surat', 'Gujarat', 'Athwa Gate Circle, Ghod Dod Road');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 84, 'Mix Veg Korma with Parotta', '["Creamy Mix Veg Korma", "Malabar Parotta (2 pcs)", "Onion Raita"]', '2026-09-24 04:37:16', 'pending', 'Near Akshar Chowk, Old Padra Road', 'Vadodara', 'Gujarat', 'Akshar Pavilion, Old Padra Road');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 54, 'Amritsari Chole Bhature with Pickled Onions', '["Amritsari Chole", "Fluffy Bhature (2 pcs)", "Mint Chutney", "Pickled Chilli"]', '2026-09-25 18:47:16', 'pending', 'Near Sardar Patel Bhavan, Santram Road', 'Nadiad', 'Gujarat', 'Santram Mandir Road');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 72, 'Veg Hakka Noodles with Veg Manchurian', '["Veg Hakka Noodles", "Veg Manchurian Dry (4 pcs)", "Chilli Garlic Sauce"]', '2026-09-25 00:33:16', 'pending', 'Near Indira Circle, University Road', 'Rajkot', 'Gujarat', 'University Road Bus Stop');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 68, 'Kadhi Pakora with Steamed Rice', '["Punjabi Kadhi with Pakoras", "Steamed Rice", "Spicy Pickle"]', '2026-09-25 17:00:16', 'pending', 'Near Varachha Main Road, Varachha', 'Surat', 'Gujarat', 'Mini Bazar Cross Roads, Varachha');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 67, 'Kadhi Pakora with Steamed Rice', '["Punjabi Kadhi with Pakoras", "Steamed Rice", "Spicy Pickle"]', '2026-09-25 07:47:16', 'pending', 'Near Gh-5 Circle, Sector 16', 'Gandhinagar', 'Gujarat', 'Sector 16 Government Colony Community Hall');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 88, 'Vegetable Cutlets with Mint Chutney & Bread', '["Spiced Veg Cutlets (4 pcs)", "Brown Bread Slices (4 pcs)", "Tomato Ketchup", "Mint Chutney"]', '2026-09-24 01:17:16', 'available', 'Near College Road, Christian Society', 'Nadiad', 'Gujarat', 'Methodist Mission Hospital Road');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 71, 'Aloo Gobi Matar with Phulka Rotis', '["Aloo Gobi Matar", "Phulka Roti (5 pcs)", "Moong Dal", "Cucumber Salad"]', '2026-09-24 03:40:16', 'Allocated', 'Near Fatehgunj Main Post Office, Fatehgunj', 'Vadodara', 'Gujarat', 'Fatehgunj Flyover Circle');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 15, 'Dal Makhani with Jeera Basmati Rice', '["Dal Makhani", "Jeera Basmati Rice", "Sirka Pyaz", "Papad"]', '2026-09-25 18:08:16', 'pending', 'Near Akshar Chowk, Old Padra Road', 'Vadodara', 'Gujarat', 'Akshar Pavilion, Old Padra Road');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 61, 'Fresh Vegetable Dum Biryani & Raita', '["Vegetable Dum Biryani", "Cucumber Mint Raita", "Roasted Papad"]', '2026-09-26 06:57:16', 'pending', 'Near Reliance Cross Roads, Kudasan', 'Gandhinagar', 'Gujarat', 'Kudasan Main Road, Gandhinagar');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 90, 'Masala Dosa Combo with Sambar & Chutneys', '["Crispy Masala Dosa", "Mixed Veg Sambar", "Coconut Chutney", "Tomato Chutney"]', '2026-09-25 04:04:16', 'pending', 'Near Madhapar Chowkadi, 150 Feet Ring Road', 'Rajkot', 'Gujarat', 'Madhapar Flyover Circle');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 87, 'Paneer Butter Masala with Butter Naan', '["Paneer Butter Masala", "Butter Tandoori Naan (2 pcs)", "Green Salad"]', '2026-09-25 02:09:16', 'Allocated', 'Near Shyamal Cross Roads, Satellite', 'Ahmedabad', 'Gujarat', 'Shyamal Row Houses, Satellite');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 50, 'Mix Veg Korma with Parotta', '["Creamy Mix Veg Korma", "Malabar Parotta (2 pcs)", "Onion Raita"]', '2026-09-25 22:15:16', 'available', 'Near CH-3 Circle, Sector 21', 'Gandhinagar', 'Gujarat', 'Sector 21 Shopping Center Ground');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 42, 'Amritsari Chole Bhature with Pickled Onions', '["Amritsari Chole", "Fluffy Bhature (2 pcs)", "Mint Chutney", "Pickled Chilli"]', '2026-09-26 12:00:16', 'available', 'Near CH-3 Circle, Sector 21', 'Gandhinagar', 'Gujarat', 'Sector 21 Shopping Center Ground');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 63, 'Paneer Butter Masala with Butter Naan', '["Paneer Butter Masala", "Butter Tandoori Naan (2 pcs)", "Green Salad"]', '2026-09-24 00:00:16', 'pending', 'Near Chandkheda Bus Terminal, Chandkheda', 'Ahmedabad', 'Gujarat', 'Tragad Road, Chandkheda');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 51, 'Methi Thepla with Masala Chai & Chunda', '["Methi Thepla (6 pcs)", "Mango Chunda", "Spicy Pickle"]', '2026-09-24 15:34:16', 'pending', 'Behind Community Health Center, Pandesara', 'Surat', 'Gujarat', 'Pandesara GIDC Community Center');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 101, 'Assorted Fresh Bakery Breads & Dinner Rolls', '["Whole Wheat Sandwich Loaves", "Dinner Butter Rolls", "Multigrain Breads"]', '2026-09-24 21:37:16', 'available', 'Near C.G. Road Crossings, Navrangpura', 'Ahmedabad', 'Gujarat', 'Supermall, C.G. Road');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 22, 'Mixed Vegetable Pulao with Boondi Raita', '["Mixed Vegetable Pulao", "Boondi Raita", "Roasted Papad", "Mint Chutney"]', '2026-09-26 07:14:16', 'Allocated', 'Near Uttarsanda Road Crossings', 'Nadiad', 'Gujarat', 'Expressway Toll Approach Road');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 101, 'Methi Thepla with Masala Chai & Chunda', '["Methi Thepla (6 pcs)", "Mango Chunda", "Spicy Pickle"]', '2026-09-25 19:18:16', 'available', 'Near Pal RTO, Pal', 'Surat', 'Gujarat', 'Pal Gam Community Hall');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 96, 'Traditional Gujarati Thali Meal Packs', '["Phulka Roti (4 pcs)", "Gujarati Dal", "Bhindu Sambharo", "Steamed Rice", "Mohanthal"]', '2026-09-25 21:11:16', 'pending', 'Behind Community Health Center, Pandesara', 'Surat', 'Gujarat', 'Pandesara GIDC Community Center');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 100, 'Nutritious Moong Dal Khichdi & Gujarati Kadhi', '["Moong Dal Khichdi", "Sweet & Sour Kadhi", "Fried Papad", "Achar"]', '2026-09-26 04:28:16', 'pending', 'Near Reliance Cross Roads, Kudasan', 'Gandhinagar', 'Gujarat', 'Kudasan Main Road, Gandhinagar');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 67, 'Mumbai Style Butter Pav Bhaji', '["Butter Pav Bhaji Gravy", "Toasted Butter Pav (4 pcs)", "Lemon Wedges", "Diced Onions"]', '2026-09-24 20:59:16', 'pending', 'Near Sardar Patel Bhavan, Santram Road', 'Nadiad', 'Gujarat', 'Santram Mandir Road');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 119, 'Traditional Gujarati Thali Meal Packs', '["Phulka Roti (4 pcs)", "Gujarati Dal", "Bhindu Sambharo", "Steamed Rice", "Mohanthal"]', '2026-09-25 18:16:16', 'done', 'Near Yagnik Road, Jagnath Plot', 'Rajkot', 'Gujarat', 'Imperial Palace Road, Yagnik Road');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 82, 'Kadhi Pakora with Steamed Rice', '["Punjabi Kadhi with Pakoras", "Steamed Rice", "Spicy Pickle"]', '2026-09-24 09:03:16', 'pending', 'Opposite Kalupur Railway Station, Kalupur', 'Ahmedabad', 'Gujarat', 'Rain Basera Shelter, Kalupur Gate 2');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 33, 'Khaman & Nylon Sev Poha Pack', '["Nylon Sev Khaman", "Indori Poha", "Fried Peanuts", "Sweet Chutney"]', '2026-09-24 07:57:16', 'pending', 'Near Sardar Patel Bhavan, Santram Road', 'Nadiad', 'Gujarat', 'Santram Mandir Road');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 39, 'Matar Paneer with Jeera Rice', '["Matar Paneer Curry", "Jeera Rice", "Papad", "Pickle"]', '2026-09-24 04:59:16', 'available', 'Near Reliance Cross Roads, Kudasan', 'Gandhinagar', 'Gujarat', 'Kudasan Main Road, Gandhinagar');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 52, 'Punjabi Rajma Masala with Basmati Rice', '["Punjabi Rajma Gravy", "Steamed Basmati Rice", "Kachumber Salad", "Roasted Papad"]', '2026-09-25 16:10:16', 'done', 'Near Town Hall, Station Road', 'Anand', 'Gujarat', 'Anand Railway Station West Gate');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 29, 'Assorted Fresh Bakery Breads & Dinner Rolls', '["Whole Wheat Sandwich Loaves", "Dinner Butter Rolls", "Multigrain Breads"]', '2026-09-26 03:24:16', 'available', 'Near Gotri Medical College, Gotri', 'Vadodara', 'Gujarat', 'Gotri Road Community Center');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 39, 'Amritsari Chole Bhature with Pickled Onions', '["Amritsari Chole", "Fluffy Bhature (2 pcs)", "Mint Chutney", "Pickled Chilli"]', '2026-09-24 11:38:16', 'pending', 'Near Madhapar Chowkadi, 150 Feet Ring Road', 'Rajkot', 'Gujarat', 'Madhapar Flyover Circle');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 82, 'Sambar Vada & Upma Breakfast Box', '["Rava Upma Bowl", "Crispy Medu Vada (2 pcs)", "Sambar Bowl"]', '2026-09-25 04:14:16', 'pending', 'Near Venus Atlantis, Corporate Road, Prahlad Nagar', 'Ahmedabad', 'Gujarat', 'Prahlad Nagar Corporate Road');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 96, 'Palak Paneer with Tandoori Butter Roti', '["Palak Paneer Gravy", "Tandoori Butter Roti (3 pcs)", "Onion Salad"]', '2026-09-24 23:24:16', 'pending', 'Near Gh-5 Circle, Sector 16', 'Gandhinagar', 'Gujarat', 'Sector 16 Government Colony Community Hall');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 92, 'Fresh Vegetable Dum Biryani & Raita', '["Vegetable Dum Biryani", "Cucumber Mint Raita", "Roasted Papad"]', '2026-09-24 07:26:16', 'pending', 'Near CH-3 Circle, Sector 21', 'Gandhinagar', 'Gujarat', 'Sector 21 Shopping Center Ground');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 56, 'Mix Veg Korma with Parotta', '["Creamy Mix Veg Korma", "Malabar Parotta (2 pcs)", "Onion Raita"]', '2026-09-24 11:53:16', 'pending', 'Near Madhapar Chowkadi, 150 Feet Ring Road', 'Rajkot', 'Gujarat', 'Madhapar Flyover Circle');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 25, 'Masala Dosa Combo with Sambar & Chutneys', '["Crispy Masala Dosa", "Mixed Veg Sambar", "Coconut Chutney", "Tomato Chutney"]', '2026-09-25 14:29:16', 'pending', 'Near Varachha Main Road, Varachha', 'Surat', 'Gujarat', 'Mini Bazar Cross Roads, Varachha');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 89, 'Traditional Gujarati Thali Meal Packs', '["Phulka Roti (4 pcs)", "Gujarati Dal", "Bhindu Sambharo", "Steamed Rice", "Mohanthal"]', '2026-09-24 02:06:16', 'pending', 'Santram Bal Ashram Trust, Santram Road', 'Nadiad', 'Gujarat', 'Santram Bal Ashram Gate 1');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 112, 'Veg Biryani with Mirchi Ka Salan', '["Hyderabadi Veg Biryani", "Mirchi Ka Salan", "Raita"]', '2026-09-25 12:50:16', 'pending', 'Near Indoor Stadium, Athwa Lines', 'Surat', 'Gujarat', 'Athwa Gate Circle, Ghod Dod Road');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 20, 'Matar Paneer with Jeera Rice', '["Matar Paneer Curry", "Jeera Rice", "Papad", "Pickle"]', '2026-09-26 04:15:16', 'pending', 'Near Pal RTO, Pal', 'Surat', 'Gujarat', 'Pal Gam Community Hall');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 76, 'Chole Kulche Street Style Combo', '["Pindi Chole", "Soft Butter Kulcha (2 pcs)", "Pickled Onions", "Green Chutney"]', '2026-09-24 18:40:16', 'pending', 'Santram Bal Ashram Trust, Santram Road', 'Nadiad', 'Gujarat', 'Santram Bal Ashram Gate 1');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 120, 'Dal Makhani with Jeera Basmati Rice', '["Dal Makhani", "Jeera Basmati Rice", "Sirka Pyaz", "Papad"]', '2026-09-24 04:42:16', 'pending', 'Near Reliance Cross Roads, Kudasan', 'Gandhinagar', 'Gujarat', 'Kudasan Main Road, Gandhinagar');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 38, 'Mixed Vegetable Pulao with Boondi Raita', '["Mixed Vegetable Pulao", "Boondi Raita", "Roasted Papad", "Mint Chutney"]', '2026-09-24 22:11:16', 'pending', 'Near IRMA Campus, Anand-Vidyanagar Road', 'Anand', 'Gujarat', 'Bhaikaka Statue, Vallabh Vidyanagar');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 41, 'Mixed Vegetable Pulao with Boondi Raita', '["Mixed Vegetable Pulao", "Boondi Raita", "Roasted Papad", "Mint Chutney"]', '2026-09-25 08:49:16', 'pending', 'Near Vaishnodevi Circle, SG Highway', 'Ahmedabad', 'Gujarat', 'Shivalik Business Hub, SG Highway');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 21, 'South Indian Breakfast Combo (Idli & Vada)', '["Steamed Idli (3 pcs)", "Medu Vada (2 pcs)", "Vegetable Sambar", "Coconut Chutney"]', '2026-09-24 23:36:16', 'pending', 'Near Pal RTO, Pal', 'Surat', 'Gujarat', 'Pal Gam Community Hall');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 25, 'Baingan Bhartha with Bajra Rotla', '["Smoked Ringan Bharthu", "Hot Bajra Rotla (2 pcs)", "Chaas Glass", "Green Garlic Chutney"]', '2026-09-25 00:01:16', 'available', 'Near IRMA Campus, Anand-Vidyanagar Road', 'Anand', 'Gujarat', 'Bhaikaka Statue, Vallabh Vidyanagar');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 83, 'Veg Hakka Noodles with Veg Manchurian', '["Veg Hakka Noodles", "Veg Manchurian Dry (4 pcs)", "Chilli Garlic Sauce"]', '2026-09-25 14:41:16', 'Allocated', 'Near Borsad Chowkadi, Anand', 'Anand', 'Gujarat', 'Borsad Highway Junction');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 107, 'Palak Paneer with Tandoori Butter Roti', '["Palak Paneer Gravy", "Tandoori Butter Roti (3 pcs)", "Onion Salad"]', '2026-09-25 21:19:16', 'pending', 'VIP Road junction, Vesu', 'Surat', 'Gujarat', 'Vesu Canal Corridor, Near GD Goenka School');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 44, 'Veg Fried Rice with Manchurian Gravy', '["Veg Fried Rice", "Vegetable Manchurian Gravy", "Crispy Noodles"]', '2026-09-23 23:57:16', 'pending', 'Near Karelibaug Water Tank, Karelibaug', 'Vadodara', 'Gujarat', 'Vrundavan Vruddhashram, Karelibaug');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 29, 'Kadhi Pakora with Steamed Rice', '["Punjabi Kadhi with Pakoras", "Steamed Rice", "Spicy Pickle"]', '2026-09-24 06:40:16', 'available', 'Near Gh-5 Circle, Sector 16', 'Gandhinagar', 'Gujarat', 'Sector 16 Government Colony Community Hall');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 115, 'Matar Paneer with Jeera Rice', '["Matar Paneer Curry", "Jeera Rice", "Papad", "Pickle"]', '2026-09-24 12:54:16', 'pending', 'Opposite Iscon Mega Mall, SG Highway', 'Ahmedabad', 'Gujarat', 'Iscon Cross Roads, SG Highway');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 58, 'South Indian Breakfast Combo (Idli & Vada)', '["Steamed Idli (3 pcs)", "Medu Vada (2 pcs)", "Vegetable Sambar", "Coconut Chutney"]', '2026-09-24 00:19:16', 'pending', 'Near Karelibaug Water Tank, Karelibaug', 'Vadodara', 'Gujarat', 'Vrundavan Vruddhashram, Karelibaug');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 78, 'Methi Thepla with Masala Chai & Chunda', '["Methi Thepla (6 pcs)", "Mango Chunda", "Spicy Pickle"]', '2026-09-25 17:02:16', 'pending', 'Near College Road, Christian Society', 'Nadiad', 'Gujarat', 'Methodist Mission Hospital Road');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 54, 'Khaman & Nylon Sev Poha Pack', '["Nylon Sev Khaman", "Indori Poha", "Fried Peanuts", "Sweet Chutney"]', '2026-09-26 09:46:16', 'pending', 'Near Gotri Medical College, Gotri', 'Vadodara', 'Gujarat', 'Gotri Road Community Center');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 118, 'Nutritious Moong Dal Khichdi & Gujarati Kadhi', '["Moong Dal Khichdi", "Sweet & Sour Kadhi", "Fried Papad", "Achar"]', '2026-09-25 21:43:16', 'Allocated', 'Near Indoor Stadium, Athwa Lines', 'Surat', 'Gujarat', 'Athwa Gate Circle, Ghod Dod Road');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 32, 'Khaman & Nylon Sev Poha Pack', '["Nylon Sev Khaman", "Indori Poha", "Fried Peanuts", "Sweet Chutney"]', '2026-09-24 07:46:16', 'pending', 'Santram Bal Ashram Trust, Santram Road', 'Nadiad', 'Gujarat', 'Santram Bal Ashram Gate 1');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 18, 'Mumbai Style Butter Pav Bhaji', '["Butter Pav Bhaji Gravy", "Toasted Butter Pav (4 pcs)", "Lemon Wedges", "Diced Onions"]', '2026-09-25 15:09:16', 'pending', 'Near Manjalpur Naka, Manjalpur', 'Vadodara', 'Gujarat', 'Manjalpur Sports Complex Gate');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 19, 'Assorted Fresh Bakery Breads & Dinner Rolls', '["Whole Wheat Sandwich Loaves", "Dinner Butter Rolls", "Multigrain Breads"]', '2026-09-25 05:16:16', 'pending', 'Near Gondal Road ST Workshop, Gondal Road', 'Rajkot', 'Gujarat', 'Malaviya Chowk, Gondal Road');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 19, 'Fresh Vegetable Dum Biryani & Raita', '["Vegetable Dum Biryani", "Cucumber Mint Raita", "Roasted Papad"]', '2026-09-24 15:51:16', 'pending', 'Near Borsad Chowkadi, Anand', 'Anand', 'Gujarat', 'Borsad Highway Junction');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 81, 'Nutritious Moong Dal Khichdi & Gujarati Kadhi', '["Moong Dal Khichdi", "Sweet & Sour Kadhi", "Fried Papad", "Achar"]', '2026-09-25 13:13:16', 'pending', 'Near Indira Circle, University Road', 'Rajkot', 'Gujarat', 'University Road Bus Stop');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 82, 'Fresh Steamed Khaman Dhokla & Khandvi', '["Khaman Dhokla", "Spiced Khandvi Roll", "Papaya Sambharo", "Sweet Kadhi"]', '2026-09-24 14:27:16', 'pending', 'Near Town Hall, Station Road', 'Anand', 'Gujarat', 'Anand Railway Station West Gate');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 19, 'Vegetable Cutlets with Mint Chutney & Bread', '["Spiced Veg Cutlets (4 pcs)", "Brown Bread Slices (4 pcs)", "Tomato Ketchup", "Mint Chutney"]', '2026-09-24 04:31:16', 'Allocated', 'Near Town Hall, Station Road', 'Anand', 'Gujarat', 'Anand Railway Station West Gate');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 118, 'Veg Hakka Noodles with Veg Manchurian', '["Veg Hakka Noodles", "Veg Manchurian Dry (4 pcs)", "Chilli Garlic Sauce"]', '2026-09-25 19:47:16', 'pending', 'Near IRMA Campus, Anand-Vidyanagar Road', 'Anand', 'Gujarat', 'Bhaikaka Statue, Vallabh Vidyanagar');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 67, 'Dal Tadka with Steamed Rice & Green Salad', '["Yellow Dal Tadka", "Steamed Basmati Rice", "Fried Green Chillies", "Papad"]', '2026-09-24 00:39:16', 'pending', 'Near Bhaijipura Cross Roads, PDPU Road', 'Gandhinagar', 'Gujarat', 'PDPU Campus Road, Raysan');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 61, 'Nutritious Moong Dal Khichdi & Gujarati Kadhi', '["Moong Dal Khichdi", "Sweet & Sour Kadhi", "Fried Papad", "Achar"]', '2026-09-25 19:52:16', 'done', 'Near Yagnik Road, Jagnath Plot', 'Rajkot', 'Gujarat', 'Imperial Palace Road, Yagnik Road');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 83, 'Nutritious Moong Dal Khichdi & Gujarati Kadhi', '["Moong Dal Khichdi", "Sweet & Sour Kadhi", "Fried Papad", "Achar"]', '2026-09-25 21:50:16', 'available', 'Santram Bal Ashram Trust, Santram Road', 'Nadiad', 'Gujarat', 'Santram Bal Ashram Gate 1');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 98, 'Palak Paneer with Tandoori Butter Roti', '["Palak Paneer Gravy", "Tandoori Butter Roti (3 pcs)", "Onion Salad"]', '2026-09-25 14:20:16', 'pending', 'Near Sardar Patel Bhavan, Santram Road', 'Nadiad', 'Gujarat', 'Santram Mandir Road');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 34, 'Palak Paneer with Tandoori Butter Roti', '["Palak Paneer Gravy", "Tandoori Butter Roti (3 pcs)", "Onion Salad"]', '2026-09-26 04:26:16', 'available', 'Near Madhapar Chowkadi, 150 Feet Ring Road', 'Rajkot', 'Gujarat', 'Madhapar Flyover Circle');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 106, 'Punjabi Rajma Masala with Basmati Rice', '["Punjabi Rajma Gravy", "Steamed Basmati Rice", "Kachumber Salad", "Roasted Papad"]', '2026-09-25 02:11:16', 'available', 'Near Borsad Chowkadi, Anand', 'Anand', 'Gujarat', 'Borsad Highway Junction');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 117, 'Masala Dosa Combo with Sambar & Chutneys', '["Crispy Masala Dosa", "Mixed Veg Sambar", "Coconut Chutney", "Tomato Chutney"]', '2026-09-25 02:49:16', 'pending', 'Santram Bal Ashram Trust, Santram Road', 'Nadiad', 'Gujarat', 'Santram Bal Ashram Gate 1');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 104, 'Aloo Gobi Matar with Phulka Rotis', '["Aloo Gobi Matar", "Phulka Roti (5 pcs)", "Moong Dal", "Cucumber Salad"]', '2026-09-26 01:14:16', 'Allocated', 'Behind Vadodara Central Mall, Alkapuri', 'Vadodara', 'Gujarat', 'Alkapuri Club Road, Opposite Express Hotel');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 92, 'Mixed Vegetable Pulao with Boondi Raita', '["Mixed Vegetable Pulao", "Boondi Raita", "Roasted Papad", "Mint Chutney"]', '2026-09-25 02:47:16', 'pending', 'Near Indoor Stadium, Athwa Lines', 'Surat', 'Gujarat', 'Athwa Gate Circle, Ghod Dod Road');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 119, 'Assorted Fresh Bakery Breads & Dinner Rolls', '["Whole Wheat Sandwich Loaves", "Dinner Butter Rolls", "Multigrain Breads"]', '2026-09-25 02:02:16', 'Allocated', 'Near Akshar Chowk, Old Padra Road', 'Vadodara', 'Gujarat', 'Akshar Pavilion, Old Padra Road');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 81, 'Masala Dosa Combo with Sambar & Chutneys', '["Crispy Masala Dosa", "Mixed Veg Sambar", "Coconut Chutney", "Tomato Chutney"]', '2026-09-24 05:28:16', 'pending', 'Near Varachha Main Road, Varachha', 'Surat', 'Gujarat', 'Mini Bazar Cross Roads, Varachha');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 103, 'Veg Hakka Noodles with Veg Manchurian', '["Veg Hakka Noodles", "Veg Manchurian Dry (4 pcs)", "Chilli Garlic Sauce"]', '2026-09-26 04:57:16', 'pending', 'Near Fatehgunj Main Post Office, Fatehgunj', 'Vadodara', 'Gujarat', 'Fatehgunj Flyover Circle');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 112, 'Mumbai Style Butter Pav Bhaji', '["Butter Pav Bhaji Gravy", "Toasted Butter Pav (4 pcs)", "Lemon Wedges", "Diced Onions"]', '2026-09-25 20:29:16', 'pending', 'Opposite Ahmedabad University Campus, Navrangpura', 'Ahmedabad', 'Gujarat', 'Commerce Six Roads, Navrangpura');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 43, 'Traditional Gujarati Thali Meal Packs', '["Phulka Roti (4 pcs)", "Gujarati Dal", "Bhindu Sambharo", "Steamed Rice", "Mohanthal"]', '2026-09-25 04:38:16', 'pending', 'Near Fatehgunj Main Post Office, Fatehgunj', 'Vadodara', 'Gujarat', 'Fatehgunj Flyover Circle');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 111, 'Assorted Fresh Bakery Breads & Dinner Rolls', '["Whole Wheat Sandwich Loaves", "Dinner Butter Rolls", "Multigrain Breads"]', '2026-09-24 17:52:16', 'available', 'Behind Vadodara Central Mall, Alkapuri', 'Vadodara', 'Gujarat', 'Alkapuri Club Road, Opposite Express Hotel');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 21, 'Vegetable Cutlets with Mint Chutney & Bread', '["Spiced Veg Cutlets (4 pcs)", "Brown Bread Slices (4 pcs)", "Tomato Ketchup", "Mint Chutney"]', '2026-09-26 07:58:16', 'pending', 'Near Infocity Club & Resort, Sector 0', 'Gandhinagar', 'Gujarat', 'Infocity IT Tower 2, Sector 0');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 39, 'Mixed Vegetable Pulao with Boondi Raita', '["Mixed Vegetable Pulao", "Boondi Raita", "Roasted Papad", "Mint Chutney"]', '2026-09-26 10:54:16', 'pending', 'Near CH-3 Circle, Sector 21', 'Gandhinagar', 'Gujarat', 'Sector 21 Shopping Center Ground');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 69, 'Fresh Vegetable Dum Biryani & Raita', '["Vegetable Dum Biryani", "Cucumber Mint Raita", "Roasted Papad"]', '2026-09-26 06:21:16', 'pending', 'Near Bopal Cross Roads, South Bopal', 'Ahmedabad', 'Gujarat', 'Sobha Dream Acres, South Bopal');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 30, 'Palak Paneer with Tandoori Butter Roti', '["Palak Paneer Gravy", "Tandoori Butter Roti (3 pcs)", "Onion Salad"]', '2026-09-26 09:19:16', 'pending', 'Near Infocity Club & Resort, Sector 0', 'Gandhinagar', 'Gujarat', 'Infocity IT Tower 2, Sector 0');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 107, 'Mixed Vegetable Pulao with Boondi Raita', '["Mixed Vegetable Pulao", "Boondi Raita", "Roasted Papad", "Mint Chutney"]', '2026-09-24 18:37:16', 'pending', 'Near Textile Market Gate 1, Ring Road', 'Surat', 'Gujarat', 'Ring Road Flyover Junction');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 56, 'Sambar Vada & Upma Breakfast Box', '["Rava Upma Bowl", "Crispy Medu Vada (2 pcs)", "Sambar Bowl"]', '2026-09-24 12:42:16', 'pending', 'Near Akshar Chowk, Old Padra Road', 'Vadodara', 'Gujarat', 'Akshar Pavilion, Old Padra Road');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 112, 'Fresh Steamed Khaman Dhokla & Khandvi', '["Khaman Dhokla", "Spiced Khandvi Roll", "Papaya Sambharo", "Sweet Kadhi"]', '2026-09-25 02:23:16', 'pending', 'Near Infocity Club & Resort, Sector 0', 'Gandhinagar', 'Gujarat', 'Infocity IT Tower 2, Sector 0');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 27, 'Mumbai Style Butter Pav Bhaji', '["Butter Pav Bhaji Gravy", "Toasted Butter Pav (4 pcs)", "Lemon Wedges", "Diced Onions"]', '2026-09-25 04:11:16', 'pending', 'Near Textile Market Gate 1, Ring Road', 'Surat', 'Gujarat', 'Ring Road Flyover Junction');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 93, 'Sambar Vada & Upma Breakfast Box', '["Rava Upma Bowl", "Crispy Medu Vada (2 pcs)", "Sambar Bowl"]', '2026-09-25 02:48:16', 'pending', 'Near Shyamal Cross Roads, Satellite', 'Ahmedabad', 'Gujarat', 'Shyamal Row Houses, Satellite');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 89, 'Masala Dosa Combo with Sambar & Chutneys', '["Crispy Masala Dosa", "Mixed Veg Sambar", "Coconut Chutney", "Tomato Chutney"]', '2026-09-26 08:37:16', 'available', 'Near Reliance Cross Roads, Kudasan', 'Gandhinagar', 'Gujarat', 'Kudasan Main Road, Gandhinagar');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 72, 'Nutritious Moong Dal Khichdi & Gujarati Kadhi', '["Moong Dal Khichdi", "Sweet & Sour Kadhi", "Fried Papad", "Achar"]', '2026-09-25 02:45:16', 'pending', 'Near Pal RTO, Pal', 'Surat', 'Gujarat', 'Pal Gam Community Hall');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 107, 'Masala Dosa Combo with Sambar & Chutneys', '["Crispy Masala Dosa", "Mixed Veg Sambar", "Coconut Chutney", "Tomato Chutney"]', '2026-09-24 17:30:16', 'pending', 'Near Indira Circle, University Road', 'Rajkot', 'Gujarat', 'University Road Bus Stop');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 30, 'Methi Thepla with Masala Chai & Chunda', '["Methi Thepla (6 pcs)", "Mango Chunda", "Spicy Pickle"]', '2026-09-24 11:12:16', 'done', 'Opposite MSU Arts Faculty, Sayajigunj', 'Vadodara', 'Gujarat', 'Sayajigunj Near Railway Station Gate 3');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 94, 'Mumbai Style Butter Pav Bhaji', '["Butter Pav Bhaji Gravy", "Toasted Butter Pav (4 pcs)", "Lemon Wedges", "Diced Onions"]', '2026-09-26 07:46:16', 'pending', 'Near Textile Market Gate 1, Ring Road', 'Surat', 'Gujarat', 'Ring Road Flyover Junction');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 81, 'Sambar Vada & Upma Breakfast Box', '["Rava Upma Bowl", "Crispy Medu Vada (2 pcs)", "Sambar Bowl"]', '2026-09-24 19:13:16', 'pending', 'Near Gondal Road ST Workshop, Gondal Road', 'Rajkot', 'Gujarat', 'Malaviya Chowk, Gondal Road');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 49, 'Aloo Gobi Matar with Phulka Rotis', '["Aloo Gobi Matar", "Phulka Roti (5 pcs)", "Moong Dal", "Cucumber Salad"]', '2026-09-24 11:42:16', 'pending', 'Near Akshar Chowk, Old Padra Road', 'Vadodara', 'Gujarat', 'Akshar Pavilion, Old Padra Road');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 100, 'Veg Biryani with Mirchi Ka Salan', '["Hyderabadi Veg Biryani", "Mirchi Ka Salan", "Raita"]', '2026-09-24 06:30:16', 'pending', 'Near Textile Market Gate 1, Ring Road', 'Surat', 'Gujarat', 'Ring Road Flyover Junction');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 58, 'Aloo Gobi Matar with Phulka Rotis', '["Aloo Gobi Matar", "Phulka Roti (5 pcs)", "Moong Dal", "Cucumber Salad"]', '2026-09-24 15:29:16', 'done', 'Near Vastrapur Lake, Vastrapur', 'Ahmedabad', 'Gujarat', 'Alpha One Mall, Vastrapur');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 96, '2026-09-26 19:53:16', 'pending', 'Vrundavan Old Age Home & Care Shelter, Behind Community Health Center, Pandesara', 'Surat', 'Gujarat', 'Pandesara GIDC Community Center');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 61, '2026-09-25 06:54:16', 'pending', 'Snehalaya Leprosy & Destitute Relief Center, Behind Community Health Center, Pandesara', 'Surat', 'Gujarat', 'Pandesara GIDC Community Center');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 84, '2026-09-26 05:02:16', 'pending', 'Prahlad Nagar Construction Camp Daily Food Program, Near Uttarsanda Road Crossings', 'Nadiad', 'Gujarat', 'Expressway Toll Approach Road');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 30, '2026-09-25 17:07:16', 'Allocated', 'Apang Manav Mandal Specially Abled Care Foundation, Near Bopal Cross Roads, South Bopal', 'Ahmedabad', 'Gujarat', 'Sobha Dream Acres, South Bopal');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 38, '2026-09-26 03:18:16', 'pending', 'Sector 16 Night Care Center for Rural Migrants, Near Gotri Medical College, Gotri', 'Vadodara', 'Gujarat', 'Gotri Road Community Center');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 88, '2026-09-25 10:44:16', 'Allocated', 'Alkapuri Slum Women & Children Nutrition Point, Near Textile Market Gate 1, Ring Road', 'Surat', 'Gujarat', 'Ring Road Flyover Junction');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 76, '2026-09-25 06:50:16', 'pending', 'Gota Metro Construction Labor Community Camp, Near Gondal Road ST Workshop, Gondal Road', 'Rajkot', 'Gujarat', 'Malaviya Chowk, Gondal Road');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 21, '2026-09-25 17:29:16', 'pending', 'Rain Basera Night Shelter for Homeless Citizens, Near CH-3 Circle, Sector 21', 'Gandhinagar', 'Gujarat', 'Sector 21 Shopping Center Ground');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 76, '2026-09-26 21:56:16', 'Fulfilled', 'Gota Metro Construction Labor Community Camp, Near CH-3 Circle, Sector 21', 'Gandhinagar', 'Gujarat', 'Sector 21 Shopping Center Ground');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 26, '2026-09-25 23:03:16', 'pending', 'Chandkheda Community Relief Foundation Food Cell, Near Borsad Chowkadi, Anand', 'Anand', 'Gujarat', 'Borsad Highway Junction');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 35, '2026-09-26 10:46:16', 'pending', 'Sector 16 Night Care Center for Rural Migrants, Near Gondal Road ST Workshop, Gondal Road', 'Rajkot', 'Gujarat', 'Malaviya Chowk, Gondal Road');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 90, '2026-09-26 00:10:16', 'Allocated', 'Mother Teresa Home for the Dying Destitute, Near CH-3 Circle, Sector 21', 'Gandhinagar', 'Gujarat', 'Sector 21 Shopping Center Ground');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 32, '2026-09-26 21:57:16', 'pending', 'Prahlad Nagar Construction Camp Daily Food Program, Near Sardar Patel Bhavan, Santram Road', 'Nadiad', 'Gujarat', 'Santram Mandir Road');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 97, '2026-09-26 05:18:16', 'pending', 'Mother Teresa Home for the Dying Destitute, Near Bhaijipura Cross Roads, PDPU Road', 'Gandhinagar', 'Gujarat', 'PDPU Campus Road, Raysan');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 44, '2026-09-25 14:21:16', 'pending', 'Shishu Gruh Destitute Children Welfare Center, Near Infocity Club & Resort, Sector 0', 'Gandhinagar', 'Gujarat', 'Infocity IT Tower 2, Sector 0');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 23, '2026-09-26 20:16:16', 'pending', 'Snehalaya Leprosy & Destitute Relief Center, Near Venus Atlantis, Corporate Road, Prahlad Nagar', 'Ahmedabad', 'Gujarat', 'Prahlad Nagar Corporate Road');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 82, '2026-09-26 23:25:16', 'Fulfilled', 'Shishu Gruh Destitute Children Welfare Center, Near Akshar Chowk, Old Padra Road', 'Vadodara', 'Gujarat', 'Akshar Pavilion, Old Padra Road');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 49, '2026-09-26 21:05:16', 'Allocated', 'Gota Metro Construction Labor Community Camp, Near Infocity Club & Resort, Sector 0', 'Gandhinagar', 'Gujarat', 'Infocity IT Tower 2, Sector 0');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 79, '2026-09-25 21:15:16', 'Allocated', 'Alkapuri Slum Women & Children Nutrition Point, Near Amul Dairy Campus, Amul Dairy Road', 'Anand', 'Gujarat', 'Amul Circle, Anand');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 72, '2026-09-25 18:20:16', 'pending', 'Shishu Gruh Destitute Children Welfare Center, Near Gota Flyover, SG Highway', 'Ahmedabad', 'Gujarat', 'Gota Community Labor Camp');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 80, '2026-09-26 10:58:16', 'Fulfilled', 'Karelibaug Slum Children Daily Nutrition Center, Near CH-3 Circle, Sector 21', 'Gandhinagar', 'Gujarat', 'Sector 21 Shopping Center Ground');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 81, '2026-09-26 06:51:16', 'Allocated', 'Sector 16 Night Care Center for Rural Migrants, Near Town Hall, Station Road', 'Anand', 'Gujarat', 'Anand Railway Station West Gate');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 98, '2026-09-25 06:53:16', 'Fulfilled', 'Rain Basera Night Shelter for Homeless Citizens, Opposite MSU Arts Faculty, Sayajigunj', 'Vadodara', 'Gujarat', 'Sayajigunj Near Railway Station Gate 3');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 73, '2026-09-26 23:52:16', 'pending', 'Athwa Lines Senior Citizen Support Center, Near Reliance Cross Roads, Kudasan', 'Gandhinagar', 'Gujarat', 'Kudasan Main Road, Gandhinagar');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 30, '2026-09-26 09:48:16', 'pending', 'Navrangpura Urban Slum Free Meal Distribution Point, Near Shyamal Cross Roads, Satellite', 'Ahmedabad', 'Gujarat', 'Shyamal Row Houses, Satellite');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 93, '2026-09-26 12:11:16', 'pending', 'Navrangpura Urban Slum Free Meal Distribution Point, Near College Road, Christian Society', 'Nadiad', 'Gujarat', 'Methodist Mission Hospital Road');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 31, '2026-09-25 22:59:16', 'Allocated', 'Rain Basera Night Shelter for Homeless Citizens, Near Town Hall, Station Road', 'Anand', 'Gujarat', 'Anand Railway Station West Gate');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 92, '2026-09-25 22:59:16', 'pending', 'Prahlad Nagar Construction Camp Daily Food Program, Near Town Hall, Station Road', 'Anand', 'Gujarat', 'Anand Railway Station West Gate');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 89, '2026-09-26 16:16:16', 'pending', 'Chandkheda Community Relief Foundation Food Cell, Near Uttarsanda Road Crossings', 'Nadiad', 'Gujarat', 'Expressway Toll Approach Road');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 80, '2026-09-25 05:00:16', 'pending', 'Athwa Lines Senior Citizen Support Center, Near Shyamal Cross Roads, Satellite', 'Ahmedabad', 'Gujarat', 'Shyamal Row Houses, Satellite');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 55, '2026-09-25 16:11:16', 'pending', 'Sayajigunj Daily Food Relief for Destitute Travelers, Near Reliance Cross Roads, Kudasan', 'Gandhinagar', 'Gujarat', 'Kudasan Main Road, Gandhinagar');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 55, '2026-09-25 09:52:16', 'pending', 'Vrundavan Old Age Home & Care Shelter, Near Akshar Chowk, Old Padra Road', 'Vadodara', 'Gujarat', 'Akshar Pavilion, Old Padra Road');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 48, '2026-09-26 23:48:16', 'Fulfilled', 'Mother Teresa Home for the Dying Destitute, Near Sardar Patel Bhavan, Santram Road', 'Nadiad', 'Gujarat', 'Santram Mandir Road');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 72, '2026-09-26 09:50:16', 'pending', 'Sector 16 Night Care Center for Rural Migrants, Near Akshar Chowk, Old Padra Road', 'Vadodara', 'Gujarat', 'Akshar Pavilion, Old Padra Road');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 81, '2026-09-26 03:56:16', 'pending', 'Athwa Lines Senior Citizen Support Center, Near Varachha Main Road, Varachha', 'Surat', 'Gujarat', 'Mini Bazar Cross Roads, Varachha');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 47, '2026-09-26 21:27:16', 'pending', 'Santram Bal Ashram & Orphanage Support Wing, Near IRMA Campus, Anand-Vidyanagar Road', 'Anand', 'Gujarat', 'Bhaikaka Statue, Vallabh Vidyanagar');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 72, '2026-09-26 06:47:16', 'Allocated', 'Vesu Migrant Laborers Free Community Kitchen, Near Gh-5 Circle, Sector 16', 'Gandhinagar', 'Gujarat', 'Sector 16 Government Colony Community Hall');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 43, '2026-09-26 19:18:16', 'Allocated', 'Gota Metro Construction Labor Community Camp, Near Reliance Cross Roads, Kudasan', 'Gandhinagar', 'Gujarat', 'Kudasan Main Road, Gandhinagar');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 28, '2026-09-25 17:46:16', 'pending', 'Santram Bal Ashram & Orphanage Support Wing, Opposite Kalupur Railway Station, Kalupur', 'Ahmedabad', 'Gujarat', 'Rain Basera Shelter, Kalupur Gate 2');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 20, '2026-09-26 20:12:16', 'pending', 'Prahlad Nagar Construction Camp Daily Food Program, Near Kalawad Road Crossings, Kalawad Road', 'Rajkot', 'Gujarat', 'Kotecha Chowk, Kalawad Road');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 77, '2026-09-26 22:05:16', 'pending', 'Santram Bal Ashram & Orphanage Support Wing, Near Reliance Cross Roads, Kudasan', 'Gandhinagar', 'Gujarat', 'Kudasan Main Road, Gandhinagar');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 27, '2026-09-26 21:54:16', 'pending', 'Navrangpura Urban Slum Free Meal Distribution Point, Near Bhaijipura Cross Roads, PDPU Road', 'Gandhinagar', 'Gujarat', 'PDPU Campus Road, Raysan');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 76, '2026-09-25 06:11:16', 'pending', 'Santram Bal Ashram & Orphanage Support Wing, Near Akshar Chowk, Old Padra Road', 'Vadodara', 'Gujarat', 'Akshar Pavilion, Old Padra Road');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 36, '2026-09-26 23:37:16', 'pending', 'Rain Basera Night Shelter for Homeless Citizens, Near Bhaijipura Cross Roads, PDPU Road', 'Gandhinagar', 'Gujarat', 'PDPU Campus Road, Raysan');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 61, '2026-09-26 22:00:16', 'pending', 'Sector 16 Night Care Center for Rural Migrants, Near Uttarsanda Road Crossings', 'Nadiad', 'Gujarat', 'Expressway Toll Approach Road');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 46, '2026-09-25 14:38:16', 'pending', 'Kalupur Railway Porters & Daily Wage Workers Canteen, Near Kankaria Lake Gate 3, Maninagar', 'Ahmedabad', 'Gujarat', 'Kankaria Lake Front, Maninagar');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 52, '2026-09-26 08:10:16', 'pending', 'Kalupur Railway Porters & Daily Wage Workers Canteen, Near Amul Dairy Campus, Amul Dairy Road', 'Anand', 'Gujarat', 'Amul Circle, Anand');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 96, '2026-09-26 12:18:16', 'pending', 'Bhadra Slum Cluster Free Food Distribution Center, Near Indoor Stadium, Athwa Lines', 'Surat', 'Gujarat', 'Athwa Gate Circle, Ghod Dod Road');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 77, '2026-09-26 03:09:16', 'pending', 'Kalupur Railway Porters & Daily Wage Workers Canteen, Near Gota Flyover, SG Highway', 'Ahmedabad', 'Gujarat', 'Gota Community Labor Camp');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 69, '2026-09-26 00:44:16', 'pending', 'Kalupur Railway Porters & Daily Wage Workers Canteen, Near Fatehgunj Main Post Office, Fatehgunj', 'Vadodara', 'Gujarat', 'Fatehgunj Flyover Circle');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 94, '2026-09-25 11:33:16', 'pending', 'Sayajigunj Daily Food Relief for Destitute Travelers, Near Amul Dairy Campus, Amul Dairy Road', 'Anand', 'Gujarat', 'Amul Circle, Anand');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 20, '2026-09-25 07:41:16', 'pending', 'Pandesara Industrial Workers Child Welfare Shelter, Near Amul Dairy Campus, Amul Dairy Road', 'Anand', 'Gujarat', 'Amul Circle, Anand');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 23, '2026-09-26 06:46:16', 'Fulfilled', 'Rain Basera Night Shelter for Homeless Citizens, Near Gondal Road ST Workshop, Gondal Road', 'Rajkot', 'Gujarat', 'Malaviya Chowk, Gondal Road');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 91, '2026-09-26 02:48:16', 'Allocated', 'Vrundavan Old Age Home & Care Shelter, Near Adajan Star Bazar, Adajan', 'Surat', 'Gujarat', 'LP Savani Road, Adajan');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 68, '2026-09-25 01:18:16', 'pending', 'Mother Teresa Home for the Dying Destitute, Near Pal RTO, Pal', 'Surat', 'Gujarat', 'Pal Gam Community Hall');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 27, '2026-09-25 07:58:16', 'Fulfilled', 'Shishu Gruh Destitute Children Welfare Center, Near Shyamal Cross Roads, Satellite', 'Ahmedabad', 'Gujarat', 'Shyamal Row Houses, Satellite');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 30, '2026-09-26 04:46:16', 'pending', 'Karelibaug Slum Children Daily Nutrition Center, Near Kankaria Lake Gate 3, Maninagar', 'Ahmedabad', 'Gujarat', 'Kankaria Lake Front, Maninagar');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 35, '2026-09-25 19:34:16', 'pending', 'Vesu Migrant Laborers Free Community Kitchen, Near Manjalpur Naka, Manjalpur', 'Vadodara', 'Gujarat', 'Manjalpur Sports Complex Gate');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 21, '2026-09-25 04:52:16', 'pending', 'Mother Teresa Home for the Dying Destitute, Near College Road, Christian Society', 'Nadiad', 'Gujarat', 'Methodist Mission Hospital Road');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 97, '2026-09-25 17:27:16', 'pending', 'Bhadra Slum Cluster Free Food Distribution Center, Near Gh-5 Circle, Sector 16', 'Gandhinagar', 'Gujarat', 'Sector 16 Government Colony Community Hall');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 22, '2026-09-25 14:09:16', 'pending', 'Navrangpura Urban Slum Free Meal Distribution Point, Near Uttarsanda Road Crossings', 'Nadiad', 'Gujarat', 'Expressway Toll Approach Road');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 22, '2026-09-27 00:36:16', 'pending', 'Vesu Migrant Laborers Free Community Kitchen, Near Town Hall, Station Road', 'Anand', 'Gujarat', 'Anand Railway Station West Gate');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 91, '2026-09-25 18:35:16', 'pending', 'Prahlad Nagar Construction Camp Daily Food Program, Near Amul Dairy Campus, Amul Dairy Road', 'Anand', 'Gujarat', 'Amul Circle, Anand');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 81, '2026-09-25 04:37:16', 'Allocated', 'Shishu Gruh Destitute Children Welfare Center, Near Bhaijipura Cross Roads, PDPU Road', 'Gandhinagar', 'Gujarat', 'PDPU Campus Road, Raysan');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 80, '2026-09-25 21:03:16', 'pending', 'Sector 16 Night Care Center for Rural Migrants, Near Yagnik Road, Jagnath Plot', 'Rajkot', 'Gujarat', 'Imperial Palace Road, Yagnik Road');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 49, '2026-09-25 22:04:16', 'pending', 'Gota Metro Construction Labor Community Camp, Near Madhapar Chowkadi, 150 Feet Ring Road', 'Rajkot', 'Gujarat', 'Madhapar Flyover Circle');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 62, '2026-09-25 05:37:16', 'pending', 'Vesu Migrant Laborers Free Community Kitchen, Near CH-3 Circle, Sector 21', 'Gandhinagar', 'Gujarat', 'Sector 21 Shopping Center Ground');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 65, '2026-09-26 15:57:16', 'Fulfilled', 'Santram Bal Ashram & Orphanage Support Wing, Near Infocity Club & Resort, Sector 0', 'Gandhinagar', 'Gujarat', 'Infocity IT Tower 2, Sector 0');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 93, '2026-09-25 02:50:16', 'pending', 'Vrundavan Old Age Home & Care Shelter, Near Amul Dairy Campus, Amul Dairy Road', 'Anand', 'Gujarat', 'Amul Circle, Anand');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 99, '2026-09-25 19:45:16', 'Fulfilled', 'Alkapuri Slum Women & Children Nutrition Point, Near Infocity Club & Resort, Sector 0', 'Gandhinagar', 'Gujarat', 'Infocity IT Tower 2, Sector 0');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 88, '2026-09-25 14:30:16', 'Allocated', 'Athwa Lines Senior Citizen Support Center, Near Gondal Road ST Workshop, Gondal Road', 'Rajkot', 'Gujarat', 'Malaviya Chowk, Gondal Road');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 83, '2026-09-25 15:58:16', 'pending', 'Prahlad Nagar Construction Camp Daily Food Program, Near Adajan Star Bazar, Adajan', 'Surat', 'Gujarat', 'LP Savani Road, Adajan');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 59, '2026-09-26 14:24:16', 'Allocated', 'Vesu Migrant Laborers Free Community Kitchen, Near Kankaria Lake Gate 3, Maninagar', 'Ahmedabad', 'Gujarat', 'Kankaria Lake Front, Maninagar');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 48, '2026-09-26 19:47:16', 'Allocated', 'Santram Bal Ashram & Orphanage Support Wing, Near College Road, Christian Society', 'Nadiad', 'Gujarat', 'Methodist Mission Hospital Road');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 99, '2026-09-26 19:45:16', 'Fulfilled', 'Santram Bal Ashram & Orphanage Support Wing, Near Reliance Cross Roads, Kudasan', 'Gandhinagar', 'Gujarat', 'Kudasan Main Road, Gandhinagar');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 97, '2026-09-25 18:47:16', 'pending', 'Shishu Gruh Destitute Children Welfare Center, Behind Community Health Center, Pandesara', 'Surat', 'Gujarat', 'Pandesara GIDC Community Center');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 66, '2026-09-25 08:10:16', 'pending', 'Bhadra Slum Cluster Free Food Distribution Center, Near Yagnik Road, Jagnath Plot', 'Rajkot', 'Gujarat', 'Imperial Palace Road, Yagnik Road');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 20, '2026-09-26 23:52:16', 'pending', 'Pandesara Industrial Workers Child Welfare Shelter, Near Kalawad Road Crossings, Kalawad Road', 'Rajkot', 'Gujarat', 'Kotecha Chowk, Kalawad Road');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 24, '2026-09-25 19:52:16', 'pending', 'Alkapuri Slum Women & Children Nutrition Point, Opposite MSU Arts Faculty, Sayajigunj', 'Vadodara', 'Gujarat', 'Sayajigunj Near Railway Station Gate 3');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 91, '2026-09-26 14:57:16', 'pending', 'Sector 16 Night Care Center for Rural Migrants, Near College Road, Christian Society', 'Nadiad', 'Gujarat', 'Methodist Mission Hospital Road');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 82, '2026-09-26 06:29:16', 'pending', 'Chandkheda Community Relief Foundation Food Cell, Near Amul Dairy Campus, Amul Dairy Road', 'Anand', 'Gujarat', 'Amul Circle, Anand');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 95, '2026-09-25 22:16:16', 'pending', 'Alkapuri Slum Women & Children Nutrition Point, Near Textile Market Gate 1, Ring Road', 'Surat', 'Gujarat', 'Ring Road Flyover Junction');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 24, '2026-09-26 18:24:16', 'pending', 'Shishu Gruh Destitute Children Welfare Center, Behind Vadodara Central Mall, Alkapuri', 'Vadodara', 'Gujarat', 'Alkapuri Club Road, Opposite Express Hotel');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 30, '2026-09-26 02:11:16', 'pending', 'Karelibaug Slum Children Daily Nutrition Center, Near Amul Dairy Campus, Amul Dairy Road', 'Anand', 'Gujarat', 'Amul Circle, Anand');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 61, '2026-09-25 08:15:16', 'pending', 'Mother Teresa Home for the Dying Destitute, Near Vaishnodevi Circle, SG Highway', 'Ahmedabad', 'Gujarat', 'Shivalik Business Hub, SG Highway');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 25, '2026-09-26 21:06:16', 'pending', 'Karelibaug Slum Children Daily Nutrition Center, Near Borsad Chowkadi, Anand', 'Anand', 'Gujarat', 'Borsad Highway Junction');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 53, '2026-09-26 19:56:16', 'pending', 'Alkapuri Slum Women & Children Nutrition Point, Near Varachha Main Road, Varachha', 'Surat', 'Gujarat', 'Mini Bazar Cross Roads, Varachha');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 40, '2026-09-25 01:24:16', 'pending', 'Snehalaya Leprosy & Destitute Relief Center, Near Gh-5 Circle, Sector 16', 'Gandhinagar', 'Gujarat', 'Sector 16 Government Colony Community Hall');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 41, '2026-09-25 22:10:16', 'pending', 'Vrundavan Old Age Home & Care Shelter, Near Borsad Chowkadi, Anand', 'Anand', 'Gujarat', 'Borsad Highway Junction');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 30, '2026-09-26 23:28:16', 'pending', 'Sayajigunj Daily Food Relief for Destitute Travelers, Near IRMA Campus, Anand-Vidyanagar Road', 'Anand', 'Gujarat', 'Bhaikaka Statue, Vallabh Vidyanagar');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 60, '2026-09-26 07:43:16', 'pending', 'Athwa Lines Senior Citizen Support Center, Near Bhaijipura Cross Roads, PDPU Road', 'Gandhinagar', 'Gujarat', 'PDPU Campus Road, Raysan');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 91, '2026-09-25 04:08:16', 'pending', 'Vesu Migrant Laborers Free Community Kitchen, Near Infocity Club & Resort, Sector 0', 'Gandhinagar', 'Gujarat', 'Infocity IT Tower 2, Sector 0');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 74, '2026-09-25 22:23:16', 'pending', 'Vesu Migrant Laborers Free Community Kitchen, Near IRMA Campus, Anand-Vidyanagar Road', 'Anand', 'Gujarat', 'Bhaikaka Statue, Vallabh Vidyanagar');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 58, '2026-09-25 09:49:16', 'pending', 'Sector 16 Night Care Center for Rural Migrants, Near Uttarsanda Road Crossings', 'Nadiad', 'Gujarat', 'Expressway Toll Approach Road');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 47, '2026-09-25 23:49:16', 'pending', 'Santram Bal Ashram & Orphanage Support Wing, Near Sardar Patel Bhavan, Santram Road', 'Nadiad', 'Gujarat', 'Santram Mandir Road');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 79, '2026-09-25 16:58:16', 'pending', 'Apang Manav Mandal Specially Abled Care Foundation, Near Gota Flyover, SG Highway', 'Ahmedabad', 'Gujarat', 'Gota Community Labor Camp');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 38, '2026-09-26 23:32:16', 'pending', 'Alkapuri Slum Women & Children Nutrition Point, Near Kalawad Road Crossings, Kalawad Road', 'Rajkot', 'Gujarat', 'Kotecha Chowk, Kalawad Road');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 51, '2026-09-25 00:32:16', 'pending', 'Snehalaya Leprosy & Destitute Relief Center, Near Vaishnodevi Circle, SG Highway', 'Ahmedabad', 'Gujarat', 'Shivalik Business Hub, SG Highway');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 54, '2026-09-26 16:28:16', 'pending', 'Chandkheda Community Relief Foundation Food Cell, Near Pal RTO, Pal', 'Surat', 'Gujarat', 'Pal Gam Community Hall');


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 92, '2026-09-25 21:57:16', 'Allocated', 'Vrundavan Old Age Home & Care Shelter, Near College Road, Christian Society', 'Nadiad', 'Gujarat', 'Methodist Mission Hospital Road');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 33, 'Masala Dosa Combo with Sambar & Chutneys', '["Crispy Masala Dosa", "Mixed Veg Sambar", "Coconut Chutney", "Tomato Chutney"]', '2026-09-25 17:44:16', 'Allocated', 'Near Vaishnodevi Circle, SG Highway', 'Ahmedabad', 'Gujarat', 'Shivalik Business Hub, SG Highway');
SET @FID_1 = LAST_INSERT_ID();


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 33, '2026-09-25 17:44:16', 'Allocated', 'Opposite Kalupur Railway Station, Kalupur', 'Ahmedabad', 'Gujarat', 'Rain Basera Shelter, Kalupur Gate 2');
SET @NFID_1 = LAST_INSERT_ID();


INSERT INTO MatchedFoods (FID, DonorId, Providedquntity, donationDateTime, city, state, fromperfectLocation, NFID, ReceiverId, requestDateTime, Neededquntity, toperfectLocation)
VALUES (@FID_1, 'abc@gmail.com', 33, '2026-09-25 17:44:16', 'Ahmedabad', 'Gujarat', 'Shivalik Business Hub, SG Highway', @NFID_1, 'pqr@gmail.com', '2026-09-25 17:44:16', 33, 'Rain Basera Shelter, Kalupur Gate 2');
SET @MFID_1 = LAST_INSERT_ID();


INSERT INTO FoodDeliveries (MatchedFoodId, DonorId, ReceiverId, TransporterId, Status, CreatedAt, AssignedAt, AcceptedAt, DeliveredAt)
VALUES (@MFID_1, 'abc@gmail.com', 'pqr@gmail.com', NULL, 'AwaitingTransporter', '2026-09-25 17:44:16', NULL, NULL, NULL);
SET @DEL_1 = LAST_INSERT_ID();


INSERT INTO DeliveryStatusHistories (DeliveryId, FromStatus, ToStatus, ChangedByUserId, ChangedByUserRole, ChangedAt, Notes)
VALUES (@DEL_1, 'Allocated', 'AwaitingTransporter', 'System', 'System', '2026-09-25 17:44:16', 'Order matched and awaiting transporter pickup.');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 37, 'Fresh Vegetable Dum Biryani & Raita', '["Vegetable Dum Biryani", "Cucumber Mint Raita", "Roasted Papad"]', '2026-09-25 19:44:16', 'Allocated', 'Near Indoor Stadium, Athwa Lines', 'Surat', 'Gujarat', 'Athwa Gate Circle, Ghod Dod Road');
SET @FID_2 = LAST_INSERT_ID();


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 37, '2026-09-25 19:44:16', 'Allocated', 'Near Pal RTO, Pal', 'Surat', 'Gujarat', 'Pal Gam Community Hall');
SET @NFID_2 = LAST_INSERT_ID();


INSERT INTO MatchedFoods (FID, DonorId, Providedquntity, donationDateTime, city, state, fromperfectLocation, NFID, ReceiverId, requestDateTime, Neededquntity, toperfectLocation)
VALUES (@FID_2, 'abc@gmail.com', 37, '2026-09-25 19:44:16', 'Surat', 'Gujarat', 'Athwa Gate Circle, Ghod Dod Road', @NFID_2, 'pqr@gmail.com', '2026-09-25 19:44:16', 37, 'Pal Gam Community Hall');
SET @MFID_2 = LAST_INSERT_ID();


INSERT INTO FoodDeliveries (MatchedFoodId, DonorId, ReceiverId, TransporterId, Status, CreatedAt, AssignedAt, AcceptedAt, DeliveredAt)
VALUES (@MFID_2, 'abc@gmail.com', 'pqr@gmail.com', NULL, 'AwaitingTransporter', '2026-09-25 19:44:16', NULL, NULL, NULL);
SET @DEL_2 = LAST_INSERT_ID();


INSERT INTO DeliveryStatusHistories (DeliveryId, FromStatus, ToStatus, ChangedByUserId, ChangedByUserRole, ChangedAt, Notes)
VALUES (@DEL_2, 'Allocated', 'AwaitingTransporter', 'System', 'System', '2026-09-25 19:44:16', 'Order matched and awaiting transporter pickup.');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 69, 'Baingan Bhartha with Bajra Rotla', '["Smoked Ringan Bharthu", "Hot Bajra Rotla (2 pcs)", "Chaas Glass", "Green Garlic Chutney"]', '2026-09-25 21:44:16', 'Allocated', 'Near Vaishnodevi Circle, SG Highway', 'Ahmedabad', 'Gujarat', 'Shivalik Business Hub, SG Highway');
SET @FID_3 = LAST_INSERT_ID();


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 69, '2026-09-25 21:44:16', 'Allocated', 'Opposite Kalupur Railway Station, Kalupur', 'Ahmedabad', 'Gujarat', 'Rain Basera Shelter, Kalupur Gate 2');
SET @NFID_3 = LAST_INSERT_ID();


INSERT INTO MatchedFoods (FID, DonorId, Providedquntity, donationDateTime, city, state, fromperfectLocation, NFID, ReceiverId, requestDateTime, Neededquntity, toperfectLocation)
VALUES (@FID_3, 'abc@gmail.com', 69, '2026-09-25 21:44:16', 'Ahmedabad', 'Gujarat', 'Shivalik Business Hub, SG Highway', @NFID_3, 'pqr@gmail.com', '2026-09-25 21:44:16', 69, 'Rain Basera Shelter, Kalupur Gate 2');
SET @MFID_3 = LAST_INSERT_ID();


INSERT INTO FoodDeliveries (MatchedFoodId, DonorId, ReceiverId, TransporterId, Status, CreatedAt, AssignedAt, AcceptedAt, DeliveredAt)
VALUES (@MFID_3, 'abc@gmail.com', 'pqr@gmail.com', NULL, 'AwaitingTransporter', '2026-09-25 21:44:16', NULL, NULL, NULL);
SET @DEL_3 = LAST_INSERT_ID();


INSERT INTO DeliveryStatusHistories (DeliveryId, FromStatus, ToStatus, ChangedByUserId, ChangedByUserRole, ChangedAt, Notes)
VALUES (@DEL_3, 'Allocated', 'AwaitingTransporter', 'System', 'System', '2026-09-25 21:44:16', 'Order matched and awaiting transporter pickup.');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 34, 'Methi Thepla with Masala Chai & Chunda', '["Methi Thepla (6 pcs)", "Mango Chunda", "Spicy Pickle"]', '2026-09-25 21:44:16', 'Allocated', 'Near Infocity Club & Resort, Sector 0', 'Gandhinagar', 'Gujarat', 'Infocity IT Tower 2, Sector 0');
SET @FID_4 = LAST_INSERT_ID();


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 34, '2026-09-25 21:44:16', 'Allocated', 'Near Bhaijipura Cross Roads, PDPU Road', 'Gandhinagar', 'Gujarat', 'PDPU Campus Road, Raysan');
SET @NFID_4 = LAST_INSERT_ID();


INSERT INTO MatchedFoods (FID, DonorId, Providedquntity, donationDateTime, city, state, fromperfectLocation, NFID, ReceiverId, requestDateTime, Neededquntity, toperfectLocation)
VALUES (@FID_4, 'abc@gmail.com', 34, '2026-09-25 21:44:16', 'Gandhinagar', 'Gujarat', 'Infocity IT Tower 2, Sector 0', @NFID_4, 'pqr@gmail.com', '2026-09-25 21:44:16', 34, 'PDPU Campus Road, Raysan');
SET @MFID_4 = LAST_INSERT_ID();


INSERT INTO FoodDeliveries (MatchedFoodId, DonorId, ReceiverId, TransporterId, Status, CreatedAt, AssignedAt, AcceptedAt, DeliveredAt)
VALUES (@MFID_4, 'abc@gmail.com', 'pqr@gmail.com', NULL, 'AwaitingTransporter', '2026-09-25 21:44:16', NULL, NULL, NULL);
SET @DEL_4 = LAST_INSERT_ID();


INSERT INTO DeliveryStatusHistories (DeliveryId, FromStatus, ToStatus, ChangedByUserId, ChangedByUserRole, ChangedAt, Notes)
VALUES (@DEL_4, 'Allocated', 'AwaitingTransporter', 'System', 'System', '2026-09-25 21:44:16', 'Order matched and awaiting transporter pickup.');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 35, 'Amritsari Chole Bhature with Pickled Onions', '["Amritsari Chole", "Fluffy Bhature (2 pcs)", "Mint Chutney", "Pickled Chilli"]', '2026-09-25 12:44:16', 'Allocated', 'Near Yagnik Road, Jagnath Plot', 'Rajkot', 'Gujarat', 'Imperial Palace Road, Yagnik Road');
SET @FID_5 = LAST_INSERT_ID();


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 35, '2026-09-25 12:44:16', 'Allocated', 'Near Gondal Road ST Workshop, Gondal Road', 'Rajkot', 'Gujarat', 'Malaviya Chowk, Gondal Road');
SET @NFID_5 = LAST_INSERT_ID();


INSERT INTO MatchedFoods (FID, DonorId, Providedquntity, donationDateTime, city, state, fromperfectLocation, NFID, ReceiverId, requestDateTime, Neededquntity, toperfectLocation)
VALUES (@FID_5, 'abc@gmail.com', 35, '2026-09-25 12:44:16', 'Rajkot', 'Gujarat', 'Imperial Palace Road, Yagnik Road', @NFID_5, 'pqr@gmail.com', '2026-09-25 12:44:16', 35, 'Malaviya Chowk, Gondal Road');
SET @MFID_5 = LAST_INSERT_ID();


INSERT INTO FoodDeliveries (MatchedFoodId, DonorId, ReceiverId, TransporterId, Status, CreatedAt, AssignedAt, AcceptedAt, DeliveredAt)
VALUES (@MFID_5, 'abc@gmail.com', 'pqr@gmail.com', NULL, 'AwaitingTransporter', '2026-09-25 12:44:16', NULL, NULL, NULL);
SET @DEL_5 = LAST_INSERT_ID();


INSERT INTO DeliveryStatusHistories (DeliveryId, FromStatus, ToStatus, ChangedByUserId, ChangedByUserRole, ChangedAt, Notes)
VALUES (@DEL_5, 'Allocated', 'AwaitingTransporter', 'System', 'System', '2026-09-25 12:44:16', 'Order matched and awaiting transporter pickup.');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 46, 'Fresh Vegetable Dum Biryani & Raita', '["Vegetable Dum Biryani", "Cucumber Mint Raita", "Roasted Papad"]', '2026-09-25 19:44:16', 'Allocated', 'Near Sardar Patel Bhavan, Santram Road', 'Nadiad', 'Gujarat', 'Santram Mandir Road');
SET @FID_6 = LAST_INSERT_ID();


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 46, '2026-09-25 19:44:16', 'Allocated', 'Near Uttarsanda Road Crossings', 'Nadiad', 'Gujarat', 'Expressway Toll Approach Road');
SET @NFID_6 = LAST_INSERT_ID();


INSERT INTO MatchedFoods (FID, DonorId, Providedquntity, donationDateTime, city, state, fromperfectLocation, NFID, ReceiverId, requestDateTime, Neededquntity, toperfectLocation)
VALUES (@FID_6, 'abc@gmail.com', 46, '2026-09-25 19:44:16', 'Nadiad', 'Gujarat', 'Santram Mandir Road', @NFID_6, 'pqr@gmail.com', '2026-09-25 19:44:16', 46, 'Expressway Toll Approach Road');
SET @MFID_6 = LAST_INSERT_ID();


INSERT INTO FoodDeliveries (MatchedFoodId, DonorId, ReceiverId, TransporterId, Status, CreatedAt, AssignedAt, AcceptedAt, DeliveredAt)
VALUES (@MFID_6, 'abc@gmail.com', 'pqr@gmail.com', 'transporter@gmail.com', 'Accepted', '2026-09-25 19:44:16', '2026-09-25 19:44:16', '2026-09-25 19:44:16', NULL);
SET @DEL_6 = LAST_INSERT_ID();


INSERT INTO DeliveryStatusHistories (DeliveryId, FromStatus, ToStatus, ChangedByUserId, ChangedByUserRole, ChangedAt, Notes)
VALUES (@DEL_6, 'Allocated', 'AwaitingTransporter', 'System', 'System', '2026-09-25 19:44:16', 'Order matched and awaiting transporter pickup.');


INSERT INTO DeliveryStatusHistories (DeliveryId, FromStatus, ToStatus, ChangedByUserId, ChangedByUserRole, ChangedAt, Notes)
VALUES (@DEL_6, 'AwaitingTransporter', 'Accepted', 'transporter@gmail.com', 'Transporter', '2026-09-25 19:44:16', 'Delivery progress updated by transporter.');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 56, 'Baingan Bhartha with Bajra Rotla', '["Smoked Ringan Bharthu", "Hot Bajra Rotla (2 pcs)", "Chaas Glass", "Green Garlic Chutney"]', '2026-09-25 18:44:16', 'Allocated', 'Near Indoor Stadium, Athwa Lines', 'Surat', 'Gujarat', 'Athwa Gate Circle, Ghod Dod Road');
SET @FID_7 = LAST_INSERT_ID();


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 56, '2026-09-25 18:44:16', 'Allocated', 'Near Pal RTO, Pal', 'Surat', 'Gujarat', 'Pal Gam Community Hall');
SET @NFID_7 = LAST_INSERT_ID();


INSERT INTO MatchedFoods (FID, DonorId, Providedquntity, donationDateTime, city, state, fromperfectLocation, NFID, ReceiverId, requestDateTime, Neededquntity, toperfectLocation)
VALUES (@FID_7, 'abc@gmail.com', 56, '2026-09-25 18:44:16', 'Surat', 'Gujarat', 'Athwa Gate Circle, Ghod Dod Road', @NFID_7, 'pqr@gmail.com', '2026-09-25 18:44:16', 56, 'Pal Gam Community Hall');
SET @MFID_7 = LAST_INSERT_ID();


INSERT INTO FoodDeliveries (MatchedFoodId, DonorId, ReceiverId, TransporterId, Status, CreatedAt, AssignedAt, AcceptedAt, DeliveredAt)
VALUES (@MFID_7, 'abc@gmail.com', 'pqr@gmail.com', 'transporter@gmail.com', 'Accepted', '2026-09-25 18:44:16', '2026-09-25 18:44:16', '2026-09-25 18:44:16', NULL);
SET @DEL_7 = LAST_INSERT_ID();


INSERT INTO DeliveryStatusHistories (DeliveryId, FromStatus, ToStatus, ChangedByUserId, ChangedByUserRole, ChangedAt, Notes)
VALUES (@DEL_7, 'Allocated', 'AwaitingTransporter', 'System', 'System', '2026-09-25 18:44:16', 'Order matched and awaiting transporter pickup.');


INSERT INTO DeliveryStatusHistories (DeliveryId, FromStatus, ToStatus, ChangedByUserId, ChangedByUserRole, ChangedAt, Notes)
VALUES (@DEL_7, 'AwaitingTransporter', 'Accepted', 'transporter@gmail.com', 'Transporter', '2026-09-25 18:44:16', 'Delivery progress updated by transporter.');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 32, 'Veg Biryani with Mirchi Ka Salan', '["Hyderabadi Veg Biryani", "Mirchi Ka Salan", "Raita"]', '2026-09-25 17:44:16', 'Allocated', 'Behind Vadodara Central Mall, Alkapuri', 'Vadodara', 'Gujarat', 'Alkapuri Club Road, Opposite Express Hotel');
SET @FID_8 = LAST_INSERT_ID();


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 32, '2026-09-25 17:44:16', 'Allocated', 'Near Gotri Medical College, Gotri', 'Vadodara', 'Gujarat', 'Gotri Road Community Center');
SET @NFID_8 = LAST_INSERT_ID();


INSERT INTO MatchedFoods (FID, DonorId, Providedquntity, donationDateTime, city, state, fromperfectLocation, NFID, ReceiverId, requestDateTime, Neededquntity, toperfectLocation)
VALUES (@FID_8, 'abc@gmail.com', 32, '2026-09-25 17:44:16', 'Vadodara', 'Gujarat', 'Alkapuri Club Road, Opposite Express Hotel', @NFID_8, 'pqr@gmail.com', '2026-09-25 17:44:16', 32, 'Gotri Road Community Center');
SET @MFID_8 = LAST_INSERT_ID();


INSERT INTO FoodDeliveries (MatchedFoodId, DonorId, ReceiverId, TransporterId, Status, CreatedAt, AssignedAt, AcceptedAt, DeliveredAt)
VALUES (@MFID_8, 'abc@gmail.com', 'pqr@gmail.com', 'transporter@gmail.com', 'PickupArrived', '2026-09-25 17:44:16', '2026-09-25 17:44:16', '2026-09-25 17:44:16', NULL);
SET @DEL_8 = LAST_INSERT_ID();


INSERT INTO DeliveryStatusHistories (DeliveryId, FromStatus, ToStatus, ChangedByUserId, ChangedByUserRole, ChangedAt, Notes)
VALUES (@DEL_8, 'Allocated', 'AwaitingTransporter', 'System', 'System', '2026-09-25 17:44:16', 'Order matched and awaiting transporter pickup.');


INSERT INTO DeliveryStatusHistories (DeliveryId, FromStatus, ToStatus, ChangedByUserId, ChangedByUserRole, ChangedAt, Notes)
VALUES (@DEL_8, 'AwaitingTransporter', 'PickupArrived', 'transporter@gmail.com', 'Transporter', '2026-09-25 17:44:16', 'Delivery progress updated by transporter.');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 53, 'Matar Paneer with Jeera Rice', '["Matar Paneer Curry", "Jeera Rice", "Papad", "Pickle"]', '2026-09-25 14:44:16', 'Allocated', 'Near Indoor Stadium, Athwa Lines', 'Surat', 'Gujarat', 'Athwa Gate Circle, Ghod Dod Road');
SET @FID_9 = LAST_INSERT_ID();


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 53, '2026-09-25 14:44:16', 'Allocated', 'Near Pal RTO, Pal', 'Surat', 'Gujarat', 'Pal Gam Community Hall');
SET @NFID_9 = LAST_INSERT_ID();


INSERT INTO MatchedFoods (FID, DonorId, Providedquntity, donationDateTime, city, state, fromperfectLocation, NFID, ReceiverId, requestDateTime, Neededquntity, toperfectLocation)
VALUES (@FID_9, 'abc@gmail.com', 53, '2026-09-25 14:44:16', 'Surat', 'Gujarat', 'Athwa Gate Circle, Ghod Dod Road', @NFID_9, 'pqr@gmail.com', '2026-09-25 14:44:16', 53, 'Pal Gam Community Hall');
SET @MFID_9 = LAST_INSERT_ID();


INSERT INTO FoodDeliveries (MatchedFoodId, DonorId, ReceiverId, TransporterId, Status, CreatedAt, AssignedAt, AcceptedAt, DeliveredAt)
VALUES (@MFID_9, 'abc@gmail.com', 'pqr@gmail.com', 'transporter@gmail.com', 'PickupArrived', '2026-09-25 14:44:16', '2026-09-25 14:44:16', '2026-09-25 14:44:16', NULL);
SET @DEL_9 = LAST_INSERT_ID();


INSERT INTO DeliveryStatusHistories (DeliveryId, FromStatus, ToStatus, ChangedByUserId, ChangedByUserRole, ChangedAt, Notes)
VALUES (@DEL_9, 'Allocated', 'AwaitingTransporter', 'System', 'System', '2026-09-25 14:44:16', 'Order matched and awaiting transporter pickup.');


INSERT INTO DeliveryStatusHistories (DeliveryId, FromStatus, ToStatus, ChangedByUserId, ChangedByUserRole, ChangedAt, Notes)
VALUES (@DEL_9, 'AwaitingTransporter', 'PickupArrived', 'transporter@gmail.com', 'Transporter', '2026-09-25 14:44:16', 'Delivery progress updated by transporter.');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 57, 'Traditional Gujarati Thali Meal Packs', '["Phulka Roti (4 pcs)", "Gujarati Dal", "Bhindu Sambharo", "Steamed Rice", "Mohanthal"]', '2026-09-25 21:44:16', 'Allocated', 'Near Vaishnodevi Circle, SG Highway', 'Ahmedabad', 'Gujarat', 'Shivalik Business Hub, SG Highway');
SET @FID_10 = LAST_INSERT_ID();


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 57, '2026-09-25 21:44:16', 'Allocated', 'Opposite Kalupur Railway Station, Kalupur', 'Ahmedabad', 'Gujarat', 'Rain Basera Shelter, Kalupur Gate 2');
SET @NFID_10 = LAST_INSERT_ID();


INSERT INTO MatchedFoods (FID, DonorId, Providedquntity, donationDateTime, city, state, fromperfectLocation, NFID, ReceiverId, requestDateTime, Neededquntity, toperfectLocation)
VALUES (@FID_10, 'abc@gmail.com', 57, '2026-09-25 21:44:16', 'Ahmedabad', 'Gujarat', 'Shivalik Business Hub, SG Highway', @NFID_10, 'pqr@gmail.com', '2026-09-25 21:44:16', 57, 'Rain Basera Shelter, Kalupur Gate 2');
SET @MFID_10 = LAST_INSERT_ID();


INSERT INTO FoodDeliveries (MatchedFoodId, DonorId, ReceiverId, TransporterId, Status, CreatedAt, AssignedAt, AcceptedAt, DeliveredAt)
VALUES (@MFID_10, 'abc@gmail.com', 'pqr@gmail.com', 'transporter@gmail.com', 'PickupConfirmed', '2026-09-25 21:44:16', '2026-09-25 21:44:16', '2026-09-25 21:44:16', NULL);
SET @DEL_10 = LAST_INSERT_ID();


INSERT INTO DeliveryStatusHistories (DeliveryId, FromStatus, ToStatus, ChangedByUserId, ChangedByUserRole, ChangedAt, Notes)
VALUES (@DEL_10, 'Allocated', 'AwaitingTransporter', 'System', 'System', '2026-09-25 21:44:16', 'Order matched and awaiting transporter pickup.');


INSERT INTO DeliveryStatusHistories (DeliveryId, FromStatus, ToStatus, ChangedByUserId, ChangedByUserRole, ChangedAt, Notes)
VALUES (@DEL_10, 'AwaitingTransporter', 'PickupConfirmed', 'transporter@gmail.com', 'Transporter', '2026-09-25 21:44:16', 'Delivery progress updated by transporter.');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 37, 'South Indian Breakfast Combo (Idli & Vada)', '["Steamed Idli (3 pcs)", "Medu Vada (2 pcs)", "Vegetable Sambar", "Coconut Chutney"]', '2026-09-25 13:44:16', 'Allocated', 'Behind Vadodara Central Mall, Alkapuri', 'Vadodara', 'Gujarat', 'Alkapuri Club Road, Opposite Express Hotel');
SET @FID_11 = LAST_INSERT_ID();


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 37, '2026-09-25 13:44:16', 'Allocated', 'Near Gotri Medical College, Gotri', 'Vadodara', 'Gujarat', 'Gotri Road Community Center');
SET @NFID_11 = LAST_INSERT_ID();


INSERT INTO MatchedFoods (FID, DonorId, Providedquntity, donationDateTime, city, state, fromperfectLocation, NFID, ReceiverId, requestDateTime, Neededquntity, toperfectLocation)
VALUES (@FID_11, 'abc@gmail.com', 37, '2026-09-25 13:44:16', 'Vadodara', 'Gujarat', 'Alkapuri Club Road, Opposite Express Hotel', @NFID_11, 'pqr@gmail.com', '2026-09-25 13:44:16', 37, 'Gotri Road Community Center');
SET @MFID_11 = LAST_INSERT_ID();


INSERT INTO FoodDeliveries (MatchedFoodId, DonorId, ReceiverId, TransporterId, Status, CreatedAt, AssignedAt, AcceptedAt, DeliveredAt)
VALUES (@MFID_11, 'abc@gmail.com', 'pqr@gmail.com', 'transporter@gmail.com', 'PickedUp', '2026-09-25 13:44:16', '2026-09-25 13:44:16', '2026-09-25 13:44:16', NULL);
SET @DEL_11 = LAST_INSERT_ID();


INSERT INTO DeliveryStatusHistories (DeliveryId, FromStatus, ToStatus, ChangedByUserId, ChangedByUserRole, ChangedAt, Notes)
VALUES (@DEL_11, 'Allocated', 'AwaitingTransporter', 'System', 'System', '2026-09-25 13:44:16', 'Order matched and awaiting transporter pickup.');


INSERT INTO DeliveryStatusHistories (DeliveryId, FromStatus, ToStatus, ChangedByUserId, ChangedByUserRole, ChangedAt, Notes)
VALUES (@DEL_11, 'AwaitingTransporter', 'PickedUp', 'transporter@gmail.com', 'Transporter', '2026-09-25 13:44:16', 'Delivery progress updated by transporter.');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 42, 'Fresh Steamed Khaman Dhokla & Khandvi', '["Khaman Dhokla", "Spiced Khandvi Roll", "Papaya Sambharo", "Sweet Kadhi"]', '2026-09-25 17:44:16', 'Allocated', 'Behind Vadodara Central Mall, Alkapuri', 'Vadodara', 'Gujarat', 'Alkapuri Club Road, Opposite Express Hotel');
SET @FID_12 = LAST_INSERT_ID();


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 42, '2026-09-25 17:44:16', 'Allocated', 'Near Gotri Medical College, Gotri', 'Vadodara', 'Gujarat', 'Gotri Road Community Center');
SET @NFID_12 = LAST_INSERT_ID();


INSERT INTO MatchedFoods (FID, DonorId, Providedquntity, donationDateTime, city, state, fromperfectLocation, NFID, ReceiverId, requestDateTime, Neededquntity, toperfectLocation)
VALUES (@FID_12, 'abc@gmail.com', 42, '2026-09-25 17:44:16', 'Vadodara', 'Gujarat', 'Alkapuri Club Road, Opposite Express Hotel', @NFID_12, 'pqr@gmail.com', '2026-09-25 17:44:16', 42, 'Gotri Road Community Center');
SET @MFID_12 = LAST_INSERT_ID();


INSERT INTO FoodDeliveries (MatchedFoodId, DonorId, ReceiverId, TransporterId, Status, CreatedAt, AssignedAt, AcceptedAt, DeliveredAt)
VALUES (@MFID_12, 'abc@gmail.com', 'pqr@gmail.com', 'transporter@gmail.com', 'InTransit', '2026-09-25 17:44:16', '2026-09-25 17:44:16', '2026-09-25 17:44:16', NULL);
SET @DEL_12 = LAST_INSERT_ID();


INSERT INTO DeliveryStatusHistories (DeliveryId, FromStatus, ToStatus, ChangedByUserId, ChangedByUserRole, ChangedAt, Notes)
VALUES (@DEL_12, 'Allocated', 'AwaitingTransporter', 'System', 'System', '2026-09-25 17:44:16', 'Order matched and awaiting transporter pickup.');


INSERT INTO DeliveryStatusHistories (DeliveryId, FromStatus, ToStatus, ChangedByUserId, ChangedByUserRole, ChangedAt, Notes)
VALUES (@DEL_12, 'AwaitingTransporter', 'InTransit', 'transporter@gmail.com', 'Transporter', '2026-09-25 17:44:16', 'Delivery progress updated by transporter.');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 47, 'Veg Hakka Noodles with Veg Manchurian', '["Veg Hakka Noodles", "Veg Manchurian Dry (4 pcs)", "Chilli Garlic Sauce"]', '2026-09-25 20:44:16', 'Allocated', 'Near Amul Dairy Campus, Amul Dairy Road', 'Anand', 'Gujarat', 'Amul Circle, Anand');
SET @FID_13 = LAST_INSERT_ID();


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 47, '2026-09-25 20:44:16', 'Allocated', 'Near Borsad Chowkadi, Anand', 'Anand', 'Gujarat', 'Borsad Highway Junction');
SET @NFID_13 = LAST_INSERT_ID();


INSERT INTO MatchedFoods (FID, DonorId, Providedquntity, donationDateTime, city, state, fromperfectLocation, NFID, ReceiverId, requestDateTime, Neededquntity, toperfectLocation)
VALUES (@FID_13, 'abc@gmail.com', 47, '2026-09-25 20:44:16', 'Anand', 'Gujarat', 'Amul Circle, Anand', @NFID_13, 'pqr@gmail.com', '2026-09-25 20:44:16', 47, 'Borsad Highway Junction');
SET @MFID_13 = LAST_INSERT_ID();


INSERT INTO FoodDeliveries (MatchedFoodId, DonorId, ReceiverId, TransporterId, Status, CreatedAt, AssignedAt, AcceptedAt, DeliveredAt)
VALUES (@MFID_13, 'abc@gmail.com', 'pqr@gmail.com', 'transporter@gmail.com', 'InTransit', '2026-09-25 20:44:16', '2026-09-25 20:44:16', '2026-09-25 20:44:16', NULL);
SET @DEL_13 = LAST_INSERT_ID();


INSERT INTO DeliveryStatusHistories (DeliveryId, FromStatus, ToStatus, ChangedByUserId, ChangedByUserRole, ChangedAt, Notes)
VALUES (@DEL_13, 'Allocated', 'AwaitingTransporter', 'System', 'System', '2026-09-25 20:44:16', 'Order matched and awaiting transporter pickup.');


INSERT INTO DeliveryStatusHistories (DeliveryId, FromStatus, ToStatus, ChangedByUserId, ChangedByUserRole, ChangedAt, Notes)
VALUES (@DEL_13, 'AwaitingTransporter', 'InTransit', 'transporter@gmail.com', 'Transporter', '2026-09-25 20:44:16', 'Delivery progress updated by transporter.');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 33, 'Traditional Gujarati Thali Meal Packs', '["Phulka Roti (4 pcs)", "Gujarati Dal", "Bhindu Sambharo", "Steamed Rice", "Mohanthal"]', '2026-09-25 22:44:16', 'Allocated', 'Near Yagnik Road, Jagnath Plot', 'Rajkot', 'Gujarat', 'Imperial Palace Road, Yagnik Road');
SET @FID_14 = LAST_INSERT_ID();


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 33, '2026-09-25 22:44:16', 'Allocated', 'Near Gondal Road ST Workshop, Gondal Road', 'Rajkot', 'Gujarat', 'Malaviya Chowk, Gondal Road');
SET @NFID_14 = LAST_INSERT_ID();


INSERT INTO MatchedFoods (FID, DonorId, Providedquntity, donationDateTime, city, state, fromperfectLocation, NFID, ReceiverId, requestDateTime, Neededquntity, toperfectLocation)
VALUES (@FID_14, 'abc@gmail.com', 33, '2026-09-25 22:44:16', 'Rajkot', 'Gujarat', 'Imperial Palace Road, Yagnik Road', @NFID_14, 'pqr@gmail.com', '2026-09-25 22:44:16', 33, 'Malaviya Chowk, Gondal Road');
SET @MFID_14 = LAST_INSERT_ID();


INSERT INTO FoodDeliveries (MatchedFoodId, DonorId, ReceiverId, TransporterId, Status, CreatedAt, AssignedAt, AcceptedAt, DeliveredAt)
VALUES (@MFID_14, 'abc@gmail.com', 'pqr@gmail.com', 'transporter@gmail.com', 'ReceiverArrived', '2026-09-25 22:44:16', '2026-09-25 22:44:16', '2026-09-25 22:44:16', NULL);
SET @DEL_14 = LAST_INSERT_ID();


INSERT INTO DeliveryStatusHistories (DeliveryId, FromStatus, ToStatus, ChangedByUserId, ChangedByUserRole, ChangedAt, Notes)
VALUES (@DEL_14, 'Allocated', 'AwaitingTransporter', 'System', 'System', '2026-09-25 22:44:16', 'Order matched and awaiting transporter pickup.');


INSERT INTO DeliveryStatusHistories (DeliveryId, FromStatus, ToStatus, ChangedByUserId, ChangedByUserRole, ChangedAt, Notes)
VALUES (@DEL_14, 'AwaitingTransporter', 'ReceiverArrived', 'transporter@gmail.com', 'Transporter', '2026-09-25 22:44:16', 'Delivery progress updated by transporter.');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 67, 'Veg Biryani with Mirchi Ka Salan', '["Hyderabadi Veg Biryani", "Mirchi Ka Salan", "Raita"]', '2026-09-25 21:44:16', 'Allocated', 'Near Amul Dairy Campus, Amul Dairy Road', 'Anand', 'Gujarat', 'Amul Circle, Anand');
SET @FID_15 = LAST_INSERT_ID();


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 67, '2026-09-25 21:44:16', 'Allocated', 'Near Borsad Chowkadi, Anand', 'Anand', 'Gujarat', 'Borsad Highway Junction');
SET @NFID_15 = LAST_INSERT_ID();


INSERT INTO MatchedFoods (FID, DonorId, Providedquntity, donationDateTime, city, state, fromperfectLocation, NFID, ReceiverId, requestDateTime, Neededquntity, toperfectLocation)
VALUES (@FID_15, 'abc@gmail.com', 67, '2026-09-25 21:44:16', 'Anand', 'Gujarat', 'Amul Circle, Anand', @NFID_15, 'pqr@gmail.com', '2026-09-25 21:44:16', 67, 'Borsad Highway Junction');
SET @MFID_15 = LAST_INSERT_ID();


INSERT INTO FoodDeliveries (MatchedFoodId, DonorId, ReceiverId, TransporterId, Status, CreatedAt, AssignedAt, AcceptedAt, DeliveredAt)
VALUES (@MFID_15, 'abc@gmail.com', 'pqr@gmail.com', 'transporter@gmail.com', 'Delivered', '2026-09-25 21:44:16', '2026-09-25 21:44:16', '2026-09-25 21:44:16', '2026-09-25 21:44:16');
SET @DEL_15 = LAST_INSERT_ID();


INSERT INTO DeliveryStatusHistories (DeliveryId, FromStatus, ToStatus, ChangedByUserId, ChangedByUserRole, ChangedAt, Notes)
VALUES (@DEL_15, 'Allocated', 'AwaitingTransporter', 'System', 'System', '2026-09-25 21:44:16', 'Order matched and awaiting transporter pickup.');


INSERT INTO DeliveryStatusHistories (DeliveryId, FromStatus, ToStatus, ChangedByUserId, ChangedByUserRole, ChangedAt, Notes)
VALUES (@DEL_15, 'AwaitingTransporter', 'Delivered', 'transporter@gmail.com', 'Transporter', '2026-09-25 21:44:16', 'Delivery progress updated by transporter.');


INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 46, 'Veg Biryani with Mirchi Ka Salan', '["Hyderabadi Veg Biryani", "Mirchi Ka Salan", "Raita"]', '2026-09-25 15:44:16', 'Allocated', 'Near Vaishnodevi Circle, SG Highway', 'Ahmedabad', 'Gujarat', 'Shivalik Business Hub, SG Highway');
SET @FID_16 = LAST_INSERT_ID();


INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 46, '2026-09-25 15:44:16', 'Allocated', 'Opposite Kalupur Railway Station, Kalupur', 'Ahmedabad', 'Gujarat', 'Rain Basera Shelter, Kalupur Gate 2');
SET @NFID_16 = LAST_INSERT_ID();


INSERT INTO MatchedFoods (FID, DonorId, Providedquntity, donationDateTime, city, state, fromperfectLocation, NFID, ReceiverId, requestDateTime, Neededquntity, toperfectLocation)
VALUES (@FID_16, 'abc@gmail.com', 46, '2026-09-25 15:44:16', 'Ahmedabad', 'Gujarat', 'Shivalik Business Hub, SG Highway', @NFID_16, 'pqr@gmail.com', '2026-09-25 15:44:16', 46, 'Rain Basera Shelter, Kalupur Gate 2');
SET @MFID_16 = LAST_INSERT_ID();


INSERT INTO FoodDeliveries (MatchedFoodId, DonorId, ReceiverId, TransporterId, Status, CreatedAt, AssignedAt, AcceptedAt, DeliveredAt)
VALUES (@MFID_16, 'abc@gmail.com', 'pqr@gmail.com', 'transporter@gmail.com', 'Delivered', '2026-09-25 15:44:16', '2026-09-25 15:44:16', '2026-09-25 15:44:16', '2026-09-25 15:44:16');
SET @DEL_16 = LAST_INSERT_ID();


INSERT INTO DeliveryStatusHistories (DeliveryId, FromStatus, ToStatus, ChangedByUserId, ChangedByUserRole, ChangedAt, Notes)
VALUES (@DEL_16, 'Allocated', 'AwaitingTransporter', 'System', 'System', '2026-09-25 15:44:16', 'Order matched and awaiting transporter pickup.');


INSERT INTO DeliveryStatusHistories (DeliveryId, FromStatus, ToStatus, ChangedByUserId, ChangedByUserRole, ChangedAt, Notes)
VALUES (@DEL_16, 'AwaitingTransporter', 'Delivered', 'transporter@gmail.com', 'Transporter', '2026-09-25 15:44:16', 'Delivery progress updated by transporter.');
