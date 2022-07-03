
import 'package:bloc/bloc.dart';
import 'package:blog/entities/errors/exceptions.dart';
import 'package:blog/entities/profile_entity.dart';
import 'package:blog/entities/user_login_entity.dart';
import 'package:blog/shared/locator.dart';
import 'package:blog/shared/services/user.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  late Profile _profile;
  Profile get perfil => _profile;

  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) async {
      if (event is LoginUserEvent) {
        emit(LoadingLoginUser());

        try {
          _profile = await Locator.instance
              .get<UserService>()
              .loginUser(cpf: event.cpf, password: event.password);

          emit(SuccessLoginUser(profile: _profile));
        } on BlogException catch (ex) {
          emit(ErrorLoginUser(message: ex.message));
        }
      } else if (event is SignupUserEvent) {
        emit(LoadingSignupUser());

        try {
          final String _msg = await Locator.instance
              .get<UserService>()
              .signupUser(
                  cpf: event.cpf,
                  password: event.password,
                  email: event.email,
                  name: event.name);

          emit(SuccessSignupUser(message: _msg));
        } on BlogException catch (ex) {
          emit(ErrorSignupUser(message: ex.message));
        }
      } else if (event is LogoutEvent) {
        try {
          await Locator.instance.get<UserService>().logout();
          emit(SuccessLogout());
        } on BlogException catch (ex) {
          emit(ErrorLogout(message: ex.message));
        }
      } else if (event is CheckLoggedEvent) {
        emit(LoadingCheckUser());
        try {
          final UserLogin _user =
              await Locator.instance.get<UserService>().getUser();
emit(SuccessCheckUser(
                userLogin:
                    UserLogin(cpf: _user.cpf, password: _user.password)));
          
        } on BlogException catch (ex) {
          emit(ErrorCheckUser(message: ex.message));
        }
      }
    });
  }
}
