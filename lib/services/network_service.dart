import 'package:hng_task1/model/advice_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final url = 'https://api.adviceslip.com/advice';
  Future<AdviceModel> networkSercive() async {
    final response = await http.get(Uri.parse(url));

    var body = response.body;

    var data = jsonDecode(body);
    print(data);
    return AdviceModel.fromJson(data);
  }
}
