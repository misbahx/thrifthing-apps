import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:thrifthing_app_kel4/route/list_product_state.dart';
import 'package:thrifthing_app_kel4/widget/error.dart';
import 'package:thrifthing_app_kel4/widget/loading.dart';
import 'package:thrifthing_app_kel4/pages/login.dart';
import 'package:thrifthing_app_kel4/services/Blocs/Authentication/login_bloc.dart';

class MainState extends StatelessWidget {
  const MainState({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        if (state is LoginInitial) return LoginPage();
        if (state is LoginLoading) return LoadingWidget();
        if (state is LoginSuccess) return ListProductMainState();
        if (state is LoginFailed) return ErrorNotif(message: state.error);
        return Container(
          child: Center(child: Text("State error")),
        );
      },
    );
  }
}
