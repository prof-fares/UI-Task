// Mocks generated by Mockito 5.4.4 from annotations
// in task_ui_challenge/test/controllers/home_controller_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:task_ui_challenge/app/configurations/errors/failure_model.dart'
    as _i5;
import 'package:task_ui_challenge/data/models/car_model.dart' as _i6;
import 'package:task_ui_challenge/data/repos/carsRepo/cars_repo_interface.dart'
    as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [CarsRepoInterface].
///
/// See the documentation for Mockito's code generation for more information.
class MockCarsRepoInterface extends _i1.Mock implements _i3.CarsRepoInterface {
  MockCarsRepoInterface() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.GeneralErrorModel, _i6.CarsModel>> getAllCars(
          {required int? page}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getAllCars,
          [],
          {#page: page},
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.GeneralErrorModel, _i6.CarsModel>>.value(
                _FakeEither_0<_i5.GeneralErrorModel, _i6.CarsModel>(
          this,
          Invocation.method(
            #getAllCars,
            [],
            {#page: page},
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.GeneralErrorModel, _i6.CarsModel>>);

  @override
  _i4.Future<_i2.Either<_i5.GeneralErrorModel, _i6.Car>> getCarbyId(
          {required String? carId}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getCarbyId,
          [],
          {#carId: carId},
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.GeneralErrorModel, _i6.Car>>.value(
                _FakeEither_0<_i5.GeneralErrorModel, _i6.Car>(
          this,
          Invocation.method(
            #getCarbyId,
            [],
            {#carId: carId},
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.GeneralErrorModel, _i6.Car>>);
}
