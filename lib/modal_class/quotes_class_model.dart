class QuotesClassModel {
  String? quote;
  String? author;
  String? category;

  QuotesClassModel({
    required this.quote,
    required this.author,
    required this.category,
  });

  factory QuotesClassModel.fun({required Map data}) {
    return QuotesClassModel(
      quote: data['quote'],
      author: data['author'],
      category: data['category'],
    );
  }
}
