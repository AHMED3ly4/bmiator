import 'package:bmiator/auth/data/models/bmi_model.dart';
import 'package:bmiator/home/view/widgets/history_item.dart';
import 'package:bmiator/home/view/widgets/reusable_card.dart';
import 'package:bmiator/home/view_model/home_cubit.dart';
import 'package:bmiator/home/view_model/home_states.dart';
import 'package:bmiator/shared/firebase/farebase_utils.dart';
import 'package:bmiator/shared/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/theming/app_theme.dart';

class HistoryList extends StatefulWidget {
  const HistoryList({super.key, required this.userId});
  final String userId;

  @override
  State<HistoryList> createState() => _HistoryListState();
}

class _HistoryListState extends State<HistoryList> {
  final HomeCubit cubit = HomeCubit();
  final controller =ScrollController();
  BMIModel? lastFetchedBmi;
  List<BMIModel> history=[];
  Future<void> getMoreData() async {
      await FirebaseUtils.getBMIs(widget.userId,lastFetchedBmi?.date).then((moreData) {
        if(moreData != [] && moreData != null){
          setState(() {
            history.addAll((moreData));
          });
        }
      }).catchError((error){UIUtils.showMessage("Can not get data");});

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit.getBMIs(widget.userId);
    controller.addListener(() {
      if(controller.position.maxScrollExtent ==controller.offset){
        getMoreData();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ReusableCard(
        color: AppTheme.cardColor,
        cardChild:BlocBuilder<HomeCubit,HomeStates>(
          bloc: cubit,
          builder: (context, state) {
            if(state is GetBMIsLoading){
              return const Center(child: CircularProgressIndicator());
            }else if(state is GetBMIsError){
              return const Column(
                children: [
                  Icon(Icons.error),
                  Text("Can not find history"),
                ],
              );
            }else if(state is GetBMIsSuccess){
              history=state.history;
              lastFetchedBmi = history.last;
              return ListView.builder(
                controller: controller,
                itemCount: history.length+1,
                itemBuilder: (context, index) {
                  if(index < history.length){
                    return HistoryItem(bmi: history[index],homeCubit: cubit,);
                  }else{
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
