import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/document_provider.dart';
import '../providers/theme_provider.dart';
import '../widgets/document_card.dart';
import '../widgets/empty_state.dart';
import '../theme/app_theme.dart';
import 'document_viewer_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFF1F5F9),
            Color(0xFFE0E7FF).withOpacity(0.6),
            Color(0xFFE9D5FF).withOpacity(0.6),
          ],
          stops: const [0.0, 0.5, 1.0],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.auto_stories,
                color: theme.colorScheme.primary,
                size: 28,
              ),
              const SizedBox(width: 12),
              Text(
                'DocuRead',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.brightness_6),
              onPressed: () {
                context.read<ThemeProvider>().toggleTheme();
              },
              tooltip: 'Toggle tema',
            ),
            IconButton(
              icon: const Icon(Icons.settings_outlined),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsScreen(),
                  ),
                );
              },
              tooltip: 'Pengaturan',
            ),
          ],
        ),
        body: Consumer<DocumentProvider>(
          builder: (context, docProvider, child) {
            if (docProvider.recentDocuments.isEmpty) {
              return EmptyState(
                icon: Icons.description_outlined,
                title: 'Belum ada dokumen',
                subtitle: 'Buka file PDF atau DOCX untuk mulai membaca',
                actionText: 'Buka Dokumen',
                onAction: () => _pickAndOpenDocument(context),
              );
            }

            return CustomScrollView(
              slivers: [
                // Header
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dokumen Terbaru',
                          style: theme.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: theme.textTheme.headlineSmall?.color,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '${docProvider.recentDocuments.length} dokumen',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.textTheme.bodyMedium?.color?.withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Document List
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(20, 24, 20, 100),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final document = docProvider.recentDocuments[index];
                        return DocumentCard(
                          document: document,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DocumentViewerScreen(
                                  document: document,
                                ),
                              ),
                            );
                          },
                          onDelete: () {
                            _showDeleteDialog(context, docProvider, document);
                          },
                        );
                      },
                      childCount: docProvider.recentDocuments.length,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => _pickAndOpenDocument(context),
          icon: const Icon(Icons.add),
          label: const Text('Buka Dokumen'),
        ),
      ),
    );
  }

  Future<void> _pickAndOpenDocument(BuildContext context) async {
    final docProvider = context.read<DocumentProvider>();
    docProvider.setLoading(true);

    final document = await docProvider.pickDocument();
    
    docProvider.setLoading(false);

    if (document != null && context.mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DocumentViewerScreen(document: document),
        ),
      );
    }
  }

  void _showDeleteDialog(
    BuildContext context,
    DocumentProvider provider,
    document,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hapus dari riwayat?'),
        content: const Text(
          'File tidak akan dihapus dari perangkat, hanya dari daftar riwayat.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              provider.removeFromRecent(document);
              Navigator.pop(context);
            },
            child: const Text('Hapus'),
          ),
        ],
      ),
    );
  }
}
