from flask import Flask, jsonify
import psycopg2
import os

app = Flask(__name__)

def get_db_connection():
    return psycopg2.connect(
        host=os.getenv('PGHOST', 'db'),
        user=os.getenv('PGUSER', 'postgres'),
        password=os.getenv('PGPASSWORD', 'postgres'),
        database=os.getenv('PGDATABASE', 'postgres')
    )

@app.get("/")
def root():
    return jsonify(message="Hello from Flask + PostgreSQL in Docker 🐳🐘"), 200

@app.get("/health")
def health():
    try:
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute("SELECT version();")
        version = cursor.fetchone()[0]
        cursor.close()
        conn.close()
        return jsonify(status="healthy", database=version), 200
    except Exception as e:
        return jsonify(status="unhealthy", error=str(e)), 500

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)