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

  // Fonction pour valider et soumettre les données, puis réinitialiser
  void _validateAndSubmit() {
    if (_formKey.currentState!.validate()) {
      // Si la validation est réussie
      _formKey.currentState!.save();
      // Afficher un message de validation
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Authentification réussie')),
      );
      // Soumettre les données et naviguer
      Navigator.pushNamed(context, '/contactList', arguments: {
        'email': email,
        'password': password,
      });
      // Réinitialiser le formulaire
      _formKey.currentState?.reset();
      setState(() {
        email = '';
        password = '';
      });
    } else {
      // Afficher un message d'erreur si la validation échoue
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur: Veuillez corriger les champs')),
      );
    }
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
                  // Animation sur le champ Email
                  AnimatedOpacity(
                    opacity: email.isNotEmpty ? 1.0 : 0.5,
                    duration: Duration(milliseconds: 500),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.email),
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
                        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$')
                            .hasMatch(value)) {
                          return 'Veuillez entrer un email valide';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 10.0),

                  // Animation sur le champ Mot de passe
                  AnimatedOpacity(
                    opacity: password.isNotEmpty ? 1.0 : 0.5,
                    duration: Duration(milliseconds: 500),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Mot de passe',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock),
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
                        if (value.length < 6) {
                          return 'Le mot de passe doit comporter au moins 6 caractères';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 20.0),

                  // Bouton "Valider" qui combine validation, soumission et réinitialisation
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    onPressed: _validateAndSubmit,
                    child: Text(
                      'Valider',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  SizedBox(height: 10.0),

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
