import 'package:flutter/material.dart';
import 'package:hng_task1/model/advice_model.dart';
import 'package:hng_task1/services/network_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _networkHelper = NetworkHelper();
  AdviceModel? _response;

  @override
  void initState() {
    _makeRequest();
    super.initState();
  }

  void _makeRequest() async {
    final response = await _networkHelper.networkSercive();
    setState(() {
      _response = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 200, right: 50, left: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Hello World!!',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 200,
                  ),
                  if (_response != null)
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              'Adivce id:',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.purpleAccent),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text('${_response?.slip.id}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                )),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          '${_response?.slip.advice}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                ],
              ),
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.only(bottom: 40),
              child: Text(
                'click the button to get a random advice.',
                style: TextStyle(fontSize: 10),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _makeRequest,
        tooltip: 'Get Advice',
        child: const Icon(Icons.add),
      ),
    );
  }
}
