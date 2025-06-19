import 'package:flutter/material.dart';

class UrduAbjadCalculator extends StatefulWidget {
  const UrduAbjadCalculator({super.key});

  @override
  State<UrduAbjadCalculator> createState() => _UrduAbjadCalculatorState();
}

class _UrduAbjadCalculatorState extends State<UrduAbjadCalculator> {
  final TextEditingController _controller = TextEditingController();
  int total = 0;
  String breakdown = "";

  final Map<String, int> abjadMap = {
    'ا': 1,
    'ب': 2,
    'پ': 2,
    'ت': 400,
    'ٹ': 400,
    'ث': 500,
    'ج': 3,
    'چ': 3,
    'ح': 8,
    'خ': 600,
    'د': 4,
    'ڈ': 4,
    'ذ': 700,
    'ر': 200,
    'ڑ': 200,
    'ز': 7,
    'ژ': 7,
    'س': 60,
    'ش': 300,
    'ص': 90,
    'ض': 800,
    'ط': 9,
    'ظ': 900,
    'ع': 70,
    'غ': 1000,
    'ف': 80,
    'ق': 100,
    'ک': 20,
    'گ': 20,
    'ل': 30,
    'م': 40,
    'ن': 50,
    'ں': 50,
    'و': 6,
    'ہ': 5,
    'ھ': 5,
    'ء': 0,
    'ی': 10,
    'ے': 10,
  };

  void _calculateAbjad(String name) {
    name = name.trim().replaceAll(RegExp(r'[^ء-ۿ]'), '');
    int sum = 0;
    List<String> parts = [];

    for (var char in name.characters) {
      int value = abjadMap[char] ?? 0;
      if (value > 0) {
        parts.add('$char($value)');
        sum += value;
      }
    }

    setState(() {
      total = sum;
      breakdown = parts.join(' + ');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Center(
          child: Card(
            margin: const EdgeInsets.all(16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      '🔢 ابجدی عدد کیلکولیٹر',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontFamily: "urdu",
                        
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'ابجد ایک قدیم سسٹم ہے جس میں ہر حرف کا ایک عدد ہوتا ہے۔ '
                      'جیسے "اللہ" کا عدد 66 ہے، اس لیے اللہ کا نام 66 بار پڑھنا روحانیت کے لیے بہترین سمجھا جاتا ہے۔ '
                      'آپ بھی اپنے یا کسی بھی نام کا عدد نکال سکتے ہیں تاکہ اس کا روحانی اثر جان سکیں، ',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                        fontFamily: "urdu",
                      ),
                    ),

                    const SizedBox(height: 20),
                    TextField(
                      controller: _controller,
                      textDirection: TextDirection.rtl,
                      decoration: InputDecoration(
                        hintText: 'اپنا نام درج کریں',
                        hintStyle: TextStyle(fontFamily: "urdu"),
                        prefixIcon: const Icon(Icons.edit),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: () => _calculateAbjad(_controller.text),
                      icon: const Icon(Icons.calculate),
                      label: const Text('حساب کریں'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    if (_controller.text.isNotEmpty) ...[
                      Text(
                        '📿 کل عدد: $total',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        breakdown,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
