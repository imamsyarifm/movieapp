import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ticket_movie/models/models.dart';
import 'package:ticket_movie/services/services.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial());

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is LoadUser) {
      //ambil data dari firestore
      User user = await UserServices.getUser(event.id);
      //kembalikan data user
      yield UserLoaded(user);
    } else if (event is SignOut) {
      yield UserInitial();
    } else if (event is UpdateData) {
      User updatedUser = (state as UserLoaded)
          .user
          .copyWith(name: event.name, profilePicture: event.profileImage);
      await UserServices.updateUser(updatedUser);
      yield UserLoaded(updatedUser);
    }
  }
}
