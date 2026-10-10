import 'package:flutter/material.dart';
import '../widgets/glass_container.dart';

class BugWaPage extends StatefulWidget {
  const BugWaPage({super.key});

  @override
  State<BugWaPage> createState() => _BugWaPageState();
}

class _BugWaPageState extends State<BugWaPage> {
  final _numberCtrl = TextEditingController();
  final _msgCtrl = TextEditingController();
  final List<Map<String, String>> _log = [];

  void _send() {
    if (_numberCtrl.text.isEmpty) return;
    setState(() {
      _log.insert(0, {
        'number': _numberCtrl.text,
        'msg': _msgCtrl.text.isEmpty ? 'Test' : _msgCtrl.text,
        'time': DateTime.now().toString().substring(11, 19),
      });
    });
    _numberCtrl.clear();
    _msgCtrl.clear();
  }

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
                child: const Text('BUG WA',
                  style: TextStyle(
                    color: Colors.white, fontSize: 32,
                    fontWeight: FontWeight.w900, letterSpacing: 3,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Text('Bug reporting untuk WhatsApp',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.5), fontSize: 14,
                ),
              ),
              const SizedBox(height: 24),
              GlassContainer(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Form Bug Report',
                      style: TextStyle(
                        color: Colors.white, fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _field(_numberCtrl, 'Nomor WhatsApp', Icons.phone_rounded, TextInputType.phone),
                    const SizedBox(height: 12),
                    _field(_msgCtrl, 'Deskripsi Bug', Icons.description_rounded, null, 3),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity, height: 52,
                      child: ElevatedButton(
                        onPressed: _send,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: Ink(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF00E5FF), Color(0xFF7C4DFF)],
                            ),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: const Center(
                            child: Text('KIRIM LAPORAN',
                              style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.w700,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              if (_log.isNotEmpty) ...[
                Text('RIWAYAT LAPORAN',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 12, letterSpacing: 2, fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                ..._log.map((e) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: GlassContainer(
                    padding: const EdgeInsets.all(14),
                    child: Row(
                      children: [
                        const Icon(Icons.check_circle_rounded,
                          color: Color(0xFF00E676), size: 20),
                        const SizedBox(width: 12),
                        Expanded(child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(e['number']!, style: const TextStyle(
                              color: Colors.white, fontSize: 14,
                              fontWeight: FontWeight.w600,
                            )),
                            const SizedBox(height: 2),
                            Text(e['msg']!, style: TextStyle(
                              color: Colors.white.withOpacity(0.5), fontSize: 12,
                            )),
                          ],
                        )),
                        Text(e['time']!, style: TextStyle(
                          color: Colors.white.withOpacity(0.3), fontSize: 11,
                        )),
                      ],
                    ),
                  ),
                )),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _field(TextEditingController c, String label, IconData icon,
      TextInputType? keyboard, [int maxLines = 1]) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.06),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: TextField(
        controller: c,
        keyboardType: keyboard,
        maxLines: maxLines,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: label,
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.4)),
          prefixIcon: Icon(icon, color: Colors.white.withOpacity(0.6)),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        ),
      ),
    );
  }
}
