import 'package:flutter/material.dart';

class DestinationScreen extends StatelessWidget {
  final String title;

  const DestinationScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                _getImagePath(title),
                width: double.infinity,
                height: 230,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              _getDescription(title),
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  String _getImagePath(String title) {
    switch (title) {
      case 'Danau Toba':
        return 'assets/image/danau-toba.png';
      case 'Aek Sijorni':
        return 'assets/image/aek-sijorni.png';
      case 'Air Terjun Sipiso-piso':
        return 'assets/image/air-terjun-sipiso-piso.png';
      case 'Lumbini Natural Park':
        return 'assets/image/lumbini-natural-park.png';
      case 'Masjid Raya Al Mashun':
        return 'assets/image/mr-al-mashun.png';
      case 'Mikie Holiday':
        return 'assets/image/mikie-holiday.png';
      case 'Kebun Binatang Siantar':
        return 'assets/image/kebun-binatang-siantar.png';
      case 'Istana Mimun':
        return 'assets/image/istana-mimun.png';
      default:
        return 'assets/image/default.png';
    }
  }

  String _getDescription(String title) {
    switch (title) {
      case 'Danau Toba':
        return 'Danau Toba is a large natural lake in Sumatra, Indonesia, occupying the caldera of a supervolcano.';
      case 'Aek Sijorni':
        return 'Aek Sijorni is a beautiful waterfall located in South Tapanuli, North Sumatra, known for its clear water and lush surroundings.';
      case 'Air Terjun Sipiso-piso':
        return 'Air Terjun Sipiso-piso is a stunning waterfall in the Batak highlands of North Sumatra, plunging 120 meters down a steep cliff.';
      case 'Lumbini Natural Park':
        return 'Lumbini Natural Park is a peaceful Buddhist park featuring a replica of the Shwedagon Pagoda, situated in Berastagi, North Sumatra.';
      case 'Masjid Raya Al Mashun':
        return 'Masjid Raya Al Mashun, also known as the Great Mosque of Medan, is a historic mosque located in Medan, North Sumatra.';
      case 'Mikie Holiday':
        return 'Mikie Holiday is a popular amusement park in Berastagi, North Sumatra, offering various rides and attractions for families.';
      case 'Kebun Binatang Siantar':
        return 'Kebun Binatang Siantar is a zoo located in Pematang Siantar, North Sumatra, home to a variety of animals and a favorite among visitors.';
      case 'Istana Mimun':
        return 'Istana Maimun is a royal palace of the Sultanate of Deli, located in Medan, North Sumatra, known for its unique architectural style.';
      default:
        return 'This is a beautiful destination worth visiting.';
    }
  }
}
