import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/features/medicine/presentation/views/widgets/line_container.dart';
import 'package:graduation_project/search_form_field.dart';

import 'core/utils/styles.dart';

class ChatsScreen extends StatelessWidget
{
   ChatsScreen({super.key});
final searchController=TextEditingController();
  @override
  Widget build(BuildContext context)
  {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 18.w,vertical: 30.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    Text('Messages',
                    style: Styles.size16_700Black,)
                  ],),
                  20.verticalSpace,
                 SearchTextFormFiled(hint: 'Search Chat', customController: searchController, type: TextInputType.text,),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => buildChatItem(),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 20.0,
                    ),
                    itemCount: 15,
                  ),

                ],
              ),
            ),
          ),
      ),
    );
  }


  // arrow function
  Widget buildChatItem() =>
      Column(
        children: [
          Row(
            children: [
              const Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  CircleAvatar(
                    radius: 30.0,
                    backgroundImage:
                      AssetImage('images/vitamin_a.png'),
                    backgroundColor: Colors.black,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                      bottom: 3.0,
                      end: 3.0,
                    ),
                    child: CircleAvatar(
                      radius: 7.0,
                      backgroundColor: Colors.greenAccent,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 20.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Eng/Ahmed Alaa',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          '02:00 pm',
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      children:
                      [
                        const Expanded(
                          child: Text(
                            'I suffered to do this والله',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                          ),
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xff0E4CA1),
                                  Color(0xff67A3F4),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),

                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '1',
                                  style: Styles.size16_700White,
                                ),
                              ],
                            ),
                          ),
                        ),],
                    ),
                  ],
                ),
              ),
            ],
          ),
          15.verticalSpace,
          Padding(
            padding:  EdgeInsets.only(left: 80.w),
            child: const LineContainer(),
          ),
        ],
      );

}