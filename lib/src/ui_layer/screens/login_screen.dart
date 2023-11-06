import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netcarrots_task/src/business_layer/blocs/auth/auth_bloc.dart';
import 'package:netcarrots_task/src/business_layer/blocs/auth/auth_state.dart';
import 'package:netcarrots_task/src/business_layer/localization/app_localizations.dart';
import 'package:netcarrots_task/src/business_layer/util/helper/screen_navigation_helper.dart';
import 'package:netcarrots_task/src/business_layer/util/helper/util_helper.dart';
import 'package:netcarrots_task/src/data_layer/res/styles.dart';
import 'package:netcarrots_task/src/ui_layer/screens/otp_verification_screen.dart';
import 'package:netcarrots_task/src/ui_layer/widgets/app-text_fields.dart';
import 'package:netcarrots_task/src/ui_layer/widgets/app_buttons.dart';
import 'package:netcarrots_task/src/ui_layer/widgets/appbar_widget.dart';
import 'package:netcarrots_task/src/ui_layer/widgets/progress_helper.dart';
import 'package:netcarrots_task/src/ui_layer/widgets/toast_helper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _mobileNumberController = TextEditingController();

  @override
  void dispose() {
    _mobileNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: _blocListener,
      builder: (context, state) {
        return Stack(
          children: [
            Scaffold(
              appBar: AppBarWidget(
                title: AppLocalizations.current.login,
              ),
              body: _mainWidget(context),
            ),
            if (state is LoadingState) const ProgressBar(),
          ],
        );
      },
    );
  }

  Widget _mainWidget(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: AppStyles.pd20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _scrollWidget(),
            ),
            CommonAppButton(
              title: AppLocalizations.current.login,
              onPressed: _handleLogin,
            ),
          ],
        ),
      ),
    );
  }

  Widget _scrollWidget() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.current.allFieldsAreMandatory,
            style: AppStyles.mainNormal14,
          ),
          AppStyles.sbHeight10,
          Text(
            AppLocalizations.current.mobileNo,
            style: AppStyles.mainBold14,
          ),
          AppStyles.sbHeight10,
          CommonTextField(
            controller: _mobileNumberController,
            hint: "",
            maxLength: 10,
            keyboardType: TextInputType.phone,
          ),
        ],
      ),
    );
  }

  void _blocListener(BuildContext context, AuthState state) {
    if (state is LoginSuccessState) {
      Navigator.push(
        context,
        ScreenNavigation.createRoute(
          widget: OtpVerificationScreen(
            captchaCode: state.captchaCode,
            mobileNumber: _mobileNumberController.text.trim(),
          ),
        ),
      );
    } else if (state is LoginErrorState) {
      ToastHelper.showToast(context, state.errorMessage);
    }
  }

  void _handleLogin() {
    UtilHelper.instance.closeKeyboard(context);
    context.read<AuthBloc>().login(
          mobileNumber: _mobileNumberController.text.trim(),
        );
  }
}
