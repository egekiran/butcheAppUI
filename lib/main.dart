import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Butche',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            HeaderSection(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Text(
                      'Bütçe Dağılımı',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    BudgetDistributionSection(),
                    Text(
                      'Geçmiş İşlemler',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TransactionList(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HeaderSection extends StatefulWidget {
  @override
  State<HeaderSection> createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Merhaba, Ege',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '+3296.00₺',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
              alignment: Alignment.centerRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      '+5873.00₺',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      '-2577.00₺',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}

class BudgetDistributionSection extends StatefulWidget {
  @override
  State<BudgetDistributionSection> createState() =>
      _BudgetDistributionSectionState();
}

class _BudgetDistributionSectionState extends State<BudgetDistributionSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BudgetItem(
            icon: Icons.fastfood,
            label: 'Yeme & İçme',
            color: Colors.orange,
          ),
          BudgetItem(
            icon: Icons.checkroom,
            label: 'Giyim',
            color: Colors.purple,
          ),
          BudgetItem(
            icon: Icons.movie,
            label: 'Eğlence',
            color: Colors.blue,
          ),
          BudgetItem(
            icon: Icons.credit_card,
            label: 'Düzenli Ödemeler',
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}

class BudgetItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  BudgetItem({required this.icon, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, size: 28, color: color),
          Text(
            label,
            style: TextStyle(fontSize: 16),
          ),
          Expanded(
            child: LinearProgressIndicator(
              value: 0.6,
              color: color,
              backgroundColor: color.withOpacity(0.2),
            ),
          ),
        ],
      ),
    );
  }
}

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        date: 'Bugün',
        description: 'Starbucks',
        amount: '-113.00₺',
        isIncome: false),
    Transaction(
        date: 'Bugün',
        description: 'Burger King',
        amount: '-187.00₺',
        isIncome: false),
    Transaction(
        date: 'Dün',
        description: 'Harçlık',
        amount: '+3000.00₺',
        isIncome: true),
    Transaction(
        date: '09.06.2024',
        description: 'Burger King',
        amount: '-187.00₺',
        isIncome: false),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                spreadRadius: 5,
              ),
            ],
          ),
          margin: EdgeInsets.symmetric(vertical: 8.0),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transactions[index].date,
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      transactions[index].description,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Text(
                  transactions[index].amount,
                  style: TextStyle(
                    color: transactions[index].isIncome
                        ? Colors.green
                        : Colors.red,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class Transaction {
  final String date;
  final String description;
  final String amount;
  final bool isIncome;

  Transaction({
    required this.date,
    required this.description,
    required this.amount,
    required this.isIncome,
  });
}
