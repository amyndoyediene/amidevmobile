import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  // Contrôleur pour l'animation de rotation
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inscription'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.yellow, // Fond jaune
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  // Animation de la transparence sur le champ Email
                  AnimatedOpacity(
                    opacity: email.isNotEmpty ? 1.0 : 0.5,
                    duration: Duration(milliseconds: 500),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.email), // Icône de mail
                      ),
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez entrer un email';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 10.0),

                  // Animation de la transparence sur le champ Mot de passe
                  AnimatedOpacity(
                    opacity: password.isNotEmpty ? 1.0 : 0.5,
                    duration: Duration(milliseconds: 500),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Mot de passe',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock), // Icône de mot de passe
                      ),
                      obscureText: true,
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez entrer un mot de passe';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 20.0),

                  // Bouton "Voir contact" avec une animation de rotation
                  RotationTransition(
                    turns: _animationController,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange, // Fond orange
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(20.0), // Bordure arrondie
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushNamed(context, '/contactList',
                              arguments: {
                                'email': email,
                                'password': password,
                              });
                        }
                      },
                      child: Text(
                        'Voir contact',
                        style: TextStyle(
                          color: Colors.black, // Texte en noir
                          fontWeight: FontWeight.bold, // Texte en gras
                        ),
                      ),
                    ),
                  ),

                  // Bouton "Animation et style" avec une animation de taille
                  AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange, // Fond orange
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(20.0), // Bordure arrondie
                        ),
                        side: BorderSide(
                            width: 1.0, color: Colors.green), // Bordure verte
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushNamed(context, '/imagePage',
                              arguments: {
                                'email': email,
                                'password': password,
                              });
                        }
                      },
                      child: Text(
                        'Animation et style',
                        style: TextStyle(
                          color: Colors.black, // Texte en noir
                          fontWeight: FontWeight.bold, // Texte en gras
                        ),
                      ),
                    ),
                  ),

                  // Bouton "Voir image"
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.orange, // Couleur de fond en orange
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(20.0), // Bordure arrondie
                      ),
                      side: BorderSide(
                          width: 1.0, color: Colors.green), // Bordure verte
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushNamed(context, '/imagePage', arguments: {
                          'email': email,
                          'password': password,
                        });
                      }
                    },
                    child: Text(
                      'Voir image',
                      style: TextStyle(
                        color: Colors.black, // Texte en noir
                        fontWeight: FontWeight.bold, // Texte en gras
                      ),
                    ),
                  ),

                  // Nouveau bouton "Voir cahier"
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.orange, // Couleur de fond en orange
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      side: BorderSide(
                          width: 1.0, color: Colors.blue), // Bordure bleue
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushNamed(context, '/fileList', arguments: {
                          'email': email,
                          'password': password,
                        });
                      }
                    },
                    child: Text(
                      'Voir cahier',
                      style: TextStyle(
                        color: Colors.black, // Texte en noir
                        fontWeight: FontWeight.bold, // Texte en gras
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
