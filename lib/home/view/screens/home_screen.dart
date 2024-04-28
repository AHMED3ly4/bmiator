import 'dart:math';

import 'package:bmiator/auth/data/models/bmi_model.dart';
import 'package:bmiator/auth/view/screens/auth_screen.dart';
import 'package:bmiator/auth/view/widgets/default_elevated_button.dart';
import 'package:bmiator/auth/view_model/auth_cubit.dart';
import 'package:bmiator/home/view/screens/history_screen.dart';
import 'package:bmiator/home/view/screens/result_screen.dart';
import 'package:bmiator/home/view/widgets/data_card.dart';
import 'package:bmiator/home/view/widgets/drawer_irem.dart';
import 'package:bmiator/home/view/widgets/gender_card.dart';
import 'package:bmiator/home/view/widgets/reusable_card.dart';
import 'package:bmiator/home/view_model/home_cubit.dart';
import 'package:bmiator/home/view_model/home_states.dart';
import 'package:bmiator/shared/firebase/farebase_utils.dart';
import 'package:bmiator/shared/theming/app_theme.dart';
import 'package:bmiator/shared/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender { male, female }

class HomeScreen extends StatefulWidget {
  static const routeName = "/home screen route name";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isMaleSelected = true;

  Gender? activeCard;

  int height = 170;

  int weight = 60;

  int age = 30;
  double calculateBmi(int weight, int height) {
    return weight / pow(height / 100, 2);
  }

  String getBmiStatue(double bmiGrade) {
    if (bmiGrade <= 18.5) {
      return "under weight";
    } else if (bmiGrade > 18.5 && bmiGrade <= 25) {
      return "normal";
    } else if (bmiGrade > 25 && bmiGrade <= 30) {
      return "over weight";
    } else {
      return "Obesity";
    }
  }

  final HomeCubit cubit = HomeCubit();
  @override
  Widget build(BuildContext context) {
    final user = BlocProvider.of<AuthViewModel>(context).currentUser;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: Drawer(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 12,
                ),
                Text(
                  "Welcome, ${user!.name.split(" ")[0]}",
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      fontSize: 24, color: AppTheme.lightBlueColor),
                ),
                SizedBox(
                  height: 40,
                ),
                DrawerItem(
                    text: "Your History",
                    icon: Icons.history,
                    onTap: () {
                      Navigator.pushNamed(context, HistoryScreen.routeName);
                    },
                ),
                DrawerItem(
                    text: "Log out",
                    icon: Icons.logout,
                    onTap: () {
                      FirebaseUtils.logout().then((value) => Navigator.pushReplacementNamed(context, AuthScreen.routeName));
                    },
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text('Bmiator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    function: () {
                      setState(() {
                        activeCard = Gender.male;
                      });
                    },
                    color: activeCard == Gender.male
                        ? AppTheme.cardColor
                        : AppTheme.inactiveCardColor,
                    cardChild: GenderCard(
                      icon: FontAwesomeIcons.person,
                      text: 'male',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    function: () {
                      setState(() {
                        activeCard = Gender.female;
                      });
                    },
                    color: activeCard == Gender.female
                        ? AppTheme.cardColor
                        : AppTheme.inactiveCardColor,
                    cardChild: GenderCard(
                      icon: FontAwesomeIcons.personDress,
                      text: 'female',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: AppTheme.cardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'height'.toUpperCase(),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        'cm',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 25),
                      thumbColor: Theme.of(context).primaryColor,
                      overlayColor: Color(0x29EB1555),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                      min: 120.0,
                      max: 220.0,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: AppTheme.cardColor,
                    cardChild: DataCard(
                        dataName: 'weight',
                        dataNumber: weight,
                        plusFunction: () {
                          setState(() {
                            weight++;
                          });
                        },
                        minusFunction: () {
                          setState(() {
                            weight--;
                          });
                        }),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: AppTheme.cardColor,
                    cardChild: DataCard(
                      dataName: 'age',
                      dataNumber: age,
                      plusFunction: () {
                        setState(() {
                          age++;
                        });
                      },
                      minusFunction: () {
                        setState(() {
                          age--;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          BlocListener<HomeCubit, HomeStates>(
            bloc: cubit,
            listener: (_, state) {
              if (state is AddBMILoading) {
                UIUtils.showLoading(context);
              } else if (state is AddBMIError) {
                UIUtils.hideLoading(context);
                UIUtils.showMessage(state.errorMessage);
              } else if (state is AddBMISuccess) {
                UIUtils.hideLoading(context);
                Navigator.pushNamed(
                  context,
                  ResultScreen.routeName,
                  arguments: BMIModel(
                    statue: getBmiStatue(calculateBmi(weight, height)),
                    grade: calculateBmi(weight, height),
                    weight: weight,
                    height: height,
                    age: age,
                    date: DateTime.now(),
                  ),
                );
              }
            },
            child: DefaultElevatedButton(
              label: "Calculate",
              onPressed: () {
                cubit.addBmi(
                  BlocProvider.of<AuthViewModel>(context).currentUser!.id,
                  BMIModel(
                    statue: getBmiStatue(calculateBmi(weight, height)),
                    grade: calculateBmi(weight, height),
                    weight: weight,
                    height: height,
                    age: age,
                    date: DateTime.now(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
