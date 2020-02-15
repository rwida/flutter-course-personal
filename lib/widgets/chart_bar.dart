import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingTotal;

  ChartBar(this.label, this.spendingAmount, this.spendingTotal);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, contraint) {
        return Column(
          children: <Widget>[
            Container(
              height: contraint.maxHeight * 0.15,
              child: FittedBox(
                child: Text('\$${spendingAmount.toStringAsFixed(0)}'),
              ),
            ),
            SizedBox(
              height: contraint.maxHeight * 0.05,
            ),
            Container(
              height: contraint.maxHeight * 0.6,
              width: 10,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: spendingTotal,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: contraint.maxHeight * 0.05,
            ),
            Container(
              height: contraint.maxHeight * 0.15,
              child: FittedBox(child: Text(label)
              ),
              ),
          ],
        );
      },
    );
  }
}
