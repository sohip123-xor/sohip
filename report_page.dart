import 'package:flutter/material.dart';
import 'entities.dart';



class ReportPage extends StatelessWidget {
  const ReportPage({super.key});
  @override
  Widget build(BuildContext context) {
    final ScanResult r = ModalRoute.of(context)!.settings.arguments as ScanResult;
    Color badge(int s)=> s>=80?Colors.green : s>=50?Colors.amber : Colors.red;

    return Scaffold(
      appBar: AppBar(title: Text(r.target.uri.host)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(child: ListTile(
            title: Text('Security Score: ${r.score}'),
            trailing: CircleAvatar(backgroundColor: badge(r.score), radius: 12),
            subtitle: Text('Scanned at: ${r.at.toLocal()}'),
          )),
          const SizedBox(height: 8),
          Card(child: ListTile(
            title: const Text('TLS / HTTPS'),
            subtitle: Text('HTTPS: ${r.tls.isHttps}\nHandshake OK: ${r.tls.handshakeOk}\nCert Likely Valid: ${r.tls.certValidLikely}\nTLS Version: ${r.tls.tlsVersion ?? "-"}'),
          )),
          const SizedBox(height: 8),
          Card(child: ListTile(
            title: const Text('Security Headers'),
            subtitle: Text('CSP: ${r.headers.hasCSP}\nX-Frame-Options: ${r.headers.hasXFO}\nHSTS: ${r.headers.hasHSTS}\nX-Content-Type-Options: ${r.headers.hasXCTO}'),
          )),
          if (r.ports.isNotEmpty) ...[
            const SizedBox(height: 8),
            Card(child: Column(children: [
              const ListTile(title: Text('Open Ports')),
              for (final p in r.ports) ListTile(title: Text('${p.port} (${p.service})'), trailing: p.risky ? const Icon(Icons.warning) : null)
            ]))
          ],
          const SizedBox(height: 8),
          Card(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const ListTile(title: Text('Recommendations')),
            Padding(
                padding: const EdgeInsets.all(12),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: r.recommendations.map((e)=>Text('• $e')).toList())
            )
          ]))
        ],
      ),
    );
  }
}