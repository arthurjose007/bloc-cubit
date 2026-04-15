import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final email = event.email;
        final password = event.password;
        //email validation using Regex
        String? _validateEmail(String email) {
          if (email.isEmpty) return 'Email is required';

          final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,}$');
          if (!regex.hasMatch(email)) return 'Invalid email format';

          return null;
        }

        final emailError = _validateEmail(email);
        if (emailError != null) {
          return emit(AuthFailure(emailError));
        }
        if (password.length < 6) {
          return emit(AuthFailure('Password cannot be less than 6 character'));
        }

        await Future.delayed(Duration(seconds: 1), () {
          return emit(AuthSuccess(uid: '$email-$password'));
        });
      }catch(e){
        return emit(AuthFailure(e.toString()),
        );
      }
    });
  }
}
