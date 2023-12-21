import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:space_x/common/utils/utils.dart';
import 'package:space_x/services/network/common/api_exeption.dart';

class Failure extends Equatable {
  const Failure([this.errorMessage]);

  /// Message to display for user
  final String? errorMessage;

  factory Failure.from(dynamic e, dynamic trace) {
    Utils.debugPrint(
      'FAILURE: $e${trace.toString().isEmpty ? '' : "\n\n$trace"}',
    );

    if (e is ApiException) return Failure(e.errorMessage);
    if (kDebugMode && e is Exception) {
      // FOR simplified debugging
      return Failure(e.toString());
    }
    return const Failure();
  }

  @override
  List<Object?> get props => [errorMessage];
}
