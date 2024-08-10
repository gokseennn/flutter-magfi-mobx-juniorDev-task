import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';

part 'base_view_model.g.dart';

class BaseViewModel = _BaseViewModel with _$BaseViewModel;

abstract class _BaseViewModel with Store {
  @observable
  ObservableFuture?
      dataFuture; // UI'nin veri yükleme durumunu izlemek için kullanılan observable bir Future

  @observable
  String errorMessage =
      ''; // Olası hata mesajını tutmak için kullanılan observable bir string

  _BaseViewModel() {
    init(); // ViewModel oluşturulduğunda otomatik olarak init fonksiyonunu çağırır
  }

  @action
  Future<void> init() async {
    // ViewModel'in başlatma fonksiyonu. OnInit'i runWithLoading içinde çalıştırır.
    await runWithLoading(() async {
      await onInit(); // Alt sınıflar tarafından implemente edilen verileri yükleme işlemini başlatır
    });
  }

  @action
  Future<T?> runWithLoading<T>(Future<T> Function() task) async {
    // Bir işlemi yükleme durumunda çalıştırır ve sonuçları yönetir
    try {
      dataFuture = ObservableFuture(task());
      return await dataFuture as T; // İşlemin sonucunu döndürür
    } catch (e) {
      handleError(e.toString()); // Hata meydana gelirse hata mesajını işler
      return null; // Hata durumunda null döndürür
    } finally {
      dataFuture =
          null; // İşlem tamamlandığında veya hata durumunda dataFuture'u null yapar
    }
  }

  @action
  Future<void> refreshData() async {
    //Herhangi bir hata durmunda init fonksiyonu içindekilerin tekrar çağırılması için belki tek fonksiyona düşürülebilir
    errorMessage = "";
    runInAction(() {
      dataFuture = null;
    });
    await init(); // init fonksiyonu onInit'i çağırarak gerekli veriyi yükleyecek
  }

  @action
  void handleError(message) {
    errorMessage = message;
  }

  // Alt sınıflar tarafından implement edilecek
  Future<void> onInit() async {}

  @action
  void handleDioError(DioException error) {
    //Hata kodları daha fazla eklenebilir !!!
    if (error.type == DioExceptionType.connectionTimeout) {
      errorMessage = 'Bağlantı zaman aşımına uğradı. Lütfen tekrar deneyin.';
    } else if (error.type == DioExceptionType.receiveTimeout) {
      errorMessage = 'Sunucu yanıt vermiyor. Lütfen tekrar deneyin.';
    } else if (error.response?.statusCode == 404) {
      errorMessage = 'Kaynak bulunamadı.';
    } else {
      errorMessage = 'Bir hata oluştu: ${error.message}';
    }
  }
}
