import 'package:flutter/material.dart';

class Chat_Page extends StatefulWidget {
  const Chat_Page({super.key});

  @override
  State<Chat_Page> createState() => _Chat_PageState();
}

class _Chat_PageState extends State<Chat_Page> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          color: Colors.grey[200], // placeholder for page content
        ),

        // input bar at the bottom
        bottomNavigationBar: SafeArea(
          child: Container(
            color: Colors.white, // input bar background
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8), // adds spacing
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: BorderSide.none,
                      ),
                      hintText: "Type a message",
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.blueAccent,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.send, color: Colors.white),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ),

      ),
    );
  }
}
