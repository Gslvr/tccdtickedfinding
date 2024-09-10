class KoltukDurum {
  bool engellikoltuk = false;
  dynamic koltukNo = 0;
  dynamic vagonSiraNo = 0;
  dynamic saat;

  KoltukDurum(
      {required this.engellikoltuk,
      required this.koltukNo,
      required this.vagonSiraNo,
      this.saat});

  Map<String, dynamic> toJson() {
    return {
      'engellikoltuk': engellikoltuk,
      'koltukNo': koltukNo,
      'vagonSiraNo': vagonSiraNo,
      'saat': saat
    };
  }

     KoltukDurum copyWith({
    bool? engellikoltuk,
    dynamic koltukNo,
    dynamic vagonSiraNo,
    String? saat,
}){
    return KoltukDurum(
      engellikoltuk: engellikoltuk??this.engellikoltuk,
      koltukNo: koltukNo??this.koltukNo,
      vagonSiraNo: vagonSiraNo??this.vagonSiraNo,
      saat: saat??this.saat);
}
}
