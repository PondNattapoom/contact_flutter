import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/logic/index.dart';
import '/presentation/index.dart';

class ContactCubitList extends StatelessWidget {
  static const String id = 'ContactCubitList';
  const ContactCubitList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<CounterCubit>().funcGetCounter();
    context.read<ContactCubit>().funcGetAllContacts();

    return Scaffold(
      appBar: AppBar(
          title: BlocBuilder<CounterCubit, CounterState>(
            buildWhen: (previous, current) => current is EventGetCounter,
            builder: (context, state) {
              if (state is EventGetCounter) {
                var counter = state.counter;
                return Text('Cubit: List Contacts ($counter)');
              }
              return const Text('Cubit: Contacts');
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.add_card),
              onPressed: () => {
                Navigator.pushReplacementNamed(context, ContactCubitAdd.id),
              },
            ),
          ]),
      body: SafeArea(
        child: BlocBuilder<ContactCubit, ContactState>(
          buildWhen: (previous, current) => current is EventGetAllContacts,
          builder: (context, state) {
            if (state is EventGetAllContacts) {
              var contacts = state.contactData;
              return RefreshIndicator(
                onRefresh: () async {
                  context.read<ContactCubit>().funcGetAllContacts();
                },
                child: ListView.builder(
                  itemCount: contacts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(
                          '[${contacts[index].id}] Name: ${contacts[index].name}'),
                      subtitle: Text(
                          'Nick: ${contacts[index].nickname}, Social: ${contacts[index].social}, Mobile: ${contacts[index].mobile}'),
                      leading: const FlutterLogo(),
                      onTap: () {
                        context
                            .read<ContactCubit>()
                            .setCurrentContact(contacts[index]);
                        Navigator.pushReplacementNamed(
                            context, ContactCubitDetails.id);
                      },
                    );
                  },
                ),
              );
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
