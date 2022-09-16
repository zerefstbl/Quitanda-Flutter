import 'package:flutter/material.dart';

import '../../../config/custom.colors.dart';

import '../../../models/cart.item.model.dart';

import '../../../pages/common_widgets/quantity.widget.dart';

import '../../../services/utils.services.dart';

class CartTile extends StatefulWidget {
  final CartItemModel cartItem;

  final Function(CartItemModel) remove;

  const CartTile({
    Key? key,
    required this.cartItem,
    required this.remove,
  }) : super(key: key);

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  final UtilServices utilServices = UtilServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        // Imagem
        leading: Image.asset(
          widget.cartItem.item.imgUrl,
          height: 60,
          width: 60,
        ),

        // Titulo
        title: Text(
          widget.cartItem.item.itemName,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),

        // Total
        subtitle: Text(
          utilServices.priceToCurrency(widget.cartItem.totalPrice()),
          style: TextStyle(
            color: CustomColors.customSwatchColor,
            fontWeight: FontWeight.bold,
          ),
        ),

        //Quantidade
        trailing: QuantityWidget(
          result: (quantity) {
            setState(() {
              widget.cartItem.quantity = quantity;

              if (quantity == 0) widget.remove(widget.cartItem);
            });
          },
          suffixText: widget.cartItem.item.unit,
          value: widget.cartItem.quantity,
          isRemovable: true,
        ),
      ),
    );
  }
}
