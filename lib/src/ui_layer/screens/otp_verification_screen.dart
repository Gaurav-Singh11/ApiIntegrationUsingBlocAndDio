// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netcarrots_task/src/business_layer/blocs/auth/auth_bloc.dart';
import 'package:netcarrots_task/src/business_layer/blocs/auth/auth_state.dart';
import 'package:netcarrots_task/src/business_layer/localization/app_localizations.dart';
import 'package:netcarrots_task/src/business_layer/util/helper/screen_navigation_helper.dart';
import 'package:netcarrots_task/src/business_layer/util/helper/util_helper.dart';
import 'package:netcarrots_task/src/data_layer/res/styles.dart';
import 'package:netcarrots_task/src/ui_layer/screens/user_detail_screen.dart';
import 'package:netcarrots_task/src/ui_layer/widgets/app-text_fields.dart';
import 'package:netcarrots_task/src/ui_layer/widgets/app_buttons.dart';
import 'package:netcarrots_task/src/ui_layer/widgets/appbar_widget.dart';
import 'package:netcarrots_task/src/ui_layer/widgets/progress_helper.dart';
import 'package:netcarrots_task/src/ui_layer/widgets/toast_helper.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String? captchaCode;
  final String mobileNumber;

  const OtpVerificationScreen({
    super.key,
    required this.captchaCode,
    required this.mobileNumber,
  });

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final _otpController = TextEditingController();
  final _captchaController = TextEditingController();

  @override
  void dispose() {
    _otpController.dispose();
    _captchaController.dispose();
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
                title: AppLocalizations.current.otpScreen,
                shouldShowBackButton: true,
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
              title: AppLocalizations.current.verify,
              onPressed: _handleOtpVerification,
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
            AppLocalizations.current.otp,
            style: AppStyles.mainBold14,
          ),
          AppStyles.sbHeight10,
          CommonTextField(
            controller: _otpController,
            hint: "",
            maxLength: 6,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.phone,
          ),
          AppStyles.sbHeight10,
          Row(
            children: [
              Expanded(
                child: Text(
                  AppLocalizations.current.captchaCode,
                  style: AppStyles.mainBold14,
                ),
              ),
              Text(
                widget.captchaCode ?? "",
                style: AppStyles.mainNormal14,
              ),
              IconButton(
                onPressed: _handleCaptchaCodeCopy,
                icon: const Icon(Icons.copy),
              )
            ],
          ),
          AppStyles.sbHeight10,
          CommonTextField(
            controller: _captchaController,
            hint: "",
            maxLength: 4,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.phone,
          ),
          AppStyles.sbHeight10,
        ],
      ),
    );
  }

  void _handleOtpVerification() {
    UtilHelper.instance.closeKeyboard(context);
    context.read<AuthBloc>().verifyOtp(
          otp: _otpController.text.trim(),
          mobile: widget.mobileNumber.trim(),
          captcha: _captchaController.text.trim(),
        );
  }

  void _blocListener(BuildContext context, AuthState state) {
    if (state is OtpVerificationSuccessState) {
      Navigator.pushAndRemoveUntil(
        context,
        ScreenNavigation.createRoute(widget: const UserDetailScreen()),
        (route) => false,
      );
    } else if (state is OtpVerificationErrorState) {
      ToastHelper.showToast(context, state.errorMessage);
    }
  }

  void _handleCaptchaCodeCopy() async {
    await Clipboard.setData(ClipboardData(text: widget.captchaCode ?? ""));
    ToastHelper.showToast(context, AppLocalizations.current.captchaCopied, error: false);
  }
}
