import 'package:rider/models/order_data.dart';

class Order {
  String _id;
  String _date;
  String _zone;
  String _taka;
  String _status;
  OrderData _pickup;
  OrderData _delivery;
  Order(this._id, this._date, this._zone, this._taka, this._status,this._pickup,this._delivery);

  String getId() => _id;
  String getDate() => _date;
  String getZone() => _zone;
  String getTata() => _taka;
  String getStatus() => _status;
  OrderData getPickupInfo()=> _pickup;
  OrderData getDeliveryInfo()=> _delivery;
}
