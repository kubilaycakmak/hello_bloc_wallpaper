// GENERATED CODE - DO NOT MODIFY BY HAND

part of search_event;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SearchInitiated extends SearchInitiated {
  @override
  final String query;
  @override
  final int page;
  @override
  final String orientation;

  factory _$SearchInitiated([void Function(SearchInitiatedBuilder) updates]) =>
      (new SearchInitiatedBuilder()..update(updates)).build();

  _$SearchInitiated._({this.query, this.page, this.orientation}) : super._() {
    if (query == null) {
      throw new BuiltValueNullFieldError('SearchInitiated', 'query');
    }
    if (page == null) {
      throw new BuiltValueNullFieldError('SearchInitiated', 'page');
    }
    if (orientation == null) {
      throw new BuiltValueNullFieldError('SearchInitiated', 'orientation');
    }
  }

  @override
  SearchInitiated rebuild(void Function(SearchInitiatedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SearchInitiatedBuilder toBuilder() =>
      new SearchInitiatedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SearchInitiated &&
        query == other.query &&
        page == other.page &&
        orientation == other.orientation;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, query.hashCode), page.hashCode), orientation.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SearchInitiated')
          ..add('query', query)
          ..add('page', page)
          ..add('orientation', orientation))
        .toString();
  }
}

class SearchInitiatedBuilder
    implements Builder<SearchInitiated, SearchInitiatedBuilder> {
  _$SearchInitiated _$v;

  String _query;
  String get query => _$this._query;
  set query(String query) => _$this._query = query;

  int _page;
  int get page => _$this._page;
  set page(int page) => _$this._page = page;

  String _orientation;
  String get orientation => _$this._orientation;
  set orientation(String orientation) => _$this._orientation = orientation;

  SearchInitiatedBuilder();

  SearchInitiatedBuilder get _$this {
    if (_$v != null) {
      _query = _$v.query;
      _page = _$v.page;
      _orientation = _$v.orientation;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SearchInitiated other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SearchInitiated;
  }

  @override
  void update(void Function(SearchInitiatedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SearchInitiated build() {
    final _$result = _$v ??
        new _$SearchInitiated._(
            query: query, page: page, orientation: orientation);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
