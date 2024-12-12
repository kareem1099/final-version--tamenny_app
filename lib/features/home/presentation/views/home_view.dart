import 'package:flutter/material.dart';
import 'widgets/health_scan_categories_widget.dart';
import 'widgets/home_custom_app_bar.dart';
import 'widgets/main_banner_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: HomeCustomAppBar(),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 27,
                ),
              ),
              SliverToBoxAdapter(
                child: MainBannerWidget(),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 24,
                ),
              ),
              SliverToBoxAdapter(
                child: HealthScanCategoriesWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
