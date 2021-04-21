import 'dart:core';

import 'package:bill_keep/custom_widgets/button_solid_with_icon.dart';
import 'package:bill_keep/custom_widgets/field_chips_input.dart';
import 'package:bill_keep/custom_widgets/header_text.dart';
import 'package:bill_keep/module/item/item_controller.dart';
import 'package:bill_keep/module/item/item_model.dart';
import 'package:bill_keep/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:get/get.dart';

class AddItemScreen extends StatelessWidget {
  static const routeName = 'add_item_screen';
  final ItemController itemController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: Container(
        height: Get.size.height * (3 / 4),
        color: Color(0xFF737373),
        // This line set the transparent background
        child: Container(
          height: Get.size.height * (3 / 4),
          decoration: ShapeDecoration(
            color: white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      HeaderText(
                        text: "Add new expense item",
                        alignment: Alignment.centerLeft,
                        color: wood_smoke,
                        size: 21,
                        weight: FontWeight.bold,
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: SvgPicture.asset(
                            "assets/icons/close.svg",
                          ))
                    ],
                  ),
                ),
                Container(
                  height: 2,
                  color: wood_smoke,
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Creating new expense board"),
                  ),
                ),
                FormBuilder(
                  key: itemController.formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: FormBuilderTextField(
                          name: 'name',
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(context),
                            FormBuilderValidators.minLength(context, 3),
                          ]),
                          decoration: InputDecoration(
                            hintText: 'Enter name',
                            hintStyle: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.w500,
                                color: wood_smoke),
                            contentPadding: EdgeInsets.all(16),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 2, color: black),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16))),
                            disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 2, color: black),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16))),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 2, color: black),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16))),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(width: 2, color: black),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16))),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: FormBuilderTextField(
                          name: 'description',
                          minLines: 3,
                          maxLines: 10,
                          decoration: InputDecoration(
                            hintText: 'Enter description',
                            hintStyle: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.w500,
                                color: wood_smoke),
                            contentPadding: EdgeInsets.all(16),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 2, color: black),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16))),
                            disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 2, color: black),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16))),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 2, color: black),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16))),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(width: 2, color: black),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16))),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: FormBuilderTextField(
                          name: 'amount',
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(context),
                            FormBuilderValidators.min(context, 1),
                          ]),
                          valueTransformer: (value) {
                            return int.parse(value);
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'Enter total amount spent',
                            hintStyle: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w500,
                              color: wood_smoke,
                            ),
                            contentPadding: EdgeInsets.all(16),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 2, color: black),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16))),
                            disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 2, color: black),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16))),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 2, color: black),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16))),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(width: 2, color: black),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16))),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: FormBuilderChipsInput(
                            decoration: InputDecoration(
                                hintText: 'Enter labels',
                                hintStyle: TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.w500,
                                    color: wood_smoke),
                                contentPadding: EdgeInsets.all(16),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(width: 2, color: black),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16))),
                                disabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(width: 2, color: black),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16))),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(width: 2, color: black),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16))),
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(width: 2, color: black),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16)))),
                            name: 'labels',
                            maxChips: 5,
                            findSuggestions: (String query) async {
                              if (query.isNotEmpty) {
                                var lowercaseQuery = query.toLowerCase();
                                var contactsToreturn = itemController.labels
                                    .where((profile) {
                                  return profile.id
                                      .toLowerCase()
                                      .contains(query.toLowerCase());
                                }).toList(growable: false)
                                      ..sort((a, b) => a.id
                                          .toLowerCase()
                                          .indexOf(lowercaseQuery)
                                          .compareTo(b.id
                                              .toLowerCase()
                                              .indexOf(lowercaseQuery)));
                                if (contactsToreturn.isEmpty) {
                                  contactsToreturn = <Label>[Label(id: query)];
                                }
                                return contactsToreturn;
                              } else {
                                return const <Label>[];
                              }
                            },
                            chipBuilder: (context, state, item) {
                              return InputChip(
                                key: ObjectKey(item),
                                label: Text(item.id),
                                avatar: CircleAvatar(
                                  // backgroundImage: NetworkImage(item.imageUrl),
                                  child: Text(
                                    item.id[0].toUpperCase(),
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                                onDeleted: () => state.deleteChip(item),
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                              );
                            },
                            suggestionBuilder: (context, state, item) {
                              return ListTile(
                                key: ObjectKey(item),
                                leading: CircleAvatar(
                                  // backgroundImage: NetworkImage(item.imageUrl),
                                  child: Text(
                                    item.id[0].toUpperCase(),
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ),
                                title: Text(item.id),
                                onTap: () => state.selectSuggestion(item),
                              );
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: FormBuilderImagePicker(
                          name: 'itemImage',
                          valueTransformer: (value) {
                            print('image value $value');
                            if (value != null && value.length > 0) {
                              return value[0];
                            } else
                              return value;
                          },
                          decoration: InputDecoration(
                              hintText: 'Select bill image',
                              hintStyle: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.w500,
                                color: wood_smoke,
                              ),
                              contentPadding: EdgeInsets.all(16),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 2, color: black),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16))),
                              disabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 2, color: black),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16))),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 2, color: black),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16))),
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 2, color: black),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)))),
                          maxImages: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Obx(
                      () => itemController.processing == false
                          ? ButtonPlainWithIcon(
                              color: wood_smoke,
                              textColor: white,
                              iconPath: "assets/icons/arrow_next.svg",
                              isPrefix: false,
                              isSuffix: true,
                              text: 'Submit',
                              callback: () {
                                itemController.createItem();
                              },
                            )
                          : ButtonPlainWithIcon(
                              color: wood_smoke,
                              textColor: white,
                              iconPath: "assets/icons/arrow_next.svg",
                              isPrefix: false,
                              isSuffix: true,
                              text: 'Processing...',
                              callback: () {},
                            ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
