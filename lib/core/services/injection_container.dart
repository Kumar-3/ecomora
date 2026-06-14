import 'package:ecom/core/common/app/cache_helper.dart';
import 'package:ecom/src/auth/data/datasources/auth_remote_data_source.dart';
import 'package:ecom/src/auth/data/repositories/auth_repository_implimentation.dart';
import 'package:ecom/src/auth/domain/repositories/auth_repository.dart';
import 'package:ecom/src/auth/domain/usecases/forgot_password.dart';
import 'package:ecom/src/auth/domain/usecases/login.dart';
import 'package:ecom/src/auth/domain/usecases/register.dart';
import 'package:ecom/src/auth/domain/usecases/reset_password.dart';
import 'package:ecom/src/auth/domain/usecases/verify_o_t_p.dart';
import 'package:ecom/src/auth/domain/usecases/verify_token.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

part 'injection_container.main.dart';
