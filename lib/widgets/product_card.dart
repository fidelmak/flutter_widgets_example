import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String image;
  final String name;
  final String category;
  final double price;
  final bool isLiked;
  final bool isSelected;
  final ValueChanged<Product> onSelected;
  final Color backgroundColor;
  final Color borderColor;
  final double borderRadius;
  final Color iconColor;
  final double imageRadius;
  final Color titleColor;
  final double titleFontSize;
  final double categoryFontSize;
  final double priceFontSize;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;

  ProductCard({
    Key? key,
    required this.image,
    required this.name,
    required this.category,
    required this.price,
    required this.isLiked,
    required this.isSelected,
    required this.onSelected,
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.grey,
    this.borderRadius = 20.0,
    this.iconColor = Colors.red,
    this.imageRadius = 40.0,
    this.titleColor = Colors.black,
    this.titleFontSize = 14.0,
    this.categoryFontSize = 12.0,
    this.priceFontSize = 16.0,
    this.margin = const EdgeInsets.symmetric(vertical: 20),
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 15,
              spreadRadius: 10),
        ],
      ),
      margin: margin,
      child: Container(
        padding: padding,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              left: 0,
              top: 0,
              child: IconButton(
                icon: Icon(
                  isLiked ? Icons.favorite : Icons.favorite_border,
                  color: isLiked ? iconColor : borderColor,
                ),
                onPressed: () {},
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(height: isSelected ? 15 : 0),
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: imageRadius,
                        backgroundColor: Colors.orange.withAlpha(40),
                      ),
                      Image.asset(image)
                    ],
                  ),
                ),
                Text(
                  name,
                  style: TextStyle(
                    fontSize: titleFontSize,
                    color: titleColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  category,
                  style: TextStyle(
                    fontSize: categoryFontSize,
                    color: Colors.orange,
                  ),
                ),
                Text(
                  price.toString(),
                  style: TextStyle(
                    fontSize: priceFontSize,
                    color: titleColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ).ripple(() {
        Navigator.of(context).pushNamed('/detail');
        onSelected(Product(
          image: image,
          name: name,
          category: category,
          price: price,
          isLiked: isLiked,
          isSelected: isSelected,
        ));
      }, borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
    );
  }
}

class Product {
  final String image;
  final String name;
  final String category;
  final double price;
  final bool isLiked;
  final bool isSelected;

  Product({
    required this.image,
    required this.name,
    required this.category,
    required this.price,
    required this.isLiked,
    required this.isSelected,
  });
}

extension RippleEffect on Widget {
  Widget ripple(VoidCallback onTap, {BorderRadiusGeometry? borderRadius}) {
    return GestureDetector(
      onTap: onTap,
      child: this,
    );
  }
}
