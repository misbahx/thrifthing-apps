import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:thrifthing_app_kel4/pages/mainstate.dart";
import "package:thrifthing_app_kel4/repository/login_repository.dart";
import "package:thrifthing_app_kel4/services/Blocs/Authentication/bloc/login_bloc.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [RepositoryProvider(create: (context) => LoginRepository())],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
                create: ((context) =>
                    LoginBloc(loginRepository: context.read<LoginRepository>())
                      ..add(LoginInitialEvent())))
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Thrifthing apps",
            home: MainState(),
          ),
        ));
  }
}
