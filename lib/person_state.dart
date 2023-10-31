part of 'person_bloc.dart';

sealed class PersonState extends Equatable {
  final String name;

  final int age;

  final List<String>? cousins;

  const PersonState({
    required this.name,
    required this.age,
    this.cousins,
  });

  PersonState copyWith({
    String? name,
    int? age,
    List<String>? cousins,
  });

  @override
  List<Object?> get props => [age, name, cousins];
}

class PersonInitial extends PersonState {
  const PersonInitial({
    super.name = 'Yasin',
    super.age = 21,
    super.cousins,
  });

  @override
  PersonInitial copyWith({
    String? name,
    int? age,
    List<String>? cousins,
  }) {
    return PersonInitial(
      name: name ?? this.name,
      age: age ?? this.age,
      cousins: cousins ?? this.cousins,
    );
  }
}

class AliState extends PersonState {
  final String father;

  const AliState({
    required this.father,
    required super.name,
    required super.age,
    super.cousins,
  });

  factory AliState.from(
    PersonState person, {
    required String father,
  }) =>
      AliState(
        father: father,
        age: person.age,
        name: person.name,
        cousins: person.cousins,
      );

  @override
  AliState copyWith({
    String? father,
    String? name,
    int? age,
    List<String>? cousins,
  }) {
    return AliState(
      father: father ?? this.father,
      name: name ?? this.name,
      age: age ?? this.age,
      cousins: cousins ?? this.cousins,
    );
  }

  @override
  List<Object?> get props => super.props..add(father);
}

class HossainState extends PersonState {
  final String mother;

  const HossainState({
    required this.mother,
    required super.name,
    required super.age,
    super.cousins,
  });

  factory HossainState.from(
    PersonState person, {
    required String mother,
  }) =>
      HossainState(
        mother: mother,
        age: person.age,
        name: person.name,
        cousins: person.cousins,
      );

  @override
  HossainState copyWith({
    String? mother,
    String? name,
    int? age,
    List<String>? cousins,
  }) {
    return HossainState(
      mother: mother ?? this.mother,
      name: name ?? this.name,
      age: age ?? this.age,
      cousins: cousins ?? this.cousins,
    );
  }

  @override
  List<Object?> get props => super.props..add(mother);
}

enum LoadState { loading, response, error }

class CousinsState extends PersonState {
  final LoadState loadState;
  final String? error;

  const CousinsState({
    required this.loadState,
    required super.name,
    required super.age,
    this.error,
    super.cousins,
  });

  factory CousinsState.from(
    PersonState person, {
    required LoadState loadState,
    List<String>? cousins,
    String? error,
  }) =>
      CousinsState(
        age: person.age,
        name: person.name,
        cousins: cousins,
        error: error,
        loadState: loadState,
      );

  @override
  CousinsState copyWith({
    LoadState? loadState,
    String? name,
    int? age,
    List<String>? cousins,
    String? error,
  }) {
    return CousinsState(
      loadState: loadState ?? this.loadState,
      name: name ?? this.name,
      age: age ?? this.age,
      cousins: cousins ?? this.cousins,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => super.props
    ..add(loadState)
    ..add(error);
}
