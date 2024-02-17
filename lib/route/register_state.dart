import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:thrifthing_app_kel4/pages/register.dart';
import 'package:thrifthing_app_kel4/services/Blocs/Register/register_bloc.dart';
import 'package:thrifthing_app_kel4/widget/error.dart';
import 'package:thrifthing_app_kel4/widget/loading.dart';

class RegisterMainState extends StatelessWidget {
  const RegisterMainState({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        if (state is RegisterInitial) return RegisterPage();
        if (state is RegisterLoading) return LoadingWidget();
        if (state is RegisterSuccess) return ErrorNotif(message: state.message);
        if (state is RegisterFailed) return ErrorNotif(message: state.error);
        return Container(
          child: Center(child: Text("State error")),
        );
      },
    );
  }
}
