import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:magfi_dev_task/core/widgets/shimmer.dart';
import '../base/base_view_model.dart';

class CommonScreen<T extends BaseViewModel> extends StatelessWidget {
  final T viewModel;
  final int shimmerItemCount;
  final Widget body;

  const CommonScreen({
    super.key,
    required this.viewModel,
    required this.body,
    this.shimmerItemCount = 10,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: FutureBuilder(
              future: viewModel.dataFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const ShimmerList();
                } else if (snapshot.hasError) {
                  return Center(
                      child: Text('Bir hata oluştu: ${snapshot.error}'));
                } else {
                  return body; // Veri başarıyla yüklendiğinde body widget'ı gösterilecek
                }
              },
            ),
          ),
        );
      },
    );
  }
}
