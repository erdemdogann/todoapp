import 'package:flutter/material.dart';
import 'package:todoapp/tododata.dart';

class Editpage extends StatefulWidget {
  final TodoData todo;
  final int index;
  final Function(int, TodoData) editNote;

  const Editpage(
      {super.key,
      required this.todo,
      required this.index,
      required this.editNote});

  @override
  _EditpageState createState() => _EditpageState();
}

class _EditpageState extends State<Editpage> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;

  String? _titleError;
  String? _contentError;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.todo.title);
    _contentController = TextEditingController(text: widget.todo.content);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  void _saveNote() {
    final title = _titleController.text;
    final content = _contentController.text;

    setState(() {
      _titleError = title.isEmpty ? 'Başlık gerekli' : null;
      _contentError = content.isEmpty ? 'Açıklama gerekli' : null;
    });

    if (_titleError == null && _contentError == null) {
      final updatedTodo = TodoData(title, content, widget.todo.time);
      widget.editNote(widget.index, updatedTodo);
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
        backgroundColor: const Color.fromARGB(255, 104, 0, 0),
        title: const Text(
          "Not Düzenle",
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
                controller: _titleController,
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
                controller: _contentController,
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
                onPressed: _saveNote,
                color: const Color.fromARGB(255, 104, 0, 0),
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
                  "Kaydet",
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
