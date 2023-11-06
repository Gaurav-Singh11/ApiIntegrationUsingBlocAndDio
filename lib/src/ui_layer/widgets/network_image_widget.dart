import 'package:flutter/material.dart';
import 'package:netcarrots_task/src/data_layer/res/colors.dart';

class NetworkImageWidget extends StatelessWidget {
  final String? url;
  final double height;
  final double width;
  final BoxFit boxFit;
  final Widget? localImageWidget;
  final Widget? errorWidget;

  const NetworkImageWidget({
    super.key,
    required this.url,
    this.height = 100,
    this.width = 100,
    this.boxFit = BoxFit.cover,
    this.localImageWidget,
    this.errorWidget,
  });

  @override
  Widget build(BuildContext context) {
    return _getCachedNetworkImage();
  }

  Widget _getCachedNetworkImage() {
    if (url == null ||  (url != null && url!.trim().isEmpty)) {
      return const SizedBox.shrink();
    } else {
      return Image.network(
        url!,
        height: height,
        width: width,
        fit: boxFit,
        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? event){
          if (event != null) {
            return Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
                valueColor: const AlwaysStoppedAnimation<Color>(AppColors.mainColor),
                value: event.expectedTotalBytes != null ? event.cumulativeBytesLoaded / event.expectedTotalBytes! : null,
              ),
            );
          } else {
            return child;
          }
        },
        errorBuilder: (BuildContext context, Object obj, StackTrace? trace){
          return const SizedBox.shrink();
        },
      );
    }
  }
}
