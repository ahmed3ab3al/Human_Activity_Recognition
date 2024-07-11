import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/features/home/presentation/view_models/mentor_cubit/mentor_cubit.dart';
import 'package:graduation_project/features/home/presentation/view_models/mentor_cubit/mentor_states.dart';
import 'package:graduation_project/features/home/presentation/views/widgets/mentor_view_body.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    if (MentorCubit.get(context).getAllPatients == null) {
      MentorCubit.get(context).getPatients();
    }
    var scaffoldKey = GlobalKey<ScaffoldState>();
    var idController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return Scaffold(
      key: scaffoldKey,
      body: const AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark),
          child: MentorViewBody()),
      floatingActionButton: BlocConsumer<MentorCubit, MentorStates>(
        listener: (context, state) {
          if (state is SendRequestSuccess) {
            idController.text = "";
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Center(
                    child: Text(
                        "Send Request Success, Now it is ${state.sendCareRequest.result!.status!}")),
              ),
            );
          } else if (state is SendRequestError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Center(child: Text(state.error)),
              ),
            );
          }
        },
        builder: (context, state) {
          return GestureDetector(
            child: Container(
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
              child: CircleAvatar(
                maxRadius: 30.r,
                backgroundColor: Colors.transparent,
                child: Icon(
                  MentorCubit.get(context).fabIcon,
                  color: Colors.white,
                ),
              ),
            ),
            onTap: () {
              if (MentorCubit.get(context).isBottomSheetShown) {
                if (formKey.currentState!.validate()) {
                  Navigator.pop(context);
                  MentorCubit.get(context).changeSendIcon(add: true);
                  MentorCubit.get(context).sendRequest(idController.text);
                }
              } else {
                scaffoldKey.currentState?.showBottomSheet(
                    (context) => Form(
                        key: formKey,
                        child: Container(
                          color: const Color(0xffDEDEDE),
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomTextFormFiled(
                                hint: 'ID Number',
                                customController: idController,
                                type: TextInputType.text,
                                prefix: Icons.perm_identity_rounded,
                              )
                            ],
                          ),
                        )),
                    elevation: 20
                ).closed.then((value){
                  MentorCubit.get(context).changeSendIcon(add: true);
                });
                MentorCubit.get(context).changeSendIcon(add: false);
              }
            },
          );
        },
      ),
    );
  }
}
