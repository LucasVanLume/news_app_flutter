// import 'package:dio/dio.dart';
// import 'package:flutter_clean_architecture/src/features/home/data/datasource/newsApi/news_api_datasource.dart';
// import 'package:flutter_clean_architecture/src/features/home/data/models/news_model.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';


// class MockDio extends Mock implements Dio {}

// Future<Response> _getResponse() async {
//   return Response(
//     statusCode: 200,
//     data: {
//       'articles': [
//         {
//           'name': 'Test News',
//           'author': 'Test Author',
//           'title': 'Test Title',
//           'description': 'Test Description',
//           'url': 'https://www.test.com',
//           'urlToImage': 'https://a57.foxnews.com/static.foxbusiness.com/foxbusiness.com/content/uploads/2024/03/0/0/united-1.jpg?ve=1&tl=1',
//           'publishedAt': '2022-01-01T00:00:00Z',
//           'content': 'Test Content',
//         },
//       ],
//     }, requestOptions: RequestOptions(),
//   );
// }

// void main() {
//   late NewsApiDatasource datasource;
//   late MockDio dio;

//   setUp(() {
//     dio = MockDio();
//     datasource = NewsApiDatasource(dio);
//   });

//   group('fetchAPI', () {
//     test('should return a list of NewsModel when the response code is 200', () async {
//       when(dio.get()).thenAnswer((_) async => _getResponse());

//       final result = await datasource.newsFetch();

//       expect(result, isA<List<NewsModel>>());
//       expect(result.length, 1);
//       expect(result[0].source['name'], 'Test News');
//       expect(result[0].author, 'Test Author');
//       expect(result[0].title, 'Test Title');
//       expect(result[0].description, 'Test Description');
//       expect(result[0].url, 'https://www.test.com');
//       expect(result[0].urlToImage, 'https://a57.foxnews.com/static.foxbusiness.com/foxbusiness.com/content/uploads/2024/03/0/0/united-1.jpg?ve=1&tl=1');
//       expect(result[0].publishedAt, '2022-01-01T00:00:00Z');
//       expect(result[0].content, 'Test Content');

//       //verify(dio.get(Uri.parse('https://newsapi.org/v2/top-headlines?country=us&apiKey=YOUR_API_KEY'))).called(1);
//     });

//     test('should throw an exception when the response code is not 200', () async {
//       when(dio.get("")).thenAnswer((_) async => Response(statusCode: 400, requestOptions: RequestOptions()));

//       expect(() => datasource.newsFetch(), throwsException);
//     });
//   });
// }




// // import 'package:flutter_clean_architecture/src/features/home/data/datasource/newsApi/news_api_datasource.dart';
// // import 'package:flutter_clean_architecture/src/features/home/data/models/news_model.dart';
// // import 'package:flutter_test/flutter_test.dart';
// // import 'package:mockito/mockito.dart';
// // import 'package:dio/dio.dart';


// // class MockDio extends Mock implements Dio {}

// // void main() {
// //   group('NewsApiDatasource', () {
// //     final dio = MockDio();
// //     final datasource = NewsApiDatasource(dio);

// //     test('Return a MewsModel', () async {
// //       final response = {
// //         'status': 'ok',
// //         'totalResults': 2,
// //         'articles': [
// //           {
// //             'source': {'name': 'source1'},
// //             'author': 'author1',
// //             'title': 'title1',
// //             'description': 'description1',
// //             'url': 'url1',
// //             'urlToImage': 'urlToImage1',
// //             'publishedAt': 'publishedAt1',
// //             'content': 'content1',
// //           },
// //           {
// //             'source': {'name': 'source2'},
// //             'author': 'author2',
// //             'title': 'title2',
// //             'description': 'description2',
// //             'url': 'url2',
// //             'urlToImage': 'urlToImage2',
// //             'publishedAt': 'publishedAt2',
// //             'content': 'content2',
// //           },
// //         ],
// //       };

// //       final requestOptions = RequestOptions(path: 'textNews');
// //       when(dio.get('any')).thenAnswer((_) async => Future.value(Response(data: response, statusCode: 200, requestOptions: requestOptions)));

// //       final result = await datasource.newsText('textNews');

// //       expect(result, isA<List<NewsModel>>());
// //       expect(result.length, 2);
// //       expect(result[0].name, 'source1');
// //       expect(result[1].name, 'source2');
// //     });

// //     test('should throw an exception when the http call completes with an error', () {
// //       final requestOptions = RequestOptions(path: 'textNews');
// //       when(dio.get('any')).thenAnswer((_) async => Future.value(Response(data: null, statusCode: 404, requestOptions: requestOptions)));

// //       expect(() => datasource.newsText('textNews'), throwsException);
// //     });
// //   });
// // }