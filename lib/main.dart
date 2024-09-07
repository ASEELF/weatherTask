import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'provider.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherScreen(),
    );
  }
}

class WeatherScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherProviderInstance = ref.watch(weatherProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: Center(
        child: weatherProviderInstance.weatherData == null
            ? const CircularProgressIndicator()
            : Text('Weather Data: ${weatherProviderInstance.weatherData!.metadata.name}'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(weatherProvider.notifier).fetchWeather(
            apiKey: 'DEMOKEY',
            latitude: 31.9552,
            longitude: 35.945,
            altitude: 757,
            format: 'json',
          );
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
