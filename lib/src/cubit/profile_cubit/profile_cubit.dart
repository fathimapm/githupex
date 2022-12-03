import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:untitled5/src/helpers/storage_helper.dart';
import 'package:untitled5/src/helpers/storage_key.dart';
import 'package:untitled5/src/models/user_response.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());


  getProfileData() async {
    emit(ProfileLoading());

    try {
      String? profileInfoJSON =
      await StorageHelper.readData(StorageKey.userData.name);
      if (profileInfoJSON == null) {
        emit(ProfileLoadError());
        return;
      }
      var profileInfoRaw = jsonDecode(profileInfoJSON);
      UserResponse userData = UserResponse.fromJson(profileInfoRaw);
      emit(ProfileLoadSuccess(userData));
    } catch (ex) {
      emit(ProfileLoadError());
    }
  }
}