import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:weatherapp/data/weather_repository.dart';
import 'package:weatherapp/models/weather.dart';
import '../../locator.dart';
import './bloc.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository = locator<WeatherRepository>();
  // final WeatherRepository weatherRepository2 = locator.get<WeatherRepository>();

  @override
  WeatherState get initialState => InitialWeatherState();

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is FetchWeatherEvent) {
      yield WeatherLoadingState();
      try {
        final Weather getirilenWeather =
            await weatherRepository.getWeather(event.sehirAdi);
        yield WeatherLoadedState(weather: getirilenWeather);
      } catch (_) {
        yield WeatherErrorState();
      }
    } else if (event is RefreshWeatherEvent) {
      try {
        final Weather getirilenWeather =
            await weatherRepository.getWeather(event.sehirAdi);
        yield WeatherLoadedState(weather: getirilenWeather);
      } catch (_) {
        yield currentState;
      }
    }
  }
}
// import 'dart:async';
//
// import 'package:bloc/bloc.dart';
// import 'package:weatherapp/blocs/bloc.dart';
// import 'package:weatherapp/data/weather_repository.dart';
// import 'package:weatherapp/models/weather.dart';
// import 'weather_event.dart';
// import 'weather_state.dart';
//
// class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
//
//   WeatherState get initialState => InitialWeatherState();
//
//   @override
//   Stream<WeatherState> mapEventToState(
//     WeatherEvent event,
//   ) async* {
//     if (event is FetchWeatherEvent) {
//       yield WeatherLoadingState();
//       try {
//         // final Weather getirilenWeather =
//         //     await weatherRepository.getWeather(event.sehirAdi);
//         WeatherRepository weatherRepository = WeatherRepository();
//         weatherRepository.getWeather(event.sehirAdi);
//         yield WeatherLoadedState(weather: Weather());
//       } catch (_) {
//         yield WeatherErrorState();
//       }
//     }
//   }
// }
//
// /*
// class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
//   final WeatherRepository weatherRepository = locator<WeatherRepository>();
//   // final WeatherRepository weatherRepository2 = locator.get<WeatherRepository>();
//
//   @override
//   WeatherState get initialState => InitialWeatherState();
//
//   @override
//   Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
//     if (event is FetchWeatherEvent) {
//       yield WeatherLoadingState();
//       try {
//         final Weather getirilenWeather =
//             await weatherRepository.getWeather(event.sehirAdi);
//         yield WeatherLoadedState(weather: getirilenWeather);
//       } catch (_) {
//         yield WeatherErrorState();
//       }
//     } else if (event is RefreshWeatherEvent) {
//       try {
//         final Weather getirilenWeather =
//             await weatherRepository.getWeather(event.sehirAdi);
//         yield WeatherLoadedState(weather: getirilenWeather);
//       } catch (_) {
//         yield currentState;
//       }
//     }
//   }
// }
//
//  */
