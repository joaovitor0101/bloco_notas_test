# 🚀 Cyber Notes

Um aplicativo de Bloco de Notas moderno, minimalista e com uma pegada **Cyberpunk/Neon**, desenvolvido inteiramente em **Flutter**.

O **Cyber Notes** surgiu com o objetivo de ir além das notas clichês em fundo branco, trazendo um visual imersivo (dark mode nativo com tons Slate e destaques em Ciano Neon) que deixa organizar as ideias muito mais legal e agradável aos olhos.

---

## ✨ Funcionalidades

*   **Autenticação Pronta:** Uma `LoginPage` lindona já preparada para integração futura com seu banco de dados (Firebase, Supabase, etc).
*   **Gestão Completa (CRUD):** 
    *   **Criar:** Adicione novas notas rapidamente.
    *   **Ler:** Visualize todas as suas anotações em cartões flutuantes.
    *   **Atualizar:** Edite o conteúdo de qualquer nota com um clique.
    *   **Deletar:** Remova anotações que não servem mais (com popup de segurança avermelhado para evitar acidentes!).
*   **Design Premium:** Interface totalmente repaginada focada em *Neon UI*, utilizando cores `Slate` (0xFF0F172A e 0xFF1E293B) com o brilho clássico do `Colors.cyanAccent`.

---

## 💻 Tecnologias Utilizadas

*   **[Flutter](https://flutter.dev/):** Framework UI do Google para criar aplicativos nativos lindos.
*   **Linguagem Dart:** Para toda a lógica e controle de estados (`setState`).
*   _Em breve:_ Integração com banco de dados em nuvem.

---

## 🛠️ Como rodar o projeto localmente

### Pré-requisitos
*   Ter o [Flutter SDK](https://docs.flutter.dev/get-started/install) instalado na sua máquina.
*   Um emulador (Android/iOS) ou o ambiente Desktop ativado (Windows/macOS/Linux).

### Passos

1.  **Clone o repositório** (ou baixe a pasta do projeto):
    ```bash
    git clone https://github.com/SEU-USUARIO/bloco_notas_test.git
    cd bloco_notas_test
    ```

2.  **Instale as dependências:**
    ```bash
    flutter pub get
    ```

3.  **Rode o aplicativo:**
    ```bash
    flutter run
    ```
    _Dica: O projeto fica incrível rodando diretamente como um App Windows (`flutter run -d windows`) ou no seu celular!_

---

## 📂 Estrutura do Projeto

*   `lib/main.dart` - O coração do app, onde configuramos o super tema global (`ThemeData` dark/neon) e definimos a Rota Inicial.
*   `lib/login_page.dart` - A interface inicial futurística de Login.
*   `lib/bloco_notas_page.dart` - Todo o motor do Bloco de Notas (listagem, edição, cores e lógicas interativas).

---
