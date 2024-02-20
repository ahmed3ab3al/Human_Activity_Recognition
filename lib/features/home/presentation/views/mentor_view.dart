import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/features/home/presentation/views/widgets/mentor_view_body.dart';
import '../../../../core/widgets/custom_textFormField.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}
class _HomeViewState extends State<HomeView> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var idController = TextEditingController();
  bool isBottomSheetShown = false;
  var formKey = GlobalKey<FormState>();
  IconData fabIcon = Icons.add;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: const MentorViewBody(),
      floatingActionButton: GestureDetector(
        child:  Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                Color(0xff0E4CA1),
                Color(0xff67A3F4),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child:  CircleAvatar(
            maxRadius: 30.r,
            backgroundColor: Colors.transparent,
            child: Icon(fabIcon,color: Colors.white,),
          ),
        ),
        onTap: () {
          if (isBottomSheetShown) {
            if (formKey.currentState!.validate()) {
              Navigator.pop(context);
              isBottomSheetShown = false;
              setState(() {
                fabIcon = Icons.add;
              });
            }
          }
          else {
            scaffoldKey.currentState?.showBottomSheet((context) =>
                Form(
                        key: formKey,
                        child:   Container(
                          color: const Color(0xffDEDEDE),
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomTextFormFiled(
                                  hint: 'ID Number',
                                  customController: idController,
                                  type: TextInputType.number,
                                  prefix: Icons.perm_identity_rounded
                              )
                            ],
                          ),
                        )
                    ),
                elevation: 20
            );
            isBottomSheetShown = true;
            setState(() {
              fabIcon = Icons.check;
            }
            );
          }
        },
      ),
    );
  }
}

