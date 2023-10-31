part of 'person_bloc.dart';

sealed class PersonEvent {
  const PersonEvent();
}

class AliCalled extends PersonEvent {
  final String parentName;

  const AliCalled({required this.parentName});
}

class HossainCalled extends PersonEvent {
  final String parentName;

  const HossainCalled({required this.parentName});
}

class CousinsCalled extends PersonEvent {
  final bool goFailed;

  const CousinsCalled({required this.goFailed});
}
