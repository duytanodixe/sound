# **Sound Converter – Ứng dụng xử lý âm thanh hỗ trợ AI**

**Sound Converter** là một ứng dụng Java hỗ trợ quản lý, phân tích và trộn các tệp âm thanh bằng trí tuệ nhân tạo. Ứng dụng sử dụng **JavaFX** cho giao diện đồ họa, **MySQL** để lưu trữ dữ liệu, và **Whisper CPP** để phân tích giọng nói.

---

## 🎧 Tính năng chính

- **Quản lý tệp âm thanh**: Nhập và quản lý các file định dạng MP3
- **Phân tích giọng nói bằng AI**: Sử dụng Whisper CPP để phiên âm nội dung âm thanh
- **Trích xuất đoạn âm thanh**: Cắt các đoạn nhỏ từ file âm thanh lớn
- **Trộn âm thanh**: Kết hợp nhiều đoạn âm thành một file hoàn chỉnh
- **Lưu & tải cấu hình trộn**: Cho phép lưu lại quy trình trộn để sử dụng lại sau
- **Hỗ trợ đa ngôn ngữ**: Hỗ trợ phân tích nhiều ngôn ngữ, đặc biệt tối ưu cho tiếng Việt

---

## 🖥 Yêu cầu hệ thống

- Java Development Kit (JDK) 17 hoặc mới hơn
- MySQL 8.0 trở lên
- FFmpeg (đã được tích hợp sẵn)
- Whisper CPP (đã được tích hợp sẵn)
- RAM tối thiểu 4GB (khuyến nghị 8GB)
- Ít nhất 1GB dung lượng trống

---

## 🗂 Cấu trúc thư mục dự án

```
SoundConverterOfficial/
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com/soundconverter/
│   │   │       ├── ai/             # Tích hợp Whisper CPP
│   │   │       ├── controllers/    # Controller cho JavaFX
│   │   │       ├── dao/            # Lớp truy xuất dữ liệu
│   │   │       ├── models/         # Model dữ liệu
│   │   │       ├── services/       # Dịch vụ xử lý logic
│   │   │       └── Main.java       # Điểm khởi đầu
│   │   └── resources/
│   │       ├── fxml/               # File giao diện FXML
│   │       ├── ffmpeg/             # Thư viện FFmpeg
│   │       ├── whisper/            # Thư viện Whisper CPP
│   │       │   └── models/         # Các mô hình AI
│   │       └── css/                # Style cho giao diện
├── output/                         # Lưu file tạm/thành phẩm
├── pom.xml                         # Cấu hình Maven
└── README.md                       # Tài liệu hướng dẫn
```

---

## ⚙️ Hướng dẫn cài đặt

### **1. Cài đặt Java (JDK)**

- Tải JDK 17 hoặc mới hơn từ:
  - [Oracle](https://www.oracle.com/java/technologies/downloads/)
  - Hoặc [OpenJDK](https://jdk.java.net/)
- Cài đặt và cấu hình biến môi trường `JAVA_HOME`
- Kiểm tra bằng lệnh:
  ```bash
  java -version
  ```

### **2. Cài đặt Maven** (nếu chưa có)

- Tải Maven tại: [https://maven.apache.org/download.cgi](https://maven.apache.org/download.cgi)
- Giải nén và thêm đường dẫn `bin` của Maven vào biến môi trường `PATH`
- Kiểm tra bằng lệnh:
  ```bash
  mvn -version
  ```

> Nếu lệnh trên trả về thông tin phiên bản Maven là bạn đã cài đặt thành công.

### **3. Cài đặt MySQL**

- Tải từ: [https://dev.mysql.com/downloads/mysql/](https://dev.mysql.com/downloads/mysql/)
- Cài đặt MySQL Server
- Tạo file `config.properties` trong `src/main/resources/` dựa trên file mẫu `config.properties.example` và cập nhật như sau:

```properties
# Database Configuration
db.url=jdbc:mysql://localhost:3306/soundconverter?createDatabaseIfNotExist=true&useUnicode=true&characterEncoding=UTF-8&connectionCollation=utf8mb4_unicode_ci
db.user=root
db.password=your_mysql_password

# Application Settings
app.encoding=UTF-8
app.temp.dir=./temp
app.output.encoding=UTF-8
app.file.encoding=UTF-8
```

> ⚠️ Ứng dụng sẽ tự động tạo cơ sở dữ liệu `soundconverter` và các bảng nếu chưa có.

### **4. Cài đặt và chạy ứng dụng**

1. Clone mã nguồn:
  tải từ drive hoặc git
  hướng dẫn dùng git
   ```bash
   git clone https://github.com/duytanodixe/AISOUND-
   cd SoundConverterOfficial
   ```

2. Biên dịch với Maven:
   ```bash
   mvn clean package
   ```

3. Chạy ứng dụng:
   ```bash
   java -jar target/AISOUND.jar
   ```

---

## 🧑‍💻 Hướng dẫn sử dụng
### trong lib/music đã bao gồm 3 bài hát mẫu 1 tiếng Anh, 1 tiếng Nhật, 1 tiếng Việt
### **1. Nhập tệp âm thanh**

- Mở ứng dụng, chọn nút **"Import"**
- Chọn file định dạng: `.mp3`, `.wav`, `.ogg`, `.aac`
- Tệp sẽ hiển thị trong danh sách bên trái

### **2. Phân tích âm thanh bằng AI**

- Chọn file cần phân tích
- Chọn ngôn ngữ (mặc định là tiếng Việt)
- Nhập độ dài đoạn cần phân tích (đơn vị: giây, nhập 0 để hệ thống tự chia)
- Nhấn **"Analyze"**
- Chờ kết quả hiển thị ở bảng bên dưới

### **3. Chỉnh sửa phiên âm**

- Click đúp vào cột "Text" để chỉnh sửa nội dung
- Nhấn Enter để lưu

### **4. Trộn âm thanh**

- Chọn các đoạn cần ghép(Yêu cầu đã **"Analyze"**)
- Nhấn **"Add to Merge"**
- Dùng **"Move Up" / "Move Down"** để thay đổi thứ tự
- Nhập tên tệp đầu ra
- Nhấn **"Preview"** để nghe thử
- Nhấn **"Merge"** để tạo file và chọn nơi lưu

### **5. Lưu và tải cấu hình trộn**

- Nhấn **"Save Merge"** để lưu cấu hình
- Đặt tên và xác nhận
- Để tải lại, dùng **"Load Merge"**

---

## ❗ Xử lý lỗi thường gặp

### 🔌 Lỗi kết nối MySQL

- Kiểm tra MySQL đã chạy
- Đảm bảo cấu hình trong `config.properties` chính xác
- Tài khoản MySQL cần có quyền tạo database và bảng

### 🧠 Lỗi “Invalid memory access” khi phân tích

- Đảm bảo Whisper CPP đã cài đúng
- Kiểm tra file âm thanh không bị hỏng
- Chọn đúng ngôn ngữ thay vì để mặc định
- Đảm bảo model AI nằm trong `src/main/resources/whisper/models`

### 🎛️ Lỗi trộn âm thanh

- Đảm bảo FFmpeg đã được tích hợp
- Tên file không chứa ký tự đặc biệt
- Kiểm tra quyền ghi vào thư mục đích
- Xem chi tiết lỗi trong console

---

## ⌨️ Phím tắt

| Phím tắt     | Hành động                       |
|--------------|----------------------------------|
| Ctrl + I     | Nhập file âm thanh              |
| Ctrl + A     | Phân tích file âm thanh         |
| Ctrl + E     | Chỉnh sửa đoạn âm thanh         |
| Ctrl + M     | Trộn các đoạn âm                |
| Ctrl + S     | Lưu cấu hình trộn               |
| Ctrl + L     | Tải cấu hình trộn đã lưu        |
| Ctrl + P     | Xem trước bản trộn              |

---

## 🛠 Công nghệ sử dụng

- **JavaFX**: Xây dựng giao diện người dùng
- **MySQL**: Quản lý dữ liệu file âm thanh và đoạn phân tích
- **Whisper CPP**: Mô hình AI phiên âm giọng nói
- **FFmpeg**: Trộn và xử lý file âm thanh

---

## 📬 Liên hệ và hỗ trợ

Nếu bạn gặp vấn đề, hãy tạo issue trên GitHub hoặc liên hệ qua email: **duytanodixe@gmail.com**

---

© 2025 Sound Converter Project. Phát triển bởi **[duytanodixe]**