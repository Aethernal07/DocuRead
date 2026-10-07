# DocuRead - Open Source Document Reader

📱 **Baca PDF & DOCX tanpa iklan** | Built with Flutter & Dart

## ✨ Fitur

### V1.0 (Current)
- ✅ Baca file PDF dengan smooth scrolling
- ✅ Baca file DOCX/DOC
- ✅ Zoom in/out untuk PDF
- ✅ Navigasi halaman (first, prev, next, last)
- ✅ Search dalam dokumen
- ✅ Riwayat dokumen terbaru (max 10)
- ✅ Dark mode & Light mode
- ✅ Info dokumen (size, pages, last modified)
- ✅ Material 3 design
- ✅ No ads, no tracking, no bullshit

### V2.0 (Planned)
- 🔄 Convert PDF to DOCX
- 🔄 Convert DOCX to PDF
- 📑 Bookmark pages
- ✍️ Annotation & highlighting
- 📤 Share documents
- 🗂️ Folder organization
- ☁️ Cloud sync (optional)

## 🎨 Design System

### Colors
**Light Mode:**
- Primary: Blue (#2563EB)
- Secondary: Purple (#7C3AED)
- Background: Slate (#F8FAFC)
- Surface: White (#FFFFFF)

**Dark Mode:**
- Primary: Blue (#3B82F6)
- Secondary: Purple (#8B5CF6)
- Background: Dark Slate (#0F172A)
- Surface: Slate (#1E293B)

### Typography
- Font: Inter (Google Fonts)
- Headings: 600-700 weight
- Body: 400 weight

## 🚀 Setup

### Prerequisites
- Flutter SDK >=3.0.0
- Dart SDK >=3.0.0
- Android Studio / VS Code
- Android SDK (untuk build Android)

### Installation

```bash
# Clone repo (nanti setelah push ke GitHub)
git clone https://github.com/yourusername/docuread.git
cd docuread

# Install dependencies
flutter pub get

# Run on emulator/device
flutter run

# Build APK
flutter build apk --release

# Build App Bundle (untuk Play Store)
flutter build appbundle --release
```

## 📁 Struktur Project

```
lib/
├── main.dart                 # Entry point
├── theme/
│   └── app_theme.dart       # Theme & design system
├── models/
│   └── document_model.dart  # Document data model
├── providers/
│   ├── theme_provider.dart  # Theme state management
│   └── document_provider.dart # Document state management
├── screens/
│   ├── home_screen.dart     # Home dengan list dokumen
│   ├── document_viewer_screen.dart # PDF & DOCX viewer
│   └── settings_screen.dart # Pengaturan
└── widgets/
    ├── document_card.dart   # Card komponen untuk dokumen
    └── empty_state.dart     # Empty state UI
```

## 🔧 Dependencies

**Core:**
- `flutter` - Framework
- `provider` - State management

**Document Handling:**
- `syncfusion_flutter_pdfviewer` - PDF viewer
- `docx_to_text` - DOCX reader

**File System:**
- `file_picker` - File picker dialog
- `path_provider` - Access to app directories
- `permission_handler` - Storage permissions

**UI:**
- `google_fonts` - Inter font
- `flutter_svg` - SVG support
- `shared_preferences` - Local data storage

## 📱 Screenshots

*(Add screenshots here after running the app)*

## 🤝 Contributing

1. Fork repo
2. Create feature branch (`git checkout -b feature/amazing-feature`)
3. Commit changes (`git commit -m 'Add amazing feature'`)
4. Push to branch (`git push origin feature/amazing-feature`)
5. Open Pull Request

## 📄 License

MIT License - bebas dipakai, dimodifikasi, dan didistribusikan.

## 🙏 Credits

Built with ❤️ using Flutter

**Libraries:**
- Syncfusion Flutter PDF Viewer
- Google Fonts
- Provider state management

---

**No ads. No tracking. Just reading.** 📖
