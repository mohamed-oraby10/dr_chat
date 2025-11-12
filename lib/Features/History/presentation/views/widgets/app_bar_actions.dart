import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_dr_chat_application/Features/History/presentation/views/widgets/delete_history_bottom_sheet.dart';
import 'package:new_dr_chat_application/core/utils/assets_data.dart';
import 'package:new_dr_chat_application/core/widgets/custom_icon_button.dart';

class AppBarActions extends StatelessWidget {
  const AppBarActions({super.key, required this.isSearch, this.onPress});

  final bool isSearch;
  final void Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: onPress,
          icon: Icon(
            isSearch
                ? FontAwesomeIcons.xmark
                : FontAwesomeIcons.magnifyingGlass,
          ),
        ),
        CustomIconButton(
          image: AssetsData.trashIcon,
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return DeleteHistoryBottomSheet();
              },
            );
          },
        ),
      ],
    );
  }
}
