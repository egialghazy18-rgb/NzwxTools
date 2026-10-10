import 'package:flutter/material.dart';
import '../widgets/glass_container.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _darkMode = true;
  bool _notif = true;
  bool _autoUpdate = true;

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
                child: const Text('SETTING',
                  style: TextStyle(
                    color: Colors.white, fontSize: 32,
                    fontWeight: FontWeight.w900, letterSpacing: 3,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Text('Pengaturan aplikasi',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.5), fontSize: 14,
                ),
              ),
              const SizedBox(height: 24),
              GlassContainer(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    _toggle(Icons.dark_mode_rounded, 'Dark Mode', _darkMode,
                        (v) => setState(() => _darkMode = v)),
                    const Divider(color: Colors.white24, height: 24),
                    _toggle(Icons.notifications_rounded, 'Notifikasi', _notif,
                        (v) => setState(() => _notif = v)),
                    const Divider(color: Colors.white24, height: 24),
                    _toggle(Icons.update_rounded, 'Auto Update', _autoUpdate,
                        (v) => setState(() => _autoUpdate = v)),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              GlassContainer(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Tentang',
                      style: TextStyle(
                        color: Colors.white, fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _infoRow('Versi', '1.0.0'),
                    const SizedBox(height: 8),
                    _infoRow('Developer', 'Nzwx Team'),
                    const SizedBox(height: 8),
                    _infoRow('Build', '2026'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _toggle(IconData icon, String label, bool value, Function(bool) onChanged) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xFF00E5FF), size: 22),
        const SizedBox(width: 14),
        Expanded(child: Text(label, style: const TextStyle(
          color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600,
        ))),
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: const Color(0xFF00E5FF),
        ),
      ],
    );
  }

  Widget _infoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(
          color: Colors.white.withOpacity(0.5), fontSize: 13,
        )),
        Text(value, style: const TextStyle(
          color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600,
        )),
      ],
    );
  }
}
