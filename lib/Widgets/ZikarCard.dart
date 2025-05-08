import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gohar_shahi/Data/data.dart';

class ZikrCard extends StatelessWidget {
  final ZikrData zikr;

  const ZikrCard({super.key, required this.zikr});

  void _copyText(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Copied')),
    );
  }

  void _copyAllText(BuildContext context) {
    final copiedText = '''
📖 ${zikr.reference}

${zikr.arabic}

🔸 ${zikr.translation.ur}

🔸 ${zikr.translation.hi}

🔸 ${zikr.translation.en}
''';

    Clipboard.setData(ClipboardData(text: copiedText));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('All text copied')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              zikr.reference,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(
              zikr.arabic,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                // fontFamily: 'Amiri',
              ),
            ),
            const SizedBox(height: 16),
            Text("Translations", textAlign: TextAlign.center,),

            // Urdu Translation + Copy
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    zikr.translation.ur,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      fontSize: 18,
                      fontFamily: 'urdu',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.copy, size: 18),
                  onPressed: () => _copyText(context, zikr.translation.ur),
                  tooltip: 'Copy Urdu',
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Hindi Translation + Copy
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    zikr.translation.hi,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.copy, size: 18),
                  onPressed: () => _copyText(context, zikr.translation.hi),
                  tooltip: 'Copy Hindi',
                ),
              ],
            ),
            const SizedBox(height: 12),

            // English Translation + Copy
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    zikr.translation.en,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.copy, size: 18),
                  onPressed: () => _copyText(context, zikr.translation.en),
                  tooltip: 'Copy English',
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Copy All Button
            Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                onPressed: () => _copyAllText(context),
                icon: const Icon(Icons.copy_all, size: 18),
                label: const Text('Copy All'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




class ZikrCardKalki extends StatelessWidget {
  final Kalkidataitem zikr;

  const ZikrCardKalki({super.key, required this.zikr});

  void _copyText(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Copied')),
    );
  }

  void _copyAllText(BuildContext context) {
    final copiedText = '''
📖 ${zikr.reference}

${zikr.sanskrit}

🔸 ${zikr.translation.ur}

🔸 ${zikr.translation.hi}

🔸 ${zikr.translation.en}
''';

    Clipboard.setData(ClipboardData(text: copiedText));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('All text copied')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              zikr.reference,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(
              zikr.sanskrit,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                // fontFamily: 'Amiri',
              ),
            ),
            const SizedBox(height: 16),
            Text("Translations", textAlign: TextAlign.center,),

            // Urdu Translation + Copy
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    zikr.translation.ur,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      fontSize: 18,
                      fontFamily: 'urdu',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.copy, size: 18),
                  onPressed: () => _copyText(context, zikr.translation.ur),
                  tooltip: 'Copy Urdu',
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Hindi Translation + Copy
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    zikr.translation.hi,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.copy, size: 18),
                  onPressed: () => _copyText(context, zikr.translation.hi),
                  tooltip: 'Copy Hindi',
                ),
              ],
            ),
            const SizedBox(height: 12),

            // English Translation + Copy
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    zikr.translation.en,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.copy, size: 18),
                  onPressed: () => _copyText(context, zikr.translation.en),
                  tooltip: 'Copy English',
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Copy All Button
            Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                onPressed: () => _copyAllText(context),
                icon: const Icon(Icons.copy_all, size: 18),
                label: const Text('Copy All'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
