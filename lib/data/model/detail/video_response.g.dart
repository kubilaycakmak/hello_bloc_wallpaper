// GENERATED CODE - DO NOT MODIFY BY HAND

part of video_response;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<VideoResponse> _$videoResponseSerializer =
    new _$VideoResponseSerializer();

class _$VideoResponseSerializer implements StructuredSerializer<VideoResponse> {
  @override
  final Iterable<Type> types = const [VideoResponse, _$VideoResponse];
  @override
  final String wireName = 'VideoResponse';

  @override
  Iterable<Object> serialize(Serializers serializers, VideoResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'items',
      serializers.serialize(object.items,
          specifiedType:
              const FullType(BuiltList, const [const FullType(VideoItem)])),
    ];

    return result;
  }

  @override
  VideoResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new VideoResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'items':
          result.items.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(VideoItem)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$VideoResponse extends VideoResponse {
  @override
  final BuiltList<VideoItem> items;

  factory _$VideoResponse([void Function(VideoResponseBuilder) updates]) =>
      (new VideoResponseBuilder()..update(updates)).build();

  _$VideoResponse._({this.items}) : super._() {
    if (items == null) {
      throw new BuiltValueNullFieldError('VideoResponse', 'items');
    }
  }

  @override
  VideoResponse rebuild(void Function(VideoResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VideoResponseBuilder toBuilder() => new VideoResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VideoResponse && items == other.items;
  }

  @override
  int get hashCode {
    return $jf($jc(0, items.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('VideoResponse')..add('items', items))
        .toString();
  }
}

class VideoResponseBuilder
    implements Builder<VideoResponse, VideoResponseBuilder> {
  _$VideoResponse _$v;

  ListBuilder<VideoItem> _items;
  ListBuilder<VideoItem> get items =>
      _$this._items ??= new ListBuilder<VideoItem>();
  set items(ListBuilder<VideoItem> items) => _$this._items = items;

  VideoResponseBuilder();

  VideoResponseBuilder get _$this {
    if (_$v != null) {
      _items = _$v.items?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VideoResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$VideoResponse;
  }

  @override
  void update(void Function(VideoResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$VideoResponse build() {
    _$VideoResponse _$result;
    try {
      _$result = _$v ?? new _$VideoResponse._(items: items.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'VideoResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
