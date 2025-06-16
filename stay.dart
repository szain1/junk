import 'package:flutter/material.dart';

void main() {
  runApp(const StaySathApp());
}

class StaySathApp extends StatelessWidget {
  const StaySathApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stay Sath',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: const Color(0xFF1A0033), // Dark purple background
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold),
        ),
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// ======================
// SCREEN 1: Splash Screen
// ======================
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    _controller.forward();
    
    // Navigate to home after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A0033),
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // [LOGO PLACEHOLDER] - Replace with your actual logo
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFD700), // Gold accent
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Icon(Icons.home_work_outlined, 
                  size: 80, 
                  color: Color(0xFF1A0033)),
              ),
              const SizedBox(height: 20),
              const Text(
                'Stay Sath',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const Text(
                'Gilgit-Baltistan Homestays',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

// ======================
// SCREEN 2: Home Screen
// ======================
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stay Sath'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Experience Authentic Gilgit-Baltistan',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildFeatureButton(
                    context,
                    'Browse Homestays',
                    Icons.house,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomestayListScreen()),
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildFeatureButton(
                    context,
                    'Local Crafts',
                    Icons.shopping_bag,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CraftsScreen()),
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildFeatureButton(
                    context,
                    'Cultural Experiences',
                    Icons.landscape,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ExperiencesScreen()),
                    ),
                  ),
                  const SizedBox(height: 40),
                  TextButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const BidScreen()),
                    ),
                    child: const Text(
                      'Are you a host? Submit your bid',
                      style: TextStyle(color: Color(0xFFFFD700)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureButton(BuildContext context, String text, IconData icon, VoidCallback onPressed) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFFD700), // Gold accent
          foregroundColor: const Color(0xFF1A0033), // Dark purple text
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 24),
            const SizedBox(width: 10),
            Text(
              text,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

// ======================
// SCREEN 3: Homestay Listing
// ======================
class HomestayListScreen extends StatelessWidget {
  const HomestayListScreen({super.key});

  // Sample homestay data with GB names
  final List<Map<String, dynamic>> homestays = const [
    {
      'name': 'Hunza Haven',
      'location': 'Karimabad',
      'price': 'PKR 3,500/night',
      'rating': 4.5,
      'image': 'assets/hunza_haven.jpg', // [IMAGE_PLACEHOLDER]
    },
    {
      'name': 'Skardu Serenity',
      'location': 'Skardu',
      'price': 'PKR 2,800/night',
      'rating': 4.2,
      'image': 'assets/skardu_serenity.jpg', // [IMAGE_PLACEHOLDER]
    },
    {
      'name': 'Passu Panorama',
      'location': 'Passu',
      'price': 'PKR 4,200/night',
      'rating': 4.7,
      'image': 'assets/passu_panorama.jpg', // [IMAGE_PLACEHOLDER]
    },
    {
      'name': 'Fairy Meadows Cottage',
      'location': 'Nanga Parbat',
      'price': 'PKR 3,000/night',
      'rating': 4.8,
      'image': 'assets/fairy_meadows.jpg', // [IMAGE_PLACEHOLDER]
    },
    {
      'name': 'Shigar Fort Stay',
      'location': 'Shigar',
      'price': 'PKR 5,000/night',
      'rating': 4.9,
      'image': 'assets/shigar_fort.jpg', // [IMAGE_PLACEHOLDER]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homestays in GB'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: homestays.length,
        itemBuilder: (context, index) {
          final homestay = homestays[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            color: Colors.white.withOpacity(0.1),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // [IMAGE_PLACEHOLDER] - Replace with actual image
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white.withOpacity(0.2),
                      image: const DecorationImage(
                        image: AssetImage('assets/placeholder.jpg'), // Replace
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    homestay['name'],
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  ),
                  Text(
                    homestay['location'],
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white.withOpacity(0.7)),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      _buildRatingStars(homestay['rating']),
                      const Spacer(),
                      Text(
                        homestay['price'],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFFD700)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFFD700),
                        foregroundColor: const Color(0xFF1A0033),
                      ),
                      onPressed: () {
                        // Booking functionality
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Booking ${homestay['name']}'),
                            backgroundColor: const Color(0xFFFFD700),
                          ),
                        );
                      },
                      child: const Text('Book Now'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildRatingStars(double rating) {
    int fullStars = rating.floor();
    bool hasHalfStar = (rating - fullStars) >= 0.5;
    
    return Row(
      children: [
        for (int i = 0; i < fullStars; i++)
          const Icon(Icons.star, color: Color(0xFFFFD700), size: 20),
        if (hasHalfStar)
          const Icon(Icons.star_half, color: Color(0xFFFFD700), size: 20),
        for (int i = 0; i < 5 - fullStars - (hasHalfStar ? 1 : 0); i++)
          const Icon(Icons.star_border, color: Color(0xFFFFD700), size: 20),
      ],
    );
  }
}

// ======================
// SCREEN 4: Bidding Screen (Host View)
// ======================
class BidScreen extends StatefulWidget {
  const BidScreen({super.key});

  @override
  State<BidScreen> createState() => _BidScreenState();
}

class _BidScreenState extends State<BidScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedHomestay;
  double _bidAmount = 0;
  DateTime? _selectedDate;

  final List<String> _homestays = [
    'Hunza Haven',
    'Skardu Serenity',
    'Passu Panorama',
    'Fairy Meadows Cottage',
    'Shigar Fort Stay'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Submit Your Bid'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'List your homestay for tourists',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white70),
              ),
              const SizedBox(height: 30),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Select Homestay',
                  labelStyle: const TextStyle(color: Colors.white70),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                ),
                value: _selectedHomestay,
                items: _homestays.map((homestay) {
                  return DropdownMenuItem(
                    value: homestay,
                    child: Text(
                      homestay,
                      style: const TextStyle(color: Colors.white),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedHomestay = value;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please select your homestay';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Bid Amount (PKR)',
                  labelStyle: const TextStyle(color: Colors.white70),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                  prefixText: 'PKR ',
                  prefixStyle: const TextStyle(color: Colors.white),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an amount';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
                onChanged: (value) {
                  _bidAmount = double.tryParse(value) ?? 0;
                },
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () async {
                  final pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      _selectedDate = pickedDate;
                    });
                  }
                },
                child: InputDecorator(
                  decoration: InputDecoration(
                    labelText: 'Available Date',
                    labelStyle: const TextStyle(color: Colors.white70),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _selectedDate == null
                            ? 'Select date'
                            : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                        style: const TextStyle(color: Colors.white),
                      ),
                      const Icon(Icons.calendar_today, color: Colors.white70),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFD700),
                    foregroundColor: const Color(0xFF1A0033),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Print bid details to console
                      print('Bid Submitted:');
                      print('Homestay: $_selectedHomestay');
                      print('Amount: PKR $_bidAmount');
                      print('Date: $_selectedDate');
                      
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Bid submitted successfully!'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'Submit Bid',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ======================
// SCREEN 5: Cultural Experiences
// ======================
class ExperiencesScreen extends StatelessWidget {
  const ExperiencesScreen({super.key});

  final List<Map<String, dynamic>> experiences = const [
    {
      'title': 'Balti Cooking Class',
      'description': 'Learn authentic Balti recipes from local chefs',
      'duration': '3 hours',
      'price': 'PKR 1,500',
      'image': 'assets/cooking.jpg', // [IMAGE_PLACEHOLDER]
    },
    {
      'title': 'Hunza Village Walk',
      'description': 'Guided tour through traditional Hunza villages',
      'duration': '2 hours',
      'price': 'PKR 800',
      'image': 'assets/village_walk.jpg', // [IMAGE_PLACEHOLDER]
    },
    {
      'title': 'Chapursan Valley Trek',
      'description': 'Day trek through the beautiful Chapursan Valley',
      'duration': 'Full day',
      'price': 'PKR 2,500',
      'image': 'assets/trek.jpg', // [IMAGE_PLACEHOLDER]
    },
    {
      'title': 'Wakhi Music Night',
      'description': 'Traditional music performance and storytelling',
      'duration': '2 hours',
      'price': 'PKR 1,000',
      'image': 'assets/music.jpg', // [IMAGE_PLACEHOLDER]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cultural Experiences'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: experiences.length,
        itemBuilder: (context, index) {
          final experience = experiences[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            color: Colors.white.withOpacity(0.1),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // [IMAGE_PLACEHOLDER] - Replace with actual image
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white.withOpacity(0.2),
                      image: const DecorationImage(
                        image: AssetImage('assets/placeholder.jpg'), // Replace
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    experience['title'],
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    experience['description'],
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white.withOpacity(0.7)),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.schedule, size: 16, color: Colors.white70),
                      const SizedBox(width: 4),
                      Text(
                        experience['duration'],
                        style: const TextStyle(color: Colors.white70),
                      ),
                      const Spacer(),
                      Text(
                        experience['price'],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFFD700)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFFFFD700)),
                        foregroundColor: const Color(0xFFFFD700),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      onPressed: () {
                        // Show experience details
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            backgroundColor: const Color(0xFF1A0033),
                            title: Text(
                              experience['title'],
                              style: const TextStyle(color: Colors.white),
                            ),
                            content: Text(
                              '${experience['description']}\n\nDuration: ${experience['duration']}\nPrice: ${experience['price']}',
                              style: const TextStyle(color: Colors.white70),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text(
                                  'Close',
                                  style: TextStyle(color: Color(0xFFFFD700)),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      child: const Text('Learn More'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// ======================
// Crafts Screen (Bonus)
// ======================
class CraftsScreen extends StatelessWidget {
  const CraftsScreen({super.key});

  final List<Map<String, dynamic>> crafts = const [
    {
      'name': 'Balti Shawl',
      'description': 'Handwoven wool shawl with traditional patterns',
      'price': 'PKR 2,500',
      'image': 'assets/shal.jpg', // [IMAGE_PLACEHOLDER]
    },
    {
      'name': 'Hunza Topi',
      'description': 'Traditional embroidered cap',
      'price': 'PKR 1,200',
      'image': 'assets/topi.jpg', // [IMAGE_PLACEHOLDER]
    },
    {
      'name': 'Pashmina Wrap',
      'description': 'Luxurious hand-spun pashmina',
      'price': 'PKR 4,500',
      'image': 'assets/pashmina.jpg', // [IMAGE_PLACEHOLDER]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Local Crafts'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: crafts.length,
        itemBuilder: (context, index) {
          final craft = crafts[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            color: Colors.white.withOpacity(0.1),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  // [IMAGE_PLACEHOLDER] - Replace with actual image
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white.withOpacity(0.2),
                      image: const DecorationImage(
                        image: AssetImage('assets/placeholder.jpg'), // Replace
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          craft['name'],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        ),
                        Text(
                          craft['description'],
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white.withOpacity(0.7)),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          craft['price'],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFFD700)),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.shopping_cart, color: Color(0xFFFFD700)),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Added ${craft['name']} to cart'),
                          backgroundColor: const Color(0xFFFFD700),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}