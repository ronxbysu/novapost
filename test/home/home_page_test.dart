import 'package:bloc_test/bloc_test.dart' show MockBloc;
import 'package:flutter/material.dart' show MaterialApp, CircularProgressIndicator;
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:novapost/home/home_page.dart';
import 'package:novapost/parcels/bloc/parcels_bloc.dart';

class MockParcelsBloc extends MockBloc<ParcelsEvent, ParcelsState>
    implements ParcelsBloc {}

void main() {
  late MockParcelsBloc parcelsBloc;

  setUp(() {
    parcelsBloc = MockParcelsBloc();
  });

  testWidgets('displays loading indicator when ParcelsLoading', (tester) async {
    when(() => parcelsBloc.state).thenReturn(ParcelsLoading());

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<ParcelsBloc>.value(
          value: parcelsBloc,
          child: const HomePageView(),
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}