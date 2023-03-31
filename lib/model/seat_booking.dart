class Seat {
  String? _id;
  String? _chairId;
  String? _chairName;
  String? _filmId;
  String? _status;
  String? _type;
  int? _price;

  Seat(
      {String? id,
        String? chairId,
        String? chairName,
        String? filmId,
        String? status,
        String? type,
        int? price}) {
    if (id != null) {
      this._id = id;
    }
    if (chairId != null) {
      this._chairId = chairId;
    }
    if (chairName != null) {
      this._chairName = chairName;
    }
    if (filmId != null) {
      this._filmId = filmId;
    }
    if (status != null) {
      this._status = status;
    }
    if (type != null) {
      this._type = type;
    }
    if (price != null) {
      this._price = price;
    }
  }

  String? get id => _id;
  set id(String? id) => _id = id;
  String? get chairId => _chairId;
  set chairId(String? chairId) => _chairId = chairId;
  String? get chairName => _chairName;
  set chairName(String? chairName) => _chairName = chairName;
  String? get filmId => _filmId;
  set filmId(String? filmId) => _filmId = filmId;
  String? get status => _status;
  set status(String? status) => _status = status;
  String? get type => _type;
  set type(String? type) => _type = type;
  int? get price => _price;
  set price(int? price) => _price = price;

  Seat.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _chairId = json['chairId'];
    _chairName = json['chairName'];
    _filmId = json['filmId'];
    _status = json['status'];
    _type = json['type'];
    _price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['chairId'] = this._chairId;
    data['chairName'] = this._chairName;
    data['filmId'] = this._filmId;
    data['status'] = this._status;
    data['type'] = this._type;
    data['price'] = this._price;
    return data;
  }
  void select() {
    _status = 'SELECTED';
  }

  void book() {
    _status = 'BOOKED';
  }
}






