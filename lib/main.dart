import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/index.dart';
import 'data/index.dart';
import 'logic/index.dart';
import 'presentation/index.dart';

Future main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter appRouter = AppRouter();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ContactCubit(
            contactRepository: ContactRepository(),
          ),
        ),
        BlocProvider(
          create: (context) => CounterCubit(
            counterRepository: CounterRepository(),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: true,
        themeMode: ThemeMode.light,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        initialRoute: ContactCubitList.id,
        routes: AppRouter.routeScreens,
      ),
    );
  }
}
