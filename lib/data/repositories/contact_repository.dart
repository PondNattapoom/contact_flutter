import '/data/index.dart';

class ContactRepository {
  late List<Contact> contacts;
  var apiService = ApiService();

  // Define global variables
  late Contact currentItem;

  void setRepoContact(Contact contact) {
    currentItem = contact;
  }

  Contact getRepoContact() {
    return currentItem;
  }

  Future<List<Contact>> getAllContacts() async {
    contacts = await apiService.getContacts() as List<Contact>;
    return contacts;
  }

  Future<bool> saveContacts(Contact contact) async {
    bool status = await apiService.addContact(contact);
    return status;
  }

  Future<bool> updateContacts(Contact contact) async {
    bool status = await apiService.editContact(contact);
    return status;
  }

  Future<bool> deleteContacts(Contact contact) async {
    bool status = await apiService.deleteContact(contact);
    return status;
  }
}
