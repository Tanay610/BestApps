import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, this.isImage = false});

  final bool isImage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _buildBody(context),
    );
  }

  _buildBody(BuildContext context) {
    if (isImage) {
      return SpinKitRipple(
        color: Theme.of(context).colorScheme.secondary,
      );
    } else {
      return SpinKitWave(
        color: Theme.of(context).colorScheme.secondary,
      );
    }
  }
}
