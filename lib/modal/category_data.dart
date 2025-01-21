class CategoryModel {
  String title = "no title";
  String img = "no image";

  CategoryModel(
      {this.title = "no title",
      this.img = "no image",
});

}

List<CategoryModel> foodModelList = [
  CategoryModel(
    title: "ឆាឡូកឡាក់សាច់គោ",
    img: "https://cambodiatravel.com/images/2020/10/Beef-Lok-Lak-cambodia.jpg",

  ),
  CategoryModel(
    title: "នំបញ្ចុកសម្លរខ្មែរ",
    img:
        "https://ct-blog-assets.camboticket.com/wp-content/uploads/2023/06/08164008/62361700_1042275959296150_7188721955724328960_n-1.jpg",
  ),

];
