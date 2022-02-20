import 'package:fathom_dnd/app/utils/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../../app/theme/app_colors.dart';
import '../../../../../app/theme/app_text_theme.dart';
import './character_selection_view_model.dart';

class CharacterSelectionView extends StatelessWidget {
  const CharacterSelectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CharacterSelectionViewModel>.reactive(
      viewModelBuilder: () => CharacterSelectionViewModel(),
      onModelReady: (CharacterSelectionViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        CharacterSelectionViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          appBar: AppBar(
            title: Text("${model.displayName}'s Characters"),
          ),
          body: model.isBusy
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SafeArea(
                  child: Column(
                    children: [
                      verticalSpaceSmall(context),
                      model.characters.isEmpty
                          ? const Expanded(
                              child: Text('No characters'),
                            )
                          : Expanded(
                              child: RefreshIndicator(
                                onRefresh: () => model.refresh(),
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  itemCount: model.characters.length,
                                  itemBuilder: (context, index) =>
                                      GestureDetector(
                                    onTap: () =>
                                        model.onCharacterSelections(index),
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        color: AppColors.gray,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Column(
                                        children: [
                                          Text(
                                            model.characters[index].basicInfo
                                                .name,
                                            style: AppTextTheme
                                                .textTheme.displayMedium,
                                          ),
                                          Text(
                                            model.characters[index].toString(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  separatorBuilder:
                                      (BuildContext context, int index) =>
                                          verticalSpaceSmall(context),
                                ),
                              ),
                            ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: ElevatedButton(
                          onPressed: () => model.addNewCharacter(),
                          child: const Text('Create Character'),
                        ),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
