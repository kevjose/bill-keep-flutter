import 'package:bill_keep/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'color_widget.dart';

class ColorsSelectWidget extends StatefulWidget {
  final List<Color> colors;
  final Function callback;

  const ColorsSelectWidget({
    this.colors,
    this.callback,
  });

  @override
  _ColorsSelectWidgetState createState() => _ColorsSelectWidgetState();
}

class _ColorsSelectWidgetState extends State<ColorsSelectWidget> {
  List<Color> options = [];
  int selectedChoice;

  @override
  void initState() {
    super.initState();
    options = widget.colors;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0, top: 16.0),
      child: Wrap(
        alignment: WrapAlignment.start,
        spacing: 15,
        runSpacing: 15,
        children: List<Widget>.generate(
          options.length,
          (int index) {
            return ColorWidget(
              bgColor: options[index],
              borderColor: wood_smoke,
              shadowColor: wood_smoke,
              selected: selectedChoice == index,
              onTap: () {
                setState(() {
                  selectedChoice = index;
                  print(options[index]);
                  widget.callback(options[index]);
                });
              },
            );
          },
        ).toList(),
      ),
    );
  }
}
