import 'package:flutter/material.dart';

class CidadeCard extends StatelessWidget {
  final IconData icone;
  final String nome;
  final String temperatura;
  final String condicao;

  const CidadeCard({
    super.key,
    required this.icone,
    required this.nome,
    required this.temperatura,
    required this.condicao,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icone, size: 36, color: Colors.amber),
            const SizedBox(height: 8),
            FittedBox(
              child: Text(
                "$nome",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 7),
            Text(
              "Temperatura: $temperatura °C",
              style: const TextStyle(fontSize: 17),
            ),
            const SizedBox(height: 6),
            Text(
              "Condição climática: $condicao",
              style: const TextStyle(fontSize: 17),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Ver detalhes'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
