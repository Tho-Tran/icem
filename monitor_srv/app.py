from flask import Flask, render_template, jsonify
from flask_sqlalchemy import SQLAlchemy
import requests
import threading
import time
from datetime import datetime

app = Flask(__name__)
app.config["SQLALCHEMY_DATABASE_URI"] = "postgresql://admin:ICEM2025@localhost/web_monitor"
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False

db = SQLAlchemy(app)

class Website(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    server = db.Column(db.String(50), nullable=True)
    type = db.Column(db.String(50), nullable=True)
    url = db.Column(db.String(255), nullable=False, unique=True)
    status = db.Column(db.String(50), nullable=False)
    response_time = db.Column(db.Float, nullable=True)
    last_checked = db.Column(db.DateTime, nullable=True)
    error_message = db.Column(db.Text, nullable=True)

# Hàm kiểm tra trạng thái website và cập nhật database
def check_and_update():
    with app.app_context():  # 🔹 Đảm bảo Flask hiểu thread đang chạy trong ứng dụng
        while True:
            websites = Website.query.all()
            for site in websites:
                try:
                    start_time = time.time()
                    response = requests.get(site.url, timeout=5)
                    response_time = (time.time() - start_time) * 1000  # ms
                    site.status = "OK" if response.status_code == 200 else "DOWN"
                    site.response_time = round(response_time, 2)
                    site.error_message = None
                except requests.RequestException as e:
                    site.status = "DOWN"
                    site.response_time = None
                    site.error_message = str(e)

                site.last_checked = datetime.utcnow()
            
            db.session.commit()  # 🔹 Chỉ commit **một lần** sau khi cập nhật tất cả website
            print("✅ Cập nhật trạng thái website xong.")  # Debug
            time.sleep(30)  # 🔹 Kiểm tra lại sau 30 giây

# Chạy background thread an toàn
def start_background_thread():
    thread = threading.Thread(target=check_and_update, daemon=True)
    thread.start()

@app.route("/")
def index():
    return render_template("index.html")

@app.route("/status")
def status():
    websites = Website.query.all()
    data = [
            {   
            "server": site.server,
            "type": site.type,
            "url": site.url,
            "status": site.status,
            "response_time": site.response_time,
            "last_checked": site.last_checked.strftime("%Y-%m-%d %H:%M:%S") if site.last_checked else "N/A",
            "error_message": site.error_message if site.error_message else "N/A"
        }
        for site in websites
    ]
    return jsonify(data)

if __name__ == "__main__":
    start_background_thread()  # 🛠 Khởi động thread khi chạy Flask
    app.run(host="0.0.0.0", port=5000, debug=True)

