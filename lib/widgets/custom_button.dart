import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/widgets/custom_text.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onPressed,
    required this.isLoading,
  });
  final void Function()? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    const spinkit = SpinKitWaveSpinner(
      color: Colors.white,
      size: 35.0,
    );
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: primaryColor,
        elevation: 10,
        fixedSize: Size(MediaQuery.of(context).size.width, 45),
      ),
      child: isLoading ? spinkit : const CustomText('Add'),
    );
  }
}
