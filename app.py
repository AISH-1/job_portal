# from flask import Flask, jsonify, render_template
# import psycopg2
# import os

# app = Flask(__name__)

# # Connect to PostgreSQL
# conn = psycopg2.connect(
#     dbname="joblistings",
#     user="postgres",
#     password="1234",
#     host="localhost",
#     port="5432"
# )

import os
import psycopg2
from flask import Flask, jsonify, render_template

app = Flask(__name__)

DATABASE_URL = os.environ.get("DATABASE_URL")

conn = psycopg2.connect(DATABASE_URL, sslmode="require")

@app.route("/api/jobs")
def get_jobs():
    cur = conn.cursor()
    cur.execute("""
        SELECT j.job_id, c.company_name, j.title, j.description, j.skills_required, 
               j.salary_min, j.salary_max, j.openings, j.deadline
        FROM jobs j
        JOIN companies c ON j.company_id = c.company_id
        ORDER BY j.posted_at DESC;
    """)
    jobs = cur.fetchall()
    cur.close()

    job_list = []
    for job in jobs:
        job_list.append({
            "id": job[0],
            "company": job[1],
            "title": job[2],
            "description": job[3],
            "skills": job[4],
            "salary_min": job[5],
            "salary_max": job[6],
            "openings": job[7],
            "deadline": job[8].strftime("%Y-%m-%d")
        })
    return jsonify(job_list)

@app.route("/")
def index():
    return render_template("index.html")

if __name__ == "__main__":
    app.run(debug=True)