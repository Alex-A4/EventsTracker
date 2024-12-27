import 'package:add_event/ui/add_event_view/add_event_view.dart';
import 'package:ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AddEventViewTexts {
  ColorPickerWidgetTexts get colorPickerTexts;
  AddEventTaskWidgetTexts get addTaskTexts;

  /// Title of input where user should enter event name
  String get eventNameTitle;

  /// Hint of input where user should enter event name
  String get eventNameHint;

  /// Text of the button that user should click to add new task in list
  String get addNewTask;

  /// Text of button that user should click to update exising event
  String get updateWord;

  /// Text of button that user should click to create entered event
  String get createWord;
}

class AddEventView extends StatefulWidget {
  const AddEventView({
    required this.state,
    required this.isUpdate,
    required this.texts,
    super.key,
  });

  final AddEventState state;
  final bool isUpdate;
  final AddEventViewTexts texts;

  @override
  State<AddEventView> createState() => _AddEventViewState();
}

class _AddEventViewState extends State<AddEventView> {
  final _eventNameController = TextEditingController();

  @override
  void initState() {
    if (widget.state.eventName.isNotEmpty) {
      _eventNameController.text = widget.state.eventName;
    }

    super.initState();
  }

  @override
  void dispose() {
    _eventNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final canBeCreated = widget.state.canBeCreated;

    return Stack(
      children: [
        AnimatedPositioned(
          duration: kThemeAnimationDuration,
          top: 0,
          left: 16,
          right: 16,
          bottom: !canBeCreated ? 16 : kButtonHeight + 16,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InputWidget(
                  controller: _eventNameController,
                  title: widget.texts.eventNameTitle,
                  hintText: widget.texts.eventNameHint,
                  onChanged: (name) => context.read<AddEventBloc>().add(RenameEvent(name: name)),
                ),
                const SizedBox(height: 20),
                ColorPickerWidget(
                  color: widget.state.eventColor,
                  onSelected: (color) => context.read<AddEventBloc>().add(
                        ChangeColor(color: color),
                      ),
                  texts: widget.texts.colorPickerTexts,
                ),
                const SizedBox(height: 20),
                ...widget.state.tasks
                    .map<Widget>(
                      (t) => AddEventTaskWidget(
                        task: t,
                        key: Key(t.id),
                        texts: widget.texts.addTaskTexts,
                      ),
                    )
                    .separated(const SizedBox(height: 16)),
                PrimaryTextButton(
                  onPressed: () => context.read<AddEventBloc>().add(
                        const AddNewTask(),
                      ),
                  text: widget.texts.addNewTask,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 16,
          left: 16,
          right: 16,
          child: AnimatedCollapse(
            show: canBeCreated,
            child: PrimaryButton(
              onPressed: widget.state.isLoading
                  ? null
                  : () => context.read<AddEventBloc>().add(const CreateEvent()),
              text: widget.isUpdate ? widget.texts.updateWord : widget.texts.createWord,
            ),
          ),
        ),
      ],
    );
  }
}
