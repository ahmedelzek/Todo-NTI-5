import 'package:flutter/material.dart';
import 'package:todo_nti5/core/resources/app_colors.dart';

void showDeleteDialog(BuildContext context, VoidCallback onDelete) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.warning_rounded,
                color: AppColors.red,
                size: 50,
              ),
              SizedBox(height: 10),

              Text(
                "Delete Task",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 10),

              Text(
                "Are you sure you want to delete this task?",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14),
              ),

              SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Cancel"),
                    ),
                  ),

                  SizedBox(width: 10),

                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.red,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        onDelete();
                      },
                      child: Text("Delete", style: TextStyle(color: AppColors.white),),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}