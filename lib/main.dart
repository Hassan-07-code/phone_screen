import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Phone Screen',
      debugShowCheckedModeBanner: false,
      home: PhoneScreen(),
    );
  }
}

class PhoneScreen extends StatelessWidget {
  const PhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios_new),
        title: const Center(
          child: Text('Search phone'),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Color.fromARGB(255, 56, 53, 53),
            ),
            onPressed: () => _showSearchDialog(context),
          ),
          const SizedBox(width: 16),
          const Icon(Icons.more_vert),
        ],
        backgroundColor: const Color.fromARGB(255, 151, 146, 146),
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/data.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: GridView.count(
          crossAxisCount: 4,
          crossAxisSpacing: 7,
          mainAxisSpacing: 7,
          padding: const EdgeInsets.all(16),
          children: [
            _buildAppIcon(context, FontAwesomeIcons.google, 'Google'),
            _buildAppIcon(context, FontAwesomeIcons.microsoft, 'Microsoft'),
            _buildAppIcon(context, FontAwesomeIcons.android, 'Samsung'),
            _buildAppIcon(context, FontAwesomeIcons.calculator, 'Calculator'),
            _buildAppIcon(context, FontAwesomeIcons.calendar, 'Calendar'),
            _buildAppIcon(context, FontAwesomeIcons.camera, 'Camera'),
            _buildAppIcon(context, FontAwesomeIcons.addressBook, 'Contacts'),
            _buildAppIcon(context, FontAwesomeIcons.images, 'Gallery'),
            _buildAppIcon(context, Icons.app_registration_rounded, 'IUB Portals'),
            _buildAppIcon(context, FontAwesomeIcons.linkedin, 'LinkedIn'),
            _buildAppIcon(context, FontAwesomeIcons.lock, 'Lock It'),
            _buildAppIcon(context, FontAwesomeIcons.solidEnvelope, 'Messages'),
            _buildAppIcon(context, FontAwesomeIcons.music, 'Music Player'),
            _buildAppIcon(context, FontAwesomeIcons.folderOpen, 'My Files'),
            _buildAppIcon(context, FontAwesomeIcons.wifi, 'Wifi'),
            _buildAppIcon(context, FontAwesomeIcons.phone, 'Phone'),
            _buildAppIcon(context, FontAwesomeIcons.googlePlay, 'Play Store'),
            _buildAppIcon(context, FontAwesomeIcons.toolbox, 'Settings'),
            _buildAppIcon(context, FontAwesomeIcons.radio, 'Radio'),
            _buildAppIcon(context, FontAwesomeIcons.raspberryPi, "rasPi"),
            _buildAppIcon(context, FontAwesomeIcons.video, 'Zoom'),
            _buildAppIcon(context, FontAwesomeIcons.snapchat, 'Snapchat'),
            _buildAppIcon(context, FontAwesomeIcons.whatsapp, 'WhatsApp'),
            _buildAppIcon(context, FontAwesomeIcons.youtube, 'YouTube'),
            _buildAppIcon(context, FontAwesomeIcons.windows, 'Windows'),
            _buildAppIcon(context, FontAwesomeIcons.linux, 'Linux'),
            _buildAppIcon(context, FontAwesomeIcons.apple, 'iPhone'),
            _buildAppIcon(context, FontAwesomeIcons.gamepad, 'Games')
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 61, 19, 117),
        selectedItemColor: const Color.fromARGB(255, 180, 164, 164),
        unselectedItemColor: const Color.fromARGB(255, 160, 142, 142),
        currentIndex: 0,
      ),
    );
  }

  Widget _buildAppIcon(BuildContext context, IconData icon, String label) {
    return InkWell(
      onTap: () {
        // Navigate to the GamesPage if the 'Games' icon is tapped
        if (label == 'Games') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const GamesPage(),
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsPage(label: label),
            ),
          );
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 0, 0, 0),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: const Color.fromARGB(255, 255, 252, 252),
              size: 32,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              color: Color.fromARGB(255, 198, 166, 39),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  void _showSearchDialog(BuildContext context) {
    String searchQuery = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Search'),
          content: TextField(
            onChanged: (value) {
              searchQuery = value;
            },
            decoration: const InputDecoration(hintText: "Search"),
          ),
          actions: [
            TextButton(
              child: const Text('Done'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsPage(label: searchQuery),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}

class DetailsPage extends StatelessWidget {
  final String label;

  const DetailsPage({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(label),
      ),
      body: Center(
        child: Text(
          'Welcome to $label',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class GamesPage extends StatelessWidget {
  const GamesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Games'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 4,
          crossAxisSpacing: 7,
          mainAxisSpacing: 7,
          children: [
            _buildGameIcon(context, FontAwesomeIcons.jetFighterUp, 'ACE Fighter'),
            _buildGameIcon(context, FontAwesomeIcons.fortAwesome, 'Kingdom'),
            _buildGameIcon(context, FontAwesomeIcons.chess, 'Chess'),
            _buildGameIcon(context, FontAwesomeIcons.football, 'Soccer'),
            // Add more game icons as needed
          ],
        ),
      ),
    );
  }

  Widget _buildGameIcon(BuildContext context, IconData icon, String label) {
    return InkWell(
      onTap: () {
        // You can add functionality to launch a game or navigate to a game detail page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPage(label: label),
          ),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 0, 0, 0),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: const Color.fromARGB(255, 255, 252, 252),
              size: 32,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              color: Color.fromARGB(255, 198, 166, 39),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
