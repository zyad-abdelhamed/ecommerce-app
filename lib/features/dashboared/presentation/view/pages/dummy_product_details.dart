import 'package:ecommerce_application/core/theme/text_styles.dart';
import 'package:ecommerce_application/core/utils/sized_boxs.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DummyProductDetails extends StatelessWidget {
  const DummyProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(FontAwesomeIcons.arrowLeft),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Name Of Product',
              style: TextStyles.textStyle18black,
            ),
            SizedBoxs.sizedBoxH30,
            SizedBox(
              height: MediaQuery.of(context).size.height * 1 / 6,
              child: Row(
                children: [
                  const Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '100',
                            style: TextStyles.textStyleNewPrice,
                          ),
                          Text(
                            '120',
                            style: TextStyles.textStyleOldPrice,
                          ),
                        ],
                      )),
                  Expanded(
                      flex: 3,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.horizontal(
                            right: Radius.circular(10)),
                        child: Image.network(
                          fit: BoxFit.fill,
                          'https://d1b3667xvzs6rz.cloudfront.net/2018/09/Product.jpg',
                          errorBuilder: (context, error, stackTrace) {
                            return const Text("Image Of Product");
                          },
                        ),
                      )),
                ],
              ),
            ),
            SizedBoxs.sizedBoxH30,
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Description:-',
                      style: TextStyles.textStyle18black,
                    ),
                    SizedBoxs.sizedBoxH10,
                    Text(
                        'jfsdjkfjsdfdsfdskjfhsdhfkdshfhkdhfkdshfkhdkfkl;sd;sfldfdjflsdjfl;dsjf;ldjfl;jfl;dsfl;s;djfl;dsjfsdl;jf;dslfjdslfjdsl;fjdsljf;ldsjf;ldssfl;dsjl;jdljfdfj;ldsjfdskjldsjfdskhfkdshfkldshflkdshfklfjdklfjdlkfjkldsjflkdsjflksdjflkdsjflkdsjfkldsfjsdlkfjklsdjfkdslfjjdsklfjdslkfjdslkfjsdklfjsdlkfjsdklfjsdklfjsdklfjlksdjflkdsjflksdjflkdsfjdslkfjdslkfjslkdfjjlkjlkkldhfkldshflkdslfhdslksfhdslkfhsdlkfhlsdhflsdkhflsdkhfds')
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
