import 'package:fluent_ui/fluent_ui.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FluentApp(
      debugShowCheckedModeBanner: false,
      title: 'Income Expense Tracker',
      theme: FluentThemeData(brightness: Brightness.light),
      home: IncomeExpenseApp(),
    );
  }
}

class IncomeExpenseApp extends StatefulWidget {
  @override
  _IncomeExpenseAppState createState() => _IncomeExpenseAppState();
}

class _IncomeExpenseAppState extends State<IncomeExpenseApp> {
  final List<Map<String, String>> transactions = [];
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  String transactionType = 'Income';

  void addTransaction() {
    setState(() {
      transactions.add({
        'description': descriptionController.text,
        'amount': amountController.text,
        'type': transactionType,
      });
    });

    // Clear the text fields after adding the transaction
    descriptionController.clear();
    amountController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      header: const PageHeader(title: Text('Income & Expense Tracker')),
      content: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextBox(
                  controller: descriptionController,
                  placeholder: 'Description',
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: TextBox(
                  controller: amountController,
                  placeholder: 'Amount',
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(width: 10),
              ComboBox<String>(
                value: transactionType,
                items: [
                  ComboBoxItem(child: Text('Income'), value: 'Income'),
                  ComboBoxItem(child: Text('Expense'), value: 'Expense'),
                ],
                onChanged: (value) {
                  setState(() {
                    transactionType = value!;
                  });
                },
              ),
              SizedBox(width: 10),
              Button(onPressed: addTransaction, child: Text('Add Transaction')),
            ],
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final transaction = transactions[index];
                return Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Expanded(child: Text('${transaction['description']}')),
                      SizedBox(width: 10),
                      Expanded(child: Text('${transaction['type']}')),
                      SizedBox(width: 10),
                      Expanded(child: Text('${transaction['amount']}')),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
