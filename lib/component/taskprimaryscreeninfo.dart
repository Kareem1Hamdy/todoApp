import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../Colors/app_colors.dart';
import '../Theme/app_Theme.dart';

class TaskInfo extends StatelessWidget {
  const TaskInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
        motion: DrawerMotion(),
        children: [
          SlidableAction(
              onPressed: (_){},
            icon: Icons.delete,
            label: 'Delete',
            autoClose: true,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12)
            ),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20)
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 4,
                  height: 70,
                  color: AppColors.primaryTopColor,
                ),
                const SizedBox(width: 8,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Play Basket Ball',
                        style: AppTheme.lightThemeData.textTheme.bodyMedium,
                      ),
                      SizedBox(height: 5,),
                      Row(
                        children: [
                          Icon(Icons.timelapse),
                          Text('10:30 AM')
                        ],
                      )
                    ],
                  ),
                ),
                GestureDetector(
                    onTap: (){},
                    child: Image.asset('assets/images/correct.png'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
