import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_dr_chat_application/Features/History/presentation/views/widgets/delete_history_bottom_sheet.dart';

class AppBarActions extends StatelessWidget {
  const AppBarActions({super.key, required this.isSearch, this.onPress});
  final bool isSearch;
  final void Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return isSearch
        ? SizedBox(width: 10.w)
        : Row(
            children: [
              IconButton(
                onPressed: onPress,
                icon: Icon(FontAwesomeIcons.magnifyingGlass),
              ),
              IconButton(
                icon: Icon(FontAwesomeIcons.trashCan),
                onPressed: () {
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
