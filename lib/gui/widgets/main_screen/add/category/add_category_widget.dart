import 'package:action_slider/action_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import '../../../../../data/entities/category.dart';
import '../../grid/grid_item_widget.dart';
import '../cost/add_cost_widget.dart';

class AddCategoryWidget extends StatefulWidget {
  const AddCategoryWidget({
    super.key,
    required this.categories,
  });
  final List<Category> categories;

  @override
  State<AddCategoryWidget> createState() => _AddCategoryWidgetState();
}

class _AddCategoryWidgetState extends State<AddCategoryWidget> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _nameFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  Color _sliderColor = Colors.blueAccent;
  Color _currentColor = const Color(0xff443a49);
  String _categoryName = "Моя категория";

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(100, 0, 0, 0),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        alignment: Alignment.topCenter,
                        padding: const EdgeInsets.only(left: 3, top: 7, right: 3),
                        child: const Text(
                          "Предпросмотр",
                          style: TextStyle(
                            color: Colors.white,
                          )
                        )
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  // TODO добавить действие при нажатии на категорию
                                });
                                FocusScope.of(context).unfocus();
                              },
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                height: 250,
                                width: 250,
                                decoration: BoxDecoration(
                                  color: _currentColor,
                                ),
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 30,
                                      child: Container(
                                        padding: const EdgeInsets.only(left: 10, right: 10),
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                          _categoryName,
                                          style: TextStyle(
                                            color: getTextColorByBackgroundColor(_currentColor.value.toRadixString(16)),
                                            fontSize: 25,
                                          ),
                                          softWrap: true,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: Container(
                                        padding: const EdgeInsets.only(left: 10, right: 10),
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                          "Потрачено: 11843 руб.",
                                          style: TextStyle(
                                            color: getTextColorByBackgroundColor(_currentColor.value.toRadixString(16)),
                                            fontSize: 15,
                                          ),
                                          softWrap: true,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 7,
                                      child: Container(
                                        padding: const EdgeInsets.only(left: 10, right: 10),
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "Доля от ограничения: 27%",
                                          style: TextStyle(
                                            color: getTextColorByBackgroundColor(_currentColor.value.toRadixString(16)),
                                            fontSize: 15,
                                          ),
                                          softWrap: true,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.all(8),
                      child: const Text(
                        "Выберите цвет:",
                        style: TextStyle(
                          color: Colors.white,
                        )
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(bottom: 5),
                      child: MaterialColorPicker(
                        selectedColor: _currentColor,
                        onlyShadeSelection: true,
                        onColorChange: (Color currentColor) {
                          setState(() {
                            _currentColor = currentColor;
                          });
                        },
                      ),
                    )
                  ],
                )
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(left: 3, top: 5, right: 3, bottom: 3),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(100, 0, 0, 0),
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(left: 3, top: 3, right: 3, bottom: 5),
                  child: TextFormField(
                    focusNode: _nameFocusNode,
                    controller: _nameController,
                    keyboardType: TextInputType.text,
                    cursorWidth: 2,
                    cursorHeight: 25,
                    cursorColor: Colors.white,
                    autovalidateMode: AutovalidateMode.always,
                    maxLength: 50,
                    buildCounter: (BuildContext context, { int? currentLength, int? maxLength, bool? isFocused }) {
                      return Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "$currentLength/$maxLength",
                          style: const TextStyle(
                            color: Colors.grey,

                          )
                        )
                      );
                    },
                    onChanged: (currentText) {
                      if (currentText.isNotEmpty
                      & (currentText != "")
                      & (RegExp(r'^\d+').hasMatch(currentText) == false)
                      ) {
                        if (currentText[0] != " ") {
                          setState(() {
                            _categoryName = currentText;
                          });
                        } else {
                          setState(() {
                            _categoryName = "Моя категория";
                          });
                        }
                      } else {
                        setState(() {
                          _categoryName = "Моя категория";
                        });
                      }
                    },
                    validator: (currentText) {
                      if (currentText == null || currentText.isEmpty) {
                        return null;
                      } else {
                        if (currentText == "") {
                          return "Название не может быть пустым";
                        } else if (currentText[0] == ' ') {
                          return "Название не может начинаться с пробела";
                        } else if (RegExp(r'^\d+').hasMatch(currentText)) {
                          return "Название не может начинаться с цифры";
                        }
                        else {
                          return null;
                        }
                      }
                    },
                    style: const TextStyle(
                        height: 1.27,
                        color: Colors.white,
                        fontSize: 20
                    ),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                      label: const Text(
                        "Название",
                      ),
                      labelStyle: const TextStyle(
                        color: Colors.grey,
                      ),
                      floatingLabelAlignment: FloatingLabelAlignment.start,
                      floatingLabelStyle: MaterialStateTextStyle
                          .resolveWith((Set<MaterialState> states) {
                        final Color color = states.contains(MaterialState.error) ? Theme.of(context).colorScheme.error :
                        _nameFocusNode.hasFocus ? Colors.blueAccent : Colors.grey;
                        return TextStyle(color: color);
                      }
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                          borderSide: BorderSide(
                            color: Colors.blueAccent,
                            width: 2,
                          )
                      ),
                      errorBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 2,
                          )
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                    ),
                  )
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(left: 3, top: 5, right: 3, bottom: 3),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(100, 0, 0, 0),
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(left: 3, top: 3, right: 3, bottom: 5),
                  child: TextFormField(
                    focusNode: _descriptionFocusNode,
                    controller: _descriptionController,
                    keyboardType: TextInputType.multiline,
                    cursorWidth: 2,
                    cursorHeight: 25,
                    maxLines: 10,
                    cursorColor: Colors.white,
                    autovalidateMode: AutovalidateMode.always,
                    validator: (currentText) {
                      if (currentText == null || currentText.isEmpty) {
                        return null;
                      } else {
                        if (currentText == "") {
                          return "Описание не может быть пустым";
                        } else if (currentText[0] == ' ') {
                          return "Описание не может начинаться с пробела";
                        } else if (RegExp(r'^\d+').hasMatch(currentText)) {
                          return "Описание не может начинаться с цифры";
                        }
                        else {
                          return null;
                        }
                      }
                    },
                    style: const TextStyle(
                        height: 1.27,
                        color: Colors.white,
                        fontSize: 20
                    ),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                      label: const Text(
                        "Описание",
                      ),
                      labelStyle: const TextStyle(
                        color: Colors.grey,
                      ),
                      alignLabelWithHint: true,
                      floatingLabelAlignment: FloatingLabelAlignment.start,
                      floatingLabelStyle: MaterialStateTextStyle
                          .resolveWith((Set<MaterialState> states) {
                        final Color color = states.contains(MaterialState.error) ? Theme.of(context).colorScheme.error :
                        _descriptionFocusNode.hasFocus ? Colors.blueAccent : Colors.grey;
                        return TextStyle(color: color);
                      }
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                          borderSide: BorderSide(
                            color: Colors.blueAccent,
                            width: 2,
                          )
                      ),
                      errorBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 2,
                          )
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                    ),
                  )
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
              child:  ActionSlider.standard(
                sliderBehavior: SliderBehavior.stretch,
                backgroundColor: const Color.fromARGB(100, 0, 0, 0),
                toggleColor: _sliderColor,
                iconAlignment: Alignment.centerRight,
                loadingIcon: const SizedBox(
                    width: 55,
                    child: Center(
                        child: SizedBox(
                          width: 24.0,
                          height: 24.0,
                          child: CircularProgressIndicator(
                              strokeWidth: 2.0,
                              color: Colors.black
                          ),
                        )
                    )
                ),
                successIcon: const SizedBox(
                    width: 55, child: Center(
                    child: Icon(
                        Icons.check_rounded
                    )
                )
                ),
                icon: const SizedBox(
                    width: 55,
                    child: Center(
                        child: Icon(
                            Icons.arrow_forward_ios)
                    )
                ),
                action: (controller) async {
                  controller.loading(); //starts loading animation
                  await Future.delayed(const Duration(seconds: 1));
                  controller.success(); //starts success animation
                  setState(() {
                    _sliderColor = Colors.green;
                  });
                  await Future.delayed(const Duration(seconds: 2));
                  setState(() {
                    _sliderColor = Colors.blueAccent;
                  });
                  controller.reset(); //resets the slider
                },
                child: const Text(
                    "Добавить...",
                    style: TextStyle(
                      color: Colors.grey,
                    )
                ),
              ),
            ),
            const SizedBox(height: 88),
          ]
      ),
    );
  }
}