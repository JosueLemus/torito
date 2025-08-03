import 'package:dio/dio.dart';

import '../constants.dart';

class WalletService {
  final Dio _dio = Dio(BaseOptions(baseUrl: baseUrl));

  Future<void> deposit(double amount) async {
    final response = await _dio.post(
      '/wallet/deposit',
      data: {'amount': amount},
    );
    if (response.statusCode != 200) {
      throw Exception('Error al realizar el depósito');
    }
  }
}
