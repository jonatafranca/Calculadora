import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:calc_oficina/main.dart';

void main() {
  testWidgets('verificação de botões da calculadora',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    //Verificação dos botões
    //Verificação geral da quantidade
    expect(find.byType(MaterialButton), findsNWidgets(27));
    //Verificação específica, números = 10*2
    expect(find.widgetWithText(MaterialButton, '1'), findsNWidgets(2));
    expect(find.widgetWithText(MaterialButton, '2'), findsNWidgets(2));
    expect(find.widgetWithText(MaterialButton, '3'), findsNWidgets(2));
    expect(find.widgetWithText(MaterialButton, '4'), findsNWidgets(2));
    expect(find.widgetWithText(MaterialButton, '5'), findsNWidgets(2));
    expect(find.widgetWithText(MaterialButton, '6'), findsNWidgets(2));
    expect(find.widgetWithText(MaterialButton, '7'), findsNWidgets(2));
    expect(find.widgetWithText(MaterialButton, '8'), findsNWidgets(2));
    expect(find.widgetWithText(MaterialButton, '9'), findsNWidgets(2));
    expect(find.widgetWithText(MaterialButton, '0'), findsNWidgets(2));
    //Verificação específica, operadores = 5
    expect(find.widgetWithText(MaterialButton, '+'), findsOneWidget);
    expect(find.widgetWithText(MaterialButton, '-'), findsOneWidget);
    expect(find.widgetWithText(MaterialButton, '*'), findsOneWidget);
    expect(find.widgetWithText(MaterialButton, '/'), findsOneWidget);
    expect(find.widgetWithText(MaterialButton, '%'), findsOneWidget);
    //Verificação específica, ações = 2
    expect(find.widgetWithText(MaterialButton, 'Calcular'), findsOneWidget);
    expect(find.widgetWithText(MaterialButton, 'Zerar'), findsOneWidget);
  });
  testWidgets('verificação de resultados de multiplicação',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    //Busca por valores na tela
    expect(find.widgetWithText(Text, '12'), findsNothing);
    //Execução de operações
    //Erro, a função tap encontra dois botões iguais
    await tester.tap(find.widgetWithText(MaterialButton, '4'));
    await tester.pump();
    await tester.tap(find.widgetWithText(MaterialButton, '*'));
    await tester.pump();
    // await tester.tap(find.widgetWithText(MaterialButton, '3'));
    await tester.pump();
    await tester.tap(find.widgetWithText(MaterialButton, 'Calcular'));
    await tester.pump();
    //Busca por resultados
    expect(find.widgetWithText(Text, '12'), findsOneWidget);
  });
}
