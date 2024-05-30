import 'package:action_slider/action_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/data/entities/target.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import '../../../../../data/models/database_model.dart';
import '../../grid/grid_item_widget.dart';

class AddTargetWidget extends StatefulWidget {
  const AddTargetWidget({super.key});

  @override
  State<AddTargetWidget> createState() => _AddTargetWidgetState();
}

class _AddTargetWidgetState extends State<AddTargetWidget> {
  int? _selectedCategory;
  int? _selectedPriority;
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _nameFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  Color _sliderColor = Colors.blueAccent;
  String _targetPeriod = "";
  bool _isPeriodSelected = false;
  List<DateTime?>? _selectedPeriod;

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
                          itemCount: context.watch<DatabaseModel>().categories.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedCategory = index;
                                });
                                FocusScope.of(context).unfocus();
                              },
                              child: Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                  color: (_selectedCategory == index || _selectedCategory == null)
                                      ? HexColor(context.watch<DatabaseModel>().categories[index].color)
                                      : HexColor(context.watch<DatabaseModel>().categories[index].color).withOpacity(0.3),
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
                                          context.watch<DatabaseModel>().categories[index].name,
                                          style: TextStyle(
                                            color: (_selectedCategory == index || _selectedCategory == null)
                                                ? getTextColorByBackgroundColor(context.watch<DatabaseModel>().categories[index].color)
                                                : getTextColorByBackgroundColor(context.watch<DatabaseModel>().categories[index].color).withOpacity(0.6),
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
                                                ? getTextColorByBackgroundColor(context.watch<DatabaseModel>().categories[index].color)
                                                : getTextColorByBackgroundColor(context.watch<DatabaseModel>().categories[index].color).withOpacity(0.6),
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
                                                ? getTextColorByBackgroundColor(context.watch<DatabaseModel>().categories[index].color)
                                                : getTextColorByBackgroundColor(context.watch<DatabaseModel>().categories[index].color).withOpacity(0.6),
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
              padding: const EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(100, 0, 0, 0),
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                children: [
                  Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(left: 5, top: 3, bottom: 7),
                      child: const Text(
                        "Выберите приоритет:",
                        style: TextStyle(
                          color: Colors.grey,
                        )
                      )
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      child: Row(
                          children: List.generate(10, (index) {
                            return Container(
                              margin: const EdgeInsets.only(left: 3, right: 3, bottom: 1),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedPriority = index;
                                  });
                                  FocusManager.instance.primaryFocus?.unfocus();
                                },
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: _selectedPriority == null ? Colors.white.withOpacity(0.25)
                                        : (_selectedPriority == index) ? Colors.blueAccent
                                        : Colors.white.withOpacity(0.25),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Text(
                                    (index + 1).toString(),
                                    style: TextStyle(
                                      color: _selectedPriority == index ? Colors.white : Colors.black,
                                      fontSize: 15,
                                      fontWeight: _selectedPriority == index ? FontWeight.bold : FontWeight.normal
                                    ),
                                  ),
                                ),
                              ),
                            );
                          })
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(100, 0, 0, 0),
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                children: [
                  Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(left: 5, top: 3, bottom: 7),
                      child: const Text(
                          "Выберите пероид:",
                          style: TextStyle(
                            color: Colors.grey,
                          )
                      )
                  ),
                  InkWell(
                    onTap: () async {
                      await showDateRangePicker(
                        context: context,
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2050),
                        initialEntryMode: DatePickerEntryMode.calendarOnly,
                        saveText: "Сохранить",
                        builder: (BuildContext context, Widget? child) {
                          return Theme(
                            data: ThemeData.dark(),
                            child: child!,
                          );
                        }
                      ).then((value) {
                        if (value != null) {
                          setState(() {
                            _selectedPeriod = [value.start, value.end];
                          });
                        }});

                        if (_selectedPeriod!.length > 1) {
                          setState(() {
                            _isPeriodSelected = true;
                            _targetPeriod = getCurrentDate(_selectedPeriod!);
                          });
                        }

                        if (context.mounted) {
                          FocusManager.instance.primaryFocus?.unfocus();
                        }
                      },
                      borderRadius: BorderRadius.circular(100),
                      child: Container(
                        padding: const EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                        alignment: Alignment.center,
                        child: Text(
                          _isPeriodSelected ? _targetPeriod : "<  Выбрать период  >",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                          softWrap: true,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ],
                ),
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
                                color: Colors.white
                            ),
                          )
                      )
                  ),
                  successIcon: const SizedBox(
                      width: 55, child: Center(
                      child: Icon(
                        Icons.check_rounded,
                        color: Colors.black,
                      )
                  )
                  ),
                  failureIcon: const SizedBox(
                      width: 55, child: Center(
                      child: Icon(
                        Icons.close,
                        color: Colors.black,
                      ))
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
                    if (
                    _formKey.currentState!.validate() &&
                    _selectedCategory != null &&
                    _selectedPriority != null &&
                    _selectedPeriod != null &&
                    _nameController.text.isNotEmpty &&
                    _descriptionController.text.isNotEmpty
                    ) {
                      bool result = await context.read<DatabaseModel>().addTarget(
                        Target(
                          name: _nameController.text,
                          description: _descriptionController.text,
                          priority: _selectedPriority!,
                          firstDate: _selectedPeriod![0].toString(),
                          lastDate: _selectedPeriod![1].toString(),
                          categoryId: context.read<DatabaseModel>().categories[_selectedCategory!].id,
                        ),
                      );
                      if (!result) {
                        controller.failure();
                        setState(() {
                          _sliderColor = Colors.red;
                        });
                        await Future.delayed(const Duration(seconds: 2));
                        setState(() {
                          _sliderColor = Colors.blueAccent;
                        });
                        controller.reset();
                      } else {
                        controller.success();
                        setState(() {
                          _sliderColor = Colors.green;
                        });
                        await Future.delayed(const Duration(seconds: 2));
                        setState(() {
                          _sliderColor = Colors.blueAccent;
                        });
                        controller.reset();
                      }
                    } else {
                      controller.failure();
                      setState(() {
                        _sliderColor = Colors.red;
                      });
                      await Future.delayed(const Duration(seconds: 2));
                      setState(() {
                        _sliderColor = Colors.blueAccent;
                      });
                      controller.reset();
                    }
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

String getCurrentDate(List<DateTime?> period) {
  if (period.length <= 1) {
    return "Выбрать период";
  } else {
    return "${period[0]!.year}-${period[0]!.month}-${period[0]!.day}   -  "
        " ${period[1]!.year}-${period[1]!.month}-${period[1]!.day}   "
        "(${period[1]!.difference(period[0]!).inDays + 1} дн.)";
  }
}