import 'package:az_e_wallet/utils/responsive/responsive_utilis.dart';
import 'package:az_e_wallet/views/widgets/theme.dart';
import 'package:flutter/material.dart';

class ContactsScreen extends StatelessWidget {
  final List<Contact> contacts = [
    Contact(
        name: 'Jane Smith',
        number: '+91 123456789',
        initials: 'JS',
        color: Colors.purple),
    Contact(
        name: 'Mary Brown',
        number: '+91 123456789',
        initials: 'MB',
        color: Colors.teal),
    Contact(
        name: 'John Doe',
        number: '+91 123456789',
        initials: 'JD',
        color: Colors.blue),
    Contact(
        name: 'Patricia Miller',
        number: '+91 123456789',
        initials: 'PM',
        color: Colors.cyan),
    Contact(
        name: 'Linda Anderson',
        number: '+91 123456789',
        initials: 'LA',
        color: Colors.deepPurple),
    Contact(
        name: 'Charles Moore',
        number: '+91 123456789',
        initials: 'CM',
        color: Colors.red),
    Contact(
        name: 'Barbara Thomas',
        number: '+91 123456789',
        initials: 'BT',
        color: Colors.orange),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.all(Responsive.isMobile(context) ? 8.0 : 16.0),
              child: TextField(
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.search),
                  hintText: 'Select any contact',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  filled: true,
                  fillColor: Color(0xFFFFFFFF),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(
                        vertical: Responsive.isMobile(context) ? 4.0 : 6.0,
                        horizontal: Responsive.isMobile(context) ? 8.0 : 12.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF7F9FC),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(
                          Responsive.isMobile(context) ? 8.0 : 10.0),
                      leading: CircleAvatar(
                        backgroundColor: contacts[index].color,
                        child: Text(
                          contacts[index].initials,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(contacts[index].name),
                      subtitle: Text(contacts[index].number),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        Align(
          alignment: Responsive.isMobile(context)
              ? Alignment.bottomRight
              : Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.all(Responsive.isMobile(context) ? 16.0 : 24.0),
            child: SizedBox(
              height: Responsive.isMobile(context) ? 43 : 60,
              width: Responsive.isMobile(context) ? 140 : 200,
              child: FloatingActionButton.extended(
                onPressed: () {},
                backgroundColor: AppTheme.buttonColor,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                icon: const Icon(
                  Icons.add,
                  size: 21.0,
                  color: Color(0xFFFFFFFF),
                ),
                label: Text(
                  'Add Beneficiary',
                  style: TextStyle(
                    fontSize: Responsive.isMobile(context) ? 12 : 16,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Contact {
  final String name;
  final String number;
  final String initials;
  final Color color;

  Contact({
    required this.name,
    required this.number,
    required this.initials,
    required this.color,
  });
}
