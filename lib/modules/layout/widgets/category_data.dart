class CategoryData{
  String id;
  String name;
  String image;

  CategoryData({required this.id, required this.name, required this.image, });
  static List<CategoryData> categories=[
    //CategoryData(id:"all", name:"all",image: ""),
    CategoryData(
        id:"Birthday",
        name: "This is a Birthday Party ",
        image: "assets/images/bdimg.png"
    ),
    CategoryData(
        id:"Sports",
        name: "We Are Going To Play Football",
        image: "assets/images/Rectangle 977.png"
    ),
    CategoryData(
        id:"Meeting",
        name: "Meeting for Updating The Development Method ",
        image: "assets/images/Frame 17 (1).png"
    ),
    CategoryData(
        id:"birthday",
        name: "Birthday",
        image: "assets/images/bdimg.png"
    ),
    CategoryData(
        id:"birthday",
        name: "Birthday",
        image: "assets/images/bdimg.png"
    ),
    CategoryData(
        id:"birthday",
        name: "Birthday",
        image: "assets/images/bdimg.png"
    ),
  ];
}