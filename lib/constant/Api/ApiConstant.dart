class ApiConstant {
  static String baseUrl = 'http://192.168.18.123:3000'; //home
  //  static String baseUrl = 'http://10.133.148.237:3000/'; //office
  // static String baseUrl = 'http://10.133.137.111:3000';
  // static String baseUrl =
  //     'https://rest-api-node-js-express-sql-server.vercel.app';
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
}
