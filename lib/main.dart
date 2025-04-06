import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(const FinanceDashboardApp());
}

class FinanceDashboardApp extends StatelessWidget {
  const FinanceDashboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard Financeiro',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const DashboardPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  final double saldo = 2300.75;
  final double receitas = 4000.00;
  final double despesas = 1700.25;

  final List<PieChartSectionData> gastosPorCategoria = const [
    PieChartSectionData(
      color: Colors.red,
      value: 600,
      title: 'Aluguel',
      radius: 50,
      titleStyle: TextStyle(color: Colors.white, fontSize: 14),
    ),
    PieChartSectionData(
      color: Colors.blue,
      value: 500,
      title: 'Alimentação',
      radius: 50,
      titleStyle: TextStyle(color: Colors.white, fontSize: 14),
    ),
    PieChartSectionData(
      color: Colors.orange,
      value: 300,
      title: 'Transporte',
      radius: 50,
      titleStyle: TextStyle(color: Colors.white, fontSize: 14),
    ),
    PieChartSectionData(
      color: Colors.green,
      value: 300,
      title: 'Outros',
      radius: 50,
      titleStyle: TextStyle(color: Colors.white, fontSize: 14),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Financeiro'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Card(
              elevation: 4,
              child: ListTile(
                title: const Text('Saldo Atual'),
                trailing: Text(
                  'R\$ ${saldo.toStringAsFixed(2)}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Card(
                    color: Colors.green.shade50,
                    elevation: 2,
                    child: ListTile(
                      title: const Text('Receitas'),
                      trailing: Text(
                        'R\$ ${receitas.toStringAsFixed(2)}',
                        style: const TextStyle(color: Colors.green),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Card(
                    color: Colors.red.shade50,
                    elevation: 2,
                    child: ListTile(
                      title: const Text('Despesas'),
                      trailing: Text(
                        'R\$ ${despesas.toStringAsFixed(2)}',
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Distribuição de Gastos',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            AspectRatio(
              aspectRatio: 1.3,
              child: Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: PieChart(
                    PieChartData(
                      sections: gastosPorCategoria,
                      centerSpaceRadius: 40,
                      sectionsSpace: 2,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                // Navegar para tela de adicionar transação
              },
              icon: const Icon(Icons.add),
              label: const Text('Adicionar Transação'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
            )
          ],
        ),
      ),
    );
  }
}
