
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _buildActivityIndicator(),
    );
  }

  Widget _buildActivityIndicator() {
    return defaultTargetPlatform == TargetPlatform.iOS
        ? const CupertinoActivityIndicator()
        : const CircularProgressIndicator();
  }
}
