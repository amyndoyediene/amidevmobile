import 'package:flutter/material.dart';
import 'contat.dart'; // Assurez-vous que la classe Contact est bien définie

class ContactList extends StatefulWidget {
  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  List<Contact> contacts = [
    Contact(nom: 'OURI', imageProfil: 'image-1.jpg'),
    Contact(nom: 'AMSA', imageProfil: 'image-2.png'),
    Contact(nom: 'KHOUD', imageProfil: 'image-3.jpg'),
    Contact(nom: 'NDE', imageProfil: 'image-5.jpg'),
    Contact(nom: 'BABS', imageProfil: 'image-6.jpg'),
    Contact(nom: 'MAM', imageProfil: 'image-4.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mes Contacts'),
        actions: <Widget>[Icon(Icons.search), Icon(Icons.more_vert)],
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                title: Text(
                  contacts[index].nom,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/${contacts[index].imageProfil}'),
                ),
                onTap: () {
                  // Naviguer vers la page des détails du contact
                  Navigator.pushNamed(
                    context,
                    '/detailContact',
                    arguments: {
                      'nom': contacts[index].nom,
                      'imageProfil': contacts[index].imageProfil,
                    },
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
