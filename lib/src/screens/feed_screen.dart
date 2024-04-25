import 'package:flutter/material.dart';
import 'package:proyecto_1er_parcial_v2/src/post.dart';
import 'package:proyecto_1er_parcial_v2/src/screens/post_screen.dart';
import 'package:proyecto_1er_parcial_v2/src/screens/api_screen.dart';

class FeedScreen extends StatefulWidget {
  final String userName;

  FeedScreen({required this.userName});
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  List<Post> posts = []; // Lista de publicaciones

  void addPost(Post newPost) {
    setState(() {
      posts.add(newPost); // Agrega el nuevo post a la lista de publicaciones
    });
  }

  void deletePost(int index) {
    setState(() {
      posts.removeAt(index); // Elimina el post en la posición 'index'
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TECBOK',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 30.0),
        child: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: posts[index].imageUrl.isNotEmpty
                    ? Image.network(
                        posts[index].imageUrl,
                        width: 120,
                        height: 120,
                        fit: BoxFit.cover,
                      )
                    : SizedBox.shrink(),
                title: Text(posts[index].description),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Ubicación: ${posts[index].location}'),
                    Text('Creado por: ${posts[index].userName}'),
                  ],
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    deletePost(index);
                  },
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NewPostScreen(
                      addPost: addPost,
                      userName: widget.userName,
                    )),
          );
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        color: Colors.white,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RickAndMortyScreen(),
                ));
          },
          child: Text('API'),
        ),
      ),
    );
  }
}
