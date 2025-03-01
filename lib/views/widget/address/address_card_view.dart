import 'package:ecommerce_userapp/core/constant/text_stely.dart';
import 'package:ecommerce_userapp/data/model/address_model.dart';
import 'package:flutter/material.dart';

class AddressCardView extends StatelessWidget {
  const AddressCardView(
      {required this.onDelete, super.key, required this.addressModel});

  final AddressModel addressModel;
  final void Function() onDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: ListTile(
          title: Text(
            addressModel.addressName!,
            style: AppTextStyles.bodyContent20Black,
          ),
          subtitle: Text(
            '${addressModel.addressCity!},${addressModel.addressStreet!}',
            maxLines: 3,
            style: AppTextStyles.bodyContent12Gray,
          ),
          trailing: IconButton(
            onPressed: onDelete,
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
