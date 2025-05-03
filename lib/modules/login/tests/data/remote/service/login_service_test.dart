import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gs3_app/core/http/client.dart';
import 'package:gs3_app/core/test/mocks/http_client_mock.dart';
import 'package:gs3_app/main.dart';
import 'package:gs3_app/modules/login/data/models/remote/login_service.dart';
import 'package:gs3_app/modules/login/data/models/remote/mapper/auth_response.dart';
import 'package:gs3_app/modules/login/data/remote/service/login_service.dart';
import 'package:gs3_app/modules/login/tests/fixture/login_service_fixture.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  group(
    'Testing login service with success',
    () {
      late HttpClient mockClient;
      late LoginService service;

      setUpAll(
        () {
          registerFallbackValue(MockRequestOptions());

          mockClient = HttpClientMock();
          inject.registerFactory<HttpClient>(() => mockClient);

          service = LoginServiceImpl();
        },
      );

      tearDownAll(
        () {
          inject.unregister<HttpClient>();
        },
      );

      test(
        'Given email and password, When try to login, Then return success',
        () async {
          // Arrange
          when(
            () => mockClient.post<Map<String, dynamic>>(any(),
                baseUrl: any(named: 'baseUrl'),
                data: any(named: 'data'),
                queryParameters: any(named: 'queryParameters'),
                options: any(named: 'options')),
          ).thenAnswer(
            (_) async {
              return Response<Map<String, dynamic>>(
                requestOptions: RequestOptions(path: '/login'),
                data: LoginServiceFixture.loginResponse,
                statusCode: 200,
              );
            },
          );

          // Act
          final response = await service.login(email: 'test', password: '1234');

          // Assert
          expect(response.success, true);
          expect(response.response, isA<AuthResponse>());

          verify(() => mockClient.post<Map<String, dynamic>>(
                any(),
                baseUrl: any(named: 'baseUrl'),
                data: any(named: 'data'),
                queryParameters: any(named: 'queryParameters'),
                options: any(named: 'options'),
              )).called(1);
        },
      );
    },
  );

  group(
    'Testing login service with error',
    () {
      late HttpClient mockClient;
      late LoginService service;

      setUpAll(
        () {
          registerFallbackValue(MockRequestOptions());

          mockClient = HttpClientMock();
          inject.registerFactory<HttpClient>(() => mockClient);

          service = LoginServiceImpl();
        },
      );

      tearDownAll(
        () {
          inject.unregister<HttpClient>();
        },
      );

      test(
        'Given email and password, When try to login, Then return error on login',
        () async {
          // Arrange
          when(
            () => mockClient.post<Map<String, dynamic>>(any()),
          ).thenAnswer(
            (_) async {
              return Response<Map<String, dynamic>>(
                requestOptions: RequestOptions(path: '/places'),
                data: {},
                statusCode: 200,
              );
            },
          );

          // Act & Assert
          expect(
            () async => await service.login(email: 'test', password: '1234'),
            throwsA(isA<Exception>()),
          );
        },
      );
    },
  );
}
