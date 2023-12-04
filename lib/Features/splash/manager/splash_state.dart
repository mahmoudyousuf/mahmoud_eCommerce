import 'package:equatable/equatable.dart';



enum SplashStatus { initial }

class SplashState extends Equatable {
  final SplashStatus status;

  const SplashState({
    required this.status,
  });

  factory SplashState.initial() {
    return const SplashState(
      status: SplashStatus.initial,
    );
  }

  @override
  List<Object> get props => [status];

  SplashState copyWith({
    SplashStatus? status,
  }) {
    return SplashState(status: status ?? this.status);
  }
}
