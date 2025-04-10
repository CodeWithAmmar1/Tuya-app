import 'package:flutter/material.dart';
import '../widgets/custom_container.dart';
import '../widgets/button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            // Profile Avatar
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("assets/images/image.png"),
            ),
            const SizedBox(height: 16),

            // User Name
            Text(
              "Andrey Thomson",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
            ),

            // User Email
            Text(
              "audrey@nootify.com",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
            ),

            const SizedBox(height: 20),

            // Edit Profile Button
            Button(text: "Edit Profile", onPressed: () {}),

            const SizedBox(height: 40),

            // First Container (My Account, Support)
            CustomContainer(
              items: [
                // My Account Tile
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  minLeadingWidth: 20,
                  leading: const Icon(
                    Icons.person_outline,
                    color: Colors.white,
                    size: 24,
                  ),
                  title: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      "My Account",
                      style: Theme.of(
                        context,
                      ).textTheme.titleMedium!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                    size: 16,
                  ),
                  onTap: () {},
                ),

                const Divider(
                  thickness: 1,
                  color: Colors.white10,
                  height: 1,
                ),

                // Support Tile
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  minLeadingWidth: 20,
                  leading: const Icon(
                    Icons.help_outline,
                    color: Colors.white,
                    size: 24,
                  ),
                  title: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      "Support",
                      style: Theme.of(
                        context,
                      ).textTheme.titleMedium!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                    size: 16,
                  ),
                  onTap: () {},
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Second Container (Notifications, Logout)
            CustomContainer(
              items: [
                // Push Notifications Tile
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  minLeadingWidth: 20,
                  leading: const Icon(
                    Icons.notifications_none_outlined,
                    color: Colors.white,
                    size: 24,
                  ),
                  title: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      "Push Notifications",
                      style: Theme.of(
                        context,
                      ).textTheme.titleMedium!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                    ),
                  ),
                  trailing: Switch(
                    value: switchValue,
                    onChanged: (newValue) {
                      setState(() {
                        switchValue = newValue;
                      });
                    },
                    activeColor: Colors.white,
                    activeTrackColor: const Color(0xFF2AA84E),
                  ),
                ),

                const Divider(
                  thickness: 1,
                  color: Colors.white10,
                  height: 1,
                ),

                // Logout Tile
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  minLeadingWidth: 20,
                  leading: Icon(
                    Icons.logout,
                    color: Colors.red.shade400,
                    size: 24,
                  ),
                  title: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      "Logout",
                      style: Theme.of(
                        context,
                      ).textTheme.titleMedium!.copyWith(
                            color: Colors.red.shade400,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                    ),
                  ),
                  onTap: () {},
                ),
              ],
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
