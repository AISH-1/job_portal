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

-- Insert sample jobs
INSERT INTO jobs (company_id, title, description, skills_required, salary_min, salary_max, openings, deadline) VALUES
(1, 'Software Engineer',
 'Work on backend systems for fintech applications.',
 ARRAY['Python', 'Django', 'PostgreSQL'],
 4000000, 6000000, 3, '2025-10-01'),

(2, 'Machine Learning Engineer',
 'Develop deep learning models for energy efficiency.',
 ARRAY['Python', 'TensorFlow', 'PyTorch', 'Data Analysis'],
 5000000, 8000000, 2, '2025-11-15'),

(3, 'Robotics Engineer',
 'Design and test autonomous robot control systems.',
 ARRAY['C++', 'ROS', 'Embedded Systems'],
 4500000, 7000000, 4, '2025-09-30');
 