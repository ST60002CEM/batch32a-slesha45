
import 'package:equatable/equatable.dart';
import 'package:final_assignment/features/auth/domain/entity/auth_entity.dart';
import 'package:final_assignment/features/home/domain/entity/property_entity.dart';


class FavouriteEntity extends Equatable {
  final String id;
  final PropertyEntity property;
  final AuthEntity user;

  FavouriteEntity({required this.id, required this.property, required this.user,});

  @override
  List<Object?> get props => [id, property, user];

}