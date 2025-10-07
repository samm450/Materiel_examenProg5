
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';

import 'animal.dart';
//import 'models/SessionManager.dart';

class SingletonDio {
  static var cookieManager = CookieManager(CookieJar());

  static Dio getDio() {
    Dio dio = Dio();
    dio.interceptors.add(cookieManager);

    return dio;
  }
}


class ZooService {
  static const String baseUrl = 'http://10.0.2.2:8080';

  static Future<List<Animal>> getAnimal(String continent,
      String famille) async {
    final response = await SingletonDio.getDio().get(
        '$baseUrl/exam/animaux/$continent?famille=$famille');
    List animauxjson = response.data;

    List<Animal> animaux = animauxjson
        .map((json) => Animal.fromJson(json))
        .toList();

    return animaux;
  }
/*
  static Future<void> UpdateProgress(int tacheId, int valeur) async {

    await SingletonDio.getDio().get('$baseUrl/tache/progres/$tacheId/$valeur');
  }

  static Future<Tache> TacheDetail(int id) async{
    final response = await SingletonDio.getDio().get('$baseUrl/tache/detail/$id');
    return Tache.fromJson(response.data);
  }

  static Future<void> AjoutTache(String nom, DateTime dateEcheance) async {
    final nomUtilisateur = SessionManager.nomUtilisateur;
    await SingletonDio.getDio().post('$baseUrl/tache/ajout',
        data: {'nom': nom, 'dateEcheance': dateEcheance.toIso8601String(), 'nomUtilisateur': nomUtilisateur});

    //return Tache.fromJson(response.data);
  }





*/
}