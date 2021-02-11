class Todo {
  String text;
  bool done;
  String date;

  Todo({this.text = "", this.done = false, this.date = ""});

  Todo.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    done = json['done'];
    date = json['fecha'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['done'] = this.done;
    data['fecha'] = this.date;
    return data;
  }

  String dateFormatOne() {
    return date.substring(2, 16);
  }
}
