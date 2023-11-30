import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/src/values/strings.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../../blocs/banner/banner_bloc.dart';
import '../../blocs/course/course_bloc.dart';
import '../../router/routes.dart';
import '../widgets/section_title.dart';
import 'widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void didChangeDependencies() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<CourseBloc>().add(GetCoursesEvent(majorName: 'IPA'));
      context.read<BannerBloc>().add(GetBannersEvent());
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F7F8),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.read<AuthBloc>().getCurrentSignedInEmail() ?? '',
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            ),
            Text(
              'Selamat datang',
              style: TextStyle(fontSize: 10),
            ),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: CircleAvatar(
              backgroundColor: Colors.red,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const WelcomingWidget(),
              const SizedBox(height: 16),
              const SectionTitle(title: 'Terbaru'),
              const SizedBox(height: 8),
              BlocBuilder<BannerBloc, BannerState>(
                builder: (context, bannerState) {
                  if (bannerState is GetBannerLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (bannerState is GetBannerSuccessState) {
                    return BannerBuilder(
                      bannerList: bannerState.banners,
                    );
                  }

                  if (bannerState is GetBannerErrorState) {
                    return Column(
                      children: [
                        Center(
                          child: Text(bannerState.errorMessage),
                        ),
                        IconButton(
                          onPressed: () {
                            context.read<BannerBloc>().add(GetBannersEvent());
                          },
                          icon: const Icon(Icons.refresh),
                        ),
                      ],
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SectionTitle(title: Strings.pilihPelajaran),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.courseListScreen);
                    },
                    child: const Text('Lihat Semua'),
                  )
                ],
              ),
              const SizedBox(height: 8),
              BlocBuilder<CourseBloc, CourseState>(
                builder: (context, courseState) {
                  if (courseState is LoadingGetCoursesState) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (courseState is SuccessGetCoursesState) {
                    return CourseBuilder(courseList: courseState.data ?? []);
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
