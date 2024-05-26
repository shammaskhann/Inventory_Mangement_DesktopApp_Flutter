class ApiConstant {
  // static String baseUrl = 'http://192.168.18.122:3000'; //home
  //  static String baseUrl = 'http://10.133.148.237:3000/'; //office
  // static String baseUrl = 'http://10.133.150.112:3000';
  static String baseUrl =
      'https://rest-api-node-js-express-sql-server.vercel.app';
  // static String customerApi = '/api/customers';
  static String checkDbConnection = '/api/db-connection-status';

  // info block tag api
  static String tagGetNoOfOrdersToday = '/api/smalltaginfo/getNoOfOrdersToday';
  static String tagGetTotalSalesToday = '/api/smalltaginfo/getTotalSalesToday';
  static String tagGetTotalRevenue = '/api/smalltaginfo/getTotalRevenue';
  static String tagGetTotalProducts = '/api/smalltaginfo/getTotalProducts';
  static String tagGetTotalOrderPastWeek =
      '/api/smalltaginfo/getOrderCountPastWeek';
  static String graphPastWeekOrders = '/api/graph-charts/getPastWeekOrder';

  static String topVendorPieChart = '/api/graph-charts/getTopVendorPieChart';

  static String getShippers = '/api/shippers/getShippers';
  static String getSuppliers = '/api/suppliers/getSuppliers';
  static String getPurchaseOrder = '/api/purchaseOrder/getPurchaseOrder';

  static String getSalesChannel = '/api/saleschannel/getSalesChannel';
  static String getCustomers = '/api/customers/getCustomers';
  //Invoice
  static String getInvoiceID = '/api/invoices/getInvoice';
  static String getInvoices = '/api/invoices/getInvoices';
  //Product
  static String postCustomer = '/api/customers/addCustomer';
  static String top5SellingProducts = '/api/products//getTop5SellingProduct';
  static String getInventory = '/api/inventory/getInventory';

//Orders
  static String postOrder = '/api/orders/insertOrder';
  static String getOrderAccToParam = '/api/orders/getOrderAccToParam';
  //dropDowns
  static String shipperDropDown = '/api/dropdown/getShipperDropDown';
  static String customerDropDown = '/api/dropdown/getCustomerDropDown';
  static String discountDropDown = '/api/dropdown/getDiscountCodeDropDown';
  static String giftCardDropDown = '/api/dropdown/getGiftCardDropDown';
  static String productDropDown = '/api/dropdown/getProductsDropDown';
  static String saleChannelDropDown = '/api/dropdown/getSalesChannelDropDown';

  //discount
  static String getDiscount = '/api/discount/getDiscountCodes';
  static String postDiscount = '/api/discount/insertDiscountCode';

  //payment
  static String getPaymentByOrderID = '/api/payment/getPayment';

  //shipment & tracking
  static String getShipments = '/api/shipment/getShipments';
  static String getShipmentByOrderID = '/api/shipment/getShipment';
  static String updateShipmentStatus = '/api/shipment/updateShipmentStatus';
}
