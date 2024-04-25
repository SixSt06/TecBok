import 'package:flutter/material.dart';
import 'package:proyecto_1er_parcial_v2/src/post.dart';

class NewPostScreen extends StatefulWidget {
  final Function(Post) addPost;
  final String userName;

  NewPostScreen({required this.addPost, required this.userName});

  @override
  _NewPostScreenState createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  TextEditingController descriptionController = TextEditingController();
  TextEditingController placeController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Nuevo Post',
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Bienvenido, ${widget.userName}',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Descripción'),
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: placeController,
              decoration: InputDecoration(labelText: 'Lugar'),
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: imageUrlController,
              decoration: InputDecoration(labelText: 'URL de la Imagen'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton.icon(
              onPressed: () {
                String description = descriptionController.text;
                String place = placeController.text;
                String imageUrl = imageUrlController.text;

                Post newPost = Post(
                  description: description,
                  location: place,
                  imageUrl: imageUrl,
                  userName: widget.userName,
                );

                widget.addPost(newPost);

                descriptionController.clear();
                placeController.clear();
                imageUrlController.clear();

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Publicación agregada con éxito'),
                    duration: Duration(seconds: 2),
                  ),
                );

                Navigator.pop(context);
              },
              icon: Icon(Icons.add),
              label: Text('Añadir Publicación'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Limpiar los controladores de texto cuando se destruye el widget
    descriptionController.dispose();
    placeController.dispose();
    imageUrlController.dispose();
    super.dispose();
  }
}
