class ModelMovies {
  List<Items>? _items;
  Headers? _headers;

  ModelMovies({List<Items>? items, Headers? headers}) {
    if (items != null) {
      _items = items;
    }
    if (headers != null) {
      _headers = headers;
    }
  }

  List<Items>? get items => _items;
  set items(List<Items>? items) => _items = items;
  Headers? get headers => _headers;
  set headers(Headers? headers) => _headers = headers;

  ModelMovies.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      _items = <Items>[];
      json['items'].forEach((v) {
        _items!.add(Items.fromJson(v));
      });
    }
    _headers =
        json['headers'] != null ? Headers.fromJson(json['headers']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (_items != null) {
      data['items'] = _items!.map((v) => v.toJson()).toList();
    }
    if (_headers != null) {
      data['headers'] = _headers!.toJson();
    }
    return data;
  }

  contains(String lowerCase) {}
}

class Items {
  String? _id;
  String? _title;
  String? _slug;
  String? _description;
  String? _content;
  String? _videoUrl;
  String? _thumbnail;
  String? _thumbnailMobile;
  String? _category;
  String? _director;
  String? _actor;
  String? _language;
  String? _startTime;
  String? _endTime;
  int? _heartTotal;
  int? _price;
  String? _status;
  String? _createdAt;
  bool? _isHeart;
  bool? _isReserved;

  Items(
      {String? id,
      String? title,
      String? slug,
      String? description,
      String? content,
      String? videoUrl,
      String? thumbnail,
      String? thumbnailMobile,
      String? category,
      String? director,
      String? actor,
      String? language,
      String? startTime,
      String? endTime,
      int? heartTotal,
      int? price,
      String? status,
      String? createdAt,
      bool? isHeart,
      bool? isReserved}) {
    if (id != null) {
      _id = id;
    }
    if (title != null) {
      _title = title;
    }
    if (slug != null) {
      _slug = slug;
    }
    if (description != null) {
      _description = description;
    }
    if (content != null) {
      _content = content;
    }
    if (videoUrl != null) {
      _videoUrl = videoUrl;
    }
    if (thumbnail != null) {
      _thumbnail = thumbnail;
    }
    if (thumbnailMobile != null) {
      _thumbnailMobile = thumbnailMobile;
    }
    if (category != null) {
      _category = category;
    }
    if (director != null) {
      _director = director;
    }
    if (actor != null) {
      _actor = actor;
    }
    if (language != null) {
      _language = language;
    }
    if (startTime != null) {
      _startTime = startTime;
    }
    if (endTime != null) {
      _endTime = endTime;
    }
    if (heartTotal != null) {
      _heartTotal = heartTotal;
    }
    if (price != null) {
      _price = price;
    }
    if (status != null) {
      _status = status;
    }
    if (createdAt != null) {
      _createdAt = createdAt;
    }
    if (isHeart != null) {
      _isHeart = isHeart;
    }
    if (isReserved != null) {
      _isReserved = isReserved;
    }
  }

  String? get id => _id;
  set id(String? id) => _id = id;
  String? get title => _title;
  set title(String? title) => _title = title;
  String? get slug => _slug;
  set slug(String? slug) => _slug = slug;
  String? get description => _description;
  set description(String? description) => _description = description;
  String? get content => _content;
  set content(String? content) => _content = content;
  String? get videoUrl => _videoUrl;
  set videoUrl(String? videoUrl) => _videoUrl = videoUrl;
  String? get thumbnail => _thumbnail;
  set thumbnail(String? thumbnail) => _thumbnail = thumbnail;
  String? get thumbnailMobile => _thumbnailMobile;
  set thumbnailMobile(String? thumbnailMobile) =>
      _thumbnailMobile = thumbnailMobile;
  String? get category => _category;
  set category(String? category) => _category = category;
  String? get director => _director;
  set director(String? director) => _director = director;
  String? get actor => _actor;
  set actor(String? actor) => _actor = actor;
  String? get language => _language;
  set language(String? language) => _language = language;
  String? get startTime => _startTime;
  set startTime(String? startTime) => _startTime = startTime;
  String? get endTime => _endTime;
  set endTime(String? endTime) => _endTime = endTime;
  int? get heartTotal => _heartTotal;
  set heartTotal(int? heartTotal) => _heartTotal = heartTotal;
  int? get price => _price;
  set price(int? price) => _price = price;
  String? get status => _status;
  set status(String? status) => _status = status;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  bool? get isHeart => _isHeart;
  set isHeart(bool? isHeart) => _isHeart = isHeart;
  bool? get isReserved => _isReserved;
  set isReserved(bool? isReserved) => _isReserved = isReserved;

  Items.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _title = json['title'];
    _slug = json['slug'];
    _description = json['description'];
    _content = json['content'];
    _videoUrl = json['videoUrl'];
    _thumbnail = json['thumbnail'];
    _thumbnailMobile = json['thumbnailMobile'];
    _category = json['category'];
    _director = json['director'];
    _actor = json['actor'];
    _language = json['language'];
    _startTime = json['startTime'];
    _endTime = json['endTime'];
    _heartTotal = json['heartTotal'];
    _price = json['price'];
    _status = json['status'];
    _createdAt = json['createdAt'];
    _isHeart = json['isHeart'];
    _isReserved = json['isReserved'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['title'] = _title;
    data['slug'] = _slug;
    data['description'] = _description;
    data['content'] = _content;
    data['videoUrl'] = _videoUrl;
    data['thumbnail'] = _thumbnail;
    data['thumbnailMobile'] = _thumbnailMobile;
    data['category'] = _category;
    data['director'] = _director;
    data['actor'] = _actor;
    data['language'] = _language;
    data['startTime'] = _startTime;
    data['endTime'] = _endTime;
    data['heartTotal'] = _heartTotal;
    data['price'] = _price;
    data['status'] = _status;
    data['createdAt'] = _createdAt;
    data['isHeart'] = _isHeart;
    data['isReserved'] = _isReserved;
    return data;
  }
}

class Headers {
  int? _xPage;
  int? _xTotalCount;
  int? _xPagesCount;
  int? _xPerPage;
  int? _xNextPage;

  Headers(
      {int? xPage,
      int? xTotalCount,
      int? xPagesCount,
      int? xPerPage,
      int? xNextPage}) {
    if (xPage != null) {
      _xPage = xPage;
    }
    if (xTotalCount != null) {
      _xTotalCount = xTotalCount;
    }
    if (xPagesCount != null) {
      _xPagesCount = xPagesCount;
    }
    if (xPerPage != null) {
      _xPerPage = xPerPage;
    }
    if (xNextPage != null) {
      _xNextPage = xNextPage;
    }
  }

  int? get xPage => _xPage;
  set xPage(int? xPage) => _xPage = xPage;
  int? get xTotalCount => _xTotalCount;
  set xTotalCount(int? xTotalCount) => _xTotalCount = xTotalCount;
  int? get xPagesCount => _xPagesCount;
  set xPagesCount(int? xPagesCount) => _xPagesCount = xPagesCount;
  int? get xPerPage => _xPerPage;
  set xPerPage(int? xPerPage) => _xPerPage = xPerPage;
  int? get xNextPage => _xNextPage;
  set xNextPage(int? xNextPage) => _xNextPage = xNextPage;

  Headers.fromJson(Map<String, dynamic> json) {
    _xPage = json['x-page'];
    _xTotalCount = json['x-total-count'];
    _xPagesCount = json['x-pages-count'];
    _xPerPage = json['x-per-page'];
    _xNextPage = json['x-next-page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['x-page'] = _xPage;
    data['x-total-count'] = _xTotalCount;
    data['x-pages-count'] = _xPagesCount;
    data['x-per-page'] = _xPerPage;
    data['x-next-page'] = _xNextPage;
    return data;
  }
}
