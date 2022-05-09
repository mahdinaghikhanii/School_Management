import 'package:flutter/material.dart';
import 'package:schoolmanagement/model/user.dart';

@immutable
abstract class BlocState {}

class Initial extends BlocState {}

class Loading extends BlocState {}

class Failed extends BlocState {
  final Exception exception;
  Failed(this.exception);
}

class Authenticated extends BlocState {
  final User user;
  Authenticated(this.user);
}
