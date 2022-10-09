// To parse this JSON data, do
//
//     final quoteModel = quoteModelFromJson(jsonString);

import 'dart:convert';

import 'package:clean_architecture/features/random_qoute/domain_layer/entities/quote.dart';

QuoteModel quoteModelFromJson(String str) => QuoteModel.fromJson(json.decode(str));

String quoteModelToJson(QuoteModel data) => json.encode(data.toJson());

class QuoteModel extends Quote{
    const QuoteModel({
        required this.author,
        required this.id,
        required this.quote,
        required this.permalink,
    }) : super(author: author,content: quote,id: id,permalink: permalink);

    final String author;
    final int id;
    final String quote;
    final String permalink;

    factory QuoteModel.fromJson(Map<String, dynamic> json) => QuoteModel(
        author: json["author"],
        id: json["id"],
        quote: json["quote"],
        permalink: json["permalink"],
    );

    Map<String, dynamic> toJson() => {
        "author": author,
        "id": id,
        "quote": quote,
        "permalink": permalink,
    };
}
