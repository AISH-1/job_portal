-- Create companies table
CREATE TABLE companies (
    company_id SERIAL PRIMARY KEY,
    company_name VARCHAR(255) NOT NULL,
    location VARCHAR(255),
    website VARCHAR(255)
);

-- Create jobs table
CREATE TABLE jobs (
    job_id SERIAL PRIMARY KEY,
    company_id INT REFERENCES companies(company_id) ON DELETE CASCADE,
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    skills_required TEXT[],
    salary_min NUMERIC,
    salary_max NUMERIC,
    openings INT NOT NULL,
    deadline DATE,
    posted_at TIMESTAMP DEFAULT NOW()
);

-- Insert sample companies
INSERT INTO companies (company_name, location, website) VALUES
('TechNova Inc', 'Tokyo, Japan', 'https://technova.com'),
('GreenAI Labs', 'Osaka, Japan', 'https://greenai.jp'),
('NextGen Robotics', 'Nagoya, Japan', 'https://nextgen-robotics.jp');

INSERT INTO jobs (company_id, title, description, skills_required, salary_min, salary_max, openings, deadline) VALUES
(1, 'Software Engineer',
 'TechNova Inc is seeking an experienced Software Engineer to join our dynamic backend team. 
 The ideal candidate will be responsible for designing, developing, and maintaining scalable financial 
 technology systems that serve thousands of users daily. Responsibilities include writing clean and efficient code, 
 performing code reviews, collaborating with cross-functional teams including product managers and designers, 
 optimizing database queries, ensuring system security and reliability, and implementing automated testing pipelines. 
 You should have a strong understanding of Python and Django, experience with PostgreSQL, and familiarity with cloud deployment. 
 A passion for problem-solving and building user-focused software is essential.',
 ARRAY['Python', 'Django', 'PostgreSQL', 'REST APIs', 'Git'],
 4000000, 6000000, 3, '2025-10-01'),

(2, 'Machine Learning Engineer',
 'GreenAI Labs is looking for a Machine Learning Engineer to develop advanced AI models for improving energy efficiency 
 in industrial applications. You will work with large datasets, perform feature engineering, design deep learning architectures, 
 implement training and evaluation pipelines, deploy models in production, and monitor performance. Collaboration with 
 domain experts and software engineers is crucial to translate research into practical solutions. The role also involves 
 researching state-of-the-art techniques, optimizing models for speed and accuracy, and documenting methodologies clearly.',
 ARRAY['Python', 'TensorFlow', 'PyTorch', 'Data Analysis', 'SQL', 'Docker'],
 5000000, 8000000, 2, '2025-11-15'),

(3, 'Robotics Engineer',
 'NextGen Robotics is seeking a Robotics Engineer to design, develop, and test autonomous robotic systems for industrial 
 and commercial applications. Responsibilities include developing control algorithms, integrating sensors and actuators, 
 simulating robotic behavior in virtual environments, debugging embedded systems, collaborating with mechanical and electrical teams, 
 and ensuring compliance with safety standards. Candidates should have extensive experience in C++, ROS, embedded systems, 
 real-time operating systems, and familiarity with AI-based robotics solutions. Strong analytical and problem-solving skills are required, 
 along with a passion for innovative robotics technology.',
 ARRAY['C++', 'ROS', 'Embedded Systems', 'Robotics', 'Linux', 'Sensors'],
 4500000, 7000000, 4, '2025-09-30');