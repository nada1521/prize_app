import 'package:flutter/material.dart';
import 'package:prize/core/utils/constants.dart';
import 'package:prize/core/widgets/orange_appbar_widget.dart';
import 'package:prize/features/setting/blog/model/blog_model.dart';
import 'package:prize/features/setting/blog/view/widgets/blog_widget.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<BlogModel> blogs = [
      BlogModel(
        puplishDate: "22 May 2025",
        headTitle: "Philips PowerPro Compact Bagless Vacuum",
        bodyTitle:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        imageUrl:
            "https://cdn.pixabay.com/photo/2025/06/05/16/39/desert-9643279_1280.jpg",
      ),
      BlogModel(
        puplishDate: "22 May 2025",
        headTitle: "Philips PowerPro Compact Bagless Vacuum",
        bodyTitle:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        imageUrl:
            "https://cdn.pixabay.com/photo/2020/03/24/20/42/namibia-4965457_960_720.jpg",
      ),
      BlogModel(
        puplishDate: "22 May 2025",
        headTitle: "Philips PowerPro Compact Bagless Vacuum",
        bodyTitle:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        imageUrl:
            "https://cdn.pixabay.com/photo/2025/04/23/21/03/utliberg-9553864_960_720.jpg",
      ),
      BlogModel(
        puplishDate: "22 May 2025",
        headTitle: "Philips PowerPro Compact Bagless Vacuum",
        bodyTitle:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        imageUrl:
            "https://cdn.pixabay.com/photo/2023/08/14/21/44/mountain-8190836_960_720.jpg",
      ),
      BlogModel(
        puplishDate: "22 May 2025",
        headTitle: "Philips PowerPro Compact Bagless Vacuum",
        bodyTitle:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        imageUrl:
            "https://cdn.pixabay.com/photo/2020/03/24/20/42/namibia-4965457_960_720.jpg",
      ),
      BlogModel(
        puplishDate: "22 May 2025",
        headTitle: "Philips PowerPro Compact Bagless Vacuum",
        bodyTitle:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        imageUrl:
            "https://cdn.pixabay.com/photo/2025/04/23/21/03/utliberg-9553864_960_720.jpg",
      ),
    ];
    return Scaffold(
      appBar: OrangeAppbarWidget(
        title: "Blog",
        showBackButton: true,
      ),
      body: GridView.builder(
        itemCount: blogs.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: .55,
        ),
        itemBuilder: (context, index) => BlogWidget(
          blog: blogs[index],
        ),
      ),
    );
  }
}
