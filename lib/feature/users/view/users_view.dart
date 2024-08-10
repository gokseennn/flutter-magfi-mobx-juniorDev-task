import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:magfi_dev_task/core/widgets/common_screen.dart';
import 'package:magfi_dev_task/feature/users/view/components/user_list_card.dart';
import 'package:magfi_dev_task/feature/users/viewmodel/users_view_model.dart';

class UsersView extends StatelessWidget {
  UsersView({super.key});
  final _viewModel = UsersViewModel();
  @override
  Widget build(BuildContext context) {
    return CommonScreen(
      viewModel: _viewModel,
      body: Observer(
        builder: (_) {
          return ListView.builder(
            itemCount: _viewModel.userList.length,
            itemBuilder: (context, index) {
              return UserListCardItem(user: _viewModel.userList[index]);
            },
          );
        },
      ),
    );
  }
}
