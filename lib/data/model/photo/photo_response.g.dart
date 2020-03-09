// GENERATED CODE - DO NOT MODIFY BY HAND

part of photo_response;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PhotoResponse> _$photoResponseSerializer =
    new _$PhotoResponseSerializer();

class _$PhotoResponseSerializer implements StructuredSerializer<PhotoResponse> {
  @override
  final Iterable<Type> types = const [PhotoResponse, _$PhotoResponse];
  @override
  final String wireName = 'PhotoResponse';

  @override
  Iterable<Object> serialize(Serializers serializers, PhotoResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'hits',
      serializers.serialize(object.hits,
          specifiedType:
              const FullType(BuiltList, const [const FullType(PhotoHits)])),
    ];

    return result;
  }

  @override
  PhotoResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PhotoResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'hits':
          result.hits.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(PhotoHits)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$PhotoResponse extends PhotoResponse {
  @override
  final BuiltList<PhotoHits> hits;

  factory _$PhotoResponse([void Function(PhotoResponseBuilder) updates]) =>
      (new PhotoResponseBuilder()..update(updates)).build();

  _$PhotoResponse._({this.hits}) : super._() {
    if (hits == null) {
      throw new BuiltValueNullFieldError('PhotoResponse', 'hits');
    }
  }

  @override
  PhotoResponse rebuild(void Function(PhotoResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PhotoResponseBuilder toBuilder() => new PhotoResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PhotoResponse && hits == other.hits;
  }

  @override
  int get hashCode {
    return $jf($jc(0, hits.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PhotoResponse')..add('hits', hits))
        .toString();
  }
}

class PhotoResponseBuilder
    implements Builder<PhotoResponse, PhotoResponseBuilder> {
  _$PhotoResponse _$v;

  ListBuilder<PhotoHits> _hits;
  ListBuilder<PhotoHits> get hits =>
      _$this._hits ??= new ListBuilder<PhotoHits>();
  set hits(ListBuilder<PhotoHits> hits) => _$this._hits = hits;

  PhotoResponseBuilder();

  PhotoResponseBuilder get _$this {
    if (_$v != null) {
      _hits = _$v.hits?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PhotoResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PhotoResponse;
  }

  @override
  void update(void Function(PhotoResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PhotoResponse build() {
    _$PhotoResponse _$result;
    try {
      _$result = _$v ?? new _$PhotoResponse._(hits: hits.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'hits';
        hits.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'PhotoResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
