import 'package:bloc/bloc.dart';
import 'package:blog/entities/errors/exceptions.dart';
import 'package:blog/entities/profile_entity.dart';
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
      if (event is LoginUser) {
        emit(LoadingLoginUser());

        try {
          _profile = await Locator.instance
              .get<UserService>()
              .loginUser(cpf: event.cpf, password: event.password);

          emit(SuccessLoginUser(profile: _profile));
        } on BlogException catch (ex) {
          emit(ErrorLoginUser(message: ex.message));
        }
      }
    });
  }
}
