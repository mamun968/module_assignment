import 'package:flutter/material.dart';

void main() {
  runApp(PhotoGalleryApp());
}

class PhotoGalleryApp extends StatelessWidget {
  PhotoGalleryApp({Key? key});

  List<Map<String, String>> myImages = [
    {
      "img":
          "https://images.unsplash.com/photo-1628083371371-64f105688b82?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8MjAwKjIwMCUyMHBpeGVsJTIwbmF0dXJlfGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60",
      "title": "Parrot"
    },
    {
      "img":
          "https://images.unsplash.com/photo-1469474968028-56623f02e42e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8MjAwKjIwMCUyMHBpeGVsJTIwbmF0dXJlfGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60",
      "title": "Mountain"
    },
    {
      "img":
          "https://images.unsplash.com/photo-1426604966848-d7adac402bff?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fDIwMCoyMDAlMjBwaXhlbCUyMG5hdHVyZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60",
      "title": "High Mountain"
    },
    {
      "img":
          "https://images.unsplash.com/photo-1472214103451-9374bd1c798e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fDIwMCoyMDAlMjBwaXhlbCUyMG5hdHVyZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60",
      "title": "Sunset"
    },
    {
      "img":
          "https://images.unsplash.com/photo-1501854140801-50d01698950b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fDIwMCoyMDAlMjBwaXhlbCUyMG5hdHVyZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60",
      "title": "Nagaland"
    },
    {
      "img":
          "https://images.unsplash.com/photo-1465189684280-6a8fa9b19a7a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fDIwMCoyMDAlMjBwaXhlbCUyMG5hdHVyZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60",
      "title": "Winter Lake"
    },
  ];

  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Photo Gallery',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Photo Gallery'),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                child: const Text(
                  'Welcome to My Photo Gallery!',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(16),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for photos',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
              ),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                alignment: WrapAlignment.center,
                children: myImages
                    .map(
                      (image) => GestureDetector(
                        onTap: () {
                          showSnackbar(context, 'Clicked on photo!');
                        },
                        child: Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                showSnackbar(context, 'Clicked on photo!');
                              },
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Ink.image(
                                image: NetworkImage(image['img']!),
                                fit: BoxFit.cover,
                                width: 150,
                                height: 150,
                                child: InkWell(
                                  onTap: () {
                                    showSnackbar(context, 'Clicked on photo!');
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              image['title']!,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  ListTile(
                    leading: Icon(Icons.photo),
                    title: Text('Photo 1'),
                    subtitle: Text('Description 1'),
                  ),
                  ListTile(
                    leading: Icon(Icons.photo),
                    title: Text('Photo 2'),
                    subtitle: Text('Description 2'),
                  ),
                  ListTile(
                    leading: Icon(Icons.photo),
                    title: Text('Photo 3'),
                    subtitle: Text('Description 3'),
                  ),
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showSnackbar(context, 'Photos Uploaded Successfully!');
          },
          child: const Icon(Icons.cloud_upload),
        ),
      ),
    );
  }
}
