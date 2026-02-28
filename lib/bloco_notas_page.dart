import 'package:flutter/material.dart';

class BlocoNotas extends StatefulWidget {
  const BlocoNotas({super.key});

  @override
  State<BlocoNotas> createState() => _BlocoNotasState();
}

class _BlocoNotasState extends State<BlocoNotas> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _notas = <String>[];

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

  void editarNota(int index, String novoTexto) {
    if (novoTexto.trim().isEmpty) {
      return; // função que não permite deixar o campo vazio
    }
    setState(() {
      _notas[index] = novoTexto;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bloco de Notas")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.text,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFF1E293B), // Fundo Slate 800
                hintText: "Digite sua nota",
                hintStyle: const TextStyle(color: Colors.white54),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Colors.cyanAccent,
                    width: 2,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.cyanAccent,
                foregroundColor: Colors.black,
                elevation: 4,
                shadowColor: Colors.cyanAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 12,
                ),
              ),
              onPressed: adicionarNota,
              child: const Text(
                "Adicionar",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _notas.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    color: const Color(0xFF1E293B),
                    shadowColor: Colors.cyanAccent.withAlpha(51), // 20% opacity
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                        color: Colors.cyanAccent.withAlpha(76), // 30% opacity
                        width: 1,
                      ),
                    ),
                    child: ListTile(
                      textColor: Colors.white,
                      trailing: Row(
                        mainAxisSize:
                            MainAxisSize.min, // Pra não ocupar espaço demais
                        children: [
                          IconButton(
                            onPressed: () {
                              TextEditingController editController =
                                  TextEditingController(text: _notas[index]);
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("Editar nota"),
                                    content: TextField(
                                      controller: editController,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: "Novo texto da nota",
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text("Cancelar"),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          editarNota(
                                            index,
                                            editController.text,
                                          );
                                          Navigator.of(context).pop();
                                        },
                                        child: Text("Salvar"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.cyanAccent,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      side: const BorderSide(
                                        color: Colors.redAccent,
                                        width: 1,
                                      ),
                                    ),
                                    title: const Text("Excluir nota"),
                                    content: const Text(
                                      "Tem certeza que deseja apagar esta nota?",
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text(
                                          "Cancelar",
                                          style: TextStyle(
                                            color: Colors.white54,
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          removerNota(index);
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text(
                                          "Confirmar",
                                          style: TextStyle(
                                            color: Colors.redAccent,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.redAccent,
                            ),
                          ),
                        ],
                      ),
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
