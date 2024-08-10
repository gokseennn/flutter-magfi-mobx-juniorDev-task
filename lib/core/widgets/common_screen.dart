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
                  //Eğer sayfa yükleme durumunda ise Shimmer göstererek kullanıcıyı bilgilendiriyor
                  return const ShimmerList();
                } else if (viewModel.errorMessage != "") {
                  //[errorMessage] fonksiyonu sadece hata durumunda dolu olduğu için hata varsa ekrana hata mesajı ve yeniden
                  //çağırma fonksiyonu için buton ekleniyor
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Bir Hata Oluştu ", //${viewModel.errorMessage} bu şekilde error mesajıda gösterilebilir tercih meselesi
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        ElevatedButton(
                            onPressed: viewModel
                                .refreshData, //[BaseViewModel] içindeki refreshdata ile sayfa tekrar yükleniyor
                            child: const Text("Yeniden Dene"))
                      ],
                    ),
                  );
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
