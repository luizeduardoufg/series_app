import 'package:flutter/material.dart';
import 'package:series/api/web_client.dart';
import 'package:series/components/circle_progress.dart';

class SearchResult extends StatefulWidget {
  final String _query;

  SearchResult(this._query);

  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search results'),
      ),
      body: FutureBuilder<List<dynamic>>(
        initialData: [],
        future: search(widget._query),
        builder: (context, snapshot) {
          final List<dynamic> tvShows = snapshot.data;

          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return CircleProgressBar();
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: tvShows.length,
                  itemBuilder: (context, index) {
                    return _SerieCard(tvShows[index]);
                  },
                ),
              );
              break;
          }
        },
      ),
    );
  }
}

class _SerieCard extends StatelessWidget {
  final Map<String, dynamic> _tvShow;

  _SerieCard(this._tvShow);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      child: Card(
        child: Row(
          children: [
            Expanded(
              flex: 33,
              child: Image.network(
                _tvShow['image_thumbnail_path'],
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return CircleProgressBar();
                },
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              flex: 66,
              child: Column(
                children: [
                  Expanded(
                    flex: 20,
                    child: Center(
                      child: Text(
                        _tvShow['name'],
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 20,
                    child: Text('Status: ${_tvShow['status']}'),
                  ),
                  Expanded(
                    flex: 20,
                    child: Text('Country: ${_tvShow['country']}'),
                  ),
                  Expanded(
                    flex: 40,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Icon(Icons.add),
                          ),
                          Text('Adicionar à lista'),
                        ],
                      ),
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
}
