import 'package:equatable/equatable.dart';

class MainScreenState extends Equatable {
  final String imageUrl;
  final int index;
  final bool isLanguage;
  final int homeIndex;

  const MainScreenState(
      {
      required this.index,
      required this.imageUrl,
        required this.homeIndex,
        required this.isLanguage
});

  const MainScreenState.initial() : this(imageUrl: '', index: 0,isLanguage: true,homeIndex: 0);

  MainScreenState copyWith({String? imageUrl,   int? index,bool? isLanguage,int?homeIndex}) =>
      MainScreenState(
          isLanguage: isLanguage??this.isLanguage,
          index: index ?? this.index,
          homeIndex: homeIndex??this.homeIndex,
          imageUrl: imageUrl ?? this.imageUrl,
         );

  @override
  // TODO: implement props
  List<Object?> get props => [index, imageUrl,isLanguage,homeIndex];

  @override
  bool get stringify => true;
}
