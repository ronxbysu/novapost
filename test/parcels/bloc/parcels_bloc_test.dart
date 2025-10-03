import 'package:delivery_repository/delivery_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:novapost/parcels/bloc/parcels_bloc.dart';

class MockDeliveryRepository extends Mock implements ParcelRepository {}

void main() {
  late ParcelsBloc parcelsBloc;
  late MockDeliveryRepository repository;

  setUp(() {
    repository = MockDeliveryRepository();
    parcelsBloc = ParcelsBloc(repository);
  });

  tearDown(() {
    parcelsBloc.close();
  });

  group('ParcelsBloc', () {
    test('initial state is ParcelsInitial', () {
      expect(parcelsBloc.state, equals(ParcelsInitial()));
    });

    //TODO: implement mockParcels
/*    blocTest<ParcelsBloc, ParcelsState>(
      'emits [ParcelsLoading, ParcelsLoaded] when LoadParcels succeeds',
      build: () {
        when(() => repository.getParcelList('userId'))
            .thenAnswer((_) async => mockParcels);
        return parcelsBloc;
      },
      act: (bloc) => bloc.add(LoadParcels()),
      expect: () => [
        ParcelsLoading(),
        ParcelsLoaded(parcels: mockParcels, filteredParcels: mockParcels),
      ],
    );*/

    blocTest<ParcelsBloc, ParcelsState>(
      'emits [ParcelsLoading, ParcelsError] when LoadParcels fails',
      build: () {
        when(() => repository.getParcelList('userId'))
            .thenThrow(Exception('Failed'));
        return parcelsBloc;
      },
      act: (bloc) => bloc.add(LoadParcels()),
      expect: () => [
        ParcelsLoading(),
        isA<ParcelsError>(),
      ],
    );
  });
}