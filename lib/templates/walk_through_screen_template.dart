import 'package:flutter/material.dart';
import 'package:flutter_railway_app/core/utils/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WalkThroughScreenTemplate extends StatelessWidget {
  final String _imagePath;
  final String _label;
  final String _description;
  final int _pageValue;

  WalkThroughScreenTemplate(
    this._imagePath,
    this._label,
    this._description,
    this._pageValue, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 60),
            SvgPicture.asset(_imagePath),
            const SizedBox(height: 60),
            Text(
              _label,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w900,
              ),
            ),
            Text(_description),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Skip",
                    style: TextStyle(color: AppColor.primaryColor),
                  ),
                  Row(
                    children: [
                      _buildIndicator(_pageValue == 1),
                      _buildIndicator(_pageValue == 2),
                      _buildIndicator(_pageValue == 3),
                    ],
                  ),
                  Icon(Icons.arrow_forward, color: AppColor.primaryColor),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildIndicator(bool isActive) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        color: isActive ? AppColor.primaryColor : AppColor.secondaryColor,
        shape: BoxShape.circle,
      ),
    );
  }
}
