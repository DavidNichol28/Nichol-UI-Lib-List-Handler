import 'package:flutter/material.dart';
import 'package:nichol_ui_lib_modals_and_button_triggers/nichol_ui_lib_modals_and_button_triggers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NicholUILibListItem extends ConsumerWidget {
  final String title;
  final int iteration;
  final bool isSelected;
  final VoidCallback onTap; 
  final void Function(String)? editOption;
  final VoidCallback? deleteOption;
  final List<IconButton>? leadingIconsList;
  final List<IconButton>? trailingIconsList;

  const NicholUILibListItem({
    super.key,
    required this.title,
    required this.iteration,
    this.isSelected = false,
    required this.onTap,
    this.editOption,
    this.deleteOption,
    this.leadingIconsList,
    this.trailingIconsList,
});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Widget> processedTrailingWidgets = trailingIconsList != null ? [...trailingIconsList!] : [];
    List<Widget> processedLeadingWidgets = leadingIconsList != null ? [...leadingIconsList!] : [];


    void deleteOptionHandler() {
      // Templated pop-up
      NicholUILibTemplateModalPage modalPage = NicholUILibTemplateModalPage(
        title: "Delete Tile",
        subtitle: "Current value: $title",
        buttonText: "Confirm deletion",
        onButtonPress: deleteOption!,
      );

      nicholUILibModalThrower(context, modalPage);
    }



    void editOptionHandler() {

      // Templated pop-up
      NicholUILibTemplateModalPage modalPage = NicholUILibTemplateModalPage(
        title: "Edit Tile",
        subtitle: "Current value: $title",
        onSubmit: editOption,
        buttonText: "Confirm change",
      );
      // Throws modal 
      nicholUILibModalThrower(context, modalPage);
    }

    if (editOption != null) {
      processedLeadingWidgets.add( IconButton(
          icon: const Icon(Icons.edit),
          iconSize: 24.0,
          color: Colors.green,
          onPressed: editOptionHandler,
      ));
    }
 
    if (deleteOption != null) {

      processedTrailingWidgets.add( IconButton(
          icon: const Icon(Icons.delete),
          iconSize: 24.0,
          color: Colors.red,
          onPressed: deleteOptionHandler,
      ));
    }

    Widget trailingIconsWidget = Wrap(
      spacing: 8, // Space between buttons
      children: processedTrailingWidgets
    );
    
    Widget leadingIconsWidget = Wrap(
      spacing: 8, // Space between buttons
      children: processedLeadingWidgets
    );
    
    return Material(
      color: Colors.transparent, // Ensure no background issues
      child: ListTile(
        title: Text(title),
        tileColor: isSelected ? Colors.blueGrey : null,
        onTap: onTap,
        leading: leadingIconsWidget,
        trailing: trailingIconsWidget,
      ),
    );
  }
}
