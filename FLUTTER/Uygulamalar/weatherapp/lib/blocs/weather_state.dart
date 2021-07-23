import 'package:equatable/equatable.dart';
import 'package:weatherapp/models/weather.dart';

abstract class WeatherState extends Equatable {
  // const WeatherState();
  WeatherState();
}

class InitialWeatherState extends WeatherState {
  @override
  List<Object> get props => [];
}

class WeatherLoadingState extends WeatherState {
  @override
  List<Object> get props => [];
}

class WeatherLoadedState extends WeatherState {
  Weather weather;
  WeatherLoadedState({required this.weather});

  @override
  // TODO: implement props
  List<Object> get props => [weather];
}

class WeatherErrorState extends WeatherState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

// import 'package:equatable/equatable.dart';
// import 'package:weatherapp/models/weather.dart';
//
// abstract class WeatherState extends Equatable {
//   WeatherState([List props = const []]); // : super(props);
// }
//
// class InitialWeatherState extends WeatherState {
//   @override
//   List<Object> get props => [];
//
//   WeatherEvent([List props = const []]) {
//     throw UnimplementedError();
//   }
// }
//
// class WeatherLoadingState extends WeatherState {
//   WeatherEvent([List props = const []]) {
//     throw UnimplementedError();
//   }
//
//   @override
//   List<Object?> get props => throw UnimplementedError();
// }
//
// class WeatherLoadedState extends WeatherState {
//   final Weather weather;
//
//   WeatherLoadedState({required this.weather});
//
//   WeatherEvent([List props = const []]) {
//     throw UnimplementedError();
//   }
//
//   @override
//   List<Object?> get props => throw UnimplementedError();
// }
//
// class WeatherErrorState extends WeatherState {
//   @override
//   List<Object?> get props => throw UnimplementedError();
// }
