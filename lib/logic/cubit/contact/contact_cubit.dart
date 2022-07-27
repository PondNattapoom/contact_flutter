import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/data/index.dart';

part 'contact_state.dart';

class ContactCubit extends Cubit<ContactState> {
  ContactCubit({required this.contactRepository}) : super(ContactInitial());
  final ContactRepository contactRepository;

  void setCurrentContact(Contact contactObj) async {
    contactRepository.setRepoContact(contactObj);
    emit(ChangeContact());
  }

  void getCurrentContact() async {
    Contact contactObj = contactRepository.getRepoContact();
    emit(GetContact(contact: contactObj));
  }

  void funcGetAllContacts() async {
    var contacts = await contactRepository.getAllContacts();
    emit(EventGetAllContacts(contactData: contacts));
  }

  void funcSaveContact(Contact contactObj) async {
    bool status = await contactRepository.saveContacts(contactObj);
    emit(EventSaveContact(status: status));
  }

  void funcUpdateContact(Contact contactObj) async {
    bool status = await contactRepository.updateContacts(contactObj);
    emit(EventUpdateContact(status: status));
  }

  void funcDeleteContact(Contact contactObj) async {
    bool status = await contactRepository.deleteContacts(contactObj);
    emit(EventDeleteContact(status: status));
  }
}
