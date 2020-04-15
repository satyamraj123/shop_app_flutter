import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/product_item.dart';
import 'products.dart';
class ProductsGrid extends StatelessWidget {
final bool showFav;
ProductsGrid(this.showFav);
  @override
  Widget build(BuildContext context) {
    final productsData=Provider.of<Products>(context);
    final loadedProducts=showFav?productsData.favouriteItems:productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemBuilder: (ctx, i) => Container(
          child: ChangeNotifierProvider.value(
            //create: (c)=>loadedProducts[i],
            value: loadedProducts[i],
                      child: ProductItem(//loadedProducts[i].id, loadedProducts[i].title,loadedProducts[i].imageUrl
                      ),
          )),
      itemCount: loadedProducts.length,
    );
  }
}
