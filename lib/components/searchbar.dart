import 'package:flutter/material.dart';
import 'package:series/screens/search_result.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Nome da série',
                hintText: 'Arrow',
              ),
              style: TextStyle(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SearchResult(_controller.text)));
                },
                child: Icon(Icons.search),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
