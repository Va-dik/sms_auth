import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sms_auth/src/core/components/enums/screen_states_enum.dart';
import 'package:sms_auth/src/features/home/components/enums/account_actions_enum.dart';
import 'package:sms_auth/src/features/home/components/enums/account_data_management_enum.dart';
import 'package:sms_auth/src/features/home/data/datasources/implementations/local_datasource_impl.dart';
import 'package:sms_auth/src/features/home/data/models/account_model.dart';
import 'package:sms_auth/src/features/home/domain/usecases/account_usecase/account_usecase.dart';
import 'package:sms_auth/src/features/home/presentation/bloc/account_bloc/account_events.dart';
import 'package:sms_auth/src/features/home/presentation/bloc/account_bloc/account_state.dart';

final class AccountBloc extends Bloc<AccountEvent, AccountState> {
  late AccountDataUsecase accountUsecase;
  AccountBloc() : super(AccountState(account: AccountModel())) {
    on<AccountActionEvent>(_editAccountEvent);
    on<AccountlDataManagementEvent>(_accountDataManagement);
  }

  Future<void> _accountDataManagement(
      AccountlDataManagementEvent event, Emitter<AccountState> emit) async {
    accountUsecase = AccountDataUsecase(
      localDatasource: LocalDatasourceImpl(
        preferences: await SharedPreferences.getInstance(),
      ),
    );

    switch (event.accountDataAction) {
      case AccountDataManagementEnum.get:
        emit(state.copyWith(
            account: await accountUsecase.getAccountDataFromCache(),
            screenState: ScreenStatesEnum.ready));
      case AccountDataManagementEnum.save:
        await accountUsecase.saveAccountDataToCache(state.account!).then(
              (value) => emit(
                state.copyWith(screenState: ScreenStatesEnum.ready),
              ),
            );
    }
  }

  Future<void> _editAccountEvent(
      AccountActionEvent event, Emitter<AccountState> emit) async {
    switch (event.accountAction) {
      case AccountActionsEnum.editPhotoGallery:
        {
          emit(state.copyWith(
            account: state.account?.copyWith(
              imagePath: await _pickImage(ImageSource.gallery),
            ),
            screenState: ScreenStatesEnum.ready,
          ));
          break;
        }
      case AccountActionsEnum.editPhotoCamera:
        {
          emit(state.copyWith(
            account: state.account?.copyWith(
              imagePath: await _pickImage(ImageSource.camera),
            ),
            screenState: ScreenStatesEnum.ready,
          ));
          break;
        }
      case AccountActionsEnum.editName:
        {
          emit(state.copyWith(
            account: event.account,
            screenState: ScreenStatesEnum.ready,
          ));
          break;
        }
      case AccountActionsEnum.editSurname:
        {
          emit(state.copyWith(
            account: event.account,
            screenState: ScreenStatesEnum.ready,
          ));
          break;
        }
    }
  }

  Future<String> _pickImage(ImageSource source) async {
    return await ImagePicker().pickImage(source: source).then((value) {
      if (value != null) {
        return value.path;
      } else {
        return '';
      }
    });
  }
}
