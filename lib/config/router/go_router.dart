import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:gamemuncheol_upstream/common/layout/bottom_nav_layout.dart';
import 'package:gamemuncheol_upstream/common/layout/home/layout/home_layout.dart';
import 'package:gamemuncheol_upstream/common/service/redirect_service.dart';
import 'package:gamemuncheol_upstream/core/app/auth/model/sign_in_method.dart';
import 'package:gamemuncheol_upstream/core/app/auth/presentation/view/screen/open_auth_webview/screen/oauth_webview_screen.dart';
import 'package:gamemuncheol_upstream/core/app/auth/presentation/view/screen/social_auth/screen/social_auth_screen.dart';
import 'package:gamemuncheol_upstream/core/app/walk_through/presentation/view/screen/policy/policy_accept/screen/policy_accept_screen.dart';
import 'package:gamemuncheol_upstream/core/app/walk_through/presentation/view/screen/policy/privacy_policy_summary/screen/policy_summary_screen.dart';
import 'package:gamemuncheol_upstream/core/app/walk_through/presentation/view/screen/splash/splash_screen.dart';
import 'package:gamemuncheol_upstream/core/resource/extra.dart';
import 'package:gamemuncheol_upstream/feature/member/presentation/view/nickname/screen/register_nickname_screen.dart';
import 'package:gamemuncheol_upstream/feature/post/model/post.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/view/save_steps/step1_register_match/screen/search_match_screen.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/view/save_steps/step2_select_stakeholder/screen/select_stakeholder_screen.dart';
import 'package:gamemuncheol_upstream/feature/video/presentation/screen/video_permission_screen.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/view/save_steps/step3_upload_video/screen/video_upload_screen.dart';
import 'package:gamemuncheol_upstream/feature/video/presentation/screen/full_screen.dart';

part 'go_router.g.dart';

@Riverpod(keepAlive: true)
GoRouter goRouter(
  GoRouterRef ref, {
  required RedirectService redirectService,
}) {
  SlideTransition setTransition(context, animation, secondaryAnimation, child) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1, 0),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
  }

  return GoRouter(
    initialLocation: SplashScreen.PATH,
    redirect: redirectService.redirectLogic,
    routes: [
      GoRoute(
        path: SplashScreen.PATH,
        name: SplashScreen.NAME,
        builder: (context, state) => const SplashScreen(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, child) {
          return BottomNavLayout(
            child: child,
          );
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: HomeLayout.PATH,
                name: HomeLayout.NAME,
                pageBuilder: (context, state) {
                  return CustomTransitionPage(
                    child: const HomeLayout(),
                    transitionsBuilder: setTransition,
                  );
                },
              )
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: "/second",
                pageBuilder: (context, state) {
                  return CustomTransitionPage(
                    child: const SizedBox(),
                    transitionsBuilder: setTransition,
                  );
                },
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: SocialAuthScreen.PATH,
        name: SocialAuthScreen.NAME,
        builder: (context, state) => const SocialAuthScreen(),
      ),
      GoRoute(
        path: OauthWebviewScreen.PATH,
        name: OauthWebviewScreen.NAME,
        builder: (context, state) {
          final Extra extraData = state.extra as Extra;
          final SignInMethod signInMethod = extraData.data["signInMethod"];

          switch (signInMethod) {
            case SignInMethod.apple:
              return OauthWebviewScreen.apple();
            case SignInMethod.google:
              return OauthWebviewScreen.google();
            default:
              return OauthWebviewScreen.google();
          }
        },
      ),
      GoRoute(
        path: PolicyAcceptScreen.PATH,
        name: PolicyAcceptScreen.NAME,
        builder: (context, state) => const PolicyAcceptScreen(),
      ),
      GoRoute(
        path: PolicySummaryScreen.PATH,
        name: PolicySummaryScreen.NAME,
        builder: (context, state) => const PolicySummaryScreen(),
      ),
      GoRoute(
        path: RegisterNicknameScreen.PATH,
        name: RegisterNicknameScreen.NAME,
        builder: (context, state) => const RegisterNicknameScreen(),
      ),
      GoRoute(
        path: VideoPermissionScreen.PATH,
        name: VideoPermissionScreen.NAME,
        builder: (context, state) => const VideoPermissionScreen(),
      ),
      GoRoute(
        path: SearchMatchScreen.PATH,
        name: SearchMatchScreen.NAME,
        builder: (context, state) => const SearchMatchScreen(),
        routes: [
          GoRoute(
            path: SelectStakeHolderScreen.PATH,
            name: SelectStakeHolderScreen.NAME,
            builder: (context, state) => const SelectStakeHolderScreen(),
            routes: [
              GoRoute(
                path: VideoUploadScreen.PATH,
                name: VideoUploadScreen.NAME,
                builder: (context, state) => const VideoUploadScreen(),
              ),
            ],
          ),
        ],
      ),

      GoRoute(
        path: FullScreen.PATH,
        name: FullScreen.NAME,
        builder: (context, state) {
          return FullScreen(
            post: state.extra as Post,
          );
        },
      ),
      // GoRoute(
      //   path: VideoUploadScreen.PATH,
      //   name: VideoUploadScreen.NAME,
      //   builder: (context, state) => const VideoUploadScreen(),
      // ),
      // GoRoute(
      //   path: EnterYoutubeUrlScreen.PATH,
      //   name: EnterYoutubeUrlScreen.NAME,
      //   builder: (context, state) => const EnterYoutubeUrlScreen(),
      // ),
      // GoRoute(
      //   path: YoutubeUrlPreviewScreen.PATH,
      //   name: YoutubeUrlPreviewScreen.NAME,
      //   builder: (context, state) {
      //     final Extra extraData = state.extra as Extra;
      //     return YoutubeUrlPreviewScreen.fromExtraData(extraData);
      //   },
      // ),
      // GoRoute(
      //   path: ManagePermissionScreen.PATH,
      //   name: ManagePermissionScreen.NAME,
      //   builder: (context, state) {
      //     final Extra extraData = state.extra as Extra;
      //     return ManagePermissionScreen.fromExtraData(extraData);
      //   },
      // ),
      // GoRoute(
      //   path: FeedFormScreen.PATH,
      //   name: FeedFormScreen.NAME,
      //   builder: (context, state) => const FeedFormScreen(),
      // ),
      // GoRoute(
      //   path: ChangeThumbImageScreen.PATH,
      //   name: ChangeThumbImageScreen.NAME,
      //   builder: (context, state) {
      //     final Extra? extraData = state.extra as Extra?;
      //     return ChangeThumbImageScreen.fromExtra(extraData);
      //   },
      // ),
      // GoRoute(
      //   path: VideoFilePreviewScreenV2.PATH,
      //   name: VideoFilePreviewScreenV2.NAME,
      //   builder: (context, state) {
      //     final Extra extraData = state.extra as Extra;
      //     return VideoFilePreviewScreenV2.fromExtraData(extraData);
      //   },
      // ),
    ],
  );
}
