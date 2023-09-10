import 'package:flutter/material.dart';

@immutable
class Film {
  final String id;
  final String title;
  final String description;
  final bool isFavorite;

  const Film({
    required this.id,
    required this.title,
    required this.description,
    required this.isFavorite,
  });

  Film copy({
    required bool isFavorite,
  }) => Film(
      id: id,
      title: title,
      description: description,
      isFavorite: isFavorite,
    );

  @override
  String toString() {
    return 'Film{id: $id, title: $title, description: $description, isFavorite: $isFavorite}';
  }

  @override
  bool operator == (covariant Film other) =>
      id == other.id && isFavorite == other.isFavorite;

  @override
  int get hashCode => Object.hashAll([
    id,
    isFavorite,
  ]);
}

const allFilms = [
  Film(
    id: '1',
    title: 'The Shawshank Redemption',
    description: 'Description for The Shawshank Redemption',
    isFavorite: false,
  ),
  Film(
    id: '2',
    title: 'The Godfather',
    description: 'Description for The Godfather',
    isFavorite: false,
  ),
  Film(
    id: '3',
    title: 'The Godfather: Part II',
    description: 'Description for The Godfather: Part II',
    isFavorite: false,
  ),
  Film(
    id: '4',
    title: 'The Dark Knight',
    description: 'Description for The Dark Knight',
    isFavorite: false,
  ),
];