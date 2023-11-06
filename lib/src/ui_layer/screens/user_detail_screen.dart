import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netcarrots_task/src/business_layer/blocs/user/user_bloc.dart';
import 'package:netcarrots_task/src/business_layer/blocs/user/user_state.dart';
import 'package:netcarrots_task/src/business_layer/localization/app_localizations.dart';
import 'package:netcarrots_task/src/business_layer/util/helper/screen_navigation_helper.dart';
import 'package:netcarrots_task/src/data_layer/local_db/user_state_hive_helper.dart';
import 'package:netcarrots_task/src/data_layer/models/response_models/login_response_model.dart';
import 'package:netcarrots_task/src/data_layer/res/styles.dart';
import 'package:netcarrots_task/src/ui_layer/screens/login_screen.dart';
import 'package:netcarrots_task/src/ui_layer/widgets/appbar_widget.dart';
import 'package:netcarrots_task/src/ui_layer/widgets/network_image_widget.dart';
import 'package:netcarrots_task/src/ui_layer/widgets/progress_helper.dart';

class UserDetailScreen extends StatefulWidget {
  const UserDetailScreen({super.key});

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UserBloc>().fetchUserDetail();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: AppLocalizations.current.userDetailScreen,
        rightIcon: Icons.logout,
        onRightIconTap: () {
          UserStateHiveHelper.instance.logOut();
          Navigator.pushAndRemoveUntil(
            context,
            ScreenNavigation.createRoute(widget: const LoginScreen()),
            (route) => false,
          );
        },
      ),
      body: SafeArea(child: _mainWidget(context)),
    );
  }

  Widget _mainWidget(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is LoadingUserState) {
          return const ProgressBar(opacity: 0);
        } else if (state is UserLoadedSuccessState) {
          return SingleChildScrollView(
            padding: AppStyles.pd20,
            child: _scrollWidget(state.userResponse),
          );
        } else if (state is UserLoadedFailedState) {
          return Text(
            state.message,
            style: AppStyles.mainNormal14,
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  Widget _scrollWidget(UserResponse userResponse) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: SizedBox(
              height: 100,
              child: NetworkImageWidget(
                url: userResponse.profileImage,
              ),
            ),
          ),
        ),
        AppStyles.sbHeight20,
        _addField(AppLocalizations.current.name, userResponse.userName),
        _addField(AppLocalizations.current.mobileNumber, userResponse.mobileNo),
        _addField(AppLocalizations.current.dateOfBirth, userResponse.dateOfBirth),
        _addField(AppLocalizations.current.designation, userResponse.designation),
        _addField(AppLocalizations.current.memberType, userResponse.memberType),
        _addField(AppLocalizations.current.firmName, userResponse.firmName),
        AppStyles.sbHeight10,
      ],
    );
  }

  Widget _addField(String title, String? value) {
    return Padding(
      padding: AppStyles.pdV6,
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: AppStyles.mainBold14,
            ),
          ),
          Expanded(
            child: Text(
              value ?? "",
              textAlign: TextAlign.end,
              style: AppStyles.mainNormal14,
            ),
          ),
        ],
      ),
    );
  }
}
