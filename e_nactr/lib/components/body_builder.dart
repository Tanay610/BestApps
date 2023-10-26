import 'package:e_nactr/components/error_widget.dart';
import 'package:e_nactr/components/loading_widget.dart';
import 'package:e_nactr/util/enum/api_request_status.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class BodyBuilder extends StatelessWidget {
  const BodyBuilder(
      {super.key,
      required this.apiRequestStatus,
      required this.child,
      required this.reload});

  final APIRequestStatus apiRequestStatus;
  final Widget child;
  final Function reload;

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    switch (apiRequestStatus) {
      case APIRequestStatus.loading:
        return const LoadingWidget();
      case APIRequestStatus.unInitialized:
        return const LoadingWidget();
      case APIRequestStatus.connectionError:
        return MyErrorWidget(
          refreshCallBack: reload,
          isConnection: true,
        );
      case APIRequestStatus.error:
        return MyErrorWidget(
          refreshCallBack: reload,
          isConnection: false,
        );
      case APIRequestStatus.loaded:
        return child;
      default:
        return const LoadingWidget();
    }
  }
}
