abstract class BuyerStates{}

class BuyerInitialState extends BuyerStates{}

class BuyerGetUserLoadingState extends BuyerStates{}

class BuyerGetUserSuccessState extends BuyerStates{}

class BuyerGetUserErrorState extends BuyerStates
{
  final String error;

  BuyerGetUserErrorState(this.error);
}

class BuyerChangeBottomNavState extends BuyerStates{}

