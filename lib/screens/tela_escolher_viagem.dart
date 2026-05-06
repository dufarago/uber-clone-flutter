import 'package:flutter/material.dart';

class TelaEscolherViagem extends StatelessWidget {
  const TelaEscolherViagem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      body: Column(
        children: [
          // ── Mapa simulado (Agora com imagem real) ──
          Stack(
            children: [
              SizedBox(
                height: 270,
                width: double.infinity, // Ocupa toda a largura
                child: Image.network(
                  // Link de uma imagem de mapa real
                  'https://static.vecteezy.com/system/resources/previews/000/153/588/original/vector-roadmap-location-map.jpg',
                  fit: BoxFit.cover, // Preenche todo o espaço
                  // Dá uma leve escurecida no mapa para combinar com o app
                  color: Colors.black.withOpacity(0.3), 
                  colorBlendMode: BlendMode.darken,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    // Mostra uma bolinha de carregamento enquanto a imagem baixa
                    return const Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    );
                  },
                ),
              ),

              // Botão voltar
              Positioned(
                top: 48,
                left: 16,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        color: Colors.black, shape: BoxShape.circle),
                    child: const Icon(Icons.arrow_back,
                        color: Colors.white, size: 20),
                  ),
                ),
              ),

              // Banner origem
              Positioned(
                top: 44,
                left: 62,
                right: 16,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 14, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          'Rua Narcisos, 277\n- Jardim Boa Vista, Campo Ma...',
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                      ),
                      Icon(Icons.chevron_right, color: Colors.white38),
                    ],
                  ),
                ),
              ),

              // Banner destino
              Positioned(
                bottom: 14,
                left: 16,
                right: 16,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text('4\nMIN',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                      ),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: Text(
                          'Rua Júlia Wanderley,...\nCuritiba - PR, 80430-030',
                          style: TextStyle(color: Colors.black, fontSize: 13),
                        ),
                      ),
                      const Icon(Icons.chevron_right, color: Colors.black38),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // ── Painel inferior ──
          Expanded(
            child: Container(
              color: const Color(0xFF1A1A1A),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 14),
                    child: Text(
                      'Escolher uma viagem',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),

                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      children: [
                        // Prioridade (selecionado)
                        _cardViagem(
                          selecionado: true,
                          nome: 'Prioridade',
                          passageiros: '👤4',
                          tempo: '13:58 · 4 min',
                          preco: 'R\$ 30,99',
                          badge: '⭐  Excelentes ofertas',
                          badgeColor: const Color(0xFF333333),
                          bolt: true,
                        ),
                        const SizedBox(height: 8),

                        // UberX
                        _cardViagem(
                          selecionado: false,
                          nome: 'UberX',
                          tempo: '13:59 · 5 min',
                          preco: 'R\$ 27,96',
                        ),
                        const SizedBox(height: 8),

                        // Comfort
                        _cardViagem(
                          selecionado: false,
                          nome: 'Comfort',
                          tempo: '13:56 · 3 min',
                          preco: 'R\$ 36,97',
                          badge: '⚡  Mais rápido',
                          badgeColor: const Color(0xFF1A56DB),
                        ),
                        const SizedBox(height: 12),

                        // Uber One
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 14),
                          decoration: BoxDecoration(
                            color: const Color(0xFF252525),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              const Text('🔶', style: TextStyle(fontSize: 22)),
                              const SizedBox(width: 12),
                              const Expanded(
                                child: Text(
                                  'Experimente o Uber One\ngratuitamente por 12 meses',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                              ),
                              Container(
                                width: 22,
                                height: 22,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white38),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),

                        // Perfil Pessoal
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 14),
                          decoration: BoxDecoration(
                            color: const Color(0xFF252525),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 38,
                                height: 38,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(Icons.person,
                                    color: Colors.white, size: 20),
                              ),
                              const SizedBox(width: 6),
                              Container(
                                width: 38,
                                height: 38,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(Icons.work_outline,
                                    color: Colors.white, size: 18),
                              ),
                              const SizedBox(width: 12),
                              const Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Perfil Pessoal',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                    Text(
                                        'Mastercard Crédito ····5694 (Crédito)',
                                        style: TextStyle(
                                            color: Colors.white54,
                                            fontSize: 12)),
                                  ],
                                ),
                              ),
                              const Icon(Icons.chevron_right,
                                  color: Colors.white38),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),

                  // ── Botão Customizado (Brancão!) ──
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                    child: GestureDetector(
                      onTap: () {
                        print('Botão Escolha Prioridade clicado!');
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            'Escolha Prioridade',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _cardViagem({
    required bool selecionado,
    required String nome,
    String? passageiros,
    required String tempo,
    required String preco,
    String? badge,
    Color? badgeColor,
    bool bolt = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFF252525),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: selecionado ? Colors.white : Colors.transparent,
          width: 2,
        ),
      ),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                width: 58,
                height: 48,
                decoration: const BoxDecoration(
                  color: Color(0xFF333333),
                  shape: BoxShape.circle,
                ),
                child: const Center(
                    child: Text('🚗', style: TextStyle(fontSize: 24))),
              ),
              if (bolt)
                Container(
                  width: 18,
                  height: 18,
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: const Center(
                      child: Text('⚡', style: TextStyle(fontSize: 10))),
                ),
            ],
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(nome,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                    if (passageiros != null) ...[
                      const SizedBox(width: 6),
                      Text(passageiros,
                          style: const TextStyle(
                              color: Colors.white54, fontSize: 13)),
                    ],
                  ],
                ),
                const SizedBox(height: 2),
                Text(tempo,
                    style: const TextStyle(
                        color: Colors.white54, fontSize: 13)),
                if (badge != null) ...[
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: badgeColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(badge,
                        style: const TextStyle(
                            fontSize: 12, color: Colors.white)),
                  ),
                ],
              ],
            ),
          ),
          Text(preco,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16)),
        ],
      ),
    );
  }
}