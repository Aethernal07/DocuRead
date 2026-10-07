# DocuRead

📱 **Baca PDF & DOCX tanpa iklan** — Open source document reader dengan glassmorphism UI

> Dikembangkan oleh **Renaldisch** & **Herman Agent** (Hermes AI)

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
- ✅ Material 3 + Custom glass UI
- ✅ **No ads, no tracking, no bullshit**

### V2.0 (Planned)
- 🔄 Convert PDF to DOCX
- 🔄 Convert DOCX to PDF
- 📑 Bookmark pages
- ✍️ Annotation & highlighting
- 📤 Share documents
- 🗂️ Folder organization
- ☁️ Cloud sync (optional)

## 🎨 Design System

**Color Palette:**
- **Light Mode:** Primary Blue (#2563EB), Secondary Purple (#7C3AED), Background Slate (#F8FAFC)
- **Dark Mode:** Primary Blue (#3B82F6), Secondary Purple (#8B5CF6), Background Dark Slate (#0F172A)

**Typography:**
- Font: Inter (Google Fonts)
- Headings: 600-700 weight
- Body: 400 weight

**UI Style:** Glassmorphism dengan blur background, glass cards, smooth transitions

## 📁 Struktur Project

```
docuread_design/
├── lib/
│   ├── main.dart                      # Entry point
│   ├── theme/
│   │   └── app_theme.dart            # Material 3 + glass UI theme
│   ├── models/
│   │   └── document_model.dart       # Document data model
│   ├── providers/
│   │   ├── theme_provider.dart       # Theme state (SharedPreferences)
│   │   └── document_provider.dart    # Document state + file picker
│   ├── screens/
│   │   ├── home_screen.dart          # Home dengan recent docs list
│   │   ├── document_viewer_screen.dart # PDF & DOCX viewer
│   │   └── settings_screen.dart      # Settings & about
│   └── widgets/
│       ├── document_card.dart        # Card komponen
│       └── empty_state.dart          # Empty state UI
├── android/
│   └── app/src/main/AndroidManifest.xml # Permissions & intent filters
├── .github/
│   └── workflows/
│       └── build-apk.yml             # GitHub Actions CI/CD
├── pubspec.yaml                      # Dependencies
└── README.md
```

## 🚀 Setup & Installation

### Prerequisites
- Flutter SDK >=3.0.0
- Dart SDK >=3.0.0
- Android Studio / VS Code
- Git

### Installation

```bash
# Clone repo
git clone https://github.com/USERNAME/docuread.git
cd docuread

# Install dependencies
flutter pub get

# Run on emulator/device
flutter run

# Build APK (release)
flutter build apk --release

# Build App Bundle (Play Store)
flutter build appbundle --release
```

**APK Output:** `build/app/outputs/flutter-apk/app-release.apk`

## 📦 Dependencies

| Package | Purpose |
|---------|---------|
| `syncfusion_flutter_pdfviewer` | PDF viewer dengan zoom & search |
| `docx_to_text` | Extract text dari DOCX |
| `file_picker` | File picker dialog |
| `provider` | State management |
| `path_provider` | Access app directories |
| `permission_handler` | Storage permissions |
| `shared_preferences` | Local data persistence |
| `google_fonts` | Inter typography |
| `flutter_svg` | SVG support |

## 🔧 Development Notes & Reminders

### Important untuk Development ke Depan:

**1. State Management**
- Pakai Provider (udah setup) untuk theme & document
- Jangan mixing dengan GetX atau Riverpod
- SharedPreferences untuk persist riwayat docs

**2. PDF Viewer**
- Syncfusion punya trial period 30 hari (free for dev)
- Untuk production bisa pakai `pdfx` (open source) atau embed sendiri
- Pastikan zoom & search responsif di semua ukuran screen

**3. File Picker & Permissions**
- Android 11+ butuh READ_MEDIA_* permissions (udah di manifest)
- Request runtime permissions sebelum file picker
- Handle case di mana user deny permission

**4. DOCX Conversion (V2.0)**
- `docx_to_text` hanya extract text
- Untuk PDF ↔ DOCX conversion, pertimbangkan:
  - Server-side: LibreOffice/UNO API
  - Client-side: `flutter_pdfx` + `pdf` package
  - Third-party API: CloudConvert, Zamzar (bayar)

**5. Testing**
- Build APK untuk test di actual Android device (emulator beda performa)
- Test dark/light mode switching
- Test file picker edge cases (corrupted files, huge files)
- Test search highlight & zoom responsiveness

**6. Deployment**
- GitHub Actions auto-build APK on push (workflow udah ready)
- Download APK dari GitHub Actions → Artifacts
- Untuk Play Store: setup keystore, increment version, create changelog
- Sign APK: `jarsigner` atau Android Studio signing

**7. UI/UX Polish**
- Glassmorphism blur effect bisa heavy di low-end devices
- Test performance di Android 8+ devices
- Keyboard handling saat search
- Haptics feedback (vibration) saat page turn
- Loading skeleton screen untuk file besar

**8. Future Features (V2.0+)**
- Cloud backup riwayat docs
- Offline document sync
- Reader stats (pages read, time spent)
- Text-to-speech untuk PDF/DOCX
- Dark mode auto-schedule
- Custom themes

## 📄 License

MIT License - bebas dipakai, dimodifikasi, dan didistribusikan.

## 📄 License

MIT License — Free untuk personal, commercial, atau modification

---

## 🙏 Credits

**Development:**
- **Renaldisch** — Product vision, UI/UX design, requirements
- **Herman Agent** (Hermes AI) — Code architecture, Flutter implementation, CI/CD setup

**Libraries & Tools:**
- [Flutter](https://flutter.dev) — Framework
- [Syncfusion Flutter PDF Viewer](https://www.syncfusion.com/flutter-widgets/flutter-pdf-viewer) — PDF rendering
- [Provider](https://pub.dev/packages/provider) — State management
- [Google Fonts](https://fonts.google.com) — Typography
- [GitHub Actions](https://github.com/features/actions) — CI/CD

---

## 📞 Support & Contribution

**Issues & Bugs:** Report di [GitHub Issues](https://github.com/USERNAME/docuread/issues)

**Contributing:**
1. Fork repo
2. Create feature branch (`git checkout -b feature/amazing-feature`)
3. Commit & push
4. Open Pull Request

**Code Style:**
- Use Dart conventions
- Format dengan `dart format .`
- Lint dengan `flutter analyze`

---

**Built with ❤️ using Flutter**

*Baca dokumen tanpa iklan, tanpa tracking, cuma document reader yang bersih & simple.*
