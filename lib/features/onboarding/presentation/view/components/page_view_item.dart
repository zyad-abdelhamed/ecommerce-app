import 'package:ecommerce_application/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({super.key, required this.pageViewItemModel});
  final PageViewItemModel pageViewItemModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          pageViewItemModel.titel,
          style: TextStyles.textStyle20Bold.copyWith( color: Colors.black,fontSize: 27),

        ),
        SizedBox(
          height: 300,
          child: Text(
            pageViewItemModel.subTitle,
            style: TextStyles.textStyle16grey.copyWith(color: Colors.indigo),
          ),
        )
      ],
    );
  }
}

//item model
class PageViewItemModel {
  final String titel, subTitle;

  PageViewItemModel({required this.titel, required this.subTitle});
}

//item model list
List<PageViewItemModel> pageViewItemList = [
  PageViewItemModel(
      titel: 'مرحبًا بك في عالم التسوق',
      subTitle: ' اكتشف آلاف المنتجات المتنوعة بأفضل الأسعار.'),
  PageViewItemModel(
      titel: 'تسوق بسهولة وسرعة',
      subTitle: 'أضف منتجاتك المفضلة إلى السلة وتابع خطوات الدفع بكل سلاسة.'),
  PageViewItemModel(
      titel: 'استلم طلبك في وقت قياسي',
      subTitle: 'شحن سريع وتتبع الطلبات مباشرة من التطبيق إلى باب منزلك.'),
];
