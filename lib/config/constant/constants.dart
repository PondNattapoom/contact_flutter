class ApiConstants {
  // Version
  static const String appVersion = "0.0.19";

  // Production end-point
  static String endPoint = 'apix.muangthai.co.th';
  static String projectPath = 'MTLEIProjectAPI2/';

  static String mainTokenApp = '2a4c5a2fbcd7d459c7379d5ddc5ec4a2';
  static Map<String, String> headerApi = {
    'Content-Type': 'application/json; charset=UTF-8',
  };

  // UAT end-point
  static String baseUrl = 'www.senchabox.com';
  static String middleUrl = "/ionic/www_web_api/webservice";

  static String listContactApi = '$middleUrl/ws_list.php';
  static String addContactApi = '$middleUrl/ws_add.php';
  static String editContactApi = '$middleUrl/ws_update.php';
  static String deleteContactApi = '$middleUrl/ws_delete.php';

  static String successAddContact = 'success_insert';
  static String errorAddContact = 'error_insert';

  static String successDeleteContact = 'success_delete';
  static String errorDeleteContact = 'error_delete';

  static String successUpdateContact = 'success_update';
  static String errorUpdateContact = 'error_update';
}
