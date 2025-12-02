#  LAPORAN TUGAS UTS

## Aplikasi Katalog Produk Kesehatan

---

##  IDENTITAS MAHASISWA

| Keterangan | Nilai |
|-----------|-------|
| Nama | Hilmi Durroh Taqwiyah|
| NIM | 230102060 |
| Kelas | IF23B |
| Mata Kuliah | Pemrograman Perangkat Bergerak |
| Dosen Pengampu | 1. Fajar Winata S.Kom., M.T. |
| | 2. Rizky Kharisma N. E. P. S.Tr.Kom., M.T. |
| Email | hilmidt29@gmail.com |
| GitHub | [https://github.com/HilmiMmott] |

---

## DESKRIPSI APLIKASI

**Aplikasi Katalog Produk Kesehatan** adalah aplikasi mobile berbasis Flutter yang menampilkan katalog produk kesehatan dengan fitur:
- Navigasi antar halaman (Home, Grid, Detail)
- Detail produk dengan gambar landscape
- Shopping cart system
- Custom widgets reusable
- Responsive design untuk semua ukuran layar

Aplikasi ini dibuat untuk memenuhi Tugas Besar UTS Pemrograman Perangkat Bergerak dengan implementasi:

✅ **5 Jenis Layout Flutter**
- Layout Dasar: Container, Padding, SizedBox
- Layout Multi-Child: Row, Column, Expanded
- Layout Kompleks: Stack, Positioned, Gradient
- Layout Scrollable: SingleChildScrollView, GridView
- Layout Responsif: MediaQuery untuk adaptive grid columns

✅ **3 Halaman Utama** (sesuai requirement)
- **Home Page**: Header, info cards, highlight banner, navigation buttons
- **Detail Page**: Hero image dengan Stack, deskripsi, add to cart button
- **Grid Page**: 6 produk dalam GridView responsif (2 kolom phone, 3 kolom tablet)

✅ **2 Custom Widget Reusable**
- **ProductCard**: Card produk dengan gambar, nama, tap handler untuk navigasi
- **CustomButton**: Button dengan gradient background, icon, box shadow

✅ **Fitur Tambahan**
- Shopping Cart dengan global state (detail_page.dart)
- Navigasi antar halaman dengan Navigator.push
- Theme Material Design 3
- Asset images lokal (6 produk)
- Image error handling

Aplikasi ini mendemonstrasikan pemahaman Flutter layout system, widget composition, dan best practices dalam pengembangan aplikasi mobile yang responsif.

## TEKNOLOGI YANG DIGUNAKAN

| Teknologi | Versi | Kegunaan |
|-----------|-------|----------|
| Flutter SDK | >=3.0.0 | Framework utama |
| Dart | >=3.0.0 | Bahasa pemrograman |
| Material Design 3 | Latest | UI Components & Theme |
| Asset Images | 6 files | Gambar produk lokal |

---

##  STRUKTUR FOLDER PROJECT

```
flutter_project_uts/
├── lib/
│   ├── main.dart                 # Entry point aplikasi
│   ├── screens/
│   │   ├── homepage.dart         # Halaman utama (HOME PAGE)
│   │   ├── detail_page.dart      # Halaman detail (DETAIL PAGE)
│   │   └── grid_page.dart        # Halaman grid katalog (GRID PAGE)
│   └── widgets/
│       ├── product_card.dart     # Custom widget card produk
│       └── custom_button.dart    # Custom widget button
├── assets/
│   └── images/                   # 6 gambar produk kesehatan
│       ├── maskermedis.png
│       ├── handsanitizer.png
│       ├── multivitamin.png
│       ├── tensimeterdigital.png
│       ├── termometer.png
│       └── glukometer.png
├── pubspec.yaml                  # Dependencies & Assets config
└── README.md                      # Dokumentasi ini
```

### Penjelasan Struktur:
- **`screens/`**: 3 halaman utama sesuai requirement UTS
- **`widgets/`**: 2 custom widget reusable (ProductCard, CustomButton)
- **`assets/images/`**: 6 gambar produk kesehatan lokal
- **`main.dart`**: Entry point dengan MaterialApp & ThemeData

---

## IMPLEMENTASI 5 JENIS LAYOUT FLUTTER

### 1. Layout Dasar (Single Child)

**Widget yang Digunakan:** Container, Padding, SizedBox

**Lokasi Implementasi:**
- `homepage.dart`: Padding (16px) untuk body scroll, SizedBox untuk vertical spacing
- `detail_page.dart`: SizedBox dengan height 60% dari screen width untuk hero image
- `grid_page.dart`: Padding untuk grid padding (16px)

**Fungsi:** Memberikan padding konsisten dan spacing antar elemen untuk layout yang rapi dan readable.

---

### 2. Layout Multi-Child (Row/Column)

**Widget yang Digunakan:** Row, Column, Expanded

**Lokasi Implementasi:**
- `homepage.dart`: 
  - Row untuk 2 info cards (Expanded children)
  - Row untuk 2 navigation buttons (Expanded + normal)
  - Column sebagai main layout vertikal
- `detail_page.dart`: Column untuk main layout
- `grid_page.dart`: Column di setiap ProductCard

**Fungsi:** Menampilkan elemen secara horizontal/vertikal dengan ukuran responsive dan flexible.

---

### 3. Layout Kompleks (Stack & Positioned)

**Widget yang Digunakan:** Stack, Positioned, LinearGradient

**Lokasi Implementasi:**
- `homepage.dart`: Stack di Highlight Banner dengan Positioned text
- `detail_page.dart`: Stack di hero image dengan:
  - Layer 1: Gambar (Positioned.fill)
  - Layer 2: Gradient overlay (Positioned.fill)
  - Layer 3: Nama produk (Positioned bottom-left)
  - Layer 4: Back button (SafeArea)

**Fungsi:** Menumpuk elemen dengan positioning absolut untuk visual yang kompleks.

---

### 4. Layout Scrollable

**Widget yang Digunakan:** SingleChildScrollView, GridView

**Lokasi Implementasi:**
- `homepage.dart`: SingleChildScrollView untuk body content
- `detail_page.dart`: SingleChildScrollView untuk detail content
- `grid_page.dart`: GridView.builder untuk 6 produk

**Fungsi:** Memungkinkan konten panjang untuk di-scroll tanpa overflow.

---

### 5. Layout Responsif/Adaptif

**Widget yang Digunakan:** MediaQuery

**Lokasi Implementasi:**
- `grid_page.dart`: MediaQuery untuk dynamic grid columns
  ```dart
  double width = MediaQuery.of(context).size.width;
  int gridCount = width < 500 ? 2 : 3;
  ```
- `detail_page.dart`: MediaQuery untuk responsive hero image height

**Fungsi:** Menyesuaikan layout berdasarkan ukuran layar (phone vs tablet).

---

##  SPESIFIKASI HALAMAN

### 1. Home Page (`homepage.dart`)

**Requirement:**
- ✅ Header "Aplikasi Kesehatan" dengan icon `Icons.health_and_safety`
- ✅ Row untuk info cards (Row, Column, Expanded)
- ✅ Tombol navigasi ke halaman lain

**Fitur:**
- SingleChildScrollView body dengan padding 16px
- Greeting "Selamat datang!" + subtitle
- 2 Info cards dalam Row dengan Expanded
- Highlight banner menggunakan Stack + Positioned
- 2 CustomButton untuk navigasi (Buka Katalog, Detail)

**Layout:** SingleChildScrollView + Column + Row + Expanded + Stack

---

### 2. Detail Page (`detail_page.dart`)

**Requirement:**
- ✅ Stack untuk hero image dengan overlay
- ✅ SingleChildScrollView untuk konten

**Fitur:**
- Hero image 60% dari screen width dengan Stack
- Gradient overlay (transparent → black54)
- Nama produk di bottom-left (Positioned)
- Back button di top-left (SafeArea)
- Deskripsi produk
- "Tambah ke Keranjang" button dengan SnackBar notification
- Global cart list untuk shopping

**Layout:** SingleChildScrollView + Stack + Positioned + Column

---

### 3. Grid Page (`grid_page.dart`)

**Requirement:**
- ✅ GridView dengan 6 item produk
- ✅ Setiap item punya nama dan gambar

**Produk:**
1. Masker Medis
2. Hand Sanitizer
3. Termometer Digital
4. Tensimeter Digital
5. Multivitamin
6. Glukometer

**Fitur:**
- GridView.builder dengan responsive columns (2 atau 3)
- Setiap item menggunakan ProductCard custom widget
- Tap produk → navigate ke DetailPage

**Layout:** GridView + ProductCard custom widget

---

## CUSTOM WIDGETS

### ProductCard (`lib/widgets/product_card.dart`)

**Fungsi:** Menampilkan card produk dengan gambar, nama, dan tap handler

**Properties:**
- `nama`: String - nama produk
- `gambar`: String - path atau URL gambar
- `onTap`: VoidCallback - handler untuk navigate

**Layout:**
- GestureDetector (tap detection)
- Card (wrapper dengan elevation)
- ClipRRect (rounded image corners)
- Image.asset / Image.network (gambar)
- Column + Padding (text layout)

**Fitur:**
- Rounded corners (12px)
- Elevation 4
- Support asset & network images
- Tap handler untuk navigasi

---

### CustomButton (`lib/widgets/custom_button.dart`)

**Fungsi:** Button dengan gradient background, icon, dan styling

**Properties:**
- `text`: String - label button
- `icon`: IconData - icon display
- `onPressed`: VoidCallback - tap handler
- `gradient`: Gradient - background gradient

**Layout:**
- InkWell (ripple effect)
- Container (styling)
- BoxDecoration (gradient + shadow)
- Row (icon + text)

**Fitur:**
- Gradient background
- Icon support
- Box shadow
- Rounded corners (12px)
- InkWell ripple effect

**Reusable di:**
- HomePage: 2 buttons (Buka Katalog, Detail)

---

## CARA MENJALANKAN

### Prerequisites:
- Flutter SDK >= 3.0.0
- Dart >= 3.0.0

### Install & Run:

```powershell
cd C:\Project_UTS\flutter_project_uts
flutter pub get
flutter run -d chrome
```

### Devices:
- Chrome: `flutter run -d chrome`
- Android: `flutter run -d emulator-5554`
- iOS: `flutter run -d simulator`

---

## TESTING CHECKLIST

- [ ] `flutter analyze` - no errors
- [ ] Aplikasi launch di Chrome
- [ ] HomePage: info cards, banner, buttons tampil
- [ ] HomePage → GridPage button works
- [ ] HomePage → Detail button works
- [ ] GridPage: 6 produk dalam grid
- [ ] GridPage: grid menjadi 2-3 kolom saat resize
- [ ] GridPage: tap produk → Detail Page
- [ ] DetailPage: hero image, gradient, nama tampil
- [ ] DetailPage: "Tambah ke Keranjang" button works
- [ ] DetailPage: SnackBar notification tampil
- [ ] DetailPage: back button works

---

## PEMENUHAN REQUIREMENT

| Item | Status |
|------|--------|
| 5 Layout Types | ✅ |
| 3 Halaman Utama | ✅ |
| 2 Custom Widget | ✅ |
| ThemeData | ✅ |
| Responsive Design | ✅ |
| Asset Images | ✅ |
| Structure Rapi | ✅ |
