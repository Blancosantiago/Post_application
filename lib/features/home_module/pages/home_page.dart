import 'package:challenge_application/features/home_module/components/home_components/cubit/home_cubit.dart';
import 'package:challenge_application/features/home_module/components/home_components/presentation/home_components.dart';
import 'package:challenge_application/infrastructure/ioc_m.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildHomePageComponents(context));
  }

  _buildHomePageComponents(BuildContext context) {
    return HomeComponents(
      homeCubit: IocManager.getInstance().resolve<HomeCubit>(),
    );
  }
}
