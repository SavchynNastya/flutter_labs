import 'package:flutter/material.dart';
import 'package:flutter_labs/labs/lab1/task1/utils/fuel_calculator.dart';
import 'package:flutter_labs/labs/lab1/task1/widgets/fuel_input_field.dart';
import 'package:flutter_labs/labs/lab1/task1/widgets/heating_value_results.dart';
import 'package:flutter_labs/labs/lab1/task1/widgets/mass_results.dart';

class FuelCalculatorScreen extends StatefulWidget {
  const FuelCalculatorScreen({super.key});

  @override
  FuelCalculatorScreenState createState() => FuelCalculatorScreenState();
}

class FuelCalculatorScreenState extends State<FuelCalculatorScreen> {
  double hp = 2.8, cp = 72.3, sp = 2.0, np = 1.1, op = 1.3, wp = 5.5, ap = 15.0;
  Map<String, double> dryMassResult = {};
  Map<String, double> combustibleMassResult = {};
  double lowerHeatingValueResult = 0.0;
  double lowerHeatingValueResultDry = 0.0;
  double lowerHeatingValueResultCombustible = 0.0;

  void calculateResults() {
    setState(() {
      dryMassResult =
          FuelCalculator.calculateDryMass(hp, cp, sp, np, op, wp, ap);
      combustibleMassResult =
          FuelCalculator.calculateCombustibleMass(hp, cp, sp, np, op, wp, ap);
      lowerHeatingValueResult =
          FuelCalculator.calculateLowerHeatingValueWorking(hp, cp, sp, op, wp);
      lowerHeatingValueResultDry =
          FuelCalculator.calculateLowerHeatingValueDry(hp, cp, sp, op, wp);
      lowerHeatingValueResultCombustible =
          FuelCalculator.calculateLowerHeatingValueCombustible(
              hp, cp, sp, op, wp, ap);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // FuelInputField(
            //     label: "HP",
            //     value: hp,
            //     onChanged: (v) => setState(() => hp = v)),
            // FuelInputField(
            //     label: "CP",
            //     value: cp,
            //     onChanged: (v) => setState(() => cp = v)),
            // FuelInputField(
            //     label: "SP",
            //     value: sp,
            //     onChanged: (v) => setState(() => sp = v)),
            // FuelInputField(
            //     label: "NP",
            //     value: np,
            //     onChanged: (v) => setState(() => np = v)),
            // FuelInputField(
            //     label: "OP",
            //     value: op,
            //     onChanged: (v) => setState(() => op = v)),
            // FuelInputField(
            //     label: "WP",
            //     value: wp,
            //     onChanged: (v) => setState(() => wp = v)),
            // FuelInputField(
            //     label: "AP",
            //     value: ap,
            //     onChanged: (v) => setState(() => ap = v)),
            FuelInputField(
                label: "HP",
                value: hp, // Set initial value to 2.8
                onChanged: (v) => setState(() => hp = v)),
            FuelInputField(
                label: "CP",
                value: cp, // Set initial value to 72.3
                onChanged: (v) => setState(() => cp = v)),
            FuelInputField(
                label: "SP",
                value: sp, // Set initial value to 2.0
                onChanged: (v) => setState(() => sp = v)),
            FuelInputField(
                label: "NP",
                value: np, // Set initial value to 1.1
                onChanged: (v) => setState(() => np = v)),
            FuelInputField(
                label: "OP",
                value: op, // Set initial value to 1.3
                onChanged: (v) => setState(() => op = v)),
            FuelInputField(
                label: "WP",
                value: wp, // Set initial value to 5.5
                onChanged: (v) => setState(() => wp = v)),
            FuelInputField(
                label: "AP",
                value: ap, // Set initial value to 15.0
                onChanged: (v) => setState(() => ap = v)),
            const SizedBox(height: 16),
            ElevatedButton(
                onPressed: calculateResults, child: const Text("Calculate")),
            // const SizedBox(height: 16),
            // const Text("Dry Mass Results",
            //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            // ...dryMassResult.entries
            //     .map((e) => Text("${e.key}: ${e.value.toStringAsFixed(2)}")),
            // const SizedBox(height: 16),
            // const Text("Combustible Mass Results",
            //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            // ...combustibleMassResult.entries
            //     .map((e) => Text("${e.key}: ${e.value.toStringAsFixed(2)}")),
            // const SizedBox(height: 16),
            MassResults(
              dryMassResult: dryMassResult,
              combustibleMassResult: combustibleMassResult,
            ),
            // Text("Lower Heating Value (Working): ${lowerHeatingValueResult.toStringAsFixed(2)}"),
            // Text("Lower Heating Value (Dry): ${lowerHeatingValueResultDry.toStringAsFixed(2)}"),
            // Text("Lower Heating Value (Combustible): ${lowerHeatingValueResultCombustible.toStringAsFixed(2)}"),
            HeatingValueResults(
              lowerHeatingValueResult: lowerHeatingValueResult,
              lowerHeatingValueResultDry: lowerHeatingValueResultDry,
              lowerHeatingValueResultCombustible:
                  lowerHeatingValueResultCombustible,
            )
          ],
        ),
      ),
    );
  }
}
