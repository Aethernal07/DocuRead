import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/document_model.dart';

class DocumentProvider extends ChangeNotifier {
  List<DocumentModel> _recentDocuments = [];
  List<DocumentModel> _allDocuments = [];
  bool _isLoading = false;

  List<DocumentModel> get recentDocuments => _recentDocuments;
  List<DocumentModel> get allDocuments => _allDocuments;
  bool get isLoading => _isLoading;

  DocumentProvider() {
    _loadRecentDocuments();
  }

  Future<void> _loadRecentDocuments() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('recentDocuments') ?? '[]';
    final List<dynamic> jsonList = json.decode(jsonString);
    
    _recentDocuments = jsonList
        .map((json) => DocumentModel.fromJson(json))
        .where((doc) => File(doc.filePath).existsSync())
        .take(10)
        .toList();
    
    notifyListeners();
  }

  Future<void> _saveRecentDocuments() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = json.encode(
      _recentDocuments.map((doc) => doc.toJson()).toList(),
    );
    await prefs.setString('recentDocuments', jsonString);
  }

  Future<DocumentModel?> pickDocument() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'docx', 'doc'],
      );

      if (result != null && result.files.single.path != null) {
        final file = File(result.files.single.path!);
        final document = DocumentModel(
          name: result.files.single.name,
          filePath: file.path,
          type: DocumentModel.getTypeFromPath(file.path),
          sizeInBytes: await file.length(),
          lastModified: await file.lastModified(),
          lastOpened: DateTime.now(),
        );

        await addToRecent(document);
        return document;
      }
    } catch (e) {
      debugPrint('Error picking document: $e');
    }
    return null;
  }

  Future<void> addToRecent(DocumentModel document) async {
    _recentDocuments.removeWhere((doc) => doc.filePath == document.filePath);
    _recentDocuments.insert(0, document);
    
    if (_recentDocuments.length > 10) {
      _recentDocuments = _recentDocuments.take(10).toList();
    }
    
    await _saveRecentDocuments();
    notifyListeners();
  }

  Future<void> removeFromRecent(DocumentModel document) async {
    _recentDocuments.removeWhere((doc) => doc.filePath == document.filePath);
    await _saveRecentDocuments();
    notifyListeners();
  }

  Future<void> clearRecent() async {
    _recentDocuments.clear();
    await _saveRecentDocuments();
    notifyListeners();
  }

  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }
}
