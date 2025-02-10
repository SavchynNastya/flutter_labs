import 'package:flutter/material.dart';

// class FuelInputField extends StatelessWidget {
//   final String label;
//   final double value;
//   final Function(double) onChanged;
//
//   const FuelInputField({
//     super.key,
//     required this.label,
//     required this.value,
//     required this.onChanged,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             label,
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.w600,
//               color: Colors.grey[800],
//             ),
//           ),
//           const SizedBox(height: 6),
//           TextField(
//             keyboardType: TextInputType.number,
//             style: const TextStyle(fontSize: 16),
//             decoration: InputDecoration(
//               contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(12),
//                 borderSide: BorderSide(color: Colors.grey.shade400),
//               ),
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(12),
//                 borderSide: BorderSide(color: Colors.grey.shade300),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(12),
//                 borderSide: const BorderSide(color: Colors.blue, width: 1.8),
//               ),
//               hintText: 'Enter $label',
//               hintStyle: TextStyle(color: Colors.grey[500]),
//             ),
//             onChanged: (val) {
//               double? num = double.tryParse(val);
//               if (num != null) onChanged(num);
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
class FuelInputField extends StatelessWidget {
  final String label;
  final double value;
  final Function(double) onChanged;

  const FuelInputField({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    // Creating a controller that gets initialized with the value
    TextEditingController controller = TextEditingController(text: value.toString());

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 6),
          TextField(
            controller: controller, // Set the controller to display the value
            keyboardType: TextInputType.number,
            style: const TextStyle(fontSize: 16),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.blue, width: 1.8),
              ),
              hintText: 'Enter $label',
              hintStyle: TextStyle(color: Colors.grey[500]),
            ),
            onChanged: (val) {
              double? num = double.tryParse(val);
              if (num != null) onChanged(num);
            },
          ),
        ],
      ),
    );
  }
}
