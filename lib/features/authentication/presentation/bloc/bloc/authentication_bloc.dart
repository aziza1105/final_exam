import 'package:equatable/equatable.dart';
import 'package:final_exam/features/authentication/data/repository/authentication.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/data_source/remote.dart';

import '../../../../../core/failure/failure.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../data/data_source/remote.dart';
import '../../../domain/entity/authenticated_user.dart';
import '../../../domain/usecase/authenticate.dart';
import '../../../domain/usecase/logout.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';


class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc()
      : super( const AuthenticationState(
      authenticatedUser: AuthenticatedUserEntity(email: ""),
      status: AuthenticationStatus.unknown)) {
    on<AuthenticationGetStatusEvent>((event, emit) async {
      final usecase = AuthenticateUseCase(
          repository: AuthenticationRepositoryImpl(
              dataSource: AuthenticationRemoteDataSource()));
      final either = await usecase.call(GetStatusParams());

      either.either((failure) {
        emit(state.copyWith(status: AuthenticationStatus.unauthenticated));
      }, (user) {
        emit(state.copyWith(
            status: AuthenticationStatus.authenticated,
            authenticatedUser: user));
      });
    });
    on<AuthenticationLogoutRequestedEvent>((event, emit) async {
      final usecase = LogoutUseCase(
        repository: AuthenticationRepositoryImpl(
          dataSource:AuthenticationRemoteDataSource(),
        ),
      );

      final either = await usecase.call(NoParams());

      either.either(
            (failure) {},
            (user) {
          emit(state.copyWith(status: AuthenticationStatus.unauthenticated));
        },
      );
    });

    on<AuthenticationLoginRequestedEvent>((event, emit) async {
      final usecase = AuthenticateUseCase(
          repository: AuthenticationRepositoryImpl(
              dataSource: AuthenticationRemoteDataSource()));

      final either = await usecase.call(LoginParams(
        email: event.email,
        password: event.password,
      ));

      either.either(
            (failure) {
          emit(state.copyWith(status: AuthenticationStatus.unauthenticated));
          event.onFailure((failure as ServerFailure).message);
        },
            (user) {
          emit(state.copyWith(
            status: AuthenticationStatus.authenticated,
            authenticatedUser: user,
          ));
          event.onSuccess();
        },
      );
    });

    on<AuthenticationSignUpEvent>((event, emit) async {
      final usecase = AuthenticateUseCase(
          repository: AuthenticationRepositoryImpl(
              dataSource: AuthenticationRemoteDataSource()));

      final either = await usecase.call(SignUpParams(
        email: event.email,
        password: event.password,
      ));

      either.either(
            (failure) {
          emit(state.copyWith(status: AuthenticationStatus.authenticated));
          event.onFailure((failure as ServerFailure).message);
        },
            (user) {
          emit(state.copyWith(
            status: AuthenticationStatus.unauthenticated,
            authenticatedUser: user,
          ));
          event.onSuccess();
        },
      );
    }

    );
  }
}
