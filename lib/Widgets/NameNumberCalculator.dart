import 'package:flutter/material.dart';

class NameNumberCalculator extends StatefulWidget {
  const NameNumberCalculator({super.key});

  @override
  State<NameNumberCalculator> createState() => _NameNumberCalculatorState();
}

class _NameNumberCalculatorState extends State<NameNumberCalculator> {
  final TextEditingController _controller = TextEditingController();
  int total = 0;

  int _calculateValue(String name) {
    name = name.toUpperCase().replaceAll(RegExp(r'[^A-Z]'), '');
    int sum = 0;
    for (var rune in name.runes) {
      sum += rune - 'A'.codeUnitAt(0) + 1;
    }
    return sum;
  }

  void _onCalculate() {
    setState(() {
      total = _calculateValue(_controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                '🔢 Name Number Calculator',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 12),

              const Text(
                'Abjad is an ancient system in which each letter has a numerical value. '
                'For example, the word "Allah" has a value of 66, which is why reciting the name Allah 66 times is considered spiritually beneficial. '
                'Abjad is also mentioned on page 15 of "Deen-e-Ilahi". '
                'You can also calculate the numerical value of your own name or any other name to understand its spiritual impact.'
                '\nNote: english version is not real abjad although it is used in Numerology',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 12,

                ),
              ),

              const SizedBox(height: 16),
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Enter your name',
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: _onCalculate,
                icon: const Icon(Icons.calculate),
                label: const Text('Calculate'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              if (_controller.text.isNotEmpty)
                Text(
                  '🔢 Total Value: $total',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
