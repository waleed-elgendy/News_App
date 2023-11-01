import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Models/CategoryModel.dart';
import 'package:news_app/Pages/categoryPage.dart';
import 'package:news_app/Services/GetNews.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key}) : super(key: key);
  final List<CategoryModel> categories = const [
    CategoryModel(image: "assets/general.jpg",name: "general",),
    CategoryModel(image:"assets/entertainment.jpg",name: "entertainment"),
    CategoryModel(image:"assets/health.png",name: "health"),
    CategoryModel(image:"assets/business.jpg",name: "business"),
    CategoryModel(image:"assets/science.webp",name: "science"),
    CategoryModel(image:"assets/sports.png",name: "sports"),
    CategoryModel(image:"assets/technology.webp",name: "technology"),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 81,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(left: 7, right: 7),
            child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return  CategoryPage(category: categories[index].name,);
                    }),
                  );
                },
                child: Categorywidget(
                  categories: categories,
                  index: index,
                ))),
      ),
    );
  }
}

class Categorywidget extends StatelessWidget {
  const Categorywidget({
    super.key,
    required this.categories,
    required this.index,
  });

  final List<CategoryModel> categories;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 40),
          width: 150,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            image: DecorationImage(
                image: AssetImage(categories[index].image), fit: BoxFit.fill),
          ),
          child: Center(
              child: Text(
            categories[index].name,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          )),
        ),
      ],
    );
  }
}
