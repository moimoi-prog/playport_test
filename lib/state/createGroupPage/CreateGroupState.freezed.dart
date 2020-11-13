// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'CreateGroupState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$CreateGroupStateTearOff {
  const _$CreateGroupStateTearOff();

// ignore: unused_element
  CreateGroupStateData call(
      {String imagePath = '',
      TextEditingController groupNameController,
      List<String> selectedFriends = const <String>[],
      List<Friend> friends = const <Friend>[]}) {
    return CreateGroupStateData(
      imagePath: imagePath,
      groupNameController: groupNameController,
      selectedFriends: selectedFriends,
      friends: friends,
    );
  }

// ignore: unused_element
  CreateGroupStateLoading loading() {
    return const CreateGroupStateLoading();
  }
}

/// @nodoc
// ignore: unused_element
const $CreateGroupState = _$CreateGroupStateTearOff();

/// @nodoc
mixin _$CreateGroupState {
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(String imagePath, TextEditingController groupNameController,
        List<String> selectedFriends, List<Friend> friends), {
    @required Result loading(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(String imagePath, TextEditingController groupNameController,
        List<String> selectedFriends, List<Friend> friends), {
    Result loading(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(CreateGroupStateData value), {
    @required Result loading(CreateGroupStateLoading value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(CreateGroupStateData value), {
    Result loading(CreateGroupStateLoading value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $CreateGroupStateCopyWith<$Res> {
  factory $CreateGroupStateCopyWith(
          CreateGroupState value, $Res Function(CreateGroupState) then) =
      _$CreateGroupStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$CreateGroupStateCopyWithImpl<$Res>
    implements $CreateGroupStateCopyWith<$Res> {
  _$CreateGroupStateCopyWithImpl(this._value, this._then);

  final CreateGroupState _value;
  // ignore: unused_field
  final $Res Function(CreateGroupState) _then;
}

/// @nodoc
abstract class $CreateGroupStateDataCopyWith<$Res> {
  factory $CreateGroupStateDataCopyWith(CreateGroupStateData value,
          $Res Function(CreateGroupStateData) then) =
      _$CreateGroupStateDataCopyWithImpl<$Res>;
  $Res call(
      {String imagePath,
      TextEditingController groupNameController,
      List<String> selectedFriends,
      List<Friend> friends});
}

/// @nodoc
class _$CreateGroupStateDataCopyWithImpl<$Res>
    extends _$CreateGroupStateCopyWithImpl<$Res>
    implements $CreateGroupStateDataCopyWith<$Res> {
  _$CreateGroupStateDataCopyWithImpl(
      CreateGroupStateData _value, $Res Function(CreateGroupStateData) _then)
      : super(_value, (v) => _then(v as CreateGroupStateData));

  @override
  CreateGroupStateData get _value => super._value as CreateGroupStateData;

  @override
  $Res call({
    Object imagePath = freezed,
    Object groupNameController = freezed,
    Object selectedFriends = freezed,
    Object friends = freezed,
  }) {
    return _then(CreateGroupStateData(
      imagePath: imagePath == freezed ? _value.imagePath : imagePath as String,
      groupNameController: groupNameController == freezed
          ? _value.groupNameController
          : groupNameController as TextEditingController,
      selectedFriends: selectedFriends == freezed
          ? _value.selectedFriends
          : selectedFriends as List<String>,
      friends: friends == freezed ? _value.friends : friends as List<Friend>,
    ));
  }
}

/// @nodoc
class _$CreateGroupStateData
    with DiagnosticableTreeMixin
    implements CreateGroupStateData {
  const _$CreateGroupStateData(
      {this.imagePath = '',
      this.groupNameController,
      this.selectedFriends = const <String>[],
      this.friends = const <Friend>[]})
      : assert(imagePath != null),
        assert(selectedFriends != null),
        assert(friends != null);

  @JsonKey(defaultValue: '')
  @override
  final String imagePath;
  @override
  final TextEditingController groupNameController;
  @JsonKey(defaultValue: const <String>[])
  @override
  final List<String> selectedFriends;
  @JsonKey(defaultValue: const <Friend>[])
  @override
  final List<Friend> friends;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CreateGroupState(imagePath: $imagePath, groupNameController: $groupNameController, selectedFriends: $selectedFriends, friends: $friends)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CreateGroupState'))
      ..add(DiagnosticsProperty('imagePath', imagePath))
      ..add(DiagnosticsProperty('groupNameController', groupNameController))
      ..add(DiagnosticsProperty('selectedFriends', selectedFriends))
      ..add(DiagnosticsProperty('friends', friends));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CreateGroupStateData &&
            (identical(other.imagePath, imagePath) ||
                const DeepCollectionEquality()
                    .equals(other.imagePath, imagePath)) &&
            (identical(other.groupNameController, groupNameController) ||
                const DeepCollectionEquality()
                    .equals(other.groupNameController, groupNameController)) &&
            (identical(other.selectedFriends, selectedFriends) ||
                const DeepCollectionEquality()
                    .equals(other.selectedFriends, selectedFriends)) &&
            (identical(other.friends, friends) ||
                const DeepCollectionEquality().equals(other.friends, friends)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(imagePath) ^
      const DeepCollectionEquality().hash(groupNameController) ^
      const DeepCollectionEquality().hash(selectedFriends) ^
      const DeepCollectionEquality().hash(friends);

  @override
  $CreateGroupStateDataCopyWith<CreateGroupStateData> get copyWith =>
      _$CreateGroupStateDataCopyWithImpl<CreateGroupStateData>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(String imagePath, TextEditingController groupNameController,
        List<String> selectedFriends, List<Friend> friends), {
    @required Result loading(),
  }) {
    assert($default != null);
    assert(loading != null);
    return $default(imagePath, groupNameController, selectedFriends, friends);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(String imagePath, TextEditingController groupNameController,
        List<String> selectedFriends, List<Friend> friends), {
    Result loading(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(imagePath, groupNameController, selectedFriends, friends);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(CreateGroupStateData value), {
    @required Result loading(CreateGroupStateLoading value),
  }) {
    assert($default != null);
    assert(loading != null);
    return $default(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(CreateGroupStateData value), {
    Result loading(CreateGroupStateLoading value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class CreateGroupStateData implements CreateGroupState {
  const factory CreateGroupStateData(
      {String imagePath,
      TextEditingController groupNameController,
      List<String> selectedFriends,
      List<Friend> friends}) = _$CreateGroupStateData;

  String get imagePath;
  TextEditingController get groupNameController;
  List<String> get selectedFriends;
  List<Friend> get friends;
  $CreateGroupStateDataCopyWith<CreateGroupStateData> get copyWith;
}

/// @nodoc
abstract class $CreateGroupStateLoadingCopyWith<$Res> {
  factory $CreateGroupStateLoadingCopyWith(CreateGroupStateLoading value,
          $Res Function(CreateGroupStateLoading) then) =
      _$CreateGroupStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$CreateGroupStateLoadingCopyWithImpl<$Res>
    extends _$CreateGroupStateCopyWithImpl<$Res>
    implements $CreateGroupStateLoadingCopyWith<$Res> {
  _$CreateGroupStateLoadingCopyWithImpl(CreateGroupStateLoading _value,
      $Res Function(CreateGroupStateLoading) _then)
      : super(_value, (v) => _then(v as CreateGroupStateLoading));

  @override
  CreateGroupStateLoading get _value => super._value as CreateGroupStateLoading;
}

/// @nodoc
class _$CreateGroupStateLoading
    with DiagnosticableTreeMixin
    implements CreateGroupStateLoading {
  const _$CreateGroupStateLoading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CreateGroupState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'CreateGroupState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is CreateGroupStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(String imagePath, TextEditingController groupNameController,
        List<String> selectedFriends, List<Friend> friends), {
    @required Result loading(),
  }) {
    assert($default != null);
    assert(loading != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(String imagePath, TextEditingController groupNameController,
        List<String> selectedFriends, List<Friend> friends), {
    Result loading(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(CreateGroupStateData value), {
    @required Result loading(CreateGroupStateLoading value),
  }) {
    assert($default != null);
    assert(loading != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(CreateGroupStateData value), {
    Result loading(CreateGroupStateLoading value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class CreateGroupStateLoading implements CreateGroupState {
  const factory CreateGroupStateLoading() = _$CreateGroupStateLoading;
}
