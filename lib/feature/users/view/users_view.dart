import 'package:flutter/material.dart';
import 'package:magfi_dev_task/core/widgets/common_screen.dart';
import 'package:magfi_dev_task/feature/users/view/components/user_list_card.dart';

class UsersView extends StatelessWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScreen(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => const UserListCardItem(),
      ),
    );
  }
}
