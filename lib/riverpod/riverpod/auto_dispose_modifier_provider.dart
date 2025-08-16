import 'package:flutter_riverpod/flutter_riverpod.dart';

// FutureProvider로직과 동일한데 데이터가 캐싱이 되지 않아, 매번 생성됨
// autoDispose는 데이터를 사용하지 않을 경우 메모리에서 삭제
final autoDisposeModifierProvider = FutureProvider.autoDispose(
  (ref) async {
    await Future.delayed(
      const Duration(seconds: 2),
    );

    return [1, 2, 3, 4, 5];
  },
);
