part of 'episodes_bloc.dart';

abstract class EpisodesState extends Equatable {
  const EpisodesState();  

  @override
  List<Object> get props => [];
}
class EpisodesInitial extends EpisodesState {}
