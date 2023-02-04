import 'package:app_api_php/componnent/crud.dart';
import 'package:app_api_php/conestant/links.dart';
import 'package:app_api_php/main.dart';
import 'package:app_api_php/ui/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddNotes extends StatefulWidget {
  AddNotes({Key? key, this.title, this.id, this.content, required this.isAdd})
      : super(key: key);
  String? title;
  String? id;
  String? content;
  bool isAdd;

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  String title = '';
  String desc = '';
  late TextEditingController titleController;
  late TextEditingController contentController;
  GlobalKey<FormState> key = GlobalKey();

  @override
  void initState() {
    titleController = TextEditingController(text: widget.title ?? '');
    contentController = TextEditingController(text: widget.content ?? '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<Crud>(context);
    return Scaffold(
      backgroundColor: const Color(0xfff0f0fa),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: const Color(0xffF0F0FA),
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: SizedBox(
          height: 50,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  minWidth: 35,
                  onPressed: () {
                    setState(() {});
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/write.png',
                        height: 18,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        'Check-List',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.normal,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 35,
                  onPressed: () {
                    setState(() {});
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/font.png',
                        height: 18,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        'Format',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.normal,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 35,
                  onPressed: () {
                    context.read<Crud>().openGallery(context);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/image.png',
                        height: 18,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        'Gallery',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.normal,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 35,
                  onPressed: () {
                    context.read<Crud>().openCamera(context);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.camera,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Camera',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.normal,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 35,
                  onPressed: () {
                    setState(() {});
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/pencil.png',
                        height: 18,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        'Handwrite',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.normal,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xfff0f0fa),
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => MainScreen()));
                  },
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Image.asset('assets/images/back.png'),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                const Text(
                  'All Notes',
                  style: TextStyle(
                    fontFamily: 'Itim',
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0.5,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            InkWell(
              onTap: () async {
                key.currentState!.save();
                if (widget.isAdd) {
                  if (context.read<Crud>().imageFile != null) {
                    await pro.uploadFile(
                        addLink,
                        {
                          'id': sharedPreferences.getString('id'),
                          'title': title,
                          'content': desc,
                        },
                        context.read<Crud>().imageFile!);
                  } else {
                    await pro.postRequest(addLinkTxt, {
                      'id': sharedPreferences.getString('id'),
                      'title': title,
                      'content': desc,
                    });
                  }
                } else {
                  await pro.postRequest(editLink, {
                    'id': widget.id,
                    'title': title,
                    'content': desc,
                  });
                }
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => MainScreen()));
                context.read<Crud>().imageFile = null;
              },
              child: Image.asset(
                'assets/images/tick.png',
                height: 15,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: key,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Title',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      '${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second} ',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w900,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextFormField(
                      controller: titleController,
                      onSaved: (value) {
                        setState(() {
                          title = value!;
                        });
                      },
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Title',
                          hintStyle: TextStyle(color: Colors.grey)),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: TextFormField(
                        controller: contentController,
                        onSaved: (value) {
                          setState(() {
                            desc = value!;
                          });
                        },
                        keyboardType: TextInputType.text,
                        maxLength: 500,
                        maxLines: 12,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Content',
                            hintStyle: TextStyle(color: Colors.grey)),
                      ),
                    ),
                  ),
                ),
                Consumer<Crud>(builder: (context, val, child) {
                  return val.imageFile != null
                      ? Container(
                          width: 300,
                          height: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: FileImage(val.imageFile!),
                              )),
                        )
                      : Container();
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
