// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:prize/features/orders/data/models/order_state_and_translation.dart';

class OrderModel {
  final String orderId;
  final DateTime orderPlaced;
  final OrderState orderState;
  final List<OrderProductDataModel> orderProductDataModel;
  const OrderModel({
    required this.orderId,
    required this.orderPlaced,
    required this.orderState,
    required this.orderProductDataModel,
  });
}


class OrderProductDataModel {
  final String productImageUrl;
  final int productCount;
  final double productPrice;
  OrderProductDataModel({
    required this.productImageUrl,
    required this.productCount,
    required this.productPrice,
  });
}
