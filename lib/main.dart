import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'provider.dart';
import 'weather_model.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final query = WeatherQuery(latitude: 52.52, longitude: 13.41);

    final weatherAsyncValue = ref.watch(weatherProvider(query));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: Center(
        child: weatherAsyncValue.when(
          data: (WeatherModel weather) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('City: ${weather.city}, ${weather.country}'),
                Text('Current Temperature: ${weather.temperature} °C'),
                Text('Weather Description: ${weather.weatherDescription}'),
                Text('Humidity: ${weather.humidity}%'),
                Text('Wind Speed: ${weather.windSpeed} m/s'),
                Expanded(
                  child: ListView.builder(
                    itemCount: weather.forecast.length,
                    itemBuilder: (context, index) {
                      final forecast = weather.forecast[index];
                      return ListTile(
                        title: Text('Date: ${forecast.date}'),
                        subtitle: Text(
                          'Temp: ${forecast.temperature} °C, Description: ${forecast.weatherDescription}',
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
          loading: () => const CircularProgressIndicator(),
          error: (err, stack) => Text('Error: $err'),
        ),
      ),
    );
  }
}
