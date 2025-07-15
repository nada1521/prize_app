import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:prize/core/utils/constants.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/widgets/orange_appbar_widget.dart';
import 'package:prize/features/cart/change_address/data/models/address_model.dart';
import 'package:prize/features/cart/change_address/views/widget/add_new_address_text_button.dart';
import 'package:prize/features/cart/change_address/views/widget/saved_address_widget.dart';

class ChangeAddressScreen extends StatelessWidget {
  const ChangeAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<AddressModel> address = [
      AddressModel(
        title: LocaleKeys.cart_screen_change_address_home_default.tr(),
        body:
            "Damietta El-Gadeeda City, Kafr Saad Al - markazeia City grand mall , B.Tech ",
        isDefault: true,    
      ),
      AddressModel(
        title: LocaleKeys.cart_screen_change_address_work.tr(),
        body:
            "Damietta El-Gadeeda City, Kafr Saad Al - markazeia City grand mall , B.Tech ",
            isDefault: false,
      ),
    ];
    return Scaffold(
      appBar: OrangeAppbarWidget(
        title: LocaleKeys.cart_screen_change_address_change_address.tr(),
        showBackButton: true,
      ),
      body: ListView(
        padding: screensPadding,
        children: [
          AddNewAddressTextButton(),
          verticalSpace(16),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: address.length,
            itemBuilder: (context, index) => SavedAddressWidget(
              address: address[index],
            ),
            separatorBuilder: (context, index) => verticalSpace(16),
          ),
        ],
      ),
    );
  }
}
