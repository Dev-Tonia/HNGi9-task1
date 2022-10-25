class AdviceModel {
  final Slip slip;
  AdviceModel({required this.slip});
  factory AdviceModel.fromJson(Map<String, dynamic> data) {
    final slipJson = data['slip'];
    final slip = Slip.fromJson(slipJson);
    return AdviceModel(slip: slip);
  }
}

class Slip {
  Slip({
    required this.id,
    required this.advice,
  });

  final int id;
  final String advice;

  factory Slip.fromJson(Map<String, dynamic> json) {
    final id = json['id'];
    final advice = json['advice'];
    return Slip(id: id, advice: advice);
  }
}
