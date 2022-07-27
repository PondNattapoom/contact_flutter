import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/data/index.dart';
import '/logic/cubit/contact/contact_cubit.dart';
import '/presentation/index.dart';

class ContactCubitDetails extends StatelessWidget {
  static const String id = 'ContactCubitDetails';
  const ContactCubitDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<ContactCubit>().getCurrentContact();

    Future<void> showConfirmDialog(Contact contactObj, route) async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Confirm to delete contact'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const [
                  Text('Would you like to delete of this contact?'),
                ],
              ),
            ),
            actions: [
              TextButton(
                child: const Text('Okay'),
                onPressed: () async {
                  context.read<ContactCubit>().funcDeleteContact(contactObj);
                },
              ),
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit: Contact details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            print('back to list');
            Navigator.pushReplacementNamed(context, ContactCubitList.id);
          },
        ),
        actions: [
          BlocBuilder<ContactCubit, ContactState>(
            builder: (context, state) {
              return IconButton(
                icon: const Icon(Icons.delete_forever),
                onPressed: () {
                  if (state is GetContact) {
                    showConfirmDialog(state.contact, ContactCubitList.id);
                  }
                },
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: BlocListener<ContactCubit, ContactState>(
          listener: (context, state) {
            if (state is EventDeleteContact) {
              print('Success to delete contact to API');
              if (state.status == true) {
                Navigator.pushReplacementNamed(context, ContactCubitList.id);
              } else {
                print('Failed to save contact to API');
              }
            }
          },
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: BlocBuilder<ContactCubit, ContactState>(
                builder: (context, state) {
                  if (state is GetContact) {
                    return Column(
                      children: [
                        Text('Name: ${state.contact.name}'),
                        Text('Nickname: ${state.contact.nickname}'),
                        Text('Social: ${state.contact.social}'),
                        Text('Mobile: ${state.contact.mobile}'),
                        ElevatedButton(
                          onPressed: () {
                            print('update contact');
                            print(state.contact);

                            Navigator.pushReplacementNamed(
                                context, ContactCubitEdit.id);
                          },
                          child: const Text('Update'),
                        ),
                      ],
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
