import 'package:flutter/material.dart';

class RateWidget extends StatefulWidget {
  const RateWidget({super.key});

  @override
  State<RateWidget> createState() => _RateWidgetState();
}

class _RateWidgetState extends State<RateWidget> {
  int selectedStars = 0;
  final TextEditingController bioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Title
          const Text(
            "Rate",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),

          // ⭐ Stars
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              final isSelected = index < selectedStars;
              return IconButton(
                icon: Icon(
                  Icons.star,
                  color: isSelected ? Colors.orange : Colors.grey[300],
                  size: 30,
                ),
                onPressed: () {
                  setState(() {
                    selectedStars = index + 1;
                  });
                },
              );
            }),
          ),

          const SizedBox(height: 16),

          // BIO Label
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "BIO",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Colors.indigo[900],
              ),
            ),
          ),
          const SizedBox(height: 6),

          // BIO TextField
          TextField(
            controller: bioController,
            maxLines: 3,
            decoration: InputDecoration(
              hintText: "Write something...",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.orange),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Buttons
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    // Handle cancel
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.orange,
                    side: const BorderSide(color: Colors.orange),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text("Cancel"),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle send
                    final rating = selectedStars;
                    final bio = bioController.text;
                    // Use them as needed
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text("Send"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
