import 'package:flutter/material.dart';

void main() {
  runApp(PhotoGalleryApp());
}

class PhotoGalleryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Photo Gallery'),
          centerTitle: true,
        ),
        body: PhotoGalleryScreen(),
      ),
    );
  }
}

class PhotoGalleryScreen extends StatelessWidget {
  final List<String> imageUrls = [
    'https://images.unsplash.com/photo-1608848461950-0fe51dfc41cb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8M3x8fGVufDB8fHx8fA%3D%3D&w=1000&q=80',
    'https://images.unsplash.com/photo-1615789591457-74a63395c990?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YmFieSUyMGNhdHxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80',
    'https://media.istockphoto.com/id/508030340/photo/sunny-cat.jpg?s=612x612&w=0&k=20&c=qkz-Mf32sbJnefRxpB7Fwpcxbp1fozYtJxbQoKvSeGM=',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCQ7_DruQgeuabCEwUzT2zHoChdt-sI45L5SqvMLku88knV_ToDWh6QpedQsVemCTSURE&usqp=CAU',
    'https://images.pexels.com/photos/2173872/pexels-photo-2173872.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMgdCJIMcQg92d8-pC4xUqrVIuB17pAhfXIA&usqp=CAU',
  ];

  final List<String> samplePhotoTitles = ['Photo 1', 'Photo 2', 'Photo 3'];
  final List<String> samplePhotoSubtitles = [
    'Description for Photo 1',
    'Description for Photo 2',
    'Description for Photo 3',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align content to the start
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Welcome to My Photo Gallery!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for photos...',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // Display 3 items in a row
              mainAxisSpacing: 10.0, // Vertical spacing
              crossAxisSpacing: 10.0, // Horizontal spacing
              childAspectRatio: 1.0, // Aspect ratio
            ),
            itemCount: imageUrls.length, // Number of items in the grid
            itemBuilder: (BuildContext context, int index) {
              return GridTile(
                child: GestureDetector(
                  onTap: () {
                    // Show a Snackbar when the image is clicked
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Photo ${index} is clicked'),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Image.network(
                        imageUrls[index], // Use the image URL from the list
                        width: 100.0,
                        height: 100.0,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Photo ${index}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),

          SizedBox(height: 8.0),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: samplePhotoTitles.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Image.network(
                  imageUrls[index], // Use the image URL from the list
                  width: 50.0,
                  height: 50.0,
                  fit: BoxFit.cover,
                ),
                title: Text(samplePhotoTitles[index]),
                subtitle: Text(samplePhotoSubtitles[index]),
              );
            },
          ),
          SizedBox(height: 16.0), // Add spacing before the icon
          Center( // Center the rounded upload icon
            child: GestureDetector(
              onTap: () {
                // Show a Snackbar when the icon is clicked
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Photos Uploaded Successfully!'),
                  ),
                );
              },
              child: Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child: Center(
                  child: Icon(
                    Icons.cloud_upload,
                    color: Colors.white,
                    size: 36.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
