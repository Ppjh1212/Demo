import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class Logger extends ProviderObserver {

  //프로바이더가 초기화될 때마다 호출
  @override
  void didAddProvider(ProviderBase<Object?> provider, Object? value, ProviderContainer container) {
  }

  //프로바이더가 알림을 전송할 때마다 호출
  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    log('update provider: $provider, pv: $previousValue, nv: $newValue');
  }

  //프로바이더가 disposed될 때마다 호출
  @override
  void didDisposeProvider(
      ProviderBase<Object?> provider, ProviderContainer container) {
    log('dispose provider: $provider');
  }
}
