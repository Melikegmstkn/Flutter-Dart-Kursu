import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class WeatherEvent extends Equatable {
  WeatherEvent([List props = const []]); // : super(props);
}

class FetchWeatherEvent extends WeatherEvent {
  final String sehirAdi;
  FetchWeatherEvent({required this.sehirAdi}) : super([sehirAdi]);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class RefreshWeatherEvent extends WeatherEvent {
  final String sehirAdi;
  RefreshWeatherEvent({required this.sehirAdi}) : super([sehirAdi]);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

// import 'package:equatable/equatable.dart';
// import 'package:meta/meta.dart';
// export 'weather_bloc.dart';
//
// @immutable
// abstract class WeatherEvent extends Equatable {
//   WeatherEvent([List props = const []]); // : super(props);
// }
//
// class FetchWeatherEvent extends WeatherEvent {
//   final String sehirAdi;
//   FetchWeatherEvent({required this.sehirAdi}) : super([sehirAdi]);
//
//   @override
//   List<Object?> get props => throw UnimplementedError();
// }
//
// class RefreshWeatherEvent extends WeatherEvent {
//   final String sehirAdi;
//   RefreshWeatherEvent({required this.sehirAdi}) : super([sehirAdi]);
//
//   @override
//   List<Object?> get props => throw UnimplementedError();
// }
