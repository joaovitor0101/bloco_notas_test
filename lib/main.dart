import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BlocoNotas(),
    );
  }
}

class BlocoNotas extends StatefulWidget {
  const BlocoNotas({super.key});

  @override
  State<BlocoNotas> createState() => _BlocoNotasState();
}

class _BlocoNotasState extends State<BlocoNotas> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _notas = [];

  void adicionarNota() {
    if (_controller.text.trim().isEmpty) return;

    setState(() {
      _notas.add(_controller.text);
      _controller.clear();
    });
  }

  void removerNota(int index) {
    setState(() {
      _notas.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloco de Notas"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Digite sua nota",
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: adicionarNota,
              child: const Text("Adicionar"),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _notas.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      trailing: IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                actions: [
                                  TextButton(onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("Cancelar")
                                  ),
                                  TextButton(onPressed: () {
                                    removerNota(index);
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("Confirmar")
                                  ),
                                ],
                              );
                            }
                          );
                        }, icon: Icon(Icons.delete)),
                      title: Text(_notas[index]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}