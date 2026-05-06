import 'package:flutter/material.dart';

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      body: SafeArea(
        child: Column(
          children: [
            // ── Tabs ──
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const Text('🚗  Uber',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                    const SizedBox(height: 4),
                    Container(height: 2, width: 44, color: Colors.white),
                  ],
                ),
                const SizedBox(width: 32),
                const Text('🛍  Envios',
                    style: TextStyle(color: Colors.white54, fontSize: 16)),
              ],
            ),
            const SizedBox(height: 16),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ── Barra de pesquisa ──
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 14),
                            decoration: BoxDecoration(
                              color: const Color(0xFF2A2A2A),
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: Colors.white24),
                            ),
                            child: const Row(
                              children: [
                                Icon(Icons.search,
                                    color: Colors.white54, size: 20),
                                SizedBox(width: 8),
                                Text('Para onde?',
                                    style: TextStyle(
                                        color: Colors.white54, fontSize: 15)),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 14),
                          decoration: BoxDecoration(
                            color: const Color(0xFF2A2A2A),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.white24),
                          ),
                          child: const Row(
                            children: [
                              Icon(Icons.calendar_today,
                                  color: Colors.white54, size: 15),
                              SizedBox(width: 6),
                              Text('Mais tarde',
                                  style: TextStyle(
                                      color: Colors.white54, fontSize: 13)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // ── Endereços ──
                    _cardEndereco(Icons.home_outlined, 'Casa',
                        'Rua Narcisos, 277'),
                    const SizedBox(height: 8),
                    _cardEndereco(Icons.access_time, 'Slaviero Executive',
                        'Av. Visconde de Guarapuava, 4.069 - Batel - C...'),
                    const SizedBox(height: 24),

                    // ── Para você ──
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Para você',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                            color: Color(0xFF2A2A2A),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.arrow_forward,
                              size: 16, color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _iconeServico('📦', 'Envio Local'),
                        _iconeServico('🚗', 'Viagem'),
                        _iconeServico('🧒', 'Teens'),
                        _iconeServicoBadge('🛍', 'iFood', 'Novo'),
                      ],
                    ),
                    const SizedBox(height: 28),

                    // ── Economize todos os dias ──
                    const Text('Economize todos os dias',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 14),

                    SizedBox(
                      height: 150,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          _cardPromo(
                            const Color(0xFFD0E8F5),
                            '📍',
                            'Adicione até 5 paradas',
                            'Aproveite para retirar algo no caminho',
                          ),
                          const SizedBox(width: 12),
                          _cardPromo(
                            const Color(0xFFF5DFC0),
                            '🚕',
                            'Viagens com o',
                            'Viagens econômicas...',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    const Text('Economize uma viagem',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // ── Bottom Nav ──
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF111111),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white38,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 11,
        unselectedFontSize: 11,
        currentIndex: 0,
        onTap: (_) {},
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: 'Página inicial'),
          BottomNavigationBarItem(
              icon: Icon(Icons.grid_view), label: 'Opções'),
          BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long), label: 'Atividade'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'Conta'),
        ],
      ),
    );
  }

  Widget _cardEndereco(IconData icon, String titulo, String subtitulo) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white60, size: 22),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(titulo,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15)),
              Text(subtitulo,
                  style: const TextStyle(color: Colors.white54, fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _iconeServico(String emoji, String label) {
    return Column(
      children: [
        Container(
          width: 72,
          height: 72,
          decoration: BoxDecoration(
            color: const Color(0xFF2A2A2A),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Center(child: Text(emoji, style: const TextStyle(fontSize: 28))),
        ),
        const SizedBox(height: 6),
        Text(label,
            style: const TextStyle(color: Colors.white70, fontSize: 12)),
      ],
    );
  }

  Widget _iconeServicoBadge(String emoji, String label, String badge) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        _iconeServico(emoji, label),
        Positioned(
          top: -6,
          right: -4,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(badge,
                style: const TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ),
        ),
      ],
    );
  }

  Widget _cardPromo(
      Color cor, String emoji, String titulo, String subtitulo) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: cor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 32)),
          const Spacer(),
          Text(titulo,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: Colors.black87)),
          const SizedBox(height: 4),
          Text(subtitulo,
              style: const TextStyle(fontSize: 11, color: Colors.black54)),
        ],
      ),
    );
  }
}