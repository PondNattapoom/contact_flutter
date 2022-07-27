// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';
import '/config/index.dart';
import '/data/index.dart';

class ApiService {
  Future<List<Contact>> getContacts() async {
    NetworkDemo networkHelper = NetworkDemo();
    final objectJsonDecode =
        await networkHelper.getDataAPI(ApiConstants.listContactApi);
    List<Map<String, dynamic>> resources =
        List<Map<String, dynamic>>.from(objectJsonDecode['results']);
    final listResources = resources.map((e) => Contact.fromJson(e)).toList();
    return listResources;
  }

  Future<bool> addContact(Contact contact) async {
    try {
      var params = jsonEncode(contact.toJson());
      NetworkDemo networkHelper = NetworkDemo();
      Map<String, dynamic> responseStatus =
          await networkHelper.postDataAPI(ApiConstants.addContactApi, params);

      // ['results'] come from custom text form API isn't default property
      if (responseStatus['results'] == ApiConstants.successAddContact) {
        print('Saved contact to API');
        return true;
      } else {
        print('Failed save contact to API');
        return false;
      }
    } catch (e) {
      print(e);
    }
    return false;
  }

  Future<bool> deleteContact(Contact contact) async {
    try {
      var params = jsonEncode(contact.toJson());
      NetworkDemo networkHelper = NetworkDemo();
      Map<String, dynamic> responseStatus = await networkHelper.postDataAPI(
          ApiConstants.deleteContactApi, params);

      // ['results'] come from custom text form API isn't default property
      if (responseStatus['results'] == ApiConstants.successDeleteContact) {
        print('Deleted contact from API');
        return true;
      } else {
        print('Failed delete contact from API');
        return false;
      }
    } catch (e) {
      print(e);
    }
    return false;
  }

  Future<bool> editContact(Contact contact) async {
    try {
      var params = jsonEncode(contact.toJson());
      NetworkDemo networkHelper = NetworkDemo();
      Map<String, dynamic> responseStatus =
          await networkHelper.postDataAPI(ApiConstants.editContactApi, params);

      // ['results'] come from custom text form API isn't default property
      if (responseStatus['results'] == ApiConstants.successUpdateContact) {
        print('Updated contact to API');
        return true;
      } else {
        print('Failed update contact to API');
        return false;
      }
    } catch (e) {
      print(e);
    }
    return false;
  }
}
