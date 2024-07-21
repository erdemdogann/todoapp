import 'package:flutter/material.dart';
import 'package:todoapp/tododata.dart';

class Addpage extends StatelessWidget {
  final Function(TodoData) addNote;

  Addpage({required this.addNote});

  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xffffffff),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        title: const Text(
          "Add Note",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            fontSize: 16,
            color: Color(0xff000000),
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xff212435),
            size: 24,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              TextField(
                controller: titleController,
                obscureText: false,
                textAlign: TextAlign.start,
                maxLines: 1,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  fontSize: 18,
                  color: Color(0xff000000),
                ),
                decoration: const InputDecoration(
                  disabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  hintText: "Title",
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontSize: 16,
                    color: Color(0xff000000),
                  ),
                  filled: true,
                  fillColor: Color(0xffffffff),
                  isDense: false,
                  contentPadding: EdgeInsets.all(8),
                ),
              ),
              TextField(
                controller: contentController,
                obscureText: false,
                textAlign: TextAlign.start,
                maxLines: 20,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 14,
                  color: Color(0xff000000),
                ),
                decoration: const InputDecoration(
                  disabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  hintText: "Writes Notes",
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 12,
                    color: Color(0xff000000),
                  ),
                  filled: true,
                  fillColor: Color(0xffffffff),
                  isDense: false,
                  contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                ),
              ),
              MaterialButton(
                onPressed: () {
                  final title = titleController.text;
                  final content = contentController.text;
                  final time = DateTime.now().toString(); // or use any format you prefer
                  final newNote = TodoData(title, content, time);
                  addNote(newNote);
                  Navigator.pop(context);
                },
                color: const Color(0xffffffff),
                elevation: 0,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                  side: BorderSide(color: Color(0xff808080), width: 1),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                textColor: const Color(0xff000000),
                height: 40,
                minWidth: 140,
                child: const Text(
                  "Add",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
