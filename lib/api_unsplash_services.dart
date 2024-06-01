import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'model_class.dart';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiUnsplashServices extends ChangeNotifier {
  List<GetUnsplashModel> unsplashUserList = [];

  Future<void> getData() async {
    var header = {
      "Authorization": 'Client-ID zyFqXSWfyCGsE64P_pi4c5YLMaOoEMWBO-935eYzwMs'
    };
    var response = await http.get(
      Uri.parse("https://api.unsplash.com/photos"),
      headers: header,
    );

    if (response.statusCode == 200) {
      var get = jsonDecode(response.body) as List;
      unsplashUserList = get.map((json) => GetUnsplashModel.fromJson(json)).toList();
      notifyListeners();
    } else {
      unsplashUserList = [];
      notifyListeners();
    }
  }
}


