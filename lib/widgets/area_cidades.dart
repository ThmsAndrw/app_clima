import 'package:flutter/material.dart';

import '../models/cidade_clima.dart';
import 'cidade_card.dart';

class AreaCidades extends StatelessWidget {
  final List<Cidade> cidades;
  final int colunas;
  final double alturaCard;

  const AreaCidades({
    super.key,
    required this.cidades,
    required this.colunas,
    required this.alturaCard,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Cidades em destaque',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 12),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: cidades.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: colunas,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            mainAxisExtent: alturaCard,
          ),
          itemBuilder: (context, index) {
            final cidade = cidades[index];

            return CidadeCard(
              icone: cidade.icone,
              nome: cidade.nome,
              temperatura: cidade.temperatura,
              condicao: cidade.condicao,
            );
          },
        ),
      ],
    );
  }
}
