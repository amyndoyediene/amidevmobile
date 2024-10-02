import 'package:flutter/material.dart';

class ImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // URL de l'image à récupérer
    String imageUrl = 'https://example.com/yourimage.jpg';

    return Scaffold(
      appBar: AppBar(
        title: Text('Afficher une image depuis Internet'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Voici une image récupérée depuis Internet :'),
            SizedBox(height: 20),
            
            // Chargement et affichage de l'image
            Image.network(
              imageUrl,
              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                } else {
                  return CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                        : null,
                  );
                }
              },
              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                return Text('Erreur de chargement de l\'image');
              },
            ),
          ],
        ),
      ),
    );
  }
}
