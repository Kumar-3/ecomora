// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:ecom/core/common/entities/user.dart';
import 'package:ecom/core/common/models/user_model.dart';
import 'package:ecom/core/common/singletons/cache.dart';
import 'package:ecom/core/errors/exceptions.dart';
import 'package:ecom/core/utils/constants/network_constant.dart';
import 'package:ecom/core/utils/error_response.dart';
import 'package:ecom/core/utils/network_utils.dart';
import 'package:ecom/core/utils/typedefs.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

sealed class UserRemoteDataSrc {
  Future<User> getUser(String userId);
  Future<User> updateUser({required String userId, required DataMap updatedData});
  Future<String> getUserPaymentProfile(String userId);
}

const USERS_ENDPOINT = '/users';
const PAYMENT_PROFILE_ENDPOINT = '/payment-profile';

class UserRemoteDataSrcImpl implements UserRemoteDataSrc {
  const UserRemoteDataSrcImpl(this._client);
  final http.Client _client;

  Map<String, String> get _authHeaders => {
    ...NetworkConstants.headers,
    'Authorization': 'Bearer ${Cache.instance.sessionToken}',
  };

  @override
  Future<UserModel> getUser(String userId) async {
    try {
      final uri = Uri.parse('${NetworkConstants.baseUrl}$USERS_ENDPOINT/$userId');
      final response = await _client.get(uri, headers: _authHeaders);
      final payload = jsonDecode(response.body) as DataMap;
      if (response.statusCode != 200) {
        await NetworkUtils.renewToken(response);
        final errorResponse = ErrorResponse.fromMap(payload);
        throw ServerException(message: errorResponse.error, statusCode: response.statusCode);
      }
      return UserModel.fromMap(payload);
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
  Future<UserModel> updateUser({required String userId, required DataMap updatedData}) async {
    try {
      final uri = Uri.parse('${NetworkConstants.baseUrl}$USERS_ENDPOINT/$userId');
      final response = await _client.put(uri, body: jsonEncode(updatedData), headers: _authHeaders);
      final payload = jsonDecode(response.body) as DataMap;
      if (response.statusCode != 200) {
        await NetworkUtils.renewToken(response);
        final errorResponse = ErrorResponse.fromMap(payload);
        throw ServerException(message: errorResponse.error, statusCode: response.statusCode);
      }
      return UserModel.fromMap(payload);
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
  Future<String> getUserPaymentProfile(String userId) async {
    try {
      final uri = Uri.parse(
        '${NetworkConstants.baseUrl}$USERS_ENDPOINT/$userId$PAYMENT_PROFILE_ENDPOINT',
      );
      final response = await _client.get(uri, headers: _authHeaders);
      final payload = jsonDecode(response.body) as DataMap;
      if (response.statusCode != 200) {
        await NetworkUtils.renewToken(response);
        final errorResponse = ErrorResponse.fromMap(payload);
        throw ServerException(message: errorResponse.error, statusCode: response.statusCode);
      }
      return payload['paymentProfileId'] as String;
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
