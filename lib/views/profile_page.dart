import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: const Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      child: Icon(
                        Icons.person,
                        size: 60,
                      ),
                    ),
                    Text(
                      'Muhammed Abdulla',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'user@abd5400076',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      'Kerala,India',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            buildProfileOptionCard(
              icon: Icons.settings_outlined,
              title: 'Settings',
              onTap: () {},
            ),
            buildProfileOptionCard(
              icon: Icons.person_outline,
              title: 'User Details',
              onTap: () {},
            ),
            buildProfileOptionCard(
              icon: Icons.redeem_outlined,
              title: 'My Rewards',
              onTap: () {},
            ),
            buildProfileOptionCard(
              icon: Icons.favorite_outline,
              title: 'Favorites',
              onTap: () {},
            ),
            buildProfileOptionCard(
              icon: Icons.paid_outlined,
              title: 'Subsciption',
              onTap: () {
                // Dialog box
              },
            ),
            buildProfileOptionCard(
              icon: Icons.help_outline,
              title: 'FAQ & Help',
              onTap: () {},
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 215),
              child: SizedBox(
                height: 60,
                width: 150,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: Icon(
                          Icons.logout,
                          size: 30,
                          color: Colors.red,
                        ),
                      ),
                      Text('   Logout',
                          style: TextStyle(fontSize: 18, color: Colors.red))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildProfileOptionCard({
    required IconData icon,
    required String title,
    required Function() onTap,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          size: 30,
          color: const Color.fromARGB(255, 8, 1, 143),
        ),
        title: Text(title,
            style: const TextStyle(
                fontSize: 18, color: Color.fromARGB(255, 8, 1, 143))),
        onTap: onTap,
      ),
    );
  }
}
