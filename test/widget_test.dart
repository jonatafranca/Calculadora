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
    //Verificação específica, avisos
    expect(find.text('Resultado: '), findsOneWidget);
    expect(find.text('Operação: '), findsOneWidget);
  });
  testWidgets('verificação de limpeza da tela', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    //Busca por valores na tela
    expect(find.text('13579  '), findsNothing);
    //Execução de operações
    await tester.tap(find.widgetWithText(MaterialButton, '1').first);
    await tester.pump();
    await tester.tap(find.widgetWithText(MaterialButton, '3').first);
    await tester.pump();
    await tester.tap(find.widgetWithText(MaterialButton, '5').first);
    await tester.pump();
    await tester.tap(find.widgetWithText(MaterialButton, '7').first);
    await tester.pump();
    await tester.tap(find.widgetWithText(MaterialButton, '9').first);
    await tester.pump();
    //Busca pelo valor digitado
    expect(find.text('13579  '), findsOneWidget);
    //Limpeza
    await tester.tap(find.widgetWithText(MaterialButton, 'Zerar'));
    await tester.pump();
    //Verificação de limpeza
    expect(find.text('13579  '), findsNothing);
  });
  testWidgets('verificação de resultados de multiplicação',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    //Garantir uma tela limpa
    await tester.tap(find.widgetWithText(MaterialButton, 'Zerar'));
    await tester.pump();
    //Busca por valores na tela
    expect(find.text('4 * 3'), findsNothing);
    expect(find.text('12.0'), findsNothing);
    //Execução de operações
    await tester.tap(find.widgetWithText(MaterialButton, '4').first);
    await tester.pump();
    await tester.tap(find.widgetWithText(MaterialButton, '*'));
    await tester.pump();
    await tester.tap(find.widgetWithText(MaterialButton, '3').last);
    await tester.pump();
    //Busca por valores na tela
    expect(find.text('4 * 3'), findsOneWidget);
    expect(find.text('12.0'), findsNothing);
    //Execução do comando
    await tester.tap(find.widgetWithText(MaterialButton, 'Calcular'));
    await tester.pump();
    //Busca por resultados
    expect(find.text('4 * 3'), findsOneWidget);
    expect(find.text('12.0'), findsOneWidget);
  });
  testWidgets('verificação de resultados de divisão',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    //Garantir uma tela limpa
    await tester.tap(find.widgetWithText(MaterialButton, 'Zerar'));
    await tester.pump();
    //Busca por valores na tela
    expect(find.text('50 / 2'), findsNothing);
    expect(find.text('25.0'), findsNothing);
    //Execução de operações
    await tester.tap(find.widgetWithText(MaterialButton, '5').first);
    await tester.pump();
    await tester.tap(find.widgetWithText(MaterialButton, '0').first);
    await tester.pump();
    await tester.tap(find.widgetWithText(MaterialButton, '/'));
    await tester.pump();
    await tester.tap(find.widgetWithText(MaterialButton, '2').last);
    await tester.pump();
    //Busca por valores na tela
    expect(find.text('50 / 2'), findsOneWidget);
    expect(find.text('25.0'), findsNothing);
    //Execução do comando
    await tester.tap(find.widgetWithText(MaterialButton, 'Calcular'));
    await tester.pump();
    //Busca por resultados
    expect(find.text('50 / 2'), findsOneWidget);
    expect(find.text('25.0'), findsOneWidget);
  });
  testWidgets('verificação de resultados de soma', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    //Garantir uma tela limpa
    await tester.tap(find.widgetWithText(MaterialButton, 'Zerar'));
    await tester.pump();
    //Busca por valores na tela
    expect(find.text('6 + 4'), findsNothing);
    expect(find.text('10.0'), findsNothing);
    //Execução de operações
    await tester.tap(find.widgetWithText(MaterialButton, '6').first);
    await tester.pump();
    await tester.tap(find.widgetWithText(MaterialButton, '+'));
    await tester.pump();
    await tester.tap(find.widgetWithText(MaterialButton, '4').last);
    await tester.pump();
    //Busca por valores na tela
    expect(find.text('6 + 4'), findsOneWidget);
    expect(find.text('10.0'), findsNothing);
    //Execução do comando
    await tester.tap(find.widgetWithText(MaterialButton, 'Calcular'));
    await tester.pump();
    //Busca por resultados
    expect(find.text('6 + 4'), findsOneWidget);
    expect(find.text('10.0'), findsOneWidget);
  });
  testWidgets('verificação de resultados de subtração',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    //Garantir uma tela limpa
    await tester.tap(find.widgetWithText(MaterialButton, 'Zerar'));
    await tester.pump();
    //Busca por valores na tela
    expect(find.text('60 - 15'), findsNothing);
    expect(find.text('45.0'), findsNothing);
    //Execução de operações
    await tester.tap(find.widgetWithText(MaterialButton, '6').first);
    await tester.pump();
    await tester.tap(find.widgetWithText(MaterialButton, '0').first);
    await tester.pump();
    await tester.tap(find.widgetWithText(MaterialButton, '-'));
    await tester.pump();
    await tester.tap(find.widgetWithText(MaterialButton, '1').last);
    await tester.pump();
    await tester.tap(find.widgetWithText(MaterialButton, '5').last);
    await tester.pump();
    //Busca por valores na tela
    expect(find.text('60 - 15'), findsOneWidget);
    expect(find.text('45.0'), findsNothing);
    //Execução do comando
    await tester.tap(find.widgetWithText(MaterialButton, 'Calcular'));
    await tester.pump();
    //Busca por resultados
    expect(find.text('60 - 15'), findsOneWidget);
    expect(find.text('45.0'), findsOneWidget);
  });
  testWidgets('verificação de resultados de porcentagem',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    //Garantir uma tela limpa
    await tester.tap(find.widgetWithText(MaterialButton, 'Zerar'));
    await tester.pump();
    //Busca por valores na tela
    expect(find.text('50 % 50'), findsNothing);
    expect(find.text('25.0'), findsNothing);
    //Execução de operações
    await tester.tap(find.widgetWithText(MaterialButton, '5').first);
    await tester.pump();
    await tester.tap(find.widgetWithText(MaterialButton, '0').first);
    await tester.pump();
    await tester.tap(find.widgetWithText(MaterialButton, '%'));
    await tester.pump();
    await tester.tap(find.widgetWithText(MaterialButton, '5').last);
    await tester.pump();
    await tester.tap(find.widgetWithText(MaterialButton, '0').last);
    await tester.pump();
    //Busca por valores na tela
    expect(find.text('50 % 50'), findsOneWidget);
    expect(find.text('25.0'), findsNothing);
    //Execução do comando
    await tester.tap(find.widgetWithText(MaterialButton, 'Calcular'));
    await tester.pump();
    //Busca por resultados
    expect(find.text('50 % 50'), findsOneWidget);
    expect(find.text('25.0'), findsOneWidget);
  });
}
