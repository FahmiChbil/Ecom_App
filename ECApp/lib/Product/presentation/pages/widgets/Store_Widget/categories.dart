import 'package:ecapp/Product/presentation/bloc/All_product_bloc/all_product_bloc.dart';
import 'package:ecapp/Product/presentation/bloc/Product_by_category_bloc/product_by_category_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/const.dart';
import '../../../../../core/responsive/models/device_info.dart';

class MyCategoris extends StatelessWidget {
  const MyCategoris({
    required this.deviceInfo,
    super.key,
    required this.allCategories,
  });
  final DeviceInfo deviceInfo;

  final List<String> allCategories;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: deviceInfo.screenHeight / 40),
        child: SizedBox(
          height: deviceInfo.orientation == Orientation.portrait
              ? deviceInfo.screenHeight / 20
              : deviceInfo.screenHeight / 17,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: allCategories.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      BlocProvider.of<ProductByCategoryBloc>(context).add(
                          GetProductByCategoryEvent(
                              category: allCategories[index]));
                      BlocProvider.of<AllProductBloc>(context)
                          .add(GetAllProductEvent());
                    },
                    child: Chip(
                        label: Text(
                          allCategories[index],
                          style: TextStyle(
                            fontFamily: 'Lionel Text Steam',
                            fontSize:
                                deviceInfo.orientation == Orientation.portrait
                                    ? deviceInfo.screenHeight / 43
                                    : deviceInfo.screenHeight / 39,
                          ),
                        ),
                        backgroundColor: pinkey),
                  ),
                  SizedBox(
                    width: deviceInfo.screenWidth / 30,
                  ),
                ],
              );
            },
          ),
        ));
  }
}
