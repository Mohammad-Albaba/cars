abstract class AppStates{}

class AppInitialState extends AppStates{}

class AppGetUserLoadingState extends AppStates{}

class AppGetUserSuccessState extends AppStates{}

class AppGetUserErrorState extends AppStates
{
  final String error;

  AppGetUserErrorState(this.error);
}

class AppChangeBottomNavState extends AppStates{}

class AppProfileImagePickedSuccessState extends AppStates{}

class AppProfileImagePickedErrorState extends AppStates{}

class UploadProfileImageSuccessState extends AppStates{}

class UploadProfileImageErrorState extends AppStates{}

class UserUpdateLoadingState extends AppStates{}

class UserUpdateErrorState extends AppStates{}

//create posts
class CreatePostLoadingState extends AppStates{}

class CreatePostSuccessState extends AppStates{}

class CreatePostErrorState extends AppStates{}

class PostImagePickedErrorState extends AppStates{}

class PostImagePickedSuccessState extends AppStates{}

class RemovePostImageState extends AppStates{}

