import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_cinema_app/resource/images/app_images.dart';
import 'package:flutter_cinema_app/widgets/ensign.dart';

class User extends ChangeNotifier {
  String _id = "";
  String _name = "";
  String _userName = "";
  String _phoneNumber = "";
  String _email = "";
  String _imageUrl = "";
  String _status = "";
  String _numberOnCard = "* * * *  * * * *  1 2 3 4";
  String _nameOfUserOnCard = "";
  String _expiryDateOnCard = "";
  List<String>? _roles;
  Image _ensign = EnsignItem.vietnam;
  Container _avatar = Container(
    width: 190,
    height: 199,
    decoration: const BoxDecoration(shape: BoxShape.circle),
    child: Image.asset(AppImages.imageProfile),
  );
  String _nationalCode = '84';

  get id => _id;

  get name => _name;

  get userName => _userName;

  get phoneNumber => _phoneNumber;

  get email => _email;

  get imageUrl => _imageUrl;

  get status => _status;

  get roles => _roles;

  get numberOnCard => _numberOnCard;

  get nameOfUserOnCard => _nameOfUserOnCard;

  get expiryDateOnCard => _expiryDateOnCard;

  get ensign => _ensign;

  get avatar => _avatar;

  get nationalCode => _nationalCode;

  void updateImage(File? image) {
    if (image != null) {
      _avatar = Container(
          width: 190,
          height: 199,
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: Image.file(image));
      notifyListeners();
    } else {
      _avatar = Container(
        width: 190,
        height: 199,
        decoration: const BoxDecoration(shape: BoxShape.circle),
        child: Image.asset(AppImages.imageProfile),
      );
    }
  }

  void selectedEnsign(Image ensign) {
    _ensign = ensign;
    ensign == EnsignItem.vietnam
        ? _nationalCode = '84'
        : ensign == EnsignItem.US
            ? _nationalCode = '01'
            : ensign == EnsignItem.india
                ? _nationalCode = '91'
                : _nationalCode = '39';
    notifyListeners();
  }

  void idUser(String id
      // String name, String userName, String phoneNumber, String email, String imageUrl, String status, List<String> roles, String lastLoginAt,
      ) {
    _id = id;
    notifyListeners();
  }

  void nameUser(String name) {
    _name = name;
    notifyListeners();
  }

  void userNameUser(String userName) {
    _userName = userName;
    notifyListeners();
  }

  void phoneNumberUser(String phoneNumber) {
    _phoneNumber = phoneNumber;
    notifyListeners();
  }

  void emailUser(String email) {
    _email = email;
    notifyListeners();
  }

  void imageUrlUser(String imageUrl) {
    _imageUrl = imageUrl;
    notifyListeners();
  }

  void statusUser(String status) {
    _status = status;
    notifyListeners();
  }

  void roleUser(List<String> roles) {
    _roles = roles;
    notifyListeners();
  }

  void updateNumberOnCard(String numberOnCard) {
    _numberOnCard = numberOnCard;
    notifyListeners();
  }

  void updateNameOfUserOnCard(String nameOfUserOnCard) {
    _nameOfUserOnCard = nameOfUserOnCard;
    notifyListeners();
  }

  void updateExpiryDateOnCard(String expiryDateOnCard) {
    _expiryDateOnCard = expiryDateOnCard;
    notifyListeners();
  }

  void resetNumberOnCard() {
    _numberOnCard = "* * * *  * * * *  1 2 3 4";
    notifyListeners();
  }

  void resetNameOfUserOnCard() {
    _nameOfUserOnCard = "";
    notifyListeners();
  }

  void resetExpiryDateOnCard() {
    _expiryDateOnCard = "";
    notifyListeners();
  }
}
