import 'package:bloc/bloc.dart';
import 'package:flutter_siakad_app/data/datasources/auth_remote_datasource.dart';
import 'package:flutter_siakad_app/data/model/request/auth_request_model.dart';
import 'package:flutter_siakad_app/data/model/response/auth_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const _Initial()) {
    on<_Login>((event, emit) async {
      // TODO: implement event handler
      emit(const _Loading());
      final response = await AuthRemoteDatasource().login(event.requestModel);
      response.fold(
        (error) => emit(_Error(error)),
        (data) => emit(_Laoded(data)),
      );
    });
  }
}
