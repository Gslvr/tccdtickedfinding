class Request {
  String metod;
  String url;
  Map<String,dynamic> body;

  Request({
    required this.metod,
    required this.url,
    required this.body,
  });

  Request copyWith({
    String? metod,
    String? url,
    Map<String,dynamic>? body,
  }) {
    return Request(
      metod: metod ?? this.metod,
      url: url ?? this.url,
      body: body ?? this.body,
    );
  }
}
