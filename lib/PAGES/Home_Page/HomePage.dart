import 'package:bhansa_ghar/PAGES/Home_Page/Add.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<Map<String, dynamic>> recipes = [
    {
      "title": "Pasta Carbonara",
      "time": "30 mins",
      "image": "assets/pasta.png",
      "ingredients": "Pasta, Eggs, Cheese",
      "servings": "2 servings",
    },
    {
      "title": "Grilled Sandwich",
      "time": "20 mins",
      "image": "assets/grilledSandwitch.png",
      "ingredients": "Bread, Cheese, Veggies",
      "servings": "1 serving",
    },
    {
      "title": "Classic Chicken Pot Pie",
      "time": "40 mins",
      "image": "assets/Defaultimg.png",
      "ingredients": "Chicken, Veggies, Pastry",
      "servings": "4 servings",
    },
    {
      "title": "Japanese Fried Chicken",
      "time": "35 mins",
      "image": "assets/Defaultimg.png",
      "ingredients": "Chicken, Soy Sauce, Flour",
      "servings": "3 servings",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top bar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage("assets/Defaultimg.png"),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "Hello, User 👋",
                          style: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.orangeAccent,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.orangeAccent.withOpacity(0.3),
                            blurRadius: 8,
                            offset: const Offset(2, 4),
                          ),
                        ],
                      ),
                      child: IconButton(
                        icon: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => add_recipe()));
                          },
                          child: const Icon(Icons.add, color: Colors.white),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Search Bar
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      hintText: "Search any recipe...",
                      hintStyle: GoogleFonts.roboto(
                          fontSize: 14, color: Colors.grey),
                      border: InputBorder.none,
                      contentPadding:
                      const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                // Categories
                Text(
                  "Categories",
                  style: GoogleFonts.roboto(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 90,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      categoryCard(
                          "Breakfast", Icons.free_breakfast, Colors.orange),
                      categoryCard(
                          "Lunch", Icons.lunch_dining, Colors.green),
                      categoryCard("Dinner", Icons.dinner_dining,
                          Colors.deepPurple),
                      categoryCard("Snacks", Icons.fastfood, Colors.pink),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // Recipes title
                Text(
                  "Recipes",
                  style: GoogleFonts.dancingScript(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
                const SizedBox(height: 12),

                // Recipe Grid
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: recipes.length,
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 0.65,
                  ),
                  itemBuilder: (context, index) {
                    final recipe = recipes[index];
                    return recipeCard(
                      recipe["title"],
                      recipe["time"],
                      recipe["image"],
                      recipe["ingredients"],
                      recipe["servings"],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Category Card Widget
  Widget categoryCard(String title, IconData icon, Color color) {
    return Container(
      width: 90,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 6),
          Text(
            title,
            style: GoogleFonts.roboto(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  // Recipe Card Widget
  Widget recipeCard(String title, String time, String imgPath,
      String ingredients, String servings) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with favorite icon
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: Image.asset(
                  imgPath,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                right: 8,
                top: 8,
                child: CircleAvatar(
                  radius: 14,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.favorite_border,
                      color: Colors.pink, size: 16),
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  ingredients,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.roboto(
                    fontSize: 12,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.access_time,
                        size: 16, color: Colors.grey),
                    const SizedBox(width: 3),
                    Text(
                      time,
                      style: GoogleFonts.roboto(
                          fontSize: 12, color: Colors.grey),
                    ),
                    const Spacer(),
                    const Icon(Icons.restaurant_menu,
                        size: 16, color: Colors.orange),
                    const SizedBox(width: 3),
                    Text(
                      servings,
                      style: GoogleFonts.roboto(
                          fontSize: 12, color: Colors.black54),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
