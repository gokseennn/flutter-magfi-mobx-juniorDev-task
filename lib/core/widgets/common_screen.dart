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
                  return ListView.builder(
                    itemCount: shimmerItemCount,
                    itemBuilder: (context, index) {
                      return ShimmerWidget(
                        child: ListTile(
                          leading: const CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.white,
                          ),
                          title: Container(
                            width: double.infinity,
                            height: 16,
                            color: Colors.white,
                          ),
                          subtitle: Container(
                            width: double.infinity,
                            height: 14,
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                  );
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
