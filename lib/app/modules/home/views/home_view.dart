import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    FocusNode keyword_focus_node = FocusNode();
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: SizedBox(
          height: Get.height,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).padding.top,
                color: Colors.blue,
              ),
              Expanded(
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      controller: controller.scrollController,
                      physics: BouncingScrollPhysics(),
                      child: Obx(() {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            children: [
                              SizedBox(
                                height: AppBar().preferredSize.height,
                              ),
                              for (int i = 0; i < controller.chat_data_0.length; i++)
                                createBubbleChat(controller.chat_data_0[i + 1]["id"], controller.chat_data_0[i + 1]["message"]),
                              for (int i = 0; i < controller.chat_data.length; i++)
                                createBubbleChat(controller.chat_data[i + 1]["id"], controller.chat_data[i + 1]["message"])
                            ],
                          ),
                        );
                      }),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      height: AppBar().preferredSize.height,
                      color: Colors.white.withAlpha(230),
                      child: Row(
                        children: [
                          Text(
                            "ChatBot",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: Get.height * 0.07,
                // color: Colors.blue.withAlpha(100),
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller.keywordValue,
                        focusNode: keyword_focus_node,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          isCollapsed: false,
                          isDense: false,
                          hintText: "Masukkan 2 Kata",
                          contentPadding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Get.width * 0.02,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        color: Colors.black,
                        onPressed: () {
                          keyword_focus_node.unfocus();
                          controller.getChat();
                          Future.delayed(0.75.seconds, () {
                            controller.scrollController.animateTo(
                              controller.scrollController.position.maxScrollExtent,
                              curve: Curves.ease,
                              duration: 1.seconds,
                            );
                          });
                        },
                        icon: Icon(
                          Icons.send_rounded,
                          // size: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget createBubbleChat(int id, String message) {
    switch (id) {
      case 0:
        return Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                            topLeft: Radius.circular(8),
                            bottomLeft: Radius.circular(8),
                          ),
                          color: Colors.blue,
                        ),
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: Get.width * 0.7,
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                            child: Column(
                              children: [
                                Text(
                                  message,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.005,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Get.height * 0.01,
            ),
          ],
        );
      case 1:
        return Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                            topLeft: Radius.circular(8),
                            bottomLeft: Radius.circular(8),
                          ),
                          color: Colors.blue,
                        ),
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: Get.width * 0.7,
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                            child: Column(
                              children: [
                                Text(
                                  message,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.005,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Get.height * 0.01,
            ),
          ],
        );
      case 2:
        return Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Material(
                        color: Colors.green[300],
                        borderRadius: BorderRadius.circular(8),
                        child: InkWell(
                          onTap: () {
                            controller.keywordValue.text = message;
                            controller.getChat();
                            Future.delayed(0.75.seconds, () {
                              controller.scrollController.animateTo(
                                controller.scrollController.position.maxScrollExtent,
                                curve: Curves.ease,
                                duration: 1.seconds,
                              );
                            });
                          },
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            child: Container(
                              constraints: BoxConstraints(
                                maxWidth: Get.width * 0.7,
                              ),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                                child: Column(
                                  children: [
                                    Text(
                                      message,
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.005,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Get.height * 0.01,
            ),
          ],
        );
      case 99:
        return Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                            topLeft: Radius.circular(8),
                            bottomLeft: Radius.circular(8),
                          ),
                          color: Colors.amber[400],
                        ),
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: Get.width * 0.7,
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                            child: Column(
                              children: [
                                Text(
                                  message,
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.005,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Get.height * 0.01,
            ),
          ],
        );
      default:
        return Text(message);
    }
  }
}
