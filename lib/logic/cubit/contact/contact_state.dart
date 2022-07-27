part of 'contact_cubit.dart';

abstract class ContactState extends Equatable {
  @override
  List<Object> get props => [];
}

class ContactInitial extends ContactState {
  ContactInitial();
}

class ChangeContact extends ContactState {
  ChangeContact();
}

class GetContact extends ContactState {
  final Contact contact;
  GetContact({required this.contact});

  @override
  List<Object> get props => [contact];
}

class EventGetAllContacts extends ContactState {
  final List<Contact> contactData;
  EventGetAllContacts({required this.contactData});

  @override
  List<Object> get props => [contactData];
}

class EventSaveContact extends ContactState {
  final bool status;
  EventSaveContact({required this.status});

  @override
  List<Object> get props => [status];
}

class EventUpdateContact extends ContactState {
  final bool status;
  EventUpdateContact({required this.status});

  @override
  List<Object> get props => [status];
}

class EventDeleteContact extends ContactState {
  final bool status;
  EventDeleteContact({required this.status});

  @override
  List<Object> get props => [status];
}
