// import 'package:cloud_firestore/cloud_firestore.dart';
//
//
// class MainModel {
//   final String id;
//   final String title;
//   final String icon;
//   final String priority;
//   final String iconColor;
//   final String? note;
//   final Timestamp startDate;
//   final Timestamp dueDate;
//   final bool isChecked;
//   MainModel({
//     required this.id,
//     required this.title,
//     required this.icon,
//     required this.priority,
//     required this.iconColor,
//     this.note,
//     required this.startDate,
//     required this.dueDate,
//     required this.isChecked,
//   });
//
//   factory MainModel.fromJson(Map<String, dynamic> json, String id) {
//
//     return MainModel(
//       id: id,
//       title: json['title'],
//       icon: json['icon'],
//       note: json['note'],
//       priority: json['priority'],
//       iconColor: json['iconColor'],
//       startDate: json['created_at'],
//       dueDate: json['due_date'],
//       isChecked: json['is_finished'],
//     );
//   }
//
//   @override
//   String toString() {
//     return 'TaskModel(id: $id, title: $title, icon: $icon, priority: $priority, iconColor: $iconColor, note: $note, startDate: $startDate, dueDate: $dueDate, isChecked: $isChecked)';
//   }
//
//   @override
//   bool operator ==(covariant MainModel other) {
//     if (identical(this, other)) return true;
//
//     return other.id == id &&
//         other.title == title &&
//         other.icon == icon &&
//         other.priority == priority &&
//         other.iconColor == iconColor &&
//         other.note == note &&
//         other.startDate == startDate &&
//         other.dueDate == dueDate &&
//         other.isChecked == isChecked;
//   }
//
//   @override
//   int get hashCode {
//     return id.hashCode ^
//     title.hashCode ^
//     icon.hashCode ^
//     priority.hashCode ^
//     iconColor.hashCode ^
//     note.hashCode ^
//     startDate.hashCode ^
//     dueDate.hashCode ^
//     isChecked.hashCode ;
//   }
//
//   MainModel copyWith({
//     String? id,
//     String? title,
//     String? icon,
//     String? priority,
//     String? iconColor,
//     String? note,
//     Timestamp? startDate,
//     Timestamp? dueDate,
//     bool? isChecked,
//     //Color? iconColor,
//   }) {
//     return MainModel(
//         id: id ?? this.id,
//         title: title ?? this.title,
//         icon: icon ?? this.icon,
//         priority: priority ?? this.priority,
//         iconColor: iconColor ?? this.iconColor,
//         note: note ?? this.note,
//         startDate: startDate ?? this.startDate,
//         dueDate: dueDate ?? this.dueDate,
//         isChecked: isChecked ?? this.isChecked
//     );
//   }
// }
