import 'package:flutter/material.dart';

class DetailContact extends StatefulWidget {
  @override
  _DetailContactState createState() => _DetailContactState();
}

class _DetailContactState extends State<DetailContact> {
  Map<String, dynamic> data = {};

  @override
  Widget build(BuildContext context) {
    // Récupérer les arguments de la route
    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    if (arguments != null) {
      data = arguments;
    } else {
      // Gérer le cas où les arguments sont null
      data = {'nom': 'Inconnu', 'imageProfil': 'default.png'};
    }

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[Icon(Icons.more_vert)],
        title: Text(data['nom'] ?? 'Nom inconnu'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Image.asset('assets/${data['imageProfil'] ?? 'default.png'}'),
            SizedBox(height: 20),
            Text(
              'Nom: ${data['nom'] ?? 'Inconnu'}',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
      ),
    );
  }
}
