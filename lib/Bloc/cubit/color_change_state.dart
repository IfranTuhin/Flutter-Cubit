part of 'color_change_cubit.dart';

@immutable
abstract class ColorChangeState {}

class ColorChangeInitial extends ColorChangeState {}

class AppColorChange extends ColorChangeState {
  final Color? color;

  AppColorChange({this.color});
}
