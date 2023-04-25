import 'package:flutter/material.dart';
import 'package:bugluayquiz/widgets/app_screen.dart';

class CreatorPage extends StatelessWidget {
  List<String> creatorNames = [
    'Siranut',
    'Runchana',
    'Nantanat',
  ];

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'CREATOR NAMES',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.all(16), // Add some padding to the container
            decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.grey,
                  width: 2), // Set the border color and width
              borderRadius: BorderRadius.circular(
                  8), // Add some rounded corners to the border
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'Runchana',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                    Text(
                      '6388052',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        'Nantanat',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                    Text(
                      '6388106',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'Siranut',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                    Text(
                      '6388117',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
