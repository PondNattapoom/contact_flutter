import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/logic/cubit/contact/contact_cubit.dart';
import '/config/index.dart';
import '/data/index.dart';

import '/presentation/index.dart';

class ContactCubitAdd extends StatelessWidget {
  static const String id = 'ContactCubitAdd';

  ContactCubitAdd({Key? key}) : super(key: key);

  final nameController = TextEditingController();
  final nickController = TextEditingController();
  final socialController = TextEditingController();
  final mobileController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit: Contact Add form'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => {
            // print('back to list')
            Navigator.pushReplacementNamed(context, ContactCubitList.id),
          },
        ),
      ),
      body: SafeArea(
        child: BlocListener<ContactCubit, ContactState>(
          listener: (context, state) {
            if (state is EventSaveContact) {
              print('Success to save contact to API');
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
              child: Form(
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
                        if (formKey.currentState!.validate()) {
                          var contactObj = Contact(
                            name: nameController.text,
                            nickname: nickController.text,
                            social: socialController.text,
                            mobile: mobileController.text,
                          );
                          context
                              .read<ContactCubit>()
                              .funcSaveContact(contactObj);
                        }
                      },
                      child: const Text('Save'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
