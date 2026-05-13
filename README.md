# laqueadura_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Deploy Web (Hostinger)

### 1. Compilar para web

```bash
flutter build web
```

### 2. Enviar para o servidor

```bash
rsync -avz --delete build/web/ Hostinger-Vini:/home/lucas/repositories/laques/
```

> **Nota:** Não é necessário reiniciar o Nginx. O Flutter web gera arquivos estáticos e o servidor já serve a versão atualizada assim que o rsync termina. Se o navegador mostrar a versão antiga, use **Ctrl+Shift+R** para forçar o recarregamento.
