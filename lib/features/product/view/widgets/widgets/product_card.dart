import 'package:flutter/material.dart';
  import 'rating_stars.dart';

class ProductCard extends StatelessWidget {
  final String brand;
  final String title;
  final String image;
  final double rating;
  final int reviews;
  final int price;
  final int? oldPrice;
  final String? discount;
  final bool isNew;

  const ProductCard({
    super.key,
    required this.brand,
    required this.title,
    required this.image,
    required this.rating,
    required this.reviews,
    required this.price,
    this.oldPrice,
    this.discount,
    this.isNew = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [

          /// image
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(image, fit: BoxFit.cover),
                ),

                /// heart
                Positioned(
                  top: 10,
                  right: 10,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: const Icon(Icons.favorite_border, color: Colors.red),
                  ),
                ),

                /// badge
                if (discount != null || isNew)
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        discount ?? "New Arrival",
                        style: const TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  )
              ],
            ),
          ),

          /// info
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(brand, style: const TextStyle(color: Colors.grey)),

                Text(title,
                    style: TextStyle(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : null,
                        fontWeight: FontWeight.bold,
                        fontSize: 16)),

                const SizedBox(height: 4),
                Row(
                  children: [
                    RatingStars(rating: rating),
                    Text(" ($reviews)", style: const TextStyle(color: Colors.grey)),
                  ],
                ),

                const SizedBox(height: 6),

                Row(
                  children: [
                    Text("\$$price",
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(width: 8),
                    if (oldPrice != null)
                      Text("\$$oldPrice",
                          style: const TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey)),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}