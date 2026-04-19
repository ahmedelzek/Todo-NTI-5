import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_nti5/core/customized_widgets/header_profile.dart';
import 'package:todo_nti5/features/home/cubit/home_cubit.dart';
import 'package:todo_nti5/features/home/cubit/home_state.dart';
import 'package:todo_nti5/features/home/views/widgets/customized_list_task_item.dart';
import 'package:todo_nti5/features/home/views/widgets/customized_tasks_counter.dart';
import 'package:todo_nti5/features/home/views/widgets/extension_functions.dart';

import '../../../core/app_router/app_router_keys.dart';
import '../../../core/resources/app_assets.dart';
import '../../../core/resources/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => HomeCubit()..getTasks(),
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                var cubit = HomeCubit.get(context);

                if (state is HomeLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is HomeErrorState) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          state.error,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: AppColors.red),
                        ),
                        SizedBox(height: 16.h),
                        ElevatedButton(
                          onPressed: () => cubit.getTasks(),
                          child: const Text('Try Again'),
                        ),
                      ],
                    ),
                  );
                }
                if (state is HomeSuccessState) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          context.push(AppRouterKeys.profile);
                        },
                        child: Row(
                          children: [
                            HeaderProfile(
                              userName: state.userModel.username ?? "",
                              imagePath: state.userModel.imagePath,
                            ),
                            Spacer(),
                            IconButton(
                              onPressed: () {
                                context.go(AppRouterKeys.login);
                              },
                              icon: Icon(
                                Icons.logout_outlined,
                                color: AppColors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        child: customizedTasksCounter(
                          title: "Tasks",
                          count: state.tasks.length,
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 1.w),
                          itemCount: state.tasks.length,
                          itemBuilder: (context, index) {
                            var task = state.tasks[index];
                            return InkWell(
                              onTap: () async {
                                await context.push(AppRouterKeys.editTasks, extra: state.tasks[index]);
                                cubit.getTasks();
                              },
                              child: CustomizedListTaskItem(
                                title: task.title,
                                description: task.description,
                                date: extractDate(task.createdAt),
                                time: extractTime(task.createdAt),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                }
                return const SizedBox();
              },
            ),
          ),
          floatingActionButton: Builder(
            builder: (context) {
              return FloatingActionButton(
                onPressed: () async {
                  final cubit = HomeCubit.get(context);
                  await context.push(AppRouterKeys.addTasks);
                  cubit.getTasks();
                },
                backgroundColor: AppColors.green,
                child: SvgPicture.asset(
                  AppIcons.addIcon,
                  width: 24.w,
                  height: 24.h,
                  colorFilter: ColorFilter.mode(
                    AppColors.transparentGreen,
                    BlendMode.srcIn,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
