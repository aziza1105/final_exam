import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';


import '../../../home/repository/articles_repository.dart';
import '../../data/models/article_single/article_single.dart';

part 'event.dart';
part 'state.dart';

class BlocBloc extends Bloc<BlocEvent, BlocState> {
  final ArticleRepository _repository;

  BlocBloc({required ArticleRepository repository})
      : _repository = repository,
        super(BlocState(
          status: FormzStatus.pure,
          article: ArticleSingle.fromJson(const {}),
        )) {
    on<GetSingleArticle>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));

      try {
        final article = await _repository.getArticle(id: event.slug);
        emit(state.copyWith(
          status: FormzStatus.submissionSuccess,
          article: article,
        ));
      } catch (e) {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
        event.onError('$e');
      }
    });
  }
}
