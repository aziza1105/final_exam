//
// part of 'task_bloc.dart';
//
// class MainState {
//   final LoadingStatus status;
//   final List<MainModel> taskList;
//   final List<MainModel> upcomingList;
//   final List<MainModel> searchedTask;
//   final DateTime startDate;
//   final DateTime endDate;
//   final Color selectIconColor;
//   final String selectIcon;
//   final Color? priorityColor;
//   final bool isSearching;
//   MainState({
//     required this.status,
//     required this.taskList,
//     required this.upcomingList,
//     required this.searchedTask,
//     required this.startDate,
//     required this.endDate,
//     required this.selectIconColor,
//     required this.selectIcon,
//     this.priorityColor,
//     required this.isSearching,
//   });
//
//
//   MainState copyWith({
//     LoadingStatus? status,
//     List<MainModel>? taskList,
//     List<MainModel>? upcomingList,
//     List<MainModel>? searchedTask,
//     DateTime? startDate,
//     DateTime? endDate,
//     Color? selectIconColor,
//     String? selectIcon,
//     Color? priorityColor,
//     bool? isSearching,
//   }) {
//     return MainState(
//       status: status ?? this.status,
//       taskList: taskList ?? this.taskList,
//       upcomingList: upcomingList ?? this.upcomingList,
//       searchedTask: searchedTask ?? this.searchedTask,
//       startDate: startDate ?? this.startDate,
//       endDate: endDate ?? this.endDate,
//       selectIconColor: selectIconColor ?? this.selectIconColor,
//       selectIcon: selectIcon ?? this.selectIcon,
//       priorityColor: priorityColor ?? this.priorityColor,
//       isSearching: isSearching ?? this.isSearching,
//     );
//   }
//
//   @override
//   String toString() {
//     return 'TaskState(status: $status, taskList: $taskList, upcomingList: $upcomingList, searchedTask: $searchedTask, startDate: $startDate, endDate: $endDate, selectIconColor: $selectIconColor, selectIcon: $selectIcon, priorityColor: $priorityColor, isSearching: $isSearching)';
//   }
//
//   @override
//   bool operator ==(covariant MainState other) {
//     if (identical(this, other)) return true;
//
//     return
//       other.status == status &&
//           listEquals(other.taskList, taskList) &&
//           listEquals(other.upcomingList, upcomingList) &&
//           listEquals(other.searchedTask, searchedTask) &&
//           other.startDate == startDate &&
//           other.endDate == endDate &&
//           other.selectIconColor == selectIconColor &&
//           other.selectIcon == selectIcon &&
//           other.priorityColor == priorityColor &&
//           other.isSearching == isSearching;
//   }
//
//   @override
//   int get hashCode {
//     return status.hashCode ^
//     taskList.hashCode ^
//     upcomingList.hashCode ^
//     searchedTask.hashCode ^
//     startDate.hashCode ^
//     endDate.hashCode ^
//     selectIconColor.hashCode ^
//     selectIcon.hashCode ^
//     priorityColor.hashCode ^
//     isSearching.hashCode;
//   }
// }
//
//
