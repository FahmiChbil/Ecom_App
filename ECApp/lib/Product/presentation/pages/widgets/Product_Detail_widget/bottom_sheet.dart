import 'package:flutter/material.dart';

import '../../../../../core/const.dart';
import '../../../../../core/responsive/models/device_info.dart';
import '../../../../../core/responsive/ui_conponment/info_widget.dart';

class BottomSheetDescription extends StatefulWidget {
  final DeviceInfo deviceInfo;
  final String productName;

  final int productPrice;
  final void Function()? onPress;

  const BottomSheetDescription({
    super.key,
    required this.deviceInfo,
    required this.productName,
    required this.productPrice,
    required this.onPress,
  });

  @override
  State<BottomSheetDescription> createState() => _BottomSheetDescriptionState();
}

class _BottomSheetDescriptionState extends State<BottomSheetDescription> {
  int selected = 0;
  int selected1 = 0;
  @override
  Widget build(BuildContext context) {
    final List<String> taille = ["S ", "M", "L", "XL"];
    final List<Color> colors = [
      Colors.black,
      Colors.yellow,
      Colors.grey,
      Colors.white30
    ];
    List<Color> colorsshape = [
      Colors.black,
      Colors.yellow,
      Colors.grey,
      Colors.red.shade100
    ];

    return InfoWidget(
      builder: (context, device1Info) {
        return Container(
          height: widget.deviceInfo.screenHeight / 4,
          width: widget.deviceInfo.screenWidth,
          child: Column(
            children: [
              Expanded(
                  child: Center(
                child: Container(
                  width: device1Info.localWidth / 8,
                  height: 2,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(15)),
                ),
              )),
              Expanded(
                flex: 4,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top: device1Info.localHeight / 110,
                          bottom: device1Info.localHeight / 60,
                          left: 20),
                      height: device1Info.localHeight / 2,
                      width: device1Info.localWidth / 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: Container(
                            height: device1Info.localHeight / 20,
                            child: Text(
                              widget.productName,
                              style: TextStyle(
                                  fontSize: device1Info.localHeight / 35,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                          Expanded(
                              child: Text(
                            " ${widget.productPrice.toString()}\$",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: device1Info.localHeight / 40,
                                color: Colors.grey),
                          )),
                          Expanded(
                              child: Text(
                            "Your size",
                            style: TextStyle(
                                fontSize: device1Info.localHeight / 55,
                                fontWeight: FontWeight.bold),
                          )),
                          Expanded(child:
                              InfoWidget(builder: (context, deviceinfo2) {
                            return Row(
                              children: [
                                ...List.generate(
                                    taille.length,
                                    (index) => GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              selected = index;
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: selected == index
                                                    ? pinkey
                                                    : Colors.white,
                                                border: Border.all(
                                                    color: Colors.black12),
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            margin: const EdgeInsets.only(
                                                right: 15),
                                            width: deviceinfo2.localWidth / 9,
                                            child: Center(
                                              child: Text(
                                                taille[index],
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
                                        )),
                              ],
                            );
                          })),
                        ],
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(
                          vertical: device1Info.localHeight / 110,
                        ),
                        height: device1Info.localHeight / 2,
                        width: device1Info.localWidth / 8,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ...List.generate(
                              colors.length,
                              (index1) => GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selected1 = index1;
                                  });
                                },
                                child: Container(
                                  height: device1Info.localHeight / 40,
                                  width: device1Info.localHeight / 40,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 5, color: colorsshape[index1]),
                                      color: colors[index1],
                                      shape: BoxShape.circle),
                                ),
                              ),
                            )
                          ],
                        ))
                  ],
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: device1Info.screenHeight / 95),
                    width: device1Info.localWidth / 1.5,
                    child: ElevatedButton(
                        onPressed: widget.onPress,
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            backgroundColor: myblack),
                        child: const Center(
                          child: Text("Add to Card"),
                        )),
                  ))
            ],
          ),
        );
      },
    );
  }
}
