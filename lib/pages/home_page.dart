import 'package:flutter/material.dart';
import '../widgets/glass_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                child: const Text('BERANDA',
                  style: TextStyle(
                    color: Colors.white, fontSize: 32,
                    fontWeight: FontWeight.w900, letterSpacing: 3,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Text('Selamat datang di Nzwx',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.5), fontSize: 14,
                ),
              ),
              const SizedBox(height: 24),
              GlassContainer(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Container(
                      width: 50, height: 50,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF00E5FF), Color(0xFF7C4DFF)],
                        ),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Icon(Icons.bolt_rounded, color: Colors.white),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('System Online',
                            style: TextStyle(
                              color: Colors.white, fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text('Semua modul siap digunakan',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.5), fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.check_circle_rounded, color: Color(0xFF00E5FF)),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(child: _statCard(Icons.build_circle_rounded, 'Tools', '6', const Color(0xFF00E5FF))),
                  const SizedBox(width: 12),
                  Expanded(child: _statCard(Icons.bug_report_rounded, 'Bug WA', 'Ready', const Color(0xFF7C4DFF))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _statCard(IconData icon, String label, String value, Color color) {
    return GlassContainer(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 26),
          const SizedBox(height: 12),
          Text(value, style: const TextStyle(
            color: Colors.white, fontSize: 22, fontWeight: FontWeight.w900,
          )),
          const SizedBox(height: 4),
          Text(label, style: TextStyle(
            color: Colors.white.withOpacity(0.5), fontSize: 12,
          )),
        ],
      ),
    );
  }
}
