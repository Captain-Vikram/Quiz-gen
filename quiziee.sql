-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 07, 2024 at 11:25 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quizziee`
--

-- --------------------------------------------------------

--
-- Table structure for table `biology_questions`
--

CREATE TABLE `biology_questions` (
  `question_id` int(11) NOT NULL,
  `question` text NOT NULL,
  `option_a` text NOT NULL,
  `option_b` text NOT NULL,
  `option_c` text NOT NULL,
  `option_d` text NOT NULL,
  `correct_option` char(1) NOT NULL CHECK (`correct_option` in ('a','b','c','d')),
  `topic` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `biology_questions`
--

INSERT INTO `biology_questions` (`question_id`, `question`, `option_a`, `option_b`, `option_c`, `option_d`, `correct_option`, `topic`) VALUES
(1, 'What is the primary characteristic of living organisms?', 'Homeostasis', 'Metabolism', 'Response to stimuli', 'Growth and development', 'd', 'Diversity in organisms'),
(2, 'Which of the following is NOT a characteristic of living organisms?', 'Organization', 'Metabolism', 'Homeostasis', 'Electrical conduction', 'd', 'Diversity in organisms'),
(3, 'What is the term for the ability of an organism to maintain a constant internal environment?', 'Homeostasis', 'Metabolism', 'Response to stimuli', 'Growth and development', 'a', 'Diversity in organisms'),
(4, 'Which of the following is an example of a heterotrophic organism?', 'Plant', 'Animal', 'Fungus', 'Bacterium', 'b', 'Diversity in organisms'),
(5, 'What is the primary function of the cell membrane?', 'To provide structure', 'To regulate what enters and leaves the cell', 'To produce energy', 'To synthesize proteins', 'b', 'Diversity in organisms'),
(6, 'What is the primary function of carbohydrates in cells?', 'To provide energy', 'To store energy', 'To synthesize proteins', 'To regulate metabolism', 'a', 'Biochemistry of cells'),
(7, 'Which of the following is a type of lipid?', 'Protein', 'Carbohydrate', 'Nucleic acid', 'Triglyceride', 'd', 'Biochemistry of cells'),
(8, 'What is the term for the process by which cells synthesize proteins?', 'Transcription', 'Translation', 'Mitosis', 'Meiosis', 'b', 'Biochemistry of cells'),
(9, 'Which of the following is a function of ATP in cells?', 'To synthesize proteins', 'To provide energy', 'To regulate metabolism', 'To store energy', 'b', 'Biochemistry of cells'),
(10, 'What is the primary function of the mitochondria in cells?', 'To synthesize proteins', 'To provide energy', 'To regulate metabolism', 'To store energy', 'b', 'Biochemistry of cells'),
(11, 'What is the primary function of the xylem in plants?', 'To transport water and minerals', 'To synthesize proteins', 'To provide energy', 'To regulate metabolism', 'a', 'Plant Water Relations and Mineral Nutrition'),
(12, 'Which of the following is an essential mineral nutrient for plants?', 'Carbon', 'Oxygen', 'Nitrogen', 'Helium', 'c', 'Plant Water Relations and Mineral Nutrition'),
(13, 'What is the term for the process by which plants absorb water and minerals from the soil?', 'Osmosis', 'Diffusion', 'Active transport', 'Passive transport', 'a', 'Plant Water Relations and Mineral Nutrition'),
(14, 'Which of the following is a function of the root system in plants?', 'To synthesize proteins', 'To provide energy', 'To absorb water and minerals', 'To regulate metabolism', 'c', 'Plant Water Relations and Mineral Nutrition'),
(15, 'What is the primary function of the stomata in plants?', 'To regulate gas exchange', 'To synthesize proteins', 'To provide energy', 'To store energy', 'a', 'Plant Water Relations and Mineral Nutrition'),
(16, 'What is the primary function of auxins in plant growth and development?', 'To promote cell elongation', 'To inhibit cell growth', 'To regulate metabolism', 'To synthesize proteins', 'a', 'Plant Growth and Development'),
(17, 'Which of the following is a type of plant hormone?', 'Auxin', 'Gibberellin', 'Cytokinin', 'All of the above', 'd', 'Plant Growth and Development'),
(18, 'What is the term for the process by which plants respond to light?', 'Phototropism', 'Geotropism', 'Hydrotropism', 'Thigmotropism', 'a', 'Plant Growth and Development'),
(19, 'Which of the following is a function of the shoot system in plants?', 'To absorb water and minerals', 'To synthesize proteins', 'To provide energy', 'To regulate metabolism', 'c', 'Plant Growth and Development'),
(20, 'What is the primary function of the apical meristem in plants?', 'To synthesize proteins', 'To provide energy', 'To regulate metabolism', 'To produce new growth', 'd', 'Plant Growth and Development'),
(21, 'Which process do plants primarily use to convert sunlight into energy?', 'Respiration', 'Photosynthesis', 'Transpiration', 'Fermentation', 'b', 'Plant Growth and Development'),
(22, 'What type of tissue is responsible for the transport of nutrients and sugars in plants?', 'Xylem', 'Phloem', 'Parenchyma', 'Sclerenchyma', 'b', 'Plant Water Relations and Mineral Nutrition'),
(23, 'What is the role of chlorophyll in photosynthesis?', 'Absorbing water', 'Absorbing light', 'Producing glucose', 'Releasing oxygen', 'b', 'Plant Growth and Development'),
(24, 'Which of the following is a characteristic feature of prokaryotic cells?', 'Membrane-bound organelles', 'Nucleus', 'Circular DNA', 'Multicellularity', 'c', 'Diversity in organisms'),
(25, 'What is the main function of the ribosomes in cells?', 'Energy production', 'Protein synthesis', 'DNA replication', 'Cell division', 'b', 'Biochemistry of cells');

-- --------------------------------------------------------

--
-- Table structure for table `chemistry_questions`
--

CREATE TABLE `chemistry_questions` (
  `question_id` int(11) NOT NULL,
  `question` text NOT NULL,
  `option_a` text NOT NULL,
  `option_b` text NOT NULL,
  `option_c` text NOT NULL,
  `option_d` text NOT NULL,
  `correct_option` char(1) NOT NULL,
  `topic` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `chemistry_questions`
--

INSERT INTO `chemistry_questions` (`question_id`, `question`, `option_a`, `option_b`, `option_c`, `option_d`, `correct_option`, `topic`) VALUES
(1, 'What is the smallest unit of matter?', 'Molecule', 'Atom', 'Mixture', 'Compound', 'b', 'Basic Concepts of Chemistry'),
(2, 'Which type of bond is formed by sharing of electrons?', 'Ionic bond', 'Covalent bond', 'Hydrogen bond', 'Electrostatic bond', 'b', 'Chemical Bonding'),
(3, 'What is the process of gain or loss of electrons called?', 'Oxidation', 'Reduction', 'Redox reaction', 'Ionization', 'c', 'Redox Reactions'),
(4, 'Which group of elements is known as alkali metals?', 'Group 1', 'Group 2', 'Group 17', 'Group 18', 'a', 'Elements of Groups 1 and 2'),
(5, 'What is the state of matter that has neither definite shape nor definite volume?', 'Solid', 'Liquid', 'Gas', 'Plasma', 'c', 'States of Matter'),
(6, 'What is the process of accumulation of molecules on the surface of a substance called?', 'Adsorption', 'Absorption', 'Desorption', 'Diffusion', 'a', 'Surface Chemistry'),
(7, 'What is the general formula for alkanes?', 'CnH2n+2', 'CnH2n', 'CnH2n-2', 'CnH2n+1', 'a', 'Hydrocarbons'),
(8, 'What is the study of the structure, properties, and reactions of organic compounds called?', 'Organic chemistry', 'Inorganic chemistry', 'Physical chemistry', 'Analytical chemistry', 'a', 'Basic Principles of Organic Chemistry'),
(9, 'What is the arrangement of particles in a crystalline solid called?', 'Crystal lattice', 'Unit cell', 'Molecular structure', 'Electron configuration', 'a', 'Solid State'),
(10, 'What is the change in Gibbs free energy called?', 'ΔG', 'ΔH', 'ΔS', 'ΔU', 'a', 'Chemical Thermodynamics'),
(11, 'What is the process of extraction of metals from their ores called?', 'Metallurgy', 'Electrolysis', 'Crystallization', 'Distillation', 'a', 'General Principles and Processes of Isolation'),
(12, 'What is the property of a solution that depends on the number of solute particles called?', 'Colligative property', 'Concentration', 'Solubility', 'Viscosity', 'a', 'Solutions and Colligative Properties'),
(13, 'Which group of elements is known as pnictogens?', 'Group 15', 'Group 16', 'Group 17', 'Group 18', 'a', 'p-Block Elements'),
(14, 'What is the complex formed by coordination of ligands to a central metal atom called?', 'Coordination compound', 'Organometallic compound', 'Polymer', 'Biomolecule', 'a', 'Coordination Compounds'),
(15, 'What is the reaction of an alkane with a halogen called?', 'Halogenation', 'Hydrogenation', 'Dehydrogenation', 'Oxidation', 'a', 'Halogen Derivatives of Alkanes'),
(16, 'What is the functional group present in aldehydes and ketones called?', 'Carbonyl group', 'Hydroxyl group', 'Amino group', 'Carboxyl group', 'a', 'Aldehydes, Ketones, and Carboxylic Acids'),
(17, 'What is the compound formed by reaction of an alcohol with a carboxylic acid called?', 'Ester', 'Ether', 'Aldehyde', 'Ketone', 'a', 'Organic Compounds containing Nitrogen'),
(18, 'What is the compound formed by reaction of an alcohol with an alkyl halide called?', 'Ether', 'Ester', 'Aldehyde', 'Ketone', 'a', 'Alcohols, Phenols, and Ether'),
(19, 'What is the large molecule formed by repetition of small molecules called?', 'Polymer', 'Monomer', 'Oligomer', 'Biomolecule', 'a', 'Polymers'),
(20, 'What is the study of the application of chemistry in everyday life called?', 'Chemistry in everyday life', 'Environmental chemistry', 'Industrial chemistry', 'Analytical chemistry', 'a', 'Chemistry in Everyday Life'),
(21, 'What is the biomolecule that provides energy to the body called?', 'Carbohydrate', 'Protein', 'Fat', 'Nucleic acid', 'a', 'Biomolecules (Carbohydrates)'),
(22, 'What is the process of transfer of electrons from one substance to another called?', 'Oxidation', 'Reduction', 'Electrolysis', 'Ionization', 'a', 'Electrochemistry'),
(23, 'What is the type of bonding that occurs between atoms of different electronegativities?', 'Ionic bond', 'Covalent bond', 'Polar covalent bond', 'Hydrogen bond', 'c', 'Chemical Bonding'),
(24, 'What is the term for the minimum amount of energy required for a reaction to occur?', 'Activation energy', 'Reaction rate', 'Equilibrium constant', 'Catalyst', 'a', 'Chemical Thermodynamics'),
(25, 'What is the type of polymer formed by the reaction of a dicarboxylic acid and a diamine?', 'Polyester', 'Polyamide', 'Polyolefin', 'Polyacrylate', 'b', 'Polymers');

-- --------------------------------------------------------

--
-- Table structure for table `maths_questions`
--

CREATE TABLE `maths_questions` (
  `question_id` int(11) NOT NULL,
  `question` text NOT NULL,
  `option_a` text NOT NULL,
  `option_b` text NOT NULL,
  `option_c` text NOT NULL,
  `option_d` text NOT NULL,
  `correct_option` char(1) NOT NULL,
  `topic` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `maths_questions`
--

INSERT INTO `maths_questions` (`question_id`, `question`, `option_a`, `option_b`, `option_c`, `option_d`, `correct_option`, `topic`) VALUES
(1, 'What is the value of sin(30°)?', '0.5', '1', '0', '√3/2', 'a', 'Trigonometric Functions'),
(2, 'What is the value of cos(60°)?', '1', '√2/2', '1/2', '0', 'c', 'Trigonometric Functions'),
(3, 'Which of the following is an identity for tan(θ)?', 'sin(θ)/cos(θ)', 'cos(θ)/sin(θ)', '1/sin(θ)', 'sin(θ)*cos(θ)', 'a', 'Trigonometric Functions'),
(4, 'What is the value of tan(45°)?', '0', '1', '√2', '∞', 'b', 'Trigonometric Functions'),
(5, 'What is the period of sin(x)?', 'π', '2π', 'π/2', '4π', 'b', 'Trigonometric Functions'),
(6, 'Which angle is coterminal with 270°?', '90°', '360°', '-90°', '180°', 'c', 'Trigonometric Functions'),
(7, 'If sin(θ) = 3/5, what is cos(θ) for 0 < θ < π/2?', '4/5', '5/3', '2/5', '1', 'a', 'Trigonometric Functions'),
(8, 'If sec(θ) = 2, what is the value of cos(θ)?', '1/2', '2', '√2/2', '1', 'a', 'Trigonometric Functions'),
(9, 'What is the value of cos(90° - θ)?', 'sin(θ)', 'cos(θ)', '1', '0', 'a', 'Trigonometric Functions'),
(10, 'The graph of y = sin(x) is symmetric with respect to which axis?', 'x-axis', 'y-axis', 'origin', 'none', 'b', 'Trigonometric Functions'),
(11, 'What is the value of sin(2A) in terms of sin(A) and cos(A)?', '2sin(A)cos(A)', 'sin(A)cos(A)', 'cos(A)^2 - sin(A)^2', '2cos(A)sin(A)', 'a', 'Trigonometric Functions of Compound Angles'),
(12, 'If sin(θ + φ) = sinθcosφ + cosθsinφ, what is cos(θ + φ)?', 'cosθcosφ - sinθsinφ', 'sinθsinφ - cosθcosφ', 'cosθcosφ + sinθsinφ', 'None', 'a', 'Trigonometric Functions of Compound Angles'),
(13, 'What is the double angle identity for cos(2θ)?', 'cos²(θ) - sin²(θ)', '2cos(θ)', '2sin²(θ)', '1 - sin²(θ)', 'a', 'Trigonometric Functions of Compound Angles'),
(14, 'Find the exact value of cos(75°) using sum of angles formula.', '√2/2', '(√6 - √2)/4', '√3/2', '0.5', 'b', 'Trigonometric Functions of Compound Angles'),
(15, 'Using angle sum identity, sin(105°) equals:', '1/2', '√3/2', '(√2 + √6)/4', '1', 'c', 'Trigonometric Functions of Compound Angles'),
(16, 'What is the negation of \"If it rains, then the ground will be wet\"?', 'It rains and the ground is not wet', 'If it does not rain, the ground will be dry', 'It rains and the ground will be wet', 'If it rains, the ground will not be wet', 'a', 'Mathematical Logic Statements'),
(17, 'The converse of \"If p, then q\" is:', 'If q, then p', 'If not q, then not p', 'If p, then not q', 'p implies q', 'a', 'Mathematical Logic Statements'),
(18, 'A biconditional statement is true when:', 'Both parts are true', 'One part is true', 'Both parts are false', 'At least one part is true', 'a', 'Mathematical Logic Statements'),
(19, 'What is the logical equivalence of the statement \"p AND (p OR q)\"?', 'p', 'q', 'p OR q', 'p AND q', 'a', 'Mathematical Logic Statements'),
(20, 'Which of the following is a tautology?', 'p AND NOT p', 'p OR NOT p', 'p AND q', 'p implies p', 'b', 'Mathematical Logic Statements'),
(21, 'What is the determinant of a 2x2 matrix [[a, b], [c, d]]?', 'ad - bc', 'a + d', 'ab + cd', 'a² - d²', 'a', 'Matrices'),
(22, 'If A is a 2x2 matrix and B is another 2x2 matrix, which of the following is generally true?', 'AB ≠ BA', 'AB = BA', 'AB = 0', 'AB is always invertible', 'a', 'Matrices'),
(23, 'The inverse of a matrix exists only if:', 'Its determinant is non-zero', 'Its determinant is zero', 'All entries are non-negative', 'All entries are integers', 'a', 'Matrices'),
(24, 'What is the rank of a matrix?', 'Number of non-zero rows', 'Number of columns', 'Number of non-zero columns', 'Number of zero rows', 'a', 'Matrices'),
(25, 'Which of the following matrices is singular?', 'Determinant is zero', 'All diagonal elements are 1', 'All off-diagonal elements are zero', 'It has no zero elements', 'a', 'Matrices'),
(26, 'If a coin is tossed twice, what is the probability of getting two heads?', '1/4', '1/2', '1/8', '3/4', 'a', 'Probability'),
(27, 'The sum of probabilities of all possible outcomes of an experiment is:', '1', '0', 'Greater than 1', 'Less than 1', 'a', 'Probability'),
(28, 'A bag contains 3 red balls and 2 green balls. What is the probability of drawing a red ball?', '3/5', '1/2', '2/5', '1/5', 'a', 'Probability'),
(29, 'If P(A) = 0.3, P(B) = 0.4, and P(A ∩ B) = 0.1, what is P(A ∪ B)?', '0.6', '0.7', '0.8', '0.9', 'c', 'Probability'),
(30, 'In a class of 30 students, what is the probability of randomly selecting a boy if there are 18 boys?', '3/5', '1/2', '1/3', '2/5', 'a', 'Probability');

-- --------------------------------------------------------

--
-- Table structure for table `physics_questions`
--

CREATE TABLE `physics_questions` (
  `question_id` int(11) NOT NULL,
  `question` text NOT NULL,
  `option_a` text NOT NULL,
  `option_b` text NOT NULL,
  `option_c` text NOT NULL,
  `option_d` text NOT NULL,
  `correct_option` char(1) NOT NULL,
  `topic` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `physics_questions`
--

INSERT INTO `physics_questions` (`question_id`, `question`, `option_a`, `option_b`, `option_c`, `option_d`, `correct_option`, `topic`) VALUES
(1, 'What is the SI unit of force?', 'Newton', 'Joule', 'Pascal', 'Watt', 'a', 'Force'),
(2, 'According to Newton’s second law, force is equal to what?', 'Mass times acceleration', 'Mass divided by acceleration', 'Acceleration divided by mass', 'Velocity times time', 'a', 'Force'),
(3, 'What is the gravitational constant (G)?', '6.67 × 10^-11 N(m/kg)^2', '9.81 m/s^2', '1.6 × 10^-19 C', '3.0 × 10^8 m/s', 'a', 'Gravitation'),
(4, 'What is the maximum height of a projectile launched at 30 m/s at an angle of 45°?', '45 m', '30 m', '22.5 m', '60 m', 'a', 'Projectile Motion'),
(5, 'Which law states that energy cannot be created or destroyed?', 'Law of Conservation of Energy', 'Ohm’s Law', 'Newton’s First Law', 'Law of Universal Gravitation', 'a', 'Energy'),
(6, 'What is the formula for work done?', 'W = F × d × cos(θ)', 'W = F / d', 'W = F + d', 'W = F - d', 'a', 'Work and Energy'),
(7, 'What is the unit of pressure?', 'Pascal', 'Joule', 'Newton', 'Bar', 'a', 'Fluids'),
(8, 'What phenomenon explains the bending of light when it passes from one medium to another?', 'Refraction', 'Reflection', 'Diffraction', 'Dispersion', 'a', 'Optics'),
(9, 'What is the principle of conservation of momentum?', 'Total momentum before = Total momentum after', 'Total energy before = Total energy after', 'Total mass before = Total mass after', 'Total force before = Total force after', 'a', 'Momentum'),
(10, 'What is the value of acceleration due to gravity at the surface of Earth?', '9.81 m/s^2', '10 m/s^2', '9.8 m/s^2', '11 m/s^2', 'a', 'Gravitation'),
(11, 'What is the first law of thermodynamics?', 'Energy cannot be created or destroyed', 'The total entropy of an isolated system can never decrease', 'For every action, there is an equal and opposite reaction', 'The rate of change of momentum is equal to the net force', 'a', 'Thermodynamics'),
(12, 'In a wave, what is the distance between two consecutive crests?', 'Wavelength', 'Frequency', 'Amplitude', 'Period', 'a', 'Wave Motion'),
(13, 'What is the Doppler effect?', 'Change in frequency due to relative motion', 'Reflection of waves', 'Refraction of light', 'Interference of waves', 'a', 'Waves'),
(14, 'What is the formula for the period of a simple pendulum?', 'T = 2π√(l/g)', 'T = g/l', 'T = 1/f', 'T = 2πf', 'a', 'Oscillations'),
(15, 'What is Hooke’s law?', 'F = kx', 'F = ma', 'E = mc²', 'P = V/R', 'a', 'Elasticity'),
(16, 'What does the critical angle depend on?', 'Refractive indices of two media', 'Wavelength of light', 'Speed of light in vacuum', 'Temperature', 'a', 'Optics'),
(17, 'What is the main factor affecting the speed of sound in a medium?', 'Density', 'Temperature', 'Humidity', 'Pressure', 'b', 'Sound Waves'),
(18, 'Which of the following is a characteristic of electromagnetic waves?', 'Transverse nature', 'Longitudinal nature', 'Require a medium', 'Produce sound', 'a', 'Electromagnetic Waves'),
(19, 'What is the equation for kinetic energy?', 'KE = 1/2 mv²', 'KE = mv', 'KE = mgh', 'KE = Fd', 'a', 'Work and Energy'),
(20, 'What is the relationship between current (I), voltage (V), and resistance (R)?', 'V = IR', 'V = I/R', 'I = VR', 'I = V/R', 'a', 'Current Electricity'),
(21, 'What is the effect of increasing temperature on the resistance of a conductor?', 'Resistance increases', 'Resistance decreases', 'Resistance remains the same', 'Resistance becomes zero', 'a', 'Current Electricity'),
(22, 'What is the primary purpose of a transformer?', 'To increase or decrease voltage', 'To store energy', 'To convert AC to DC', 'To measure current', 'a', 'Electromagnetic Induction'),
(23, 'What is the principle behind the operation of a potentiometer?', 'Comparison of potential difference', 'Measurement of current', 'Measurement of resistance', 'Conversion of energy', 'a', 'Current Electricity'),
(24, 'What does a common-emitter transistor do?', 'Amplifies current', 'Converts DC to AC', 'Stores energy', 'Measures voltage', 'a', 'Semiconductors'),
(25, 'What is the condition for a satellite to be in orbit around Earth?', 'Must have sufficient velocity', 'Must be stationary', 'Must have zero mass', 'Must be outside the atmosphere', 'a', 'Gravitation');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `best_score` int(100) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `token`, `best_score`) VALUES
(1, 'exampleUser', 'user@example.com', 'examplePassword', '', 0),
(2, 'Vigi', 'hdhggn@fdhh.ci', 'High', '', 0),
(3, 'Yash', 'yash@gmail.com', '123', 'JXIokvZJ7Y2KhqJJDonuOj0doZQQXd8dwd5XDVITS4nwOi3jRF9oVNUxaYX1F242NHMjQrqycXkXYHgwKGZ6poityVSon9AOwpFN', 2),
(4, 'lmao', 'lmao@hehe.com', 'lmao', 'heEHttvmBngeZWSzlPgRfoV3MZW4FZLtZ4f05YZrY4HQVB0t71ByQ7JrqJNLQyks70nH5bczCVtKHXmjmA2hKswHi9EZyL0PkzEg', 8);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `biology_questions`
--
ALTER TABLE `biology_questions`
  ADD PRIMARY KEY (`question_id`);

--
-- Indexes for table `chemistry_questions`
--
ALTER TABLE `chemistry_questions`
  ADD PRIMARY KEY (`question_id`);

--
-- Indexes for table `maths_questions`
--
ALTER TABLE `maths_questions`
  ADD PRIMARY KEY (`question_id`);

--
-- Indexes for table `physics_questions`
--
ALTER TABLE `physics_questions`
  ADD PRIMARY KEY (`question_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `biology_questions`
--
ALTER TABLE `biology_questions`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `chemistry_questions`
--
ALTER TABLE `chemistry_questions`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `maths_questions`
--
ALTER TABLE `maths_questions`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `physics_questions`
--
ALTER TABLE `physics_questions`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
