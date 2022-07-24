import 'package:flutter_getx_ttr/app/data/model/author.dart';
import 'package:flutter_getx_ttr/app/data/provider/api_provider.dart';

class ApiRepository {
  final _provider = UserProvider();
  Future<List<User>?> fetchListPremiumUser() {
    return _provider.fetchPremiumMember();
  }

  Future<List<User>?> fetchListNormalMember() {
    return _provider.fetchNormalMember();
  }
}

class NewWorkErr extends Error {}
