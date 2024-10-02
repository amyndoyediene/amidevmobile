import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FileList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Récupération des arguments passés à la route
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    String email = arguments['email'];
    String password = arguments['password'];

    // URL de l'exemple de fichier à ouvrir ou télécharger
    String fileUrl =
        'https://example.com/yourfile.pdf'; // Remplacez ceci par l'URL réelle

    return Scaffold(
      appBar: AppBar(
        title: Text('Cahier - Liste de fichiers'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Voici la liste des fichiers dans le cahier'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _openFile(fileUrl),
              child: Text('Ouvrir ou télécharger le fichier'),
            ),
            SizedBox(height: 20),
            Text('Email : $email'),
            Text('Mot de passe : $password'),
          ],
        ),
      ),
    );
  }

  void _openFile(String url) async {
    // Fonction pour ouvrir le fichier à l'URL fournie
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Impossible d\'ouvrir le fichier à l\'URL : $url';
    }
  }
}
