import 'package:flutter/material.dart';
import 'package:todoapp/tododata.dart';

class TextChangeScreen extends StatefulWidget {
  final Function(TodoData) addNote;

  const TextChangeScreen({super.key, required this.addNote});

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<TextChangeScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  String? _titleError;
  String? _contentError;

  void _addNote() {
    final title = titleController.text;
    final content = contentController.text;

    setState(() {
      _titleError = title.isEmpty ? 'Başlık gerekli' : null;
      _contentError = content.isEmpty ? 'Açıklama gerekli' : null;
    });

    if (_titleError == null && _contentError == null) {
      final time = DateTime.now().toString();
      final newNote = TodoData(title, content, time);
      widget.addNote(newNote);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF0F0F0),
      appBar: AppBar(
        elevation: 4,
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff6200EE),
        title: const Text(
          "Not Ekle",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
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
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  hintText: "Başlık",
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontSize: 16,
                    color: _titleError == null ? Color(0xff9E9E9E) : Colors.red,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  isDense: false,
                  contentPadding: const EdgeInsets.all(8),
                  errorText: _titleError,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: contentController,
                obscureText: false,
                textAlign: TextAlign.start,
                maxLines: null,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 14,
                  color: Color(0xff000000),
                ),
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  hintText: "Notu yazın",
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 12,
                    color:
                        _contentError == null ? Color(0xff9E9E9E) : Colors.red,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  isDense: false,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  errorText: _contentError,
                ),
              ),
              const SizedBox(height: 16),
              MaterialButton(
                onPressed: _addNote,
                color: const Color(0xff6200EE),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: const BorderSide(color: Colors.white, width: 1),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                textColor: Colors.white,
                height: 40,
                minWidth: 140,
                child: const Text(
                  "Ekle",
                  style: TextStyle(
                    fontSize: 16,
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
