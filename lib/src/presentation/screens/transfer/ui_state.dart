class UiState {
  final int phoneNumber;
  final int password;
  final double ammount;

  UiState({this.phoneNumber = 0, this.password = 0, this.ammount = 0});

  UiState copyWith({int? phoneNumber, int? password, double? ammount}) =>
      UiState(
        phoneNumber: phoneNumber ?? this.phoneNumber,
        password: password ?? this.password,
        ammount: ammount ?? this.ammount,
      );
}
