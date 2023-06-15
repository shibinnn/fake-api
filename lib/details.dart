import 'package:flutter/material.dart';
import 'rest.dart';

class PersonDetailsPage extends StatelessWidget {
  final List<Welcome> persons;
  final int currentIndex;

  PersonDetailsPage({
    required this.persons,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    final person = persons[currentIndex];
    final totalPersons = persons.length;

    void goToNextPerson() {
      int nextIndex = currentIndex + 1;
      if (nextIndex >= totalPersons) {
        nextIndex = 0; // Wrap around to the first person if reaching the end
      }
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => PersonDetailsPage(
            persons: persons,
            currentIndex: nextIndex,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Person Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(
                  Icons.perm_contact_calendar,
                  size: 30,
                ),
                SizedBox(width: 8),
                Text(
                  'Name:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 4),
              Text(
              person.name,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            const Row(
              children: [
                Icon(
                  Icons.email,
                  size: 30,
                ),
                SizedBox(width: 8),
                Text(
                  'Email:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              person.email,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            const Row(
              children: [
                Icon(
                  Icons.person,
                  size: 30,
                ),
                SizedBox(width: 8),
                Text(
                  'Username:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              person.username,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            const Row(
              children: [
                Icon(
                  Icons.location_city,
                  size: 30,
                ),
                SizedBox(width: 8),
                Text(
                  'Address:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              'Street: ${person.address.street}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 4),
            Text(
              'Suite: ${person.address.suite}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 4),
            Text(
              'City: ${person.address.city}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 4),
            Text(
              'Zipcode: ${person.address.zipcode}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            const Row(
              children: [
                Icon(
                  Icons.language,
                  size: 30,
                ),
                SizedBox(width: 8),
                Text(
                  'Website:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              person.website,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            const Row(
              children: [
                Icon(
                  Icons.business,
                  size: 30,
                ),
                SizedBox(width: 8),
                Text(
                  'Company:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              'Name: ${person.company.name}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 4),
            Text(
              'Catch Phrase: ${person.company.catchPhrase}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 4),
            Text(
              'BS: ${person.company.bs}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            const Row(
              children: [
                Icon(
                  Icons.phone,
                  size: 30,
                ),
                SizedBox(width: 8),
                Text(
                  'Phone:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              person.phone,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: goToNextPerson,
              child: const Text('Next Person'),
            ),
          ],
        ),
      ),
    );
  }
}