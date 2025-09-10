import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class add_recipe extends StatefulWidget {
  const add_recipe({super.key});

  @override
  State<add_recipe> createState() => _add_recipeState();
}

class _add_recipeState extends State<add_recipe> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController ingredientsController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController servingsController = TextEditingController();

  File? _imageFile; // store picked image

  // Function to pick image
  Future<void> _pickImage(ImageSource source) async {
    // Request permission
    if (source == ImageSource.camera) {
      var status = await Permission.camera.request();
      if (!status.isGranted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Camera permission denied ❌")),
        );
        return;
      }
    } else {
      var status = await Permission.photos.request();
      if (!status.isGranted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Gallery permission denied ❌")),
        );
        return;
      }
    }

    final pickedFile =
    await ImagePicker().pickImage(source: source, imageQuality: 70);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  // Show bottom drawer
  void _showImageSourceDrawer() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt, color: Colors.orange),
                title: const Text("Take a Photo"),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.image, color: Colors.green),
                title: const Text("Choose from Gallery"),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
          elevation: 0,
          title: Text(
            "Add Your Recipe",
            style: GoogleFonts.roboto(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Recipe Image Upload
                GestureDetector(
                  onTap: _showImageSourceDrawer,
                  child: Container(
                    height: 180,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.orange.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.orangeAccent, width: 1),
                    ),
                    child: _imageFile == null
                        ? const Center(
                      child: Icon(Icons.camera_alt,
                          size: 40, color: Colors.orange),
                    )
                        : ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.file(
                        _imageFile!,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Recipe Title
                buildTextField("Recipe Title", titleController, Icons.fastfood),
                const SizedBox(height: 15),

                // Ingredients
                buildTextField("Ingredients", ingredientsController,
                    Icons.list_alt, maxLines: 3),
                const SizedBox(height: 15),

                // Cooking Time
                buildTextField("Cooking Time (e.g. 30 mins)", timeController,
                    Icons.access_time),
                const SizedBox(height: 15),

                // Servings
                buildTextField("Servings (e.g. 2 people)", servingsController,
                    Icons.restaurant_menu),

                const SizedBox(height: 30),

                // Save Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orangeAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Recipe Added ✅")),
                        );
                      }
                    },
                    child: Text(
                      "Save Recipe",
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
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

  // Reusable Input Field
  Widget buildTextField(String hint, TextEditingController controller,
      IconData icon,
      {int maxLines = 1}) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      validator: (value) =>
      value == null || value.isEmpty ? "Please enter $hint" : null,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.orange),
        hintText: hint,
        hintStyle: GoogleFonts.roboto(fontSize: 14, color: Colors.grey),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.all(14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.orangeAccent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.orangeAccent),
        ),
      ),
    );
  }
}
