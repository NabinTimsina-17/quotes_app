import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';

class QuoteCard extends StatefulWidget {
  final String quote;
  final String backgroundImage;

  const QuoteCard({
    super.key,
    required this.quote,
    required this.backgroundImage,
  });

  @override
  _QuoteCardState createState() => _QuoteCardState();
}

class _QuoteCardState extends State<QuoteCard> {
  final ScreenshotController _screenshotController = ScreenshotController();

  Future<void> _copyToClipboard(BuildContext context) async {
    await Clipboard.setData(ClipboardData(text: widget.quote));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Quote copied to clipboard!")),
    );
  }

  Future<void> _downloadQuoteAsImage(BuildContext context) async {
    try {
      final Uint8List? capturedImage = await _screenshotController.capture();
      if (capturedImage == null) return;

      final tempDir = await getTemporaryDirectory();
      final path =
          '${tempDir.path}/quote_${DateTime.now().millisecondsSinceEpoch}.png';
      
      final File imageFile = File(path);
      await imageFile.writeAsBytes(capturedImage);

      // await GallerySaver.saveImage(path, albumName: 'Quotes App');

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Quote saved to gallery!")),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to save quote")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: _screenshotController,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        elevation: 5.0,
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: Stack(
          children: [
            // Background Image
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.asset(
                widget.backgroundImage,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.grey[200],
                  child: const Icon(Icons.broken_image),
                ),
              ),
            ),
            // Gradient Overlay
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                gradient: LinearGradient(
                  colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
            // Quote Content
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  widget.quote,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
            // Action Buttons
            Positioned(
              bottom: 8,
              right: 8,
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.download, color: Colors.white),
                    onPressed: () => _downloadQuoteAsImage(context),
                  ),
                  IconButton(
                    icon: const Icon(Icons.copy, color: Colors.white),
                    onPressed: () => _copyToClipboard(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}