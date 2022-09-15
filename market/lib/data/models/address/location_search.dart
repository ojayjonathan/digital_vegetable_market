import 'package:equatable/equatable.dart';

class Suggestion extends Equatable {
  final String placeId;
  final String description;

  const Suggestion(this.placeId, this.description);

  factory Suggestion.fromJson(Map<String, dynamic> json) {
    return Suggestion(json["place_id"], json["description"]);
  }

  @override
  List<Object?> get props => [placeId, description];
}
