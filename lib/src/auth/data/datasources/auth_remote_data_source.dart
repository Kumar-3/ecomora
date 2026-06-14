import 'dart:convert';

import 'package:ecom/core/common/app/cache_helper.dart';
import 'package:ecom/core/common/models/user_model.dart';
import 'package:ecom/core/errors/exceptions.dart';
import 'package:ecom/core/services/injection_container.dart';
import 'package:ecom/core/utils/constants/network_constant.dart';
import 'package:ecom/core/utils/error_response.dart';
import 'package:ecom/core/utils/network_utils.dart';
import 'package:ecom/core/utils/typedefs.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

sealed class AuthRemoteDataSource {
  const AuthRemoteDataSource();
  Future<void> register({
    required String name,
    required String password,
    required String email,
    required String phone,
  });
  Future<UserModel> login({required String email, required String password});
  Future<void> forgetPassword(String email);
  Future<void> verifyOTP({required String email, required String otp});
  Future<void> resetPassword({required String email, required String password});
  Future<bool> verifyToken();
}

const registerEndpoint = '/register';
const loginEndpoint = '/login';
const forgotPasswordEndpoint = '/forgot-password';
const verifyOtpEndpoint = '/verify-otp';
const resetPasswordEndpoint = '/reset-password';
const verifyTokenEndpoint = '/verify-token';

class AuthRemoteDataSourceImplimentation implements AuthRemoteDataSource {
  const AuthRemoteDataSourceImplimentation(this._client);
  final http.Client _client;
  @override
  Future<void> forgetPassword(String email) async {
    try {
      final uri = Uri.parse('${NetworkConstants.baseUrl}$forgotPasswordEndpoint');
      final response = await _client.post(
        uri,
        body: jsonEncode({'email': email}),
        headers: NetworkConstants.headers,
      );
      if (response.statusCode != 200) {
        final payload = jsonDecode(response.body) as DataMap;
        final errorResponse = ErrorResponse.fromMap(payload);
        throw ServerException(message: errorResponse.error, statusCode: response.statusCode);
      }
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      throw const ServerException(
        message: "Error Occurred: It's not your fault, It's ours",
        statusCode: 500,
      );
    }
  }

  @override
  Future<UserModel> login({required String email, required String password}) async {
    try {
      final uri = Uri.parse('${NetworkConstants.baseUrl}$loginEndpoint');
      final response = await _client.post(
        uri,
        body: jsonEncode({'email': email, 'password': password}),
        headers: NetworkConstants.headers,
      );
      final payload = jsonDecode(response.body) as DataMap;
      if (response.statusCode != 200) {
        final errorResponse = ErrorResponse.fromMap(payload);
        throw ServerException(message: errorResponse.error, statusCode: response.statusCode);
      }
      await sl<CacheHelper>().cacheSessionToken(payload['accessToken'] as String);
      final user = UserModel.fromMap(payload);
      await sl<CacheHelper>().cacheUserId(user.id);
      return user;
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      throw const ServerException(
        message: "Error Occurred: It's not your fault, It's ours",
        statusCode: 500,
      );
    }
  }

  @override
  Future<void> register({
    required String name,
    required String password,
    required String email,
    required String phone,
  }) async {
    try {
      final uri = Uri.parse('${NetworkConstants.baseUrl}$registerEndpoint');
      final response = await _client.post(
        uri,
        body: jsonEncode({'name': name, 'password': password, 'email': email, 'phone': phone}),
        headers: NetworkConstants.headers,
      );
      if (response.statusCode != 200 && response.statusCode != 201) {
        final payload = jsonDecode(response.body) as DataMap;
        final errorResponse = ErrorResponse.fromMap(payload);
        throw ServerException(message: errorResponse.error, statusCode: response.statusCode);
      }
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      throw const ServerException(
        message: "Error Occurred: It's not your fault, It's ours",
        statusCode: 500,
      );
    }
  }

  @override
  Future<void> resetPassword({required String email, required String password}) async {
    try {
      final uri = Uri.parse('${NetworkConstants.baseUrl}$resetPasswordEndpoint');
      final response = await _client.post(
        uri,
        body: jsonEncode({'email': email, 'password': password}),
        headers: NetworkConstants.headers,
      );
      if (response.statusCode != 200 && response.statusCode != 201) {
        final payload = jsonDecode(response.body) as DataMap;
        final errorResponse = ErrorResponse.fromMap(payload);
        throw ServerException(message: errorResponse.error, statusCode: response.statusCode);
      }
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      throw const ServerException(
        message: "Error Occurred: It's not your fault, It's ours",
        statusCode: 500,
      );
    }
  }

  @override
  Future<void> verifyOTP({required String email, required String otp}) async {
    try {
      final uri = Uri.parse('${NetworkConstants.baseUrl}$verifyOtpEndpoint');
      final response = await _client.post(
        uri,
        body: jsonEncode({'email': email, 'otp': otp}),
        headers: NetworkConstants.headers,
      );
      if (response.statusCode != 200 && response.statusCode != 201) {
        final payload = jsonDecode(response.body) as DataMap;
        final errorResponse = ErrorResponse.fromMap(payload);
        throw ServerException(message: errorResponse.error, statusCode: response.statusCode);
      }
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      throw const ServerException(
        message: "Error Occurred: It's not your fault, It's ours",
        statusCode: 500,
      );
    }
  }

  @override
  Future<bool> verifyToken() async {
    try {
      final uri = Uri.parse('${NetworkConstants.baseUrl}$verifyOtpEndpoint');
      final response = await _client.post(uri, headers: NetworkConstants.headers);
      if (response.statusCode != 200 && response.statusCode != 201) {
        final payload = jsonDecode(response.body) as DataMap;
        await NetworkUtils.renewToken(response);
        final errorResponse = ErrorResponse.fromMap(payload);
        throw ServerException(message: errorResponse.error, statusCode: response.statusCode);
      }
      return true;
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      throw const ServerException(
        message: "Error Occurred: It's not your fault, It's ours",
        statusCode: 500,
      );
    }
  }
}
