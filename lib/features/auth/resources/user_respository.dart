import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/common/constants.dart';
import 'package:ecommerce_app/features/auth/model/user.dart';

class UserRepository {
  User? _user;

  User? get user => _user;

  Future<Either<String, User>> login(
      {required String email, required String password}) async {
    try {
      final Map<String, dynamic> _body = {
        "email": email,
        "password": password,
      };
      final _res = await Dio().post(
        "${Constants.baseUrl}/auth/login",
        data: _body,
      );
      final User _tempUser = User.fromMap(_res.data["results"]);
      _user = _tempUser;
      return Right(_tempUser);
    } on DioError catch (e) {
      return Left(e.response?.data["message"] ?? "Unable to login");
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, bool>> signUp({
    required String name,
    required String email,
    required String password,
    required String address,
    required String phone,
  }) async {
    try {
      final Map<String, dynamic> _body = {
        "name": name,
        "email": email,
        "password": password,
        "phone": phone,
        "address": address,
      };
      final _ = await Dio().post(
        "${Constants.baseUrl}/auth/register",
        data: _body,
      );
      return Right(true);
    } on DioError catch (e) {
      return Left(e.response?.data["message"] ?? "Unable to login");
    } catch (e) {
      return Left(e.toString());
    }
  }
}
