import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  bool _favoritetoggle = false;
  bool get favoritetoggle => _favoritetoggle;
  set favoritetoggle(bool value) {
    _favoritetoggle = value;
  }

  int _pizzaprice = 7000;
  int get pizzaprice => _pizzaprice;
  set pizzaprice(int value) {
    _pizzaprice = value;
  }

  int _tatoyakiprice = 4500;
  int get tatoyakiprice => _tatoyakiprice;
  set tatoyakiprice(int value) {
    _tatoyakiprice = value;
  }

  int _juiceprice = 5000;
  int get juiceprice => _juiceprice;
  set juiceprice(int value) {
    _juiceprice = value;
  }

  int _maratangprice = 7000;
  int get maratangprice => _maratangprice;
  set maratangprice(int value) {
    _maratangprice = value;
  }

  LatLng? _currentlocation = const LatLng(36.102232, 129.3897838);
  LatLng? get currentlocation => _currentlocation;
  set currentlocation(LatLng? value) {
    _currentlocation = value;
  }

  List<String> _fshop = [];
  List<String> get fshop => _fshop;
  set fshop(List<String> value) {
    _fshop = value;
  }

  void addToFshop(String value) {
    fshop.add(value);
  }

  void removeFromFshop(String value) {
    fshop.remove(value);
  }

  void removeAtIndexFromFshop(int index) {
    fshop.removeAt(index);
  }

  void updateFshopAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    fshop[index] = updateFn(_fshop[index]);
  }

  void insertAtIndexInFshop(int index, String value) {
    fshop.insert(index, value);
  }

  List<String> _shopimage = [];
  List<String> get shopimage => _shopimage;
  set shopimage(List<String> value) {
    _shopimage = value;
  }

  void addToShopimage(String value) {
    shopimage.add(value);
  }

  void removeFromShopimage(String value) {
    shopimage.remove(value);
  }

  void removeAtIndexFromShopimage(int index) {
    shopimage.removeAt(index);
  }

  void updateShopimageAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    shopimage[index] = updateFn(_shopimage[index]);
  }

  void insertAtIndexInShopimage(int index, String value) {
    shopimage.insert(index, value);
  }

  List<String> _orderlist = [];
  List<String> get orderlist => _orderlist;
  set orderlist(List<String> value) {
    _orderlist = value;
  }

  void addToOrderlist(String value) {
    orderlist.add(value);
  }

  void removeFromOrderlist(String value) {
    orderlist.remove(value);
  }

  void removeAtIndexFromOrderlist(int index) {
    orderlist.removeAt(index);
  }

  void updateOrderlistAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    orderlist[index] = updateFn(_orderlist[index]);
  }

  void insertAtIndexInOrderlist(int index, String value) {
    orderlist.insert(index, value);
  }

  int _totalprice = 0;
  int get totalprice => _totalprice;
  set totalprice(int value) {
    _totalprice = value;
  }

  String _email = '';
  String get email => _email;
  set email(String value) {
    _email = value;
  }

  String _phonenumber = '';
  String get phonenumber => _phonenumber;
  set phonenumber(String value) {
    _phonenumber = value;
  }
}
