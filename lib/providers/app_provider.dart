import 'package:flutter/material.dart';

import '../data_models/piece_data_model.dart';

class AppProvider extends ChangeNotifier {
  List<PieceModel> listOfPieces = [];

  void addPieceToList(PieceModel piece) {
    listOfPieces.add(piece);
    //notifyListeners();
  }

  Future<List<PieceModel>> getPieceList() async {
    return listOfPieces;
  }
}
