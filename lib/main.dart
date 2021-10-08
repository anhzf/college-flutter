import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('K3519010 - Beautiful Custom Card'),
            backgroundColor: Colors.indigo.shade500,
          ),
          body: MyApp(),
          backgroundColor: Colors.indigo.shade300,
        ),
        color: Colors.white,
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    Widget bodySectionBg = Opacity(
      opacity: .7,
      child: Image.network(
        'https://www.toptal.com/designers/subtlepatterns/patterns/memphis-mini.png',
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
    );
    Widget bodySection = Container(
      child: Stack(
        children: [
          bodySectionBg,
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            alignment: Alignment.center,
            child: ListView(
              shrinkWrap: true,
              children: [
                Text(
                  'Beautiful Ocean at Pantai Selatan',
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(ctx).textTheme.headline6?.merge(
                        TextStyle(
                          color: Colors.indigo,
                        ),
                      ),
                ),
                Container(
                  margin: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Posted on  ',
                              style: Theme.of(ctx).textTheme.caption?.merge(
                                    TextStyle(color: Colors.indigo.shade200),
                                  ),
                            ),
                            Text(
                              'June 21, 2021',
                              style: Theme.of(ctx).textTheme.caption?.merge(
                                    TextStyle(color: Colors.indigo.shade500),
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.thumb_up,
                              color: Colors.indigo.shade300,
                              size: 16,
                            ),
                            SizedBox(width: 8),
                            Text('99',
                                style: Theme.of(ctx).textTheme.caption?.merge(
                                      TextStyle(color: Colors.indigo.shade300),
                                    )),
                            SizedBox(width: 16),
                            Icon(
                              Icons.comment,
                              color: Colors.indigo.shade300,
                              size: 16,
                            ),
                            SizedBox(width: 8),
                            Text('888',
                                style: Theme.of(ctx).textTheme.caption?.merge(
                                      TextStyle(color: Colors.indigo.shade300),
                                    )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );

    return Center(
      child: Container(
        width: MediaQuery.of(ctx).size.width * .7,
        child: AspectRatio(
          aspectRatio: 2 / 3,
          child: Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 10,
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 4 / 3,
                  child: Image.network(
                    'https://source.unsplash.com/600x400/?nature,blue',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Expanded(child: bodySection, flex: 3)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
