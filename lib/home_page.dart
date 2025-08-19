import 'package:dog_info_app/favorites.dart';
import 'package:dog_info_app/help.dart';
import 'package:dog_info_app/settings.dart';
import 'package:flutter/material.dart';
import 'dog_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dog Info'),
        centerTitle: true,
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white70,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
           DrawerHeader(
  decoration: const BoxDecoration(color: Colors.brown),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'DogInfo Menu',
        style: TextStyle(color: Colors.white, fontSize: 24),
      ),
      const SizedBox(height: 5),
      Expanded(
        child: Image.asset(
          'assets/images/dog_drawer.png', 
          fit: BoxFit.contain,
        ),
      ),
    ],
  ),
),

            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap:() {
                Navigator.push(context, 
                MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Favorites'),
              onTap: () {
                Navigator.push(context, 
                MaterialPageRoute(builder: (context) => FavoritesPage())
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.help_outline),
              title: Text('Help & FAQs'),
              onTap: () {
                Navigator.push(context, 
                MaterialPageRoute(builder: (context) => HelpPage())
                );
              },
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          DogList(),
          AboutPage(),
          SearchPage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: Material(
        color: Colors.brown,
        child: TabBar(
          controller: _tabController,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          tabs: const [
            Tab(icon: Icon(Icons.pets), text: 'Dogs'),
            Tab(icon: Icon(Icons.info_outline), text: 'About'),
            Tab(icon: Icon(Icons.search), text: 'Search'),
            Tab(icon: Icon(Icons.person), text: 'Profile'),
          ],
        ),
      ),
    );
  }
}

class DogList extends StatelessWidget {
  const DogList({super.key});

  final List<String> dogBreeds = const [
    "Shitzu",
    "Beagle",
    "Golden Retriever",
    "Tibetan Mastiff",
    "Chow Chow"
  ];

 
  static Map<String,String>dogInfo={
  'Shitzu':'The Shih Tzu is a small, affectionate dog breed known for its long, flowing coat and charming personality. Originating from China, where its name means "lion dog," this toy breed typically weighs between 9 to 16 pounds and stands about 9 to 10.5 inches tall. Shih Tzus are friendly, playful, and love being around people, making them excellent companions for families, seniors, and apartment dwellers.',
  'Beagle':'The Beagle is a small to medium-sized dog breed known for its friendly nature, intelligence, and strong sense of smell. Originally bred for hunting, Beagles are energetic and curious, making them great companions for active families. They typically weigh between 20 to 30 pounds and have a short, easy-to-maintain coat. ',
  'Golden Retriever':'The Golden Retriever is a large, friendly, and intelligent dog breed known for its gentle temperament and loyalty. Originally bred for retrieving game during hunting, they are now one of the most popular family dogs worldwide. Golden Retrievers typically weigh between 55 to 75 pounds and have a dense, water-resistant golden coat that requires regular grooming. ',
  'Tibetan Mastiff':'The Tibetan Mastiff is a large, powerful, and ancient dog breed originally bred to guard livestock and property in the Himalayan mountains. Known for its thick double coat, especially around the neck and shoulders, it resembles a lion and provides protection against harsh weather. Tibetan Mastiffs typically weigh between 70 to 150 pounds and stand 24 to 30 inches tall.',
  'Chow Chow':'The Chow Chow is a distinctive and ancient dog breed known for its lion-like mane, sturdy build, and unique blue-black tongue. Originating from China, this medium to large breed typically weighs between 40 to 70 pounds and has a dense double coat that comes in various colors like red, cream, black, and blue.'
};

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dogBreeds.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.pets, color: Colors.brown),
          title: Text(dogBreeds[index]),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${dogBreeds[index]} selected!'),
                duration: const Duration(seconds: 2),
              ),
            );
            Future.delayed(const Duration(milliseconds: 800), () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DogDetailsScreen(
                    breed: dogBreeds[index],
                    info: dogInfo[dogBreeds[index]] ?? 'No Information Available',
                  ),
                ),
              );
            });
          },
        );
      },
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
        backgroundColor: Colors.brown,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.info_outline_rounded,
                size: 70,
                color: Colors.brown,
              ),
              const SizedBox(height: 20),
              const Text(
                'Welcome to DogInfo App!',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Text(
                '🐶 This app provides detailed information about various dog breeds, helping you find the perfect companion for your lifestyle. \n\nWhether you’re a dog lover, a new pet parent, or just curious, DogInfo is your go-to app for learning about furry friends!',
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Thank you for using DogInfo App!")),
                  );
                },
                icon: const Icon(Icons.favorite, color: Colors.white),
                label: const Text("Appreciate"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Center(
        child: TextField(
          maxLength: 15,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: 'Search dogs',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            focusColor: Colors.brown,
            prefixIconColor: Colors.brown,
            hoverColor: Colors.brown,
          ),
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.brown,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.brown.shade100,
                child: const Icon(Icons.person_2_rounded, size: 70, color: Colors.brown),
              ),
              const SizedBox(height: 20),
              const Text(
                'Aswathy Ramachandran',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'aswathy@example.com',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 30),
              ListTile(
                leading: Icon(Icons.edit, color: Colors.brown),
                title: Text('Edit Profile'),
                onTap: () {
                },
              ),
              ListTile(
                leading: Icon(Icons.settings, color: Colors.brown),
                title: Text('Settings'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.logout, color: Colors.brown),
                title: Text('Logout'),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
