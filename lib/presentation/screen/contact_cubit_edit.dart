import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/config/index.dart';
import '/data/index.dart';
import '/logic/cubit/contact/contact_cubit.dart';
import '/presentation/index.dart';

class ContactCubitEdit extends StatelessWidget {
  static const String id = 'ContactCubitEdit';

  ContactCubitEdit({Key? key}) : super(key: key);

  final idController = TextEditingController();
  final nameController = TextEditingController();
  final nickController = TextEditingController();
  final socialController = TextEditingController();
  final mobileController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    context.read<ContactCubit>().getCurrentContact();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit: Contact Edit form'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => {
            Navigator.pushReplacementNamed(context, ContactCubitList.id),
          },
        ),
      ),
      body: SafeArea(
        child: BlocListener<ContactCubit, ContactState>(
          listener: (context, state) {
            if (state is EventUpdateContact) {
              print('Success to update contact to API');
              if (state.status == true) {
                Navigator.pushReplacementNamed(context, ContactCubitList.id);
              } else {
                print('Failed to update contact to API');
              }
            }
          },
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: BlocBuilder<ContactCubit, ContactState>(
                builder: (context, state) {
                  if (state is GetContact) {
                    idController.text = state.contact.id!;
                    nameController.text = state.contact.name!;
                    nickController.text = state.contact.nickname!;
                    socialController.text = state.contact.social!;
                    mobileController.text = state.contact.mobile!;
                    return Form(
                      key: formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: nameController,
                            decoration: const InputDecoration(
                              icon: Icon(
                                Icons.person,
                                color: kPrimaryColor,
                              ),
                              hintText: 'Name',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter name';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: nickController,
                            decoration: const InputDecoration(
                              icon: Icon(
                                Icons.person,
                                color: kPrimaryColor,
                              ),
                              hintText: 'Nick name',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter nick';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: socialController,
                            decoration: const InputDecoration(
                              icon: Icon(
                                Icons.social_distance,
                                color: kPrimaryColor,
                              ),
                              hintText: 'Social',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter social';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: mobileController,
                            decoration: const InputDecoration(
                              icon: Icon(
                                Icons.mobile_friendly,
                                color: kPrimaryColor,
                              ),
                              hintText: 'Mobile',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter mobile';
                              }
                              return null;
                            },
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              print(formKey.currentState!.validate());
                              if (formKey.currentState!.validate()) {
                                var contactObj = Contact(
                                  id: idController.text,
                                  name: nameController.text,
                                  nickname: nickController.text,
                                  social: socialController.text,
                                  mobile: mobileController.text,
                                );
                                context
                                    .read<ContactCubit>()
                                    .funcUpdateContact(contactObj);
                              }
                            },
                            child: const Text('Update'),
                          ),
                        ],
                      ),
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
