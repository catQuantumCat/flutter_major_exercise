//Local role - for mapping data only

class SourceResponse {
  final String? id;
  final String? name;

  //method to transfer from JSON to Source model
  factory SourceResponse.fromJson(Map<String, dynamic> json) {
    //dynamic since the type is not guaranteed to be just String
    return SourceResponse(
      id: json['id'] as String?,
      name: json['name'] as String?,
    );
  }

  SourceResponse({
    this.id,
    this.name,
  });
}
