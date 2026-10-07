import 'package:path/path.dart' as path;

enum DocumentType { pdf, docx, unknown }

class DocumentModel {
  final String name;
  final String filePath;
  final DocumentType type;
  final int sizeInBytes;
  final DateTime lastModified;
  final DateTime? lastOpened;

  DocumentModel({
    required this.name,
    required this.filePath,
    required this.type,
    required this.sizeInBytes,
    required this.lastModified,
    this.lastOpened,
  });

  String get extension => path.extension(filePath).toLowerCase();

  String get formattedSize {
    if (sizeInBytes < 1024) return '$sizeInBytes B';
    if (sizeInBytes < 1024 * 1024) {
      return '${(sizeInBytes / 1024).toStringAsFixed(1)} KB';
    }
    return '${(sizeInBytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  }

  IconData get icon {
    switch (type) {
      case DocumentType.pdf:
        return Icons.picture_as_pdf;
      case DocumentType.docx:
        return Icons.description;
      default:
        return Icons.insert_drive_file;
    }
  }

  Color get color {
    switch (type) {
      case DocumentType.pdf:
        return const Color(0xFFDC2626); // Red
      case DocumentType.docx:
        return const Color(0xFF2563EB); // Blue
      default:
        return const Color(0xFF64748B); // Gray
    }
  }

  static DocumentType getTypeFromPath(String filePath) {
    final ext = path.extension(filePath).toLowerCase();
    if (ext == '.pdf') return DocumentType.pdf;
    if (ext == '.docx' || ext == '.doc') return DocumentType.docx;
    return DocumentType.unknown;
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'filePath': filePath,
        'type': type.toString(),
        'sizeInBytes': sizeInBytes,
        'lastModified': lastModified.toIso8601String(),
        'lastOpened': lastOpened?.toIso8601String(),
      };

  factory DocumentModel.fromJson(Map<String, dynamic> json) {
    return DocumentModel(
      name: json['name'],
      filePath: json['filePath'],
      type: DocumentType.values.firstWhere(
        (e) => e.toString() == json['type'],
        orElse: () => DocumentType.unknown,
      ),
      sizeInBytes: json['sizeInBytes'],
      lastModified: DateTime.parse(json['lastModified']),
      lastOpened:
          json['lastOpened'] != null ? DateTime.parse(json['lastOpened']) : null,
    );
  }
}
