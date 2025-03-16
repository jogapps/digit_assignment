import 'package:digit_assignment/data/local_store/remote_client.dart';
import 'package:digit_assignment/models/localization/localization_model.dart';

class LocalizationRepository {
  final client = DioClient().dio;

  Future<LocalizationModel> getLocalizationsList(
    Map<String, String> queryParameters,
  ) async {
    try {
      final response = await client.post(
        'https://unified-qa.digit.org/localization/messages/v1/_search',
        queryParameters: queryParameters,
        data: {},
      );

      final responseBody = LocalizationModel.fromJson(response.data);

      return responseBody;
    } catch (err) {
      rethrow;
    }
  }
}
