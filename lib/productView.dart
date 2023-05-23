import 'package:flutter/material.dart';
import 'product.dart';

import 'fetch.dart';
import 'user.dart';
import 'user_model.dart';

class ProdukView extends StatefulWidget {
  const ProdukView({super.key, required this.user});

  final User user;
  @override
  State<ProdukView> createState() => _ProdukViewState();
}

class _ProdukViewState extends State<ProdukView> {
  @override
  Widget build(BuildContext context) {
    int batas = 20;
    List<Product>? _dataProducts;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 175, 1, 113),
        leading: Center(
          child: Text(
            widget.user.firstName ?? "NONAME",
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ),
        leadingWidth: 80,
        title: Text("Daftar Produk"),
        centerTitle: true,
        actions: [
          TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Text("Logout")),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 242, 243, 245),
      body: Column(
        children: [
          FutureBuilder(
            future: PostController.getData(banyak: batas),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text("Gagal Ambil Data"),
                );
              }
              if (snapshot.hasData) {
                _dataProducts = snapshot.data as List<Product>?;
                return Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      itemCount: batas,
                      itemBuilder: (ctx, index) {
                        return Card(
                          margin: const EdgeInsets.all(15),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                leading: Image.network(
                                  _dataProducts?[index].images[0] ??
                                      'https://images.unsplash.com/photo-1547721064-da6cfb341d50',
                                  width: 60,
                                ),
                                title: Text(
                                    _dataProducts?[index].title ?? "No judul"),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      _dataProducts?[index].description ??
                                          "No deskripsi",
                                      textAlign: TextAlign.left,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Row(
                                          children: [
                                            Text("\$"),
                                            Text(_dataProducts?[index]
                                                    .price
                                                    .toString() ??
                                                "00000"),
                                          ],
                                        ),
                                        Spacer(),
                                        Row(children: [
                                          Icon(
                                            Icons.star,
                                            size: 16.0,
                                          ),
                                          SizedBox(
                                            width: 6,
                                          ),
                                          Text(_dataProducts?[index]
                                                  .rating
                                                  .toString() ??
                                              "0"),
                                        ]),
                                        Spacer(),
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Color.fromARGB(
                                                    255, 175, 1, 113),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 30,
                                                        vertical: 8),
                                                textStyle: const TextStyle(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            onPressed: (() {}),
                                            child: Text("Beli"))
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          )
          //     FutureBuilder<Product>(
          //   future: PostController.getData(),
          //   builder: (context, snapshot) {
          //     if (snapshot.hasError) {
          //       print(snapshot.error);
          //       return Center(
          //         child: Text("Gagal Ambil Data"),
          //       );
          //     }

          //     if (snapshot.hasData) {
          //       final user = snapshot.data;
          //       return Center(
          //           child: Column(
          //         children: [
          //           SizedBox(height: 40),
          //           CircleAvatar(
          //             radius: 48,
          //             backgroundImage:
          //                 user != null ? NetworkImage(user.images[0]) : null,
          //           ),
          //           SizedBox(height: 16),
          //           Text(user?.brand ?? "Nama"),
          //           SizedBox(height: 4),
          //           Text(user?.stock.toString() ?? "Email"),
          //         ],
          //       ));
          //     } else {
          //       return Center(child: CircularProgressIndicator());
          //     }
          //   },
          // );
        ],
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card'),
      ),
      body: Card(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Image.network(
                'https://images.unsplash.com/photo-1547721064-da6cfb341d50',
              ),
              title: const Text('Title'),
              subtitle: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                      "Description description description description description description description description."),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text("Price"),
                      Spacer(),
                      Text("Rating"),
                      Spacer(),
                      ElevatedButton(
                          onPressed: (() {}), child: Text("Beli Sekarang"))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
