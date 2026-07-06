import 'package:flutter/material.dart';

class PainelInformacoes extends StatelessWidget {
  const PainelInformacoes({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.indigo.shade50,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Informações Extras',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text('Umidade: 65%', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 8),
            const Text('Vento: 12 km/h', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 8),
            const Text(
              'Sensação térmica: 30°C',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 8),
            const Text('Nascer do sol: 06:10', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
