import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_cinema_app/model/model_moives.dart';

import 'apibase/api_client.dart';
import 'apibase/api_response.dart';

class ApiRequest {
  static const String _domain = "http://66.42.54.109:8010/api/cinemas";

  static Future<ApiResponse> userLogin(String passWord, String phone) async {
    Map data = {
      "phoneNumber": phone,
      "password": passWord,
    };
    return await ApiClient().request(
      method: ApiClient.POST,
      url: "$_domain/auth/login",
      data: json.encode(data),
    );
  }

  Future<List<Items>?> bannerHome() async {
    var dio = Dio();
    Response respone = await dio.get("$_domain/backend/news");
    ModelMovies modelMovies = ModelMovies.fromJson(respone.data);
    return modelMovies.items;
  }


  static Future<ApiResponse> register(String passWord, String phone) async {
    Map data = {
      "name": "name",
      "userName": "example",
      "phoneNumber": phone,
      "email": "example@email.com",
      "imageUrl": "example",
      "roles": [],
      "password": passWord,
    };
    return await ApiClient().request(
      method: ApiClient.POST,
      url: "$_domain/backend/users",
      data: json.encode(data),
    );
  }

  static Future<ApiResponse> updateUser(
    String id,
    String name,
    String userName,
    String phoneNumber,
    String email,
  ) async {
    Map data = {
      "name": name,
      "userName": userName,
      "phoneNumber": phoneNumber,
      "email": email,
      "imageUrl":
          "https://scontent.fhan9-1.fna.fbcdn.net/v/t39.30808-6/337235300_168853745975415_8131193214280910706_n.jpg?_nc_cat=1&ccb=1-7&_nc_sid=730e14&_nc_ohc=KAm14da6ZJ4AX8fZMIw&_nc_ht=scontent.fhan9-1.fna&oh=00_AfA-EbxM2n_qM-Grwam-ur2mMpJ3twQMigoscD6u8LxhIQ&oe=641F81A3"
    };
    return await ApiClient().request(
      method: ApiClient.PUT,
      url: "$_domain/backend/users/$id",
      data: json.encode(data),
    );
  }

  Future<List<Items>?> fetchData() async {
    var dio = Dio();
    Response respone = await dio.get("$_domain/backend/films?perPage=70");
    ModelMovies modelMovies = ModelMovies.fromJson(respone.data);

    return modelMovies.items;
  }

  Future<List<Items>?> fetchStatusData(String title) async {
    var dio = Dio();
    Response respone = await dio
        .get("$_domain/backend/films?status=${title.toUpperCase().trim()}&perPage=70");
    ModelMovies modelMovies = ModelMovies.fromJson(respone.data);

    return modelMovies.items;
  }

  Future<List<Items>?> fetchCategoryData(String title) async {
    var dio = Dio();
    Response respone = await dio
        .get("$_domain/backend/films?category=${title.toUpperCase().trim()}&perPage=70");
    ModelMovies modelMovies = ModelMovies.fromJson(respone.data);
    return modelMovies.items;
  }

  static Future<ApiResponse> fetchDataFilm(String filmId) async {
    return await ApiClient().request(
      method: ApiClient.GET,
      url: "$_domain/backend/films/$filmId",
    );
  }

  static Future<ApiResponse> fetchDataChair(String filmId) async {
    return await ApiClient().request(
      method: ApiClient.GET,
      url: "$_domain/backend/reservations/$filmId",
    );
  }

  static Future<ApiResponse> book(String filmId, List<String> chairIds) async {
    Map data = {
      "filmId": filmId,
      "chairIds": chairIds,
    };
    return await ApiClient().request(
      method: ApiClient.POST,
      url: "$_domain/backend/reservations",
      data: json.encode(data),
    );
  }
}
