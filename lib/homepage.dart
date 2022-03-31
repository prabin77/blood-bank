import 'package:blood_bank/model/details.dart';
import 'package:blood_bank/provider/blood_bank_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void _navigationBottomNavBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    context.read<BloodBankProvider>().getData();
  }

  List<Details> detail = [
    Details(
        userId: 1,
        id: 2,
        //number
        title: "+977-9808320000",
        body:
            "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"),
    Details(
        userId: 1,
        id: 2,
        //number
        title: "+977-9808320001",
        body:
            "est rerum tempore vitae\nsequi sint nihil reprehenderit dolor beatae ea dolores neque\nfugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis\nqui aperiam non debitis possimus qui neque nisi nulla"),
    Details(
        userId: 1,
        id: 2,
        //number
        title: "+977-9808320002",
        body:
            "et iusto sed quo iure\nvoluptatem occaecati omnis eligendi aut ad\nvoluptatem doloribus vel accusantium quis pariatur\nmolestiae porro eius odio et labore et velit aut"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blood Bank'),
        backgroundColor: Colors.blueGrey[300],
        actions: [Icon(Icons.filter_list_outlined)],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.airport_shuttle_outlined),
                    Text(
                      " Nearby Blood Bank",
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 0.0),
                child: Container(
                  decoration: BoxDecoration(color: Colors.grey[350]),
                  height: 50,
                  width: 350,
                  child: TextField(
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                // color: Colors.grey,
                height: 530,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: context.watch<BloodBankProvider>().loading
                      ? CircularProgressIndicator()
                      : context.watch<BloodBankProvider>().error
                          ? Text('Error')
                          : ListView.builder(
                              itemCount: context
                                  .watch<BloodBankProvider>()
                                  .details
                                  .length,
                              itemBuilder: (BuildContext context, int index) {
                                return Card(
                                    child: Container(
                                  height: 100,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 100,
                                        width: 100,
                                        color: Colors.grey,
                                        child: CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              'https://thumbs.dreamstime.com/z/vector-illustration-red-blood-drop-bottle-hand-white-background-blood-bank-red-drop-cross-116932473.jpg'),
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Container(
                                            height: 60,
                                            width: 200,
                                            // color: Colors.red,
                                            alignment: Alignment.topCenter,
                                            child: Column(
                                              children: [
                                                Text(
                                                  context
                                                      .watch<
                                                          BloodBankProvider>()
                                                      .details[index]
                                                      .id
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 19,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(context
                                                    .watch<BloodBankProvider>()
                                                    .details[index]
                                                    .userId
                                                    .toString()),
                                                Text(
                                                  context
                                                      .watch<
                                                          BloodBankProvider>()
                                                      .details[index]
                                                      .title,
                                                  overflow: TextOverflow.clip,
                                                  maxLines: 1,
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: 40,
                                            width: 200,
                                            // color: Colors.black,
                                            alignment: Alignment.bottomCenter,
                                            child: Row(
                                              children: [
                                                Container(
                                                    alignment:
                                                        Alignment.bottomLeft,
                                                    child: Icon(
                                                      Icons.pin_drop,
                                                      size: 25,
                                                      color: Colors.green,
                                                    )),
                                                Container(
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    child: Text(
                                                      '4.3 km far away',
                                                      style: TextStyle(
                                                          fontSize: 22,
                                                          color: Colors.green),
                                                    )),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Container(
                                            height: 50,
                                            width: 68,
                                            // color: Colors.blue,
                                            child: InkWell(
                                              child: Icon(Icons.call),
                                              onTap: () {
                                                print("pressed");
                                              },
                                            ),
                                          ),
                                          Container(
                                              height: 50,
                                              width: 68,
                                              // color: Colors.green,
                                              child: InkWell(
                                                child: Icon(Icons.message),
                                                onTap: () {
                                                  print("pressed message");
                                                },
                                              ))
                                        ],
                                      )
                                    ],
                                  ),
                                ));
                              },
                            ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          iconSize: 30,
          currentIndex: _selectedIndex,
          onTap: _navigationBottomNavBar,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: " "),
            BottomNavigationBarItem(icon: Icon(Icons.note_add), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.message), label: " "),
            BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: " "),
            BottomNavigationBarItem(icon: Icon(Icons.video_call), label: " "),
          ]),
    );
  }
}
