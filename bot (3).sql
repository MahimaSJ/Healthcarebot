-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 21, 2023 at 04:36 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bot`
--

-- --------------------------------------------------------

--
-- Table structure for table `disease_doctor`
--

CREATE TABLE `disease_doctor` (
  `mapping_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `disease_doctor`
--

INSERT INTO `disease_doctor` (`mapping_id`, `doctor_id`) VALUES
(1, 1),
(2, 3),
(5, 4),
(6, 2),
(7, 3),
(8, 1),
(9, 6),
(10, 7),
(11, 8),
(12, 9),
(13, 10),
(14, 11),
(15, 12),
(16, 13),
(17, 14),
(18, 15),
(19, 16),
(20, 17),
(21, 2),
(22, 18),
(23, 19);

-- --------------------------------------------------------

--
-- Table structure for table `doctor_details`
--

CREATE TABLE `doctor_details` (
  `doctor_id` int(50) NOT NULL,
  `doctor_name` varchar(255) NOT NULL,
  `specialty` varchar(255) NOT NULL,
  `doctor_number` varchar(11) NOT NULL,
  `hospital_name` varchar(255) DEFAULT NULL,
  `hospital_number` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctor_details`
--

INSERT INTO `doctor_details` (`doctor_id`, `doctor_name`, `specialty`, `doctor_number`, `hospital_name`, `hospital_number`) VALUES
(1, 'Dr. Smith', 'GeneralPractitioner', '9098976789', 'Evergreen Medical Center', 98765432),
(2, 'Dr. Johnson', 'Pulmonologist', '8148435684', 'Golden Health Hospital', 98765432),
(3, 'Dr. Davis', 'Neurologist', '9894610284', 'Sunrise Care Clinic', 87654321),
(4, 'Dr. Anderson', 'infectiousDiseaseSpecialist', '9791925727', 'Emerald Wellness Hospital', 76543298),
(5, 'Dr. Rodriguez', 'Ophthalmologist', '7899876543', 'Majestic Care Center', 65430987),
(6, 'Dr. Garcia', 'OrthopedicSurgeon', '8765432109', 'Serenity General Hospital', 54109876),
(7, 'Dr. Kim', 'Pediatrician', '9876543210', 'Azure Health Pavilion', 21098765),
(8, 'Dr. Lee', 'Dentist', '8765432101', 'Vitality Medical Institute', 32109874),
(9, 'Dr. White', 'Endocrinologist', '7654321098', 'Tranquil Healing Hub', 21098543),
(10, 'Dr. Turner', 'Gastroenterologist', '6543210987', 'Hopeful Life Clinic', 18765432),
(11, 'Dr. Parker', 'Rheumatologist', '5432109876', 'Silver Lining Medical Center', 56901234),
(12, 'Dr. Allen', 'Urologist', '4321098765', 'Carewise Community Hospital', 6782),
(13, 'Dr. Ward', 'Psychiatrist', '3210987654', 'Healing Hands Medical Institute', 78901236),
(14, 'Dr. Wells', 'Oncologist', '2109876543', 'Wellness Oasis Hospital', 89012367),
(15, 'Dr. Foster', 'Dermatopathologist', '1098765432', 'Pristine Life Medical Center', 90123458),
(16, 'Dr. Hayes', 'Allergist', '1234567890', 'Eternal Health Hub', 1234789),
(17, 'Dr. Torres', 'Nephrologist', '2345678901', 'Harmony Medical Services', 1231231),
(18, 'Dr. Bennett', 'Hematologist', '3456789012', 'Serene Care Clinic', 23342342),
(19, 'Dr. Cooper', 'PlasticSurgeon', '4567890123', 'Crescent Health Center', 3453453);

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

CREATE TABLE `prescription` (
  `prescription_id` int(11) NOT NULL,
  `disease_name` varchar(255) NOT NULL,
  `medicine` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `prescription`
--

INSERT INTO `prescription` (`prescription_id`, `disease_name`, `medicine`) VALUES
(1, 'Commoncold', 'Paracetamol'),
(2, 'Migraine', 'Sumatriptan'),
(3, 'Flu', 'Oseltamivir'),
(4, 'COVID-19', 'Remdesivir'),
(5, 'Asthma', 'Albuterol'),
(6, 'Hypertension', 'Losartan'),
(7, 'Insomnia', 'Zolpidem'),
(8, 'Arthritis', 'Ibuprofen'),
(9, 'Anxiety', 'Lorazepam'),
(10, 'Gastritis', 'Omeprazole'),
(11, 'Osteoporosis', 'CalciumSupplement'),
(12, 'Depression', 'Sertraline'),
(13, 'Eczema', 'Hydrocortisone'),
(14, 'ThyroidDisorder', 'Levothyroxine'),
(15, 'CeliacDisease', 'GlutenFreeDiet'),
(16, 'Hepatitis', 'Sofosbuvir'),
(17, 'Migraine', 'Topiramate'),
(18, 'OCD', 'Fluoxetine'),
(19, 'ChronicPain', 'Tramadol');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `question_id` int(30) NOT NULL,
  `question` text DEFAULT NULL,
  `response_id` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`question_id`, `question`, `response_id`) VALUES
(1, 'what are you|what are you?', 1),
(2, 'who are you|who are you?', 1),
(3, 'what is your name|what is your name?', 1),
(4, 'What can you do|What can you do?', 2),
(7, 'what is PHP|what is PHP?', 4),
(8, 'What is ChatBot|What is ChatBot?', 5),
(9, 'hi|hy|hii', 6),
(10, 'hello|Whats up', 6),
(11, 'yow', 6),
(12, 'good day|have a good day|have a nice day', 27),
(14, 'will you marry me|will you marry me?', 7),
(15, 'what topic can I ask|what topic can I ask?', 8),
(16, 'How are you today?|How are you today', 9),
(17, 'Tell me a joke|crack a joke|make me laugh\r\n|make me cringe', 10),
(18, 'What is the meaning of life?|What is the meaning of life|What is life?|What is life', 11),
(19, 'Can you sing?|Can you sing|can you sing a song for me?|can you sing a song for me|sing a song for me ', 12),
(20, 'Tell me about your favorite book|what is your favourite book?|what is your favourite book', 13),
(21, 'What\'s the weather like today?|What\'s the weather like today|how is the weather?|how is the weather', 14),
(22, 'Do you like pizza?|Do you like pizza', 15),
(23, 'What\'s your favorite color?|What\'s your favorite color', 16),
(24, 'Tell me something interesting', 17),
(25, 'Describe your personality', 18),
(26, 'What is the capital of France?|What is the capital of France', 19),
(27, 'Who is your favorite musician?|Who is your favorite musician', 20),
(28, 'Do you believe in aliens?|Do you believe in aliens', 21),
(29, 'What\'s your favorite movie?', 22),
(30, 'Tell me about your hobbies', 23),
(31, 'good morning|happy morning', 24),
(32, 'good afternoon', 25),
(33, 'good evening', 28),
(34, 'good night|sweet dreams', 26);

-- --------------------------------------------------------

--
-- Table structure for table `responses`
--

CREATE TABLE `responses` (
  `response_id` int(30) NOT NULL,
  `response_message` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `responses`
--

INSERT INTO `responses` (`response_id`, `response_message`) VALUES
(1, 'I am KIKI, the chatBot of this application.'),
(2, 'I am in charge to answer your questions.'),
(3, 'You can ask me about something related to this website.'),
(4, 'PHP (recursive acronym for PHP: Hypertext Preprocessor ) is a widely-used open source general-purpose scripting language that is especially suited for web development and can be embedded into HTML.'),
(5, 'A chatbot is a software application used to conduct an on-line chat conversation via text or text-to-speech, in lieu of providing direct contact with a live human agent.'),
(6, 'Hi there, how can I help you ? :)'),
(7, 'I appreciate the sentiment, but I\'m just a computer program and don\'t have the ability to enter into personal relationships. If you have any other questions or need information on a different topic, feel free to ask!'),
(8, 'You can ask me about something related to this website.'),
(9, 'I\'m doing well, thank you for asking!'),
(10, 'Why did the chicken cross the road? To get to the other side!'),
(11, 'The meaning of life is subjective and can vary for each individual.'),
(12, 'I wish I could sing. However, I can help with information, answer questions, or engage in a conversation. If there\'s anything specific you\'d like assistance with, feel free to let me know!'),
(13, ' I don\'t have personal preferences or feelings, so I don\'t have a favorite book. However, I can provide information and recommendations based on popular or well-regarded books in various genres. If you have a specific genre or topic in mind, let me know, and I can suggest some notable books for you!'),
(14, '\nI\'m sorry, but I don\'t have real-time capabilities or the ability to access current weather information. I recommend checking a reliable weather website or using a weather app on your device for the most up-to-date weather conditions in your location. If you have any other questions or if there\'s anything else I can help you with, feel free to let me know!'),
(15, 'I don\'t have personal preferences or tastes, as I am just a machine learning model. However, I can provide information about pizza or help you with any questions you may have about it. If you\'re a pizza enthusiast, feel free to share your thoughts or ask anything related to pizza!\n\n\n\n\n\n'),
(16, 'I don\'t have a favorite color, but I can appreciate them all!'),
(17, 'Did you know that honey never spoils? Archaeologists have found pots of honey in ancient Egyptian tombs that are over 3,000 years old and still perfectly edible!'),
(18, 'I don\'t have a personality, but I\'m here to assist you!'),
(19, 'The capital of France is Paris.'),
(20, 'I don\'t have a favorite musician, but I can recommend some based on your preferences!'),
(21, 'I find the idea of aliens fascinating, but there is no conclusive evidence of their existence.'),
(22, 'I don\'t watch movies, but I can help you find information about your favorite films!'),
(23, 'I don\'t have hobbies, but I\'m here to chat with you!'),
(24, '\r\nGood morning! How can I assist you today?'),
(25, 'Good afternoon! How can I help you this afternoon?'),
(26, '\r\nGood night! If you have any questions or need assistance before you go to sleep, feel free to ask. Sweet dreams!'),
(27, 'Thank you! You too have a good day.'),
(28, '\r\nGood evening! How can I assist you today?\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `symptoms`
--

CREATE TABLE `symptoms` (
  `sym_id` int(11) NOT NULL,
  `sym_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `symptoms`
--

INSERT INTO `symptoms` (`sym_id`, `sym_name`) VALUES
(1, 'fever'),
(2, 'cough'),
(3, 'headache'),
(4, 'runnynose'),
(5, 'lightsensitivity'),
(6, 'bodyaches'),
(7, 'shortnessofbreath'),
(8, 'fatigue'),
(9, 'shortnessofbreath'),
(10, 'difficulty sleeping'),
(11, 'jointpain'),
(12, 'nervousness'),
(13, 'stomachpain'),
(14, 'brittlebones'),
(15, 'persistentsadness'),
(16, 'skininflammation'),
(17, 'thyroid'),
(18, 'glutenintolerance'),
(19, 'liverinflammation'),
(20, 'headache'),
(21, 'obsessivethoughts'),
(22, 'chronicpain'),
(23, 'dizziness'),
(24, 'Increasedthirst'),
(25, 'frequenturination'),
(26, 'difficulty breathing'),
(27, 'Intense headaches'),
(28, 'sensitivity to light'),
(29, 'Joint pain'),
(30, 'stiffness'),
(31, 'wheezing'),
(32, 'Abdominal pain'),
(33, 'diarrhea'),
(34, 'Memory loss'),
(35, 'confusion'),
(36, 'sneezing'),
(37, 'back pain'),
(38, 'Excessive worry'),
(39, 'restlessness'),
(40, 'Sudden numbness'),
(41, 'difficulty speaking'),
(42, 'Seizures'),
(43, 'loss of consciousness'),
(44, 'Chronic cough'),
(45, 'skin rashes'),
(46, 'Tremors'),
(47, 'Heartburn'),
(48, 'regurgitation'),
(49, 'numbness'),
(50, 'Painful urination'),
(51, 'frequent urination');

-- --------------------------------------------------------

--
-- Table structure for table `symptom_disease_mapping`
--

CREATE TABLE `symptom_disease_mapping` (
  `mapping_id` int(11) NOT NULL,
  `symptom_ids` varchar(255) NOT NULL,
  `disease_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `symptom_disease_mapping`
--

INSERT INTO `symptom_disease_mapping` (`mapping_id`, `symptom_ids`, `disease_name`) VALUES
(1, '1,6', 'INFLUENZA'),
(2, '3,23', 'HYPERTENSION'),
(3, '24,25', 'DIABETES'),
(4, '2,26', 'PNEUMONIA'),
(5, '3,5', 'MIGRAINE'),
(6, '27,28', 'MIGRAINE'),
(7, '11,30', 'ARTHRITIS'),
(8, '7,31', 'ASTHMA'),
(9, '32,33', 'CELIAC DISEASE'),
(10, '34,35', 'ALZHEIMER\'S DISEASE'),
(11, '4,36', 'COMMONCOLD'),
(12, '14,37', 'OSTEOPOROSIS'),
(13, '38,39', 'ANXIETY'),
(14, '40,41', 'STROKE'),
(15, '42,43', 'EPILEPSY'),
(16, '44,7', 'CHRONIC OBSTRUCTIVE PULMONARY DISEASE'),
(17, '11,45', 'LUPUS'),
(18, '46,30', 'PARKINSON\'S DISEASE'),
(19, '47,48', 'GASTROESOPHAGEAL REFLUX DISEASE'),
(20, '47', 'GASTROESOPHAGEAL REFLUX DISEASE'),
(21, '49,8', 'MULTIPLE SCLEROSIS'),
(22, '50,51', 'URINARY TRACT INFECTION'),
(23, '5', 'MIGRAINE');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `user_type` varchar(20) NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `user_type`) VALUES
(1, 'Subi Pinsha.P', 'subipinsha@gmail.com', '1134', 'user'),
(2, 'Abinaya ', 'smabinaya881@gmail.com', '1124', 'user'),
(3, 'Mahima.S', 'mahimaselvam@gmail.com', '1144', 'user'),
(5, 'Dhanalakshmi.G', 'dhanalakshmig03092004@gmail.com', 'Dhana@2004', 'user'),
(6, 'tyddy', 'subipinsh@gmail.com', '1152', 'user'),
(7, 'snow', 'kiruthigaji2004@gmail.com', '59jk@bts', 'user'),
(8, 'Jayasri', 'jayasri@gmail.com', '1121', 'user'),
(10, 'alin', 'alin@gmail.com', 'alin', 'user'),
(12, 'yoga', 'yoga@gmail.com', 'yogs', 'admin'),
(16, 'jeji', 'jeji@gmail.com', 'jeji', 'user'),
(17, 'yoganishta', 'yoganishta@gmail.com', 'yoga', 'admin'),
(18, 'ashwin', 'ash@gmail.com', 'ashwin', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `doctor_details`
--
ALTER TABLE `doctor_details`
  ADD PRIMARY KEY (`doctor_id`);

--
-- Indexes for table `prescription`
--
ALTER TABLE `prescription`
  ADD PRIMARY KEY (`prescription_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`question_id`);

--
-- Indexes for table `responses`
--
ALTER TABLE `responses`
  ADD PRIMARY KEY (`response_id`);

--
-- Indexes for table `symptoms`
--
ALTER TABLE `symptoms`
  ADD PRIMARY KEY (`sym_id`);

--
-- Indexes for table `symptom_disease_mapping`
--
ALTER TABLE `symptom_disease_mapping`
  ADD PRIMARY KEY (`mapping_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `question_id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `responses`
--
ALTER TABLE `responses`
  MODIFY `response_id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
