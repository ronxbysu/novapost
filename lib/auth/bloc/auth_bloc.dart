import 'package:auth_repository/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthenticationBloc extends Bloc<AuthEvent, AuthenticationState> {
  final AuthRepository authRepository;
  final FlutterSecureStorage secureStorage;

  static const String _tokenKey = 'auth_token';
  static const String _legacyTokenKey = 'token';
  static const String _rememberMeKey = 'remember_me';
  static const String _savedEmailKey = 'saved_email';
  static const String _savedPasswordKey = 'saved_password';

  AuthenticationBloc({required this.authRepository, required this.secureStorage})
    : super(AuthInitial()) {
    on<LoginRequested>(_onLogin);
    on<RegisterRequested>(_onRegister);
    on<LogoutRequested>(_onLogout);
    on<CheckAuthStatus>(_onCheckStatus);
    on<AutoLoginRequested>(_onAutoLogin);
  }

  Future<void> _onLogin(LoginRequested event, Emitter<AuthenticationState> emit) async {
    print('AuthBloc: Login requested for ${event.email}');
    emit(AuthLoading());
    try {
      final token = await authRepository.login(event.email, event.password);
      print('AuthBloc: Login successful, token received: ${token != null ? 'Yes' : 'No'}');
      // Token is already stored by the repository
      emit(AuthAuthenticated(token!));
    } catch (e) {
      print('AuthBloc: Login failed: $e');
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> _onRegister(
    RegisterRequested event,
    Emitter<AuthenticationState> emit,
  ) async {
    print('AuthBloc: Register requested for ${event.email}');
    emit(AuthLoading());
    try {
      final token = await authRepository.register(event.email, event.password);
      print('AuthBloc: Register successful, token received: ${token != null ? 'Yes' : 'No'}');
      // Token is already stored by the repository
      emit(AuthAuthenticated(token!));
    } catch (e) {
      print('AuthBloc: Register failed: $e');
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> _onLogout(LogoutRequested event, Emitter<AuthenticationState> emit) async {
    print('AuthBloc: Logout requested');
    emit(AuthLoading());
    try {
      await authRepository.logout();
      print('AuthBloc: Logout successful');
      // Repository already clears the storage
      
      // Clear saved credentials if user chose to logout
      await _clearSavedCredentials();
      
      emit(AuthUnauthenticated());
    } catch (e) {
      print('AuthBloc: Logout failed, but clearing storage anyway: $e');
      // Even if logout fails, we should still clear local storage and show unauthenticated
      await secureStorage.delete(key: _tokenKey);
      await secureStorage.delete(key: _legacyTokenKey);
      await _clearSavedCredentials();
      emit(AuthUnauthenticated());
    }
  }

  Future<void> _onCheckStatus(
    CheckAuthStatus event,
    Emitter<AuthenticationState> emit,
  ) async {
    print('AuthBloc: Checking auth status...');
    // Try both keys for compatibility
    String? token = await secureStorage.read(key: _tokenKey);
    if (token == null) {
      token = await secureStorage.read(key: _legacyTokenKey);
    }
    
    print('AuthBloc: Token found: ${token != null ? 'Yes' : 'No'}');
    if (token != null && token.isNotEmpty) {
      print('AuthBloc: User is authenticated');
      emit(AuthAuthenticated(token));
    } else {
      print('AuthBloc: User is not authenticated');
      emit(AuthUnauthenticated());
    }
  }

  Future<void> _onAutoLogin(
    AutoLoginRequested event,
    Emitter<AuthenticationState> emit,
  ) async {
    print('AuthBloc: Auto-login requested');
    emit(AuthLoading());
    
    try {
      final rememberMe = await secureStorage.read(key: _rememberMeKey);
      if (rememberMe == 'true') {
        final savedEmail = await secureStorage.read(key: _savedEmailKey);
        final savedPassword = await secureStorage.read(key: _savedPasswordKey);
        
        if (savedEmail != null && savedPassword != null) {
          print('AuthBloc: Attempting auto-login with saved credentials');
          final token = await authRepository.login(savedEmail, savedPassword);
          print('AuthBloc: Auto-login successful, token received: ${token != null ? 'Yes' : 'No'}');
          emit(AuthAuthenticated(token!));
          return;
        }
      }
      
      print('AuthBloc: No saved credentials found for auto-login');
      emit(AuthUnauthenticated());
    } catch (e) {
      print('AuthBloc: Auto-login failed: $e');
      // Clear saved credentials if auto-login fails
      await _clearSavedCredentials();
      emit(AuthUnauthenticated());
    }
  }

  Future<void> _clearSavedCredentials() async {
    try {
      await secureStorage.delete(key: _rememberMeKey);
      await secureStorage.delete(key: _savedEmailKey);
      await secureStorage.delete(key: _savedPasswordKey);
      print('AuthBloc: Saved credentials cleared');
    } catch (e) {
      print('AuthBloc: Error clearing saved credentials: $e');
    }
  }
}
