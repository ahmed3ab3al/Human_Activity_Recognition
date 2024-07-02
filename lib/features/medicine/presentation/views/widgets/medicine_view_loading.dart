import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_loading_item.dart';

class MedicineViewLoading extends StatelessWidget {
  const MedicineViewLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return CustomLoadingItem(width: 60, height: 100);
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                width: 10,
              );
            },
            itemCount: 10,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height,
          child: ListView.separated(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    CustomLoadingItem(
                      width: MediaQuery.sizeOf(context).width / 3,
                      height: MediaQuery.sizeOf(context).height / 20,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    CustomLoadingItem(
                      width: MediaQuery.sizeOf(context).width / 2,
                      height: MediaQuery.sizeOf(context).height / 10,
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                width: 10,
              );
            },
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}
