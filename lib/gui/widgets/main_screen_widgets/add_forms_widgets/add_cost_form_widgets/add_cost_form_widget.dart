import 'package:action_slider/action_slider.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import '../../../../../data/entities/category.dart';
import '../../grid_widgets/grid_item_widget.dart';

class AddCostFormWidget extends StatefulWidget {
  const AddCostFormWidget({
    super.key,
    required this.categories,
  });
  final List<Category> categories;

  @override
  State<AddCostFormWidget> createState() => _AddCostFormWidgetState();
}

class _AddCostFormWidgetState extends State<AddCostFormWidget> {
  int? _selectedCategory;
  final _formKey = GlobalKey<FormState>();
  final _costController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _costFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
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
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.only(left: 3, top: 3, bottom: 7),
                          child: GradientText(
                            "Выберите категорию:",
                            colors: const [
                              Colors.red,
                              Colors.orange,
                              Colors.yellow,
                              Colors.green,
                              Colors.blue,
                              Colors.indigo,
                              Colors.purple,
                            ],
                          )
                      ),
                      Container(
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.topLeft,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                            scrollDirection: Axis.horizontal,
                            itemCount: widget.categories.length,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    _selectedCategory = index;
                                  });
                                  FocusScope.of(context).unfocus();
                                },
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  height: 150,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    color: (_selectedCategory == index || _selectedCategory == null)
                                        ? HexColor(widget.categories[index].color!)
                                        : HexColor(widget.categories[index].color!).withOpacity(0.3),
                                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                                    border: Border.all(
                                      color: _selectedCategory == index ? Colors.white : Colors.transparent,
                                      width: 3,
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        flex: 30,
                                        child: Container(
                                          padding: const EdgeInsets.only(left: 5, right: 7),
                                          alignment: Alignment.bottomLeft,
                                          child: Text(
                                            widget.categories[index].name,
                                            style: TextStyle(
                                              color: (_selectedCategory == index || _selectedCategory == null)
                                                  ? getTextColorByBackgroundColor(widget.categories[index].color!)
                                                  : getTextColorByBackgroundColor(widget.categories[index].color!).withOpacity(0.6),
                                              fontSize: 20,
                                            ),
                                            softWrap: true,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 5,
                                        child: Container(
                                          padding: const EdgeInsets.only(left: 7, right: 7),
                                          alignment: Alignment.bottomLeft,
                                          child: Text(
                                            "Потрачено: 11843 руб.",
                                            style: TextStyle(
                                              color: (_selectedCategory == index || _selectedCategory == null)
                                                  ? getTextColorByBackgroundColor(widget.categories[index].color!)
                                                  : getTextColorByBackgroundColor(widget.categories[index].color!).withOpacity(0.6),
                                              fontSize: 10,
                                            ),
                                            softWrap: true,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 7,
                                        child: Container(
                                          padding: const EdgeInsets.only(left: 7, right: 7),
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "Доля от ограничения: 27%",
                                            style: TextStyle(
                                              color: (_selectedCategory == index || _selectedCategory == null)
                                                  ? getTextColorByBackgroundColor(widget.categories[index].color!)
                                                  : getTextColorByBackgroundColor(widget.categories[index].color!).withOpacity(0.6),
                                              fontSize: 10,
                                            ),
                                            softWrap: true,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (BuildContext context, int index) {
                              return const SizedBox(width: 8);
                            },
                          ),
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
                        focusNode: _costFocusNode,
                        controller: _costController,
                        keyboardType: TextInputType.number,
                        cursorWidth: 2,
                        cursorHeight: 25,
                        cursorColor: Colors.white,
                        autovalidateMode: AutovalidateMode.always,
                        validator: (currentText) {
                          if (currentText == null || currentText.isEmpty) {
                            return null;
                          } else {
                            if (currentText == "") {
                              return "Сумма не может быть пустой";
                            } else if (currentText.contains(" ")) {
                              return "Сумма не может содержать пробелы";
                            } else if (currentText[0] == '0') {
                              return "Сумма не может начинаться с нуля";
                            } else if (checkCostTextValidation(currentText)) {
                              return "Сумма содержит недопустимые символы";
                            } else {
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
                          suffixIcon: Icon(
                            Icons.currency_ruble,
                            size: 20,
                            color: _costFocusNode.hasFocus ? Colors.white :
                            (_costController.text != "" ? Colors.white : Colors.grey),
                          ),
                          label: const Text(
                            "Сумма",
                          ),
                          labelStyle: const TextStyle(
                            color: Colors.grey,
                          ),
                          floatingLabelAlignment: FloatingLabelAlignment.start,
                          floatingLabelStyle: MaterialStateTextStyle
                              .resolveWith((Set<MaterialState> states) {
                            final Color color = states.contains(MaterialState.error) ? Theme.of(context).colorScheme.error :
                            _costFocusNode.hasFocus ? Colors.blueAccent : Colors.grey;
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
                padding: const EdgeInsets.only(left: 20, top: 20, right: 30),
                child:  ActionSlider.standard(
                  sliderBehavior: SliderBehavior.stretch,
                  backgroundColor: const Color.fromARGB(100, 0, 0, 0),
                  toggleColor: Colors.blueAccent,
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
                      width: 55, child: Center(child: Icon(Icons.check_rounded))),
                  icon: const SizedBox(
                      width: 55,
                      child: Center(
                          child: Icon(
                              Icons.arrow_forward_ios)
                      )
                  ),
                  action: (controller) async {
                    controller.loading(); //starts loading animation
                    await Future.delayed(const Duration(seconds: 3));
                    controller.success(); //starts success animation
                    await Future.delayed(const Duration(seconds: 1));
                    controller.reset(); //resets the slider
                  },
                  child: const Text(
                    "Добавить...",
                    style: TextStyle(
                      color: Colors.white,
                    )
                  ),
                ),
              )
            ]
        ),
      ),
    );
  }
}

bool checkCostTextValidation(String text) {
  List<String> validCharsList = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"];

  List<String> textList = text.split("");

  for (String char in textList) {
    if (!validCharsList.contains(char)) {
      return true;
    }
  }

  return false;
}