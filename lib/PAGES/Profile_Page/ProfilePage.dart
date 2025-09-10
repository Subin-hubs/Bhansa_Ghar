import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              children: [
                // Profile Picture
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage("assets/Defaultimg.png"),
                ),
                SizedBox(height: 15),
                Text(
                  "Users_users",
                  style: GoogleFonts.roboto(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 30),

                // Profile Options
                Column(
                  children: [
                    _buildProfileOption(Icons.person, "Edit your Profile"),
                    _buildProfileOption(Icons.lock, "Change Password"),
                    _buildProfileOption(Icons.notifications, "Notification Settings"),
                    _buildProfileOption(Icons.help_outline, "Help & Support"),
                  ],
                ),

                SizedBox(height: 40),

                // Logout Button
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(screenWidth * 0.8, 50),
                    backgroundColor: Colors.red.shade400,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 5,
                  ),
                  child: Text(
                    "Log out",
                    style: GoogleFonts.roboto(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper widget for profile options
  Widget _buildProfileOption(IconData icon, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, size: 28, color: Colors.blueGrey),
          SizedBox(width: 15),
          Expanded(
            child: Text(
              title,
              style: GoogleFonts.roboto(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
        ],
      ),
    );
  }
}
