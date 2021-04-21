import 'dart:core';
import 'package:bill_keep/controllers/controllers.dart';
import 'package:bill_keep/custom_widgets/button_solid_with_icon.dart';
import 'package:bill_keep/custom_widgets/field_chips_input.dart';
import 'package:bill_keep/custom_widgets/fom_builder_color_picker.dart';
import 'package:bill_keep/custom_widgets/header_text.dart';
import 'package:bill_keep/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';

import '../../data.dart';

class AddBoardScreen extends StatefulWidget {
  @override
  _AddBoardScreenState createState() => _AddBoardScreenState();
  static const routeName = 'board_screen';
}

class _AddBoardScreenState extends State<AddBoardScreen> {
  final BoardController _boardController = Get.find();

  @override
  void initState() {
    super.initState();
  }

  var options = ["Option 1", "Option 2", "Option 3"];

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
                        text: "Add new expense board",
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
                  key: _boardController.formKey,
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
                      // FormBuilderField(
                      //   name: "selection_name",
                      //   validator: FormBuilderValidators.compose([
                      //     FormBuilderValidators.required(context),
                      //   ]),
                      //   builder: (FormFieldState<dynamic> field) {
                      //     return InputDecorator(
                      //       decoration: InputDecoration(
                      //         labelText: "Select option",
                      //         contentPadding:
                      //             EdgeInsets.only(top: 10.0, bottom: 0.0),
                      //         border: InputBorder.none,
                      //         errorText: field.errorText,
                      //       ),
                      //       child: Container(
                      //         height: 200,
                      //         child: CupertinoPicker(
                      //           itemExtent: 30,
                      //           children: options.map((c) => Text(c)).toList(),
                      //           onSelectedItemChanged: (index) {
                      //             field.didChange(options[index]);
                      //           },
                      //         ),
                      //       ),
                      //     );
                      //   },
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.all(16.0),
                      //   child: FormBuilderDropdown(
                      //     name: 'gender',
                      //     decoration: InputDecoration(
                      //       labelText: 'Gender',
                      //     ),
                      //     initialValue: '',
                      //     allowClear: true,
                      //     hint: Text('Select Gender'),
                      //     validator: FormBuilderValidators.compose(
                      //       [
                      //         FormBuilderValidators.required(context),
                      //       ],
                      //     ),
                      //     items: ['', 'male', 'female', 'others']
                      //         .map((gender) => DropdownMenuItem(
                      //               value: gender,
                      //               child: Text('$gender'),
                      //             ))
                      //         .toList(),
                      //   ),
                      // ),

                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: FormBuilderChipsInput(
                            decoration: InputDecoration(
                                hintText: 'Enter collaborators phone number',
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
                            name: 'collaborators',
                            maxChips: 5,
                            findSuggestions: (String query) async {
                              await Future.delayed(
                                  Duration(milliseconds: 500), null);
                              if (query.isNotEmpty) {
                                var lowercaseQuery = query.toLowerCase();
                                var contactsToreturn = contacts
                                    .where((profile) {
                                  return profile.name
                                          .toLowerCase()
                                          .contains(query.toLowerCase()) ||
                                      profile.email
                                          .toLowerCase()
                                          .contains(query.toLowerCase());
                                }).toList(growable: false)
                                      ..sort((a, b) => a.name
                                          .toLowerCase()
                                          .indexOf(lowercaseQuery)
                                          .compareTo(b.name
                                              .toLowerCase()
                                              .indexOf(lowercaseQuery)));
                                if (contactsToreturn.isEmpty) {
                                  contactsToreturn = <Contact>[
                                    Contact(query, '', '')
                                  ];
                                }
                                return contactsToreturn;
                              } else {
                                return const <Contact>[];
                              }
                            },
                            chipBuilder: (context, state, item) {
                              return InputChip(
                                key: ObjectKey(item),
                                label: Text(item.name),
                                avatar: CircleAvatar(
                                  // backgroundImage: NetworkImage(item.imageUrl),
                                  child: Text(
                                    item.name[0].toUpperCase(),
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
                                    item.name[0].toUpperCase(),
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ),
                                title: Text(item.name),
                                subtitle: Text(item.email),
                                onTap: () => state.selectSuggestion(item),
                              );
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: FormBuilderImagePicker(
                          name: 'boardCoverImage',
                          valueTransformer: (value) {
                            print('image value $value');
                            if (value != null && value.length > 0) {
                              return value[0];
                            } else
                              return value;
                          },
                          decoration: InputDecoration(
                              hintText: 'Select an image',
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
                          maxImages: 1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: FormBuilderColorPickerField(
                          name: 'color',
                          valueTransformer: (value) {
                            print(Color(value.value));
                            return value.value;
                          },
                          colorPickerType: ColorPickerType.MaterialPicker,
                          decoration: InputDecoration(labelText: 'Pick Color'),
                        ),
                      )
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
                      () => _boardController.processing == false
                          ? ButtonPlainWithIcon(
                              color: wood_smoke,
                              textColor: white,
                              iconPath: "assets/icons/arrow_next.svg",
                              isPrefix: false,
                              isSuffix: true,
                              text: 'Submit',
                              callback: () {
                                // Navigator.of(context).pop();
                                _boardController.createBoard();
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
