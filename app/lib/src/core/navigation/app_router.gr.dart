// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    DashboardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DashboardContainer(),
      );
    },
    EditProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EditProfileScreen(),
      );
    },
    EmptyRouterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EmptyRouterScreen(),
      );
    },
    FoodRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FoodContainer(),
      );
    },
    FoodDetailRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<FoodDetailRouteArgs>(
          orElse: () =>
              FoodDetailRouteArgs(uuid: pathParams.getString('uuid')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: FoodDetailScreen(
          key: args.key,
          uuid: args.uuid,
        ),
      );
    },
    FoodEditRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<FoodEditRouteArgs>(
          orElse: () => FoodEditRouteArgs(uuid: pathParams.getString('uuid')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: FoodEditScreen(
          key: args.key,
          uuid: args.uuid,
        ),
      );
    },
    FoodListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FoodListScreen(),
      );
    },
    HoustonDashboardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HoustonDashboardContainer(),
      );
    },
    LandingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LandingScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginScreen(),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileContainer(),
      );
    },
    ProfileDetailRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ProfileDetailRouteArgs>(
          orElse: () =>
              ProfileDetailRouteArgs(uuid: pathParams.getString('uuid')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProfileDetailScreen(
          key: args.key,
          uuid: args.uuid,
        ),
      );
    },
    ProfileEditRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ProfileEditRouteArgs>(
          orElse: () =>
              ProfileEditRouteArgs(uuid: pathParams.getString('uuid')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProfileEditScreen(
          key: args.key,
          uuid: args.uuid,
        ),
      );
    },
    ProfileListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileListScreen(),
      );
    },
    RegisterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RegisterScreen(),
      );
    },
    WelcomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WelcomeScreen(),
      );
    },
  };
}

/// generated route for
/// [DashboardContainer]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute({List<PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EditProfileScreen]
class EditProfileRoute extends PageRouteInfo<void> {
  const EditProfileRoute({List<PageRouteInfo>? children})
      : super(
          EditProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EmptyRouterScreen]
class EmptyRouterRoute extends PageRouteInfo<void> {
  const EmptyRouterRoute({List<PageRouteInfo>? children})
      : super(
          EmptyRouterRoute.name,
          initialChildren: children,
        );

  static const String name = 'EmptyRouterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FoodContainer]
class FoodRoute extends PageRouteInfo<void> {
  const FoodRoute({List<PageRouteInfo>? children})
      : super(
          FoodRoute.name,
          initialChildren: children,
        );

  static const String name = 'FoodRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FoodDetailScreen]
class FoodDetailRoute extends PageRouteInfo<FoodDetailRouteArgs> {
  FoodDetailRoute({
    Key? key,
    required String uuid,
    List<PageRouteInfo>? children,
  }) : super(
          FoodDetailRoute.name,
          args: FoodDetailRouteArgs(
            key: key,
            uuid: uuid,
          ),
          rawPathParams: {'uuid': uuid},
          initialChildren: children,
        );

  static const String name = 'FoodDetailRoute';

  static const PageInfo<FoodDetailRouteArgs> page =
      PageInfo<FoodDetailRouteArgs>(name);
}

class FoodDetailRouteArgs {
  const FoodDetailRouteArgs({
    this.key,
    required this.uuid,
  });

  final Key? key;

  final String uuid;

  @override
  String toString() {
    return 'FoodDetailRouteArgs{key: $key, uuid: $uuid}';
  }
}

/// generated route for
/// [FoodEditScreen]
class FoodEditRoute extends PageRouteInfo<FoodEditRouteArgs> {
  FoodEditRoute({
    Key? key,
    required String uuid,
    List<PageRouteInfo>? children,
  }) : super(
          FoodEditRoute.name,
          args: FoodEditRouteArgs(
            key: key,
            uuid: uuid,
          ),
          rawPathParams: {'uuid': uuid},
          initialChildren: children,
        );

  static const String name = 'FoodEditRoute';

  static const PageInfo<FoodEditRouteArgs> page =
      PageInfo<FoodEditRouteArgs>(name);
}

class FoodEditRouteArgs {
  const FoodEditRouteArgs({
    this.key,
    required this.uuid,
  });

  final Key? key;

  final String uuid;

  @override
  String toString() {
    return 'FoodEditRouteArgs{key: $key, uuid: $uuid}';
  }
}

/// generated route for
/// [FoodListScreen]
class FoodListRoute extends PageRouteInfo<void> {
  const FoodListRoute({List<PageRouteInfo>? children})
      : super(
          FoodListRoute.name,
          initialChildren: children,
        );

  static const String name = 'FoodListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HoustonDashboardContainer]
class HoustonDashboardRoute extends PageRouteInfo<void> {
  const HoustonDashboardRoute({List<PageRouteInfo>? children})
      : super(
          HoustonDashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'HoustonDashboardRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LandingScreen]
class LandingRoute extends PageRouteInfo<void> {
  const LandingRoute({List<PageRouteInfo>? children})
      : super(
          LandingRoute.name,
          initialChildren: children,
        );

  static const String name = 'LandingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileContainer]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileDetailScreen]
class ProfileDetailRoute extends PageRouteInfo<ProfileDetailRouteArgs> {
  ProfileDetailRoute({
    Key? key,
    required String uuid,
    List<PageRouteInfo>? children,
  }) : super(
          ProfileDetailRoute.name,
          args: ProfileDetailRouteArgs(
            key: key,
            uuid: uuid,
          ),
          rawPathParams: {'uuid': uuid},
          initialChildren: children,
        );

  static const String name = 'ProfileDetailRoute';

  static const PageInfo<ProfileDetailRouteArgs> page =
      PageInfo<ProfileDetailRouteArgs>(name);
}

class ProfileDetailRouteArgs {
  const ProfileDetailRouteArgs({
    this.key,
    required this.uuid,
  });

  final Key? key;

  final String uuid;

  @override
  String toString() {
    return 'ProfileDetailRouteArgs{key: $key, uuid: $uuid}';
  }
}

/// generated route for
/// [ProfileEditScreen]
class ProfileEditRoute extends PageRouteInfo<ProfileEditRouteArgs> {
  ProfileEditRoute({
    Key? key,
    required String uuid,
    List<PageRouteInfo>? children,
  }) : super(
          ProfileEditRoute.name,
          args: ProfileEditRouteArgs(
            key: key,
            uuid: uuid,
          ),
          rawPathParams: {'uuid': uuid},
          initialChildren: children,
        );

  static const String name = 'ProfileEditRoute';

  static const PageInfo<ProfileEditRouteArgs> page =
      PageInfo<ProfileEditRouteArgs>(name);
}

class ProfileEditRouteArgs {
  const ProfileEditRouteArgs({
    this.key,
    required this.uuid,
  });

  final Key? key;

  final String uuid;

  @override
  String toString() {
    return 'ProfileEditRouteArgs{key: $key, uuid: $uuid}';
  }
}

/// generated route for
/// [ProfileListScreen]
class ProfileListRoute extends PageRouteInfo<void> {
  const ProfileListRoute({List<PageRouteInfo>? children})
      : super(
          ProfileListRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RegisterScreen]
class RegisterRoute extends PageRouteInfo<void> {
  const RegisterRoute({List<PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [WelcomeScreen]
class WelcomeRoute extends PageRouteInfo<void> {
  const WelcomeRoute({List<PageRouteInfo>? children})
      : super(
          WelcomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
