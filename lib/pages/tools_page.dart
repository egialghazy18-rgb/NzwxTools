import 'package:flutter/material.dart';
import '../widgets/glass_container.dart';

class ToolsPage extends StatelessWidget {
  const ToolsPage({super.key});

  final List<List<dynamic>> _tools = const [
    ['Deep Scraper', 'Scrape website + secrets', Icons.travel_explore_rounded, Color(0xFF00E5FF)],
    ['Secret Scanner', 'Cari API key & token', Icons.vpn_key_rounded, Color(0xFF7C4DFF)],
    ['Admin Finder', 'Deteksi admin panel', Icons.admin_panel_settings_rounded, Color(0xFF00BFA5)],
    ['Dev Panel Finder', 'Deteksi dev panel', Icons.terminal_rounded, Color(0xFFFF6D00)],
    ['SQLi Scanner', 'Test SQL injection', Icons.code_rounded, Color(0xFFFF1744)],
    ['NGL Spam', 'Kirim pesan anonim', Icons.chat_bubble_rounded, Color(0xFF00E676)],
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF0A0E1A), Color(0xFF1A1F35)],
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              ShaderMask(
                shaderCallback: (b) => const LinearGradient(
                  colors: [Color(0xFF00E5FF), Color(0xFF7C4DFF)],
                ).createShader(b),
                child: const Text('TOOLS',
                  style: TextStyle(
                    color: Colors.white, fontSize: 32,
                    fontWeight: FontWeight.w900, letterSpacing: 3,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Text('Semua tools dalam satu genggaman',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.5), fontSize: 14,
                ),
              ),
              const SizedBox(height: 24),
              ..._tools.map((t) => Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: GlassContainer(
                  padding: const EdgeInsets.all(18),
                  child: Row(
                    children: [
                      Container(
                        width: 52, height: 52,
                        decoration: BoxDecoration(
                          color: (t[3] as Color).withOpacity(0.15),
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: (t[3] as Color).withOpacity(0.3)),
                        ),
                        child: Icon(t[2] as IconData, color: t[3] as Color, size: 26),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(t[0] as String, style: const TextStyle(
                              color: Colors.white, fontSize: 15,
                              fontWeight: FontWeight.w700,
                            )),
                            const SizedBox(height: 4),
                            Text(t[1] as String, style: TextStyle(
                              color: Colors.white.withOpacity(0.5), fontSize: 12,
                            )),
                          ],
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios_rounded,
                        color: Colors.white.withOpacity(0.3), size: 16),
                    ],
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
