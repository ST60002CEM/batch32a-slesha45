import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:final_assignment/core/common/provider/theme_view_model_provider.dart';
import 'package:final_assignment/features/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:final_assignment/features/profile/presentation/view_model/profile_view_model.dart';
import 'package:final_assignment/features/profile/presentation/widgets/profile_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
class ProfileView extends ConsumerStatefulWidget {
  const ProfileView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileViewState();
}

class _ProfileViewState extends ConsumerState<ProfileView> {
  bool showYesNoDialog = true;
  bool isDialogShowing = false;

  @override
  Widget build(BuildContext context) {
    final profileState = ref.watch(profileViewmodelProvider);

    if (profileState.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            profileState.isLoading
                ? const CircularProgressIndicator()
                : Text("${profileState.authEntity?.fName}"
                    " "
                    "${profileState.authEntity?.lName}"),
            ProfileMenu(
              text: "Enable Finger Print",
              icon: "assets/icons/fingerprint.svg",
              press: () {
                if (mounted) {
                  ref
                      .read(profileViewmodelProvider.notifier)
                      .enableFingerprint();
                }
              },
            ),
            ProfileMenu(
              text: "Log Out",
              icon: "assets/icons/logout.svg",
              press: () {
                if (mounted) {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.warning,
                    title: 'Logout',
                    desc: 'Are You Sure You Want To Logout?',
                    btnOkOnPress: () {
                      if (mounted) {
                        ref.read(authViewModelProvider.notifier).logout();
                      }
                    },
                    btnCancelOnPress: () {},
                  ).show();
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.brown,
                  padding: const EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  backgroundColor: Colors.brown.withOpacity(0.2),
                ),
                onPressed: () {},
                child: Row(
                  children: [
                    const SizedBox(width: 20),
                    const Expanded(child: Text("Dark Mode/Light Mode")),
                    Switch(
                      value: ref.watch(themeViewModelProvider),
                      onChanged: (value) {
                        ref.read(themeViewModelProvider.notifier).changeTheme();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
