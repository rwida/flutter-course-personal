import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleControler = TextEditingController();
  final _amountControler = TextEditingController();
  DateTime _selectDate;

  void _submitData() {

    if(_amountControler.text.isEmpty){
      return;
    }

    final enterTitle = _titleControler.text;
    final enterAmount = double.parse(_amountControler.text);

    if (enterTitle.isEmpty || enterAmount < 0  || _selectDate == null) {
      return;
    }

    widget.addTx(
      enterTitle,
      enterAmount,
      _selectDate,
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      setState(() {
        _selectDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Card(
        child: Container(
          padding: EdgeInsets.only(
            left: 10,
            right: 10,
            top: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: _titleControler,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number,
                controller: _amountControler,
                onSubmitted: (val) => _submitData(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              Container(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(_selectDate == null
                            ? 'No data Choosen'
                            : DateFormat.yMd().format(_selectDate),
                            )
                            ),
                    FlatButton(
                      child: Text(
                        'Choose Data',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      textColor: Theme.of(context).primaryColor,
                      onPressed: () {
                        _presentDatePicker();
                      },
                    )
                  ],
                ),
              ),
              FlatButton(
                child: Text('Add Transaction'),
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                onPressed: () {
                  _submitData();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
