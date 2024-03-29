// import 'package:cloud_firestore/cloud_firestore.dart';
//
// import '../../../../../core/exception/exception.dart';
// import '../models/task_models.dart';
//
// abstract class MainRemoteDataSource {
//   Future<List<MainModel>> getItems();
//
//   factory MainRemoteDataSource() => _MainRemoteDataSourceImpl();
// }
//
// class _MainRemoteDataSourceImpl implements MainRemoteDataSource {
//   @override
//   Future<List<MainModel>> getItems() async {
//     try {
//       final collection =
//           await FirebaseFirestore.instance.collection('tasks').get();
//       final tasks = collection.docs
//           .map((item) => MainModel.fromJson(item.data(), item.id))
//           .toList();
//       return tasks;
//     } catch (error) {
//       print(error);
//       throw ServerException(
//           message: 'Xatolik yuz berdi!', code: 500);
//     }
//   }
// }
