import 'package:space_x/common/app_urls.dart';
import 'package:space_x/services/network/common/response_extension.dart';
import 'package:space_x/features/rockets/data/models/rocket.dart';
import 'package:space_x/services/network/common/api_exeption.dart';
import 'package:space_x/services/network/api_manager.dart';

abstract class IRocketsDataSource {
  Future<List<Rocket>> loadRockets();
  Future<Rocket> loadRocket(String id);
}

class RocketsDataSource implements IRocketsDataSource {
  @override
  Future<List<Rocket>> loadRockets() async {
    final response = await ApiManager.shared.get(AppUrls.rockets);

    late final jsonList = response?.data as List<dynamic>?;
    if (response?.isSuccess == true && jsonList != null) {
      return jsonList
          .map((x) => Rocket.fromJson(x as Map<String, dynamic>))
          .toList();
    }

    throw ApiException.from(response);
  }

  @override
  Future<Rocket> loadRocket(String id) async {
    final response = await ApiManager.shared.get('${AppUrls.rockets}/$id');

    late final data = response?.data as Map<String, dynamic>?;
    if (response?.isSuccess == true && data != null) {
      return Rocket.fromJson(data);
    }

    throw ApiException.from(response);
  }
}
