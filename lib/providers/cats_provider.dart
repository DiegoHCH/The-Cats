import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_cats/models/cat.dart';
import 'package:the_cats/services/http_service.dart';

final catsProvider = FutureProvider<List<Cat>>((ref) async {
  final service = HttpService.instance;
  return await service.fetchBreeds();
});