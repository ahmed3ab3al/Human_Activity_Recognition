import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../../../constants.dart';
import '../../../../medicine/presentation/views/widgets/line_container.dart';

class BuildChatsItem extends StatelessWidget {
  const BuildChatsItem(
      {super.key,
      required this.name,
      required this.message,
      required this.time});

  final String name;
  final String message;
  final String time;

  @override
  Widget build(BuildContext context) {
    // Parse the ISO 8601 date string
    DateTime dateTime = DateTime.parse(time);
    // Format the date to the desired format
    String formattedDate = DateFormat('h:mm a').format(dateTime);
    return Column(
      children: [
        Row(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: AssetImage(anotherImage),
                  backgroundColor: Colors.blue,
                ),
                const Padding(
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
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          name,
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        formattedDate,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          message ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(),
                      //   child: Container(
                      //     width: 20,
                      //     height: 20,
                      //     decoration: BoxDecoration(
                      //       gradient: const LinearGradient(
                      //         colors: [
                      //           Color(0xff0E4CA1),
                      //           Color(0xff67A3F4),
                      //         ],
                      //         begin: Alignment.topCenter,
                      //         end: Alignment.bottomCenter,
                      //       ),
                      //       borderRadius: BorderRadius.circular(10.r),
                      //     ),
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: [
                      //         Text(
                      //           '1',
                      //           style: Styles.size16_700White,
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        15.verticalSpace,
        Padding(
          padding: EdgeInsets.only(left: 80.w),
          child: const LineContainer(),
        ),
      ],
    );
  }
}
