import 'dart:math';

import 'package:apphotels/Models/NearByhotels.dart';
import 'package:apphotels/GloabalVariables.dart';

class FireHelper {
  static List<NearByHotels> nearbyhotelList = [];
  static void removeFromList(String key) {
    int index = nearbyhotelList.indexWhere((element) => element.key == key);
    nearbyhotelList.remove(index);
  }

  static void updateLocation(NearByHotels nearByHotels) {
    int index = nearbyhotelList
        .indexWhere((element) => element.key == nearByHotels.key);
    nearbyhotelList[index].latitude = nearByHotels.latitude;
    nearbyhotelList[index].longitute = nearByHotels.longitute;
  }

  static double generateRandomNumbers(int max) {
    var randomGenertor = Random();
    int randInt = randomGenertor.nextInt(max);
    return randInt.toDouble();
  }
}
