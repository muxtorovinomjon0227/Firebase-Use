class TodoModel{
  // int? id;
  String? title;
  // String? content;
  bool? isfovoroute;

  TodoModel(
      {
        // this.id
        this.title,
        // this.content,
        this.isfovoroute});

  TodoModel.fromJson(Map<String, dynamic> json) {
    // id = json['id'];
    title = json['title'];
    // content = json['content'];
    isfovoroute = json['isfovoroute'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // data['id'] = this.id;
    data['title'] = this.title;
    // data['content'] = this.content;
    data['isfovoroute'] = this.isfovoroute;
    return data;
  }
}