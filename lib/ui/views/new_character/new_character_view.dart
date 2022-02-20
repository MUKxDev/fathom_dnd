import 'package:fathom_dnd/ui/widgets/dumb/dnd_text_field.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../app/utils/ui_helpers.dart';
import '../../../app/utils/utils.dart';
import './new_character_view_model.dart';

class NewCharacterView extends StatelessWidget {
  const NewCharacterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NewCharacterViewModel>.reactive(
      viewModelBuilder: () => NewCharacterViewModel(),
      onModelReady: (NewCharacterViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        NewCharacterViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('New Character'),
          ),
          body: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                verticalSpaceMedium(context),
                DnDTextField(
                  controller: model.nameController,
                  label: 'Name *',
                  validator: (text) => Utils.requiredValidation(text),
                ),
                verticalSpaceSmall(context),
                DnDTextField(
                  controller: model.raceController,
                  label: 'Race *',
                  validator: (text) => Utils.requiredValidation(text),
                ),
                verticalSpaceSmall(context),
                DnDTextField(
                  controller: model.classController,
                  label: 'Class *',
                  validator: (text) => Utils.requiredValidation(text),
                ),
                verticalSpaceSmall(context),
                DnDTextField(
                  controller: model.backStoryController,
                  label: 'Back Story',
                  maxLines: 6,
                ),
                verticalSpaceMedium(context),
                model.isBusy
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ElevatedButton(
                        onPressed: () => model.createNewCharacter(),
                        child: const Text('Create'),
                      ),
              ],
            ),
          )),
        );
      },
    );
  }
}
