-- Clean existing records for abc@gmail.com and pqr@gmail.com
DELETE FROM Foods WHERE emailID = 'abc@gmail.com';
DELETE FROM NeededFoods WHERE emailID = 'pqr@gmail.com';

-- Ensure both users have password '123456' properly hashed
UPDATE Users 
SET password = 'AQAAAAIAAYagAAAAEMeOMPuFZOYIT/yPdadIfQQ3l/YghrYr8FeJLWk8XBxtILwQNj5vqpmdB+SDSUVOYA==',
    Username = 'Tanmay Patel (Donor)',
    role = 'Donor',
    city = 'Ahmedabad'
WHERE EmailID = 'abc@gmail.com';

UPDATE Users 
SET password = 'AQAAAAIAAYagAAAAEMeOMPuFZOYIT/yPdadIfQQ3l/YghrYr8FeJLWk8XBxtILwQNj5vqpmdB+SDSUVOYA==',
    Username = 'PQR Seva Trust (Receiver)',
    role = 'Receiver',
    city = 'Nadiad'
WHERE EmailID = 'pqr@gmail.com';

-- ========================================================
-- 20 Realistic Food Donations for abc@gmail.com (Donor)
-- ========================================================
INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation) VALUES
('abc@gmail.com', 45, 'Fresh Vegetable Dum Biryani & Raita', '["Vegetable Dum Biryani","Cucumber Mint Raita","Roasted Papad"]', '2026-09-19 12:30:00', 'available', 'Near Vaishnodevi Circle, SG Highway, Ahmedabad, Gujarat', 'Ahmedabad', 'Gujarat', 'Shivalik Business Hub, SG Highway'),
('abc@gmail.com', 60, 'Dal Makhani with Jeera Basmati Rice', '["Dal Makhani","Jeera Basmati Rice","Sirka Pyaz","Papad"]', '2026-09-19 13:00:00', 'available', 'Behind Vadodara Central Mall, Alkapuri, Vadodara, Gujarat', 'Vadodara', 'Gujarat', 'Alkapuri Club Road, Opposite Express Hotel'),
('abc@gmail.com', 80, 'Traditional Gujarati Thali Meal Packs', '["Phulka Roti (4 pcs)","Gujarati Dal","Bhindu Sambharo","Steamed Rice","Mohanthal"]', '2026-09-19 11:45:00', 'claimed', 'Opposite Iscon Mega Mall, SG Highway, Ahmedabad, Gujarat', 'Ahmedabad', 'Gujarat', 'Iscon Cross Roads, SG Highway'),
('abc@gmail.com', 35, 'Paneer Butter Masala with Butter Naan', '["Paneer Butter Masala","Butter Tandoori Naan","Mixed Green Salad"]', '2026-09-19 14:00:00', 'available', 'Near Indoor Stadium, Athwa Lines, Surat, Gujarat', 'Surat', 'Gujarat', 'Athwa Gate Circle, Ghod Dod Road'),
('abc@gmail.com', 50, 'Amritsari Chole Bhature with Pickled Onions', '["Amritsari Chole","Fresh Fluffy Bhature (2 pcs)","Mint Chutney","Pickled Chilli"]', '2026-09-19 10:30:00', 'completed', 'Near Infocity Club & Resort, Sector 0, Gandhinagar, Gujarat', 'Gandhinagar', 'Gujarat', 'Infocity IT Tower 2, Sector 0'),
('abc@gmail.com', 65, 'South Indian Breakfast Combo (Idli & Vada)', '["Steamed Idli (3 pcs)","Medu Vada (2 pcs)","Vegetable Sambar","Coconut Chutney"]', '2026-09-19 08:30:00', 'delivered', 'Opposite Ahmedabad University Campus, Navrangpura, Ahmedabad, Gujarat', 'Ahmedabad', 'Gujarat', 'Commerce Six Roads, Navrangpura'),
('abc@gmail.com', 40, 'Fresh Steamed Khaman Dhokla & Khandvi', '["Khaman Dhokla","Spiced Khandvi Roll","Papaya Sambharo","Sweet Kadhi"]', '2026-09-19 09:15:00', 'available', 'Near Sardar Patel Bhavan, Santram Road, Nadiad, Gujarat', 'Nadiad', 'Gujarat', 'Santram Mandir Road'),
('abc@gmail.com', 70, 'Mumbai Style Butter Pav Bhaji', '["Butter Pav Bhaji Gravy","Toasted Butter Pav (4 pcs)","Lemon Wedges","Diced Onions"]', '2026-09-18 20:00:00', 'completed', 'Opposite MSU Arts Faculty, Sayajigunj, Vadodara, Gujarat', 'Vadodara', 'Gujarat', 'Sayajigunj Near Railway Station Gate 3'),
('abc@gmail.com', 55, 'Punjabi Rajma Masala with Basmati Rice', '["Punjabi Rajma Gravy","Steamed Basmati Rice","Kachumber Salad","Roasted Papad"]', '2026-09-19 13:15:00', 'available', 'Near Venus Atlantis, Corporate Road, Prahlad Nagar, Ahmedabad, Gujarat', 'Ahmedabad', 'Gujarat', 'Prahlad Nagar Corporate Road'),
('abc@gmail.com', 90, 'Assorted Fresh Bakery Breads & Dinner Rolls', '["Whole Wheat Sandwich Loaves","Dinner Butter Rolls","Multigrain Breads"]', '2026-09-19 10:00:00', 'available', 'VIP Road junction, Vesu, Surat, Gujarat', 'Surat', 'Gujarat', 'Vesu Canal Corridor, Near GD Goenka School'),
('abc@gmail.com', 50, 'Vegetable Pulao with Gujarati Kadhi', '["Matar Veg Pulao","Gujarati Sweet Kadhi","Aloo Jeera Dry","Cold Buttermilk"]', '2026-09-18 19:30:00', 'delivered', 'Opposite Town Hall, Dairy Road, Anand, Gujarat', 'Anand', 'Gujarat', 'Amul Dairy Road, Near Anand Railway Station'),
('abc@gmail.com', 40, 'Stuffed Aloo Parathas with Masala Curd', '["Punjabi Aloo Paratha (2 pcs)","Fresh Spiced Curd","Mango Pickle"]', '2026-09-19 08:00:00', 'completed', 'Behind Ahmedabad One Mall, Vastrapur, Ahmedabad, Gujarat', 'Ahmedabad', 'Gujarat', 'Vastrapur Lake East Promenade'),
('abc@gmail.com', 60, 'Kathiyawadi Sev Tameta & Bajra Rotla', '["Sev Tameta Nu Shaak","Bajra Rotla with Desi Butter","Garlic Chutney","Chhas"]', '2026-09-18 20:45:00', 'completed', 'Opposite Reliance Mall, Kalawad Road, Rajkot, Gujarat', 'Rajkot', 'Gujarat', 'Kalawad Road, Near KKV Hall'),
('abc@gmail.com', 45, 'Moong Dal Khichdi with Spiced Chhas', '["Desi Ghee Moong Dal Khichdi","Spiced Masala Buttermilk","Roasted Papad"]', '2026-09-19 12:45:00', 'available', 'Near Vidhan Sabha Road, Sector 11, Gandhinagar, Gujarat', 'Gandhinagar', 'Gujarat', 'Sector 11 Shopping Complex'),
('abc@gmail.com', 75, 'Fresh Cut Fruit Boxes (Melons, Apple, Papaya)', '["Cut Papaya & Watermelon","Bananas","Crisp Apples","Orange Slices"]', '2026-09-19 11:00:00', 'available', 'Near Bhattha Post Office, Paldi, Ahmedabad, Gujarat', 'Ahmedabad', 'Gujarat', 'Paldi Cross Roads, Fatehpura'),
('abc@gmail.com', 50, 'Matar Paneer Curry with Phulka Rotis', '["Matar Paneer Curry","Whole Wheat Phulka (4 pcs)","Cucumber Onion Salad"]', '2026-09-19 13:30:00', 'claimed', 'Beside Tarsali Ring Road Junction, Manjalpur, Vadodara, Gujarat', 'Vadodara', 'Gujarat', 'Manjalpur Naka, Near Darbar Chowk'),
('abc@gmail.com', 35, 'Punjabi Kadhi Pakoda with Steamed Rice', '["Punjabi Kadhi with Besan Pakoda","Steamed Basmati Rice","Fryums"]', '2026-09-19 12:15:00', 'available', 'Opposite DDU Main Entrance Gate, College Road, Nadiad, Gujarat', 'Nadiad', 'Gujarat', 'College Road, Near DDU Campus'),
('abc@gmail.com', 40, 'Veg Hakka Noodles & Manchurian Balls', '["Veg Hakka Noodles","Crispy Veg Manchurian Balls","Chilli Garlic Dip"]', '2026-09-18 21:00:00', 'completed', 'Beside Symphony House, SBR, Bodakdev, Ahmedabad, Gujarat', 'Ahmedabad', 'Gujarat', 'Sindhu Bhavan Road, Bodakdev'),
('abc@gmail.com', 100, 'Fresh Crispy Samosas & Mint Chutney', '["Aloo Matar Samosas (2 pcs)","Tamarind Date Chutney","Spicy Mint Chutney"]', '2026-09-19 16:00:00', 'available', 'Near Mini Bazaar Market, Varachha, Surat, Gujarat', 'Surat', 'Gujarat', 'Varachha Main Bazaar, Hirabaug Circle'),
('abc@gmail.com', 85, 'Festive Desserts (Gulab Jamun & Moong Halwa)', '["Hot Gulab Jamun (2 pcs)","Pure Ghee Moong Dal Halwa (100g)"]', '2026-09-19 17:00:00', 'available', 'Near Kankaria Gate No 3, Maninagar, Ahmedabad, Gujarat', 'Ahmedabad', 'Gujarat', 'Maninagar Railway Crossing, Station East');

-- ========================================================
-- 20 Realistic Food Requirements for pqr@gmail.com (Receiver)
-- ========================================================
INSERT INTO NeededFoods (emailID, quntity, FoodName, items, requestDateTime, status, location, city, state, perfectLocation) VALUES
('pqr@gmail.com', 60, 'Nutritious Dinner for Orphanage Children', '["Moong Dal Khichdi","Mixed Veg Sabzi","Fresh Bananas"]', '2026-09-19 19:00:00', 'pending', 'Santram Bal Ashram Trust, Santram Road, Nadiad, Gujarat', 'Nadiad', 'Gujarat', 'Santram Bal Ashram, Santram Road Gate 1'),
('pqr@gmail.com', 120, 'Lunch Meal Boxes for Construction Workers', '["Phulka Rotis (4 pcs)","Sev Usal / Sabzi","Chhas Packets"]', '2026-09-19 12:30:00', 'pending', 'Near SG Highway Flyover, Gota, Ahmedabad, Gujarat', 'Ahmedabad', 'Gujarat', 'Metro Construction Labor Camp, Gota Chowkdi'),
('pqr@gmail.com', 40, 'Soft Breakfast for Senior Citizen Care Home', '["Steamed Idli / Poha","Hot Sambar","Warm Milk"]', '2026-09-20 08:30:00', 'pending', 'Near Karelibaug Water Tank, Vadodara, Gujarat', 'Vadodara', 'Gujarat', 'Vrundavan Vruddhashram, Karelibaug Road'),
('pqr@gmail.com', 85, 'Mid-Day Lunch for Slum Learning Center', '["Veg Pulao with Soya Chunks","Spiced Kadhi","Boiled Chana"]', '2026-09-19 13:00:00', 'fulfilled', 'Behind Community Health Center, Pandesara, Surat, Gujarat', 'Surat', 'Gujarat', 'Pandesara GIDC Community Study Center'),
('pqr@gmail.com', 75, 'Evening Meals for Urban Night Shelter', '["Chole Gravy","Jeera Rice","Wheat Rotis"]', '2026-09-19 20:00:00', 'pending', 'Opposite Kalupur Railway Station West Gate, Ahmedabad, Gujarat', 'Ahmedabad', 'Gujarat', 'Rain Basera Night Shelter, Kalupur'),
('pqr@gmail.com', 50, 'Nutritious Meals for Cancer Patient Attendants', '["Paneer Bhurji","Phulkas (3 pcs)","Moong Dal Soup","Apples"]', '2026-09-19 13:30:00', 'in progress', 'Dharmashala Wing, Civil Hospital Campus, Asarwa, Ahmedabad, Gujarat', 'Ahmedabad', 'Gujarat', 'GCRI Cancer Hospital Waiting Area'),
('pqr@gmail.com', 90, 'Cooked Meals for Leprosy Rehabilitation Colony', '["Steamed Rice","Tuver Dal","Aloo Gobi Sabzi","Papad"]', '2026-09-19 12:00:00', 'pending', 'Near Gorwa Industrial Area, Gorwa, Vadodara, Gujarat', 'Vadodara', 'Gujarat', 'Kushtarog Seva Samiti Camp, Gorwa'),
('pqr@gmail.com', 55, 'Morning Breakfast for Street Children Center', '["Vegetable Upma","Ripe Bananas","Boiled Peanuts"]', '2026-09-20 09:00:00', 'pending', 'Near Methodist Church, Mission Road, Nadiad, Gujarat', 'Nadiad', 'Gujarat', 'Open School Slum Center, Mission Road'),
('pqr@gmail.com', 45, 'Evening Dinners for Blind Welfare Society', '["Desi Ghee Khichdi","Spiced Buttermilk","Papad"]', '2026-09-19 19:30:00', 'fulfilled', 'Near Dhebar Road Bus Stop, Rajkot, Gujarat', 'Rajkot', 'Gujarat', 'Andh Jan Kalyan Trust, Dhebar Road'),
('pqr@gmail.com', 110, 'Balanced Diet for Tribal Girls Hostel', '["Sprouted Moong Salad","Veg Pulav","Jaggery Ladoo"]', '2026-09-19 18:30:00', 'in progress', 'GIDC Area, Sector 28, Gandhinagar, Gujarat', 'Gandhinagar', 'Gujarat', 'Adivasi Kanya Chhatralay, Sector 28'),
('pqr@gmail.com', 35, 'Low-Salt Meals for Dialysis Patients & Attendants', '["Light Veg Khichdi","Boiled Vegetables","Cut Papaya"]', '2026-09-19 12:15:00', 'pending', 'Outside Renal Care OPD, Karamsad, Anand, Gujarat', 'Anand', 'Gujarat', 'Shree Krishna Hospital, Karamsad'),
('pqr@gmail.com', 150, 'Dry Ration & Thepla Kits for Flood Relief', '["Methi Thepla (6 pcs)","Chunda / Pickle","Bottled Water"]', '2026-09-19 14:00:00', 'fulfilled', 'Dindoli Kharwasa Road, Surat, Gujarat', 'Surat', 'Gujarat', 'Bhedwad Basti Flood Relief Center, Dindoli'),
('pqr@gmail.com', 50, 'Dinner Meal for Specially Abled Children Hostel', '["Mild Pav Bhaji","Soft Butter Pavs","Carrot Sticks"]', '2026-09-19 19:00:00', 'pending', 'Near Swaminarayan Temple, Nizampura, Vadodara, Gujarat', 'Vadodara', 'Gujarat', 'Prerna Special Care Hostel, Nizampura'),
('pqr@gmail.com', 200, 'Langar Food Supplies for Community Kitchen', '["Dal Makhani","Jeera Rice","Tandoori Rotis"]', '2026-09-20 12:00:00', 'pending', 'Thaltej Cross Road, SG Highway, Ahmedabad, Gujarat', 'Ahmedabad', 'Gujarat', 'Community Kitchen, SG Highway Thaltej'),
('pqr@gmail.com', 30, 'Light Post-Operative Patient Attendant Meals', '["Moong Lentil Soup","Soft Rice","Stewed Apples"]', '2026-09-19 13:00:00', 'pending', 'General Ward Attendant Area, Nadiad, Gujarat', 'Nadiad', 'Gujarat', 'Muljibhai Patel Kidney Hospital, Nadiad'),
('pqr@gmail.com', 40, 'Lunch for Differently Abled Vocational Workshop', '["Gujarati Kadhi Khichdi","Batata Nu Shaak","Papad"]', '2026-09-19 12:45:00', 'fulfilled', 'Near IIM-A Old Campus, Vastrapur, Ahmedabad, Gujarat', 'Ahmedabad', 'Gujarat', 'Apang Manav Mandal Workshop, Vastrapur'),
('pqr@gmail.com', 65, 'Daily Meals for Destitute Women Shelter Home', '["Phulkas (4 pcs)","Dal Tadka","Methi Aloo","Rice"]', '2026-09-19 19:45:00', 'pending', 'Near Navyug College, Rander Road, Surat, Gujarat', 'Surat', 'Gujarat', 'Nari Sanrakshan Gruh, Rander Road'),
('pqr@gmail.com', 50, 'Evening Healthy Snacks for Slum Remedial School', '["Veg Sandwiches","Fresh Sweet Lime Juice","Roasted Chana"]', '2026-09-19 16:30:00', 'pending', 'Near Fatehgunj Post Office, Vadodara, Gujarat', 'Vadodara', 'Gujarat', 'Vikas Jyot Remedial Center, Fatehgunj'),
('pqr@gmail.com', 45, 'Hot Dinner for Railway Platform Youth Shelter', '["Veg Dum Biryani","Boiled Eggs / Paneer Curry","Raita"]', '2026-09-19 20:30:00', 'pending', 'Platform 12 Exit Lane, Sarangpur, Ahmedabad, Gujarat', 'Ahmedabad', 'Gujarat', 'Saath Bal Shelter, Kalupur Railway Yard'),
('pqr@gmail.com', 130, 'Emergency Relief Nutrition Kits', '["Ready-to-Eat Khakhra","Poha","Biscuits","Dry Fruits"]', '2026-09-19 15:00:00', 'in progress', 'Community Hall, Zadeshwar, Bharuch, Gujarat', 'Bharuch', 'Gujarat', 'Narmada Relief Camp, Zadeshwar Road');
