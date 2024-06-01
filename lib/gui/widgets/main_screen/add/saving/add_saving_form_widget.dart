import 'package:action_slider/action_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../data/models/database/database_model.dart';
import '../../../../../data/entities/saving.dart';
import '../../../../../data/entities/target.dart';
import '../cost/add_cost_widget.dart';

class AddSavingFormWidget extends StatefulWidget {
  const AddSavingFormWidget({
    super.key,
    required this.target,
  });
  final Target target;

  @override
  State<AddSavingFormWidget> createState() => _AddSavingFormWidgetState();
}

class _AddSavingFormWidgetState extends State<AddSavingFormWidget> {
  final _formKey = GlobalKey<FormState>();
  final _savingController = TextEditingController();
  final _savingFocusNode = FocusNode();
  Color _sliderColor = Colors.blueAccent;

  @override
  void dispose() {
    super.dispose();
    _savingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8),
      child: Form(
        key: _formKey,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 3, top: 3, right: 3, bottom: 3),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(100, 0, 0, 0),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(left: 3, top: 3, right: 3, bottom: 10),
                      child: const Text(
                          "Добавить сбережение",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1
                      ),
                    ),
                    Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.only(left: 3, top: 3, right: 3, bottom: 5),
                        child: TextFormField(
                          focusNode: _savingFocusNode,
                          controller: _savingController,
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
                              color: _savingFocusNode.hasFocus ? Colors.white :
                              (_savingController.text != "" ? Colors.white : Colors.grey),
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
                              _savingFocusNode.hasFocus ? Colors.blueAccent : Colors.grey;
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
                  ],
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
                    _savingFocusNode.unfocus();
                    controller.loading(); //starts loading animation
                    if (
                    _formKey.currentState!.validate() &&
                    _savingController.text.isNotEmpty
                    ) {
                      bool result = await context.read<DatabaseModel>().addSaving(
                        Saving(
                          price: int.parse(_savingController.text),
                          targetId: widget.target.id,
                        ),
                      );
                      if (result) {
                        controller.success();
                        setState(() {
                          _sliderColor = Colors.green;
                        });
                        await Future.delayed(const Duration(seconds: 2));
                        setState(() {
                          _sliderColor = Colors.blueAccent;
                        });
                        controller.reset();
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
              )
            ]
        ),
      ),
    );
  }
}
