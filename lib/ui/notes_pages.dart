import 'package:app_api_php/componnent/crud.dart';
import 'package:app_api_php/conestant/links.dart';
import 'package:app_api_php/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';
import '10_connection_lost.dart';
import '4_file_not_found.dart';
import 'add_note.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff0f0fa),
      appBar: AppBar(
        backgroundColor: const Color(0xfff0f0fa),
        elevation: 0,
        title: Row(
          children: [
            Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Image.asset('assets/images/menu.png'),
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            const Text(
              'All Notes',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                letterSpacing: 0.5,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => AddNotes(
                        isAdd: true,
                      )));
        },
        child: const Icon(
          Icons.add,
          size: 35,
          color: Colors.grey,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: TextFormField(
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search Notes',
                    hintStyle: TextStyle(color: Colors.grey)),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              'Categories',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: Column(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Colors.purple.shade100.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Image.asset(
                              'assets/images/user.png',
                              color: Colors.purple,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Personal',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: Column(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Colors.green.shade200.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Image.asset(
                              'assets/images/suitcase.png',
                              color: Colors.greenAccent.shade700,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Work',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: Column(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color:
                                Colors.orangeAccent.shade100.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Image.asset(
                              'assets/images/car.png',
                              color: Colors.orangeAccent,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Travel',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: Column(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Colors.redAccent.shade100.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Image.asset(
                              'assets/images/love.png',
                              color: Colors.redAccent,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Health',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Icon(
                          Icons.add,
                          size: 30,
                          color: Colors.grey,
                        )),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(top: 10),
              // height: MediaQuery.of(context).size.height - 20,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Consumer<Crud>(
                builder: (context, val, child) {
                  return FutureBuilder(
                    future: val.postRequest(
                        viewLink, {'id': sharedPreferences.getString('id')}),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        Map data = snapshot.data as Map;
                        if (data["Status"] != "Failed") {
                          return ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: data['data'].length,
                            itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AddNotes(
                                              isAdd: false,
                                              title: data['data'][index]
                                                  ['notes_title'],
                                              content: data['data'][index]
                                                  ['notes_content'],
                                              id: data['data'][index]
                                                  ['notes_id'],
                                            )));
                              },
                              child: Dismissible(
                                key: const Key(''),
                                confirmDismiss:
                                    (DismissDirection direction) async {
                                  if (direction ==
                                      DismissDirection.startToEnd) {
                                    return await showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text(
                                              "Favorite Confirmation"),
                                          content: const Text(
                                              "Are you sure you want to add Favorite?"),
                                          actions: <Widget>[
                                            MaterialButton(
                                                onPressed: () =>
                                                    Navigator.of(context).pop(),
                                                child: const Text("Add")),
                                            MaterialButton(
                                              onPressed: () =>
                                                  Navigator.of(context).pop(),
                                              child: const Text("Cancel"),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  } else {
                                    return await showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title:
                                              const Text("Delete Confirmation"),
                                          content: const Text(
                                              "Are you sure you want to delete this item?"),
                                          actions: <Widget>[
                                            MaterialButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                  val.postRequest(deleteLink, {
                                                    'id': data['data'][index]
                                                        ['notes_id']
                                                  });
                                                  setState(() {});
                                                },
                                                child: const Text("Delete")),
                                            MaterialButton(
                                              onPressed: () =>
                                                  Navigator.of(context).pop(),
                                              child: const Text("Cancel"),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                },
                                background: Container(
                                  color: Colors.blue,
                                  child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Row(
                                      children: const [
                                        Icon(Icons.favorite,
                                            color: Colors.white),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text('Move to favorites',
                                            style:
                                                TextStyle(color: Colors.white)),
                                      ],
                                    ),
                                  ),
                                ),
                                secondaryBackground: Container(
                                  color: Colors.red,
                                  child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: const [
                                        Icon(Icons.delete, color: Colors.white),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text('Move to trash',
                                            style:
                                                TextStyle(color: Colors.white)),
                                      ],
                                    ),
                                  ),
                                ),
                                child: Container(
                                  padding: const EdgeInsets.all(15.0),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Colors.black12,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                            fit: BoxFit.cover,
                                            width: 90,
                                            height: 70,
                                            'https://images.unsplash.com/photo-1512314889357-e157c22f938d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8bm90ZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data['data'][index]['notes_title'],
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w900,
                                                fontSize: 15),
                                          ),
                                          const SizedBox(height: 10,),
                                          Text(
                                            data['data'][index]
                                                ['notes_content'],
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                                color: Colors.black54),
                                          ),
                                        ],
                                      ),
                                      Expanded(child: Container()),
                                      const Text(
                                        'yesterday',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            fontSize: 11),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const SizedBox(
                              height: 20,
                            ),
                          );
                        } else {
                          return Lottie.asset('assets/animation/empty.json');
                        }
                      } else {
                        return Lottie.asset('assets/animation/empty.json');
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
