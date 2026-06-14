import 'package:ecom/core/utils/typedefs.dart';
import 'package:equatable/equatable.dart';

class ErrorResponse extends Equatable {
  const ErrorResponse({this.type, this.message, this.errorMessages});

  factory ErrorResponse.fromMap(DataMap map) {
    var errorMessages = (map['errors'] as List?)
        ?.cast<DataMap>()
        .map((error) => error['message'] as String)
        .toList();

    if (errorMessages != null && errorMessages.isEmpty) {
      errorMessages = null;
    }

    return ErrorResponse(
      type: map['type'] as String?,
      message: map['message'] as String?,
      errorMessages: errorMessages,
    );
  }

  final String? type;
  final String? message;
  final List<String>? errorMessages;

  /// Returns a usable error message for UI
  String get error {
    if (message != null && message!.isNotEmpty) {
      return message!;
    }

    if (errorMessages != null && errorMessages!.isNotEmpty) {
      return errorMessages!.join('\n');
    }

    return 'Something went wrong';
  }

  @override
  List<Object?> get props => [type, message, errorMessages];
}
