import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_udemy_shop/features/product/data/remote/data_sources/data_source.dart';
import 'package:flutter_udemy_shop/features/product/data/remote/data_sources/firebase/firebase_data_source.dart';
import 'package:flutter_udemy_shop/features/product/data/repositories/product_repository_impl.dart';
import 'package:flutter_udemy_shop/features/product/domain/repositories/product_repository.dart';
import 'package:flutter_udemy_shop/features/product/domain/usecases/get_all_products.dart';
import 'package:flutter_udemy_shop/features/product/domain/usecases/get_concrete_product.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void configureInjection(String environment) => _initGetIt(getIt, environment: environment);

abstract class Env {
  static const dev = 'dev';
  static const prod = 'prod';
}

Future<void> _initGetIt(GetIt getIt, {String environment}) async {
  getIt
    ..registerFactory<ProductRemoteDataSource>(() => FirebaseDataSource(getIt<Firestore>()))
    ..registerFactory<ProductRepository>(
        () => ProductRepositoryImpl(remoteDataSource: getIt<ProductRemoteDataSource>()))
    ..registerFactory<GetAllProducts>(() => GetAllProducts(getIt<ProductRepository>()))
    ..registerFactory<GetConcreteProduct>(() => GetConcreteProduct(getIt<ProductRepository>()))
    ..registerFactory<Firestore>(() => Firestore());
}
