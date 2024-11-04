class newsModel{
  List<dynamic> data;
  newsModel({required this.data});
  factory newsModel.getData(Map<String,dynamic> data_){
    List<dynamic> fullData;
    fullData = data_["articles"].map(
          (e){
        return {
          "title": e["title"] ?? "No Title Available",
          "description": e["description"] ?? "No Description Available",
          "imgUrl": e["urlToImage"] ?? "https://example.com/default_image.jpg",
        };
      },
    ).toList();
    return newsModel(data: fullData);
  }
}