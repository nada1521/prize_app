// ignore_for_file: public_member_api_docs, sort_constructors_first
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

enum OrderState {
  inProgress,
  delivered,
  cancelled,
  ordered,
  confirmed,
  shipped,
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
