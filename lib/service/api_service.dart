import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobx_flutter/service/preference_service.dart';

import '../app_config.dart';
import '../model/app_error.dart';

// ignore: non_constant_identifier_names
String BASE_URL = baseUrl;

abstract class APIService {
  Future<Map<String, dynamic>?> get(String url,
      // ignore: avoid_init_to_null
      {Map<String, String?>? params = null,
      bool useAuthHeaders = true,
      Map<String, String?>? customHeader,
      useBaseUrl = true}) async {
    try {
      var data = await http.get(
          Uri.parse(
              _getUrlWithParams(url, params: params, useBaseUrl: useBaseUrl)),
          headers: await _getHeaders(
              useAuthHeaders: useAuthHeaders, customHeader: customHeader));
      return _getResponse(data);
    } catch (e) {
      return null;
    }
  }

  Future<Map<String, dynamic>?> post(String url,
      {required Map<String, dynamic> body, bool useAuthHeaders = true}) async {
    final response = await http.post(Uri.parse(_getUrl(url)),
        headers: await _getHeaders(useAuthHeaders: useAuthHeaders),
        body: json.encode(body));
    return _getResponse(response);
  }

  Future<Map<String, dynamic>?> put(String url,
      {required Map<String, String> body, bool useAuthHeaders = true}) async {
    final response = await http.put(Uri.parse(_getUrl(url)),
        headers: await _getHeaders(useAuthHeaders: useAuthHeaders), body: body);

    return _getResponse(response);
  }

  Future<Map<String, dynamic>?> patch(String url,
      {required Map<String, dynamic> body, bool useAuthHeaders = true}) async {
    final response = await http.patch(Uri.parse(_getUrl(url)),
        headers: await _getHeaders(useAuthHeaders: useAuthHeaders),
        body: json.encode(body));
    return _getResponse(response);
  }

  Future<Map<String, dynamic>?> delete(String url,
      {Map<String, String>? params, bool useAuthHeaders = true}) async {
    final response = await http.delete(
        Uri.parse(_getUrlWithParams(url, params: params, useBaseUrl: true)),
        headers: await _getHeaders(useAuthHeaders: useAuthHeaders));

    return _getResponse(response);
  }

  // Helper Methods for API Services
  String _getUrl(String url) {
    return BASE_URL + url;
  }

  Future<Map<String, String>?> _getHeaders(
      {bool useAuthHeaders = true, customHeader}) async {
    Map<String, String> map = <String, String>{};

    if (useAuthHeaders) {
      map['authorizationToken'] = await PreferencesService().getToken();
    }

    if (customHeader != null) {
      map = {...map, ...customHeader};
    }
    return map;
  }

  String _getUrlWithParams(String url,
      {Map<String, String?>? params, useBaseUrl = true}) {
    String absUrl;

    if (useBaseUrl) {
      absUrl = _getUrl(url);
    } else {
      absUrl = url;
    }

    if (params != null) {
      var paramsString = '';
      params.forEach((key, value) {
        if (value != null) {
          paramsString += '&$key=$value';
        }
      });
      print('$absUrl?${paramsString.substring(1)}');
      return '$absUrl?${paramsString.substring(1)}';
    }

    return absUrl;
  }

  Map<String, dynamic>? _getResponse(http.Response response) {
    if (response.body == null || response.body.trim().isEmpty) {
      return null;
    }
    final Map<String, dynamic> body =
        json.decode(utf8.decode(response.body.codeUnits));
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw AppError(body['data'], null);
    }
    return body;
  }
}
