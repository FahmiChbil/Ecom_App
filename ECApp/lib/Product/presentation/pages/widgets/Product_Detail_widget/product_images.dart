// ignore_for_file: camel_case_types

import 'package:ecapp/Product/presentation/pages/widgets/Product_Detail_widget/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/responsive/models/device_info.dart';
import '../../../../domain/entities/product..dart';
import '../../../bloc/AddCartBloc/add_cart_bloc.dart';

class productImages extends StatelessWidget {
  final int userId;
  const productImages(
      {super.key,
      required this.product,
      required this.devicInfo,
      required this.userId});

  final Product product;
  final DeviceInfo devicInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: devicInfo.screenHeight / 25),
      height: devicInfo.localHeight / 1.4,
      width: devicInfo.localWidth,
      child: PageView.builder(
        itemCount: product.images.length,
        onPageChanged: (indexPage) {},
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => showModalBottomSheet(
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              context: context,
              builder: (context) => BottomSheetDescription(
                    productName: product.title,
                    productPrice: product.price,
                    deviceInfo: devicInfo,
                    onPress: () async {
                      BlocProvider.of<AddCartBloc>(context).add(
                          AddToSharedEvent(
                              userId: userId, productId: product.productId));
                    },
                  )),
          child: Center(
            child: ClipRRect(
              child: Container(
                  height: devicInfo.localHeight / 1.4,
                  width: devicInfo.localWidth,
                  child:
                      Image.network(product.images[index], fit: BoxFit.cover)),
            ),
          ),
        ),
      ),
    );
  }
}
