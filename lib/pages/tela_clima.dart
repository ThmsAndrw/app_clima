import 'package:flutter/material.dart';

import '../models/cidade_clima.dart';
import '../widgets/area_cidades.dart';
import '../widgets/painel_informacoes.dart';

class TelaClima extends StatelessWidget {
  const TelaClima({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. MediaQuery: Pega a largura total da tela do dispositivo.
    // Útil para saber o tamanho absoluto da tela, mas em layouts complexos,
    // o LayoutBuilder costuma ser mais preciso para o espaço disponível.
    final larguraTela = MediaQuery.of(context).size.width;

    final cidades = [
      Cidade(
        Icons.wb_sunny,
        'São Paulo',
        '25',
        'Ensolarado',
      ),
      Cidade(
        Icons.cloud,
        'Rio de Janeiro',
        '28',
        'Nublado',
      ),
      Cidade(
        Icons.beach_access,
        'Belo Horizonte',
        '22',
        'Chuvoso',
      ),
      Cidade(
        Icons.ac_unit,
        'Curitiba',
        '20',
        'Chuvoso',
      ),
      Cidade(
        Icons.wb_sunny,
        'Porto Alegre',
        '25',
        'Ensolarado',
      ),
      Cidade(
        Icons.wb_sunny,
        'Brasília',
        '25',
        'Ensolarado',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('App Clima Responsiva'),
        centerTitle: true,
      ),
      // 2. LayoutBuilder: É o "coração" da responsividade aqui.
      // Ele reconstrói a tela toda vez que o espaço disponível (constraints) muda.
      // Diferente do MediaQuery, ele olha para o espaço que o widget PAI deu para ele.
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Pegamos a largura máxima disponível no momento.
          final largura = constraints.maxWidth;

          // 3. Breakpoints (Pontos de quebra):
          // Definimos limites em pixels para classificar o tamanho da tela.
          final celular = largura < 600;
          final tablet = largura >= 600 && largura < 900;
          final desktop = largura >= 900;

          // 4. Adaptação de grade (Grid):
          // Muda a quantidade de colunas dependendo do dispositivo.
          final colunas = celular
              ? 1 // Celular: 1 item por linha
              : tablet
              ? 2 // Tablet: 2 itens por linha
              : 3; // Desktop: 3 itens por linha

          // 5. Ajuste de proporções internas:
          // A altura do card muda para acomodar melhor a quantidade de colunas.
          final alturaCard = celular
              ? 230.0
              : tablet
              ? 220.0
              : 210.0;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  // Feedback visual para sabermos em qual modo a tela está
                  celular
                      ? 'Modo celular'
                      : tablet
                      ? 'Modo tablet'
                      : 'Modo desktop',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Largura atual: ${larguraTela.toStringAsFixed(0)} px'),
                const SizedBox(height: 20),

                // 6. AspectRatio: Mantém a proporção do banner em vez de fixar uma altura.
                // Em celulares (tela estreita), usamos 16/9 (mais quadradinho/alto).
                // Em telas maiores, usamos 16/5 (mais achatado/largo como um banner de site).
                AspectRatio(
                  aspectRatio: celular ? 16 / 9 : 16 / 5,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: const Center(
                      // 7. FittedBox: Impede que o texto "estoure" (overflow) a tela.
                      // Se o texto for maior que o espaço, ele diminui a fonte automaticamente para caber.
                      child: FittedBox(
                        child: Text(
                          'App Clima',
                          style: TextStyle(
                            color: Color.fromARGB(255, 12, 76, 129),
                            fontSize: 42,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Categorias',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),

                // 8. Wrap: Excelente para responsividade!
                // Diferente da Row (que daria erro de limite de tela se os chips não coubessem),
                // o Wrap joga os itens automaticamente para a linha de baixo quando falta espaço.
                const Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    Chip(label: Text('Ensolarado')),
                    Chip(label: Text('Chuvoso')),
                    Chip(label: Text('Frio')),
                    Chip(label: Text('Quente')),
                    Chip(label: Text('Nublado')),
                    Chip(label: Text('Vento Forte')),
                  ],
                ),
                const SizedBox(height: 25),

                // 9. Mudança de Estrutura (Layout Shift):
                // Se for Desktop, mostramos o conteúdo lado a lado (Row).
                // Se for menor (Celular/Tablet), empilhamos o conteúdo (Column).
                if (desktop)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 10. Expanded e Flexibilidade:
                      // O Expanded diz "ocupe o espaço que sobrar".
                      // O parâmetro `flex` divide a tela em partes.
                      // Aqui, os produtos ocupam 3 partes (75%) do espaço horizontal...
                      Expanded(
                        flex: 3,
                        child: AreaCidades(
                          cidades: cidades,
                          colunas: colunas,
                          alturaCard: alturaCard,
                        ),
                      ),
                      const SizedBox(width: 20),
                      // ... e o Resumo ocupa 1 parte (25%) do espaço horizontal.
                      const Expanded(flex: 1, child: PainelInformacoes()),
                    ],
                  )
                else
                  // Como não é desktop, empilhamos verticalmente.
                  // Aqui não precisamos do `Expanded` porque a Column naturalmente
                  // cresce para baixo num SingleChildScrollView.
                  Column(
                    children: [
                      AreaCidades(
                        cidades: cidades,
                        colunas: colunas,
                        alturaCard: alturaCard,
                      ),
                      const SizedBox(height: 20),
                      const PainelInformacoes(),
                    ],
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
