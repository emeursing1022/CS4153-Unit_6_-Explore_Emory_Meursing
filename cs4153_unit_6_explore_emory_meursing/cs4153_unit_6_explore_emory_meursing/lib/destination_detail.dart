// destination_detail.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class DestinationDetailScreen extends StatelessWidget {
  final Destination destination;

  const DestinationDetailScreen({Key? key, required this.destination}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isIOS = Theme.of(context).platform == TargetPlatform.iOS;
    return isIOS ? _buildCupertinoDetail(context) : _buildMaterialDetail(context);
  }

  Widget _buildMaterialDetail(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(destination.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(destination.imagePath, width: double.infinity, fit: BoxFit.cover),
            SizedBox(height: 16),
            Text(
              destination.description,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCupertinoDetail(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(destination.name),
        previousPageTitle: 'Back',
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(destination.imagePath, width: double.infinity, fit: BoxFit.cover),
              SizedBox(height: 16),
              Text(
                destination.description,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
