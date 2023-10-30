
import 'package:bloc_guideline/person_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'Person Bloc',
    () {
      test('check initial state', () {
        expect(PersonBloc().state, const PersonInitial());
      });

      blocTest<PersonBloc, PersonState>(
        'Hossain state should emit when HossainCalled added',
        build: () => PersonBloc(),
        seed: () => const PersonInitial(name: 'javad', age: 44),
        act: (bloc) {
          bloc.add(const HossainCalled(parentName: 'sara'));
        },
        expect: () => <PersonState>[
          const HossainState(
            mother: 'sara',
            name: 'javad',
            age: 44,
          ),
        ],
      );

      blocTest(
        'Cousins state emit when CousinsCalled added and return response successfully',
        build: () => PersonBloc(),
        act: (bloc) => bloc.add(
          const CousinsCalled(goFailed: false),
        ),
        wait: const Duration(milliseconds: 2000),
        expect: () => [
          CousinsState.from(
            const PersonInitial(),
            loadState: LoadState.loading,
          ),
          CousinsState.from(
            const PersonInitial(),
            cousins: const ['1', '2', '3'],
            loadState: LoadState.response,
          ),
        ],
      );

      blocTest(
        'Cousins state emit when CousinsCalled added and go failed',
        build: () => PersonBloc(),
        act: (bloc) => bloc.add(
          const CousinsCalled(goFailed: true),
        ),
        wait: const Duration(milliseconds: 2000),
        expect: () => [
          CousinsState.from(
            const PersonInitial(),
            loadState: LoadState.loading,
          ),
          CousinsState.from(
            const PersonInitial(),
            error: 'error',
            loadState: LoadState.error,
          ),
        ],
      );
    },
  );
}
