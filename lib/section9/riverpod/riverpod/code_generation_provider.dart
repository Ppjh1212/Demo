import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'code_generation_provider.g.dart';

final _testProvider = Provider<String>(
  (ref) => 'Hello Code Generation',
);

@riverpod
String gState(GStateRef ref){
  return 'Hello Code Generation';
}

@riverpod
Future<int> gStateFuture(GStateFutureRef ref) async{
  await Future.delayed(const Duration(seconds: 3));
  return 10;
}

//keepAlive: true => AutoDispose를 하지않고 데이터 캐싱을 할 수 있음
@Riverpod(keepAlive: true)
Future<int> gStateFuture2(GStateFuture2Ref ref) async{
  await Future.delayed(const Duration(seconds: 3));
  return 10;
}