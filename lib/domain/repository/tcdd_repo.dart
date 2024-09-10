import 'package:dartz/dartz.dart';
import 'package:tcddbiletfinding/data/data.dart';
import 'package:tcddbiletfinding/data/model/vagon_koltuk.dart';
import '../../core/errors/errors.dart';
import 'package:injectable/injectable.dart';

abstract class IPostRepository{
  Future<Either<Failure, List<Map<String,dynamic>>>> getStationList
      ({required String url, required Map<String, dynamic> body});
  Future<Either<Failure, List<Map<String,dynamic>>>> getDateList
      ({required String url, required Map<String, dynamic> body});

  Future<Either<Failure, List<KoltukDurum>>> getSeats
      ({required String url, required Map<String, dynamic> body});
}

@Singleton(as: IPostRepository)
class PostRepository implements IPostRepository{
  TCDDConnect tcddConnect = TCDDConnect();

  @override
  Future<Either<Failure, List<Map<String, dynamic>>>> getDateList({required
  String url, required Map<String, dynamic> body}) async{
   try{
   final response = await tcddConnect.getStationList(url: url, body: body);
   if (response.isEmpty || response == null){
     return const Left(ListFailure(message: 'İstasyonlar getirilemedi'));
   }
   response.sort((a,body)=>a['istasyonAdi'].compareTo
     (body['istasyonAdi']));
   List<Map<String,dynamic>> istasyonListesi = response;

   return Right(istasyonListesi);
   }
   catch(e){
   print(e);
    return const Left(ListFailure(message: 'İstasyonlar getirilemedi'));
   }


  }


  @override
  Future<Either<Failure, List<Map<String, dynamic>>>> getStationList({required String url, required Map<String, dynamic> body}) async {
    try{
      final response = await tcddConnect.getDate(url: url, body: body);
      if (response.isEmpty || response == null){
        return const Left(ListFailure(message: 'İstasyonlar getirilemedi'));
      }

      List<Map<String,dynamic>> istasyonListesi = response;

      return Right(istasyonListesi);
    }
    catch(e){
      print(e);
      return const Left(ListFailure(message: 'İstasyonlar getirilemedi'));
    }
  }


  @override
  Future<Either<Failure, List<KoltukDurum>>> getSeats({
    required String url,
    required Map<String, dynamic> body,
  }) async {
    List<KoltukDurum> koltukListesi = [];
    List<String> errorMessages = [];

    try {
      final response = await tcddConnect.getVagon(url: url, body: body);
      if (response.isEmpty) {
        print("response is empty");
      } else {
        koltukListesi = response;
      }
    } catch (e) {
      errorMessages.add('$e');

    }

    if (errorMessages.contains('Api den veri alınamadı')) {
      return Left(ListFailure(message: errorMessages.join(', ')));
    } else {
      return Right(koltukListesi);
    }
  }

}


