import 'package:flutter/material.dart';

void main() {
  runApp(const SwasthyaApp());
}

class SwasthyaApp extends StatefulWidget {
  const SwasthyaApp({super.key});

  @override
  State<SwasthyaApp> createState() => _SwasthyaAppState();
}

class _SwasthyaAppState extends State<SwasthyaApp> {
  String selectedLanguage = 'English';

  final Map<String, Map<String, String>> translations = {
    'English': {
      'tagline': 'Your health, our priority',
      'title': 'Welcome to Swasthya',
      'find': 'Find an Ambulance',
      'emergency': 'Emergency Assistance',
      'contact': 'Find ambulance contact numbers',
      'location': 'Your location',
      'search': 'Search',
    },
    'Malayalam': {
      'tagline': 'നിങ്ങളുടെ ആരോഗ്യം ഞങ്ങളുടെ മുൻഗണന',
      'title': 'സ്വാസ്ഥ്യത്തിലേക്ക് സ്വാഗതം',
      'find': 'ആംബുലൻസ് കണ്ടെത്തുക',
      'emergency': 'അടിയന്തര സഹായം',
      'contact': 'ആംബുലൻസ് നമ്പറുകൾ കണ്ടെത്തുക',
      'location': 'നിങ്ങളുടെ സ്ഥലം',
      'search': 'തിരയുക',
    },
    'Hindi': {
      'tagline': 'आपका स्वास्थ्य हमारी प्राथमिकता',
      'title': 'स्वास्थ्य में आपका स्वागत है',
      'find': 'एम्बुलेंस खोजें',
      'emergency': 'आपातकालीन सहायता',
      'contact': 'एम्बुलेंस संपर्क नंबर खोजें',
      'location': 'आपका स्थान',
      'search': 'खोजें',
    },
  };

  String t(String key) =>
      translations[selectedLanguage]![key]!;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Swasthya',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
        ),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'SWASTHYA',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
          actions: [
            DropdownButton<String>(
              value: selectedLanguage,
              dropdownColor: Colors.white,
              underline: const SizedBox(),
              items: ['English', 'Malayalam', 'Hindi']
                  .map((language) => DropdownMenuItem(
                        value: language,
                        child: Text(language),
                      ))
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    selectedLanguage = value;
                  });
                }
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(
                Icons.local_hospital,
                color: Colors.teal,
                size: 85,
              ),
              const SizedBox(height: 15),
              Text(
                t('title'),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                t('tagline'),
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 35),
              Card(
                color: Colors.teal.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.emergency,
                        size: 45,
                        color: Colors.red,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        t('emergency'),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(t('contact')),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.local_shipping),
                label: Text(t('find')),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(18),
                ),
              ),
              const SizedBox(height: 25),
              Text(
                t('location'),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  hintText: t('location'),
                  prefixIcon: const Icon(Icons.location_on),
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {},
                child: Text(t('search')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 
