// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Metadata _$MetadataFromJson(Map<String, dynamic> json) => Metadata(
      modelRunUpdateTimeUtc: json['modelRunUpdateTimeUtc'] as String,
      name: json['name'] as String,
      height: (json['height'] as num).toInt(),
      timezoneAbbreviation: json['timezoneAbbreviation'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      modelRunUtc: json['modelRunUtc'] as String,
      longitude: (json['longitude'] as num).toDouble(),
      utcTimeOffset: (json['utcTimeOffset'] as num).toInt(),
      generationTimeMs: (json['generationTimeMs'] as num).toDouble(),
    );

Map<String, dynamic> _$MetadataToJson(Metadata instance) => <String, dynamic>{
      'modelRunUpdateTimeUtc': instance.modelRunUpdateTimeUtc,
      'name': instance.name,
      'height': instance.height,
      'timezoneAbbreviation': instance.timezoneAbbreviation,
      'latitude': instance.latitude,
      'modelRunUtc': instance.modelRunUtc,
      'longitude': instance.longitude,
      'utcTimeOffset': instance.utcTimeOffset,
      'generationTimeMs': instance.generationTimeMs,
    };
