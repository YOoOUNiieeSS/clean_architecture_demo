import 'package:equatable/equatable.dart';

class Quote extends Equatable {
  final String content, author, permalink;
  final int id;
  const Quote(
      {required this.author,
      required this.content,
      required this.id,
      required this.permalink});

  @override
  List<Object?> get props => [id, content];
}
