class Todo {
  String text;
  bool done;

  Todo({this.text, this.done});

  Todo.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    done = json['done'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['done'] = this.done;
    return data;
  }
}
