import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_production_app/application/auth/auth_cubit.dart';
import 'package:flutter_production_app/presentation/common_widgets/colors.dart';
import 'package:flutter_production_app/presentation/pages/onboarding/constants/texts.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key, required this.authState, required this.btnController});
  final AuthState authState;
  final RoundedLoadingButtonController btnController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RoundedLoadingButton(
        color: kiwiColor.withOpacity(0.8),
        failedIcon: CupertinoIcons.xmark,
        successIcon: CupertinoIcons.checkmark,
        controller: btnController,
        onPressed: () {
          btnController.reset();
          context.read<AuthCubit>().createProfile();
        },
        animateOnTap: false,
        child: const Text(
          createYourProfile,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}