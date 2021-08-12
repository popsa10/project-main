import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/constants.dart';
import 'package:project/getSharedPrefrences.dart';
import 'package:project/shared/components.dart';
import 'package:project/shared/cubit/app_cubit.dart';
import 'package:project/shared/cubit/app_states.dart';

class HomeLayout extends StatefulWidget {
  int currentIndex;
  HomeLayout({Key key, this.currentIndex}) : super(key: key);
  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  AppCubit appCubit = AppCubit();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    uploadOfflineData();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
              bottomNavigationBar: customNavigationBar(
                  currentIndex: cubit.currentIndex, cubit: cubit),
              body: cubit.screens[cubit.currentIndex]);
        },
      ),
    );
  }

  Future<void> uploadOfflineData() async{
    if(await getSharedPrefrences("checkTime")!=null){
      String locId = await getSharedPrefrences("locId");
      if(await getSharedPrefrences("checkIn")=="true"){
        appCubit.checkIn(userid: await getSharedPrefrences("id"),location: locId,date:await getSharedPrefrences("checkDate"),time:await getSharedPrefrences("checkTime"));
      }else{
        appCubit.checkIn(userid: await getSharedPrefrences("id"),location: locId,date:await getSharedPrefrences("checkDate"),time:await getSharedPrefrences("checkTime"));
      }
    }
  }
}
