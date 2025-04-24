import 'package:nagwa_books/services/api/api_response_model.dart';

abstract class UseCase<Type, Params> {
  Future<ApiResponseModel> call(Params params);
}

class NoParams {
  const NoParams();
}
