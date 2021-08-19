abstract class SellerStates{}

class SellerInitialState extends SellerStates{}

class SellerGetUserLoadingState extends SellerStates{}

class SellerGetUserSuccessState extends SellerStates{}

class SellerGetUserErrorState extends SellerStates
{
  final String error;

  SellerGetUserErrorState(this.error);
}

class SellerChangeBottomNavState extends SellerStates{}

