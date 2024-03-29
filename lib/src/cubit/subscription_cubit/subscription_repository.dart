import 'package:untitled5/src/helpers/api_helper.dart';
import 'package:untitled5/src/models/api_response_model.dart';
import 'package:untitled5/src/models/subscription_model.dart';
import 'package:untitled5/src/web_service/api_routes.dart';

class SubscriptionRepository {
  Future<ApiResponseModel> getAllSubscriptions() async {
    ApiResponseModel response =
    await ApiHelper().makeGetRequest(ApiRoutes.getAllSubscription);
    return response;
  }

  Future<ApiResponseModel> createSubscription(SubscriptionModel subscription) async {
    ApiResponseModel response = await ApiHelper()
        .makePostRequest(ApiRoutes.getAllSubscription, subscription.toJson());
    return response;
  }

  Future<ApiResponseModel> deleteSubscription(SubscriptionModel subscription) async {
    ApiResponseModel response = await ApiHelper().makeDeleteRequest(
        ApiRoutes.getAllSubscription + "/${subscription.id}");
    return response;
  }

  Future<ApiResponseModel> updateSubscription(SubscriptionModel subscription) async {
    ApiResponseModel response = await ApiHelper().makePatchRequest(
        ApiRoutes.getAllSubscription + "/${subscription.id}", subscription.toJson());
    return response;
  }

  Future<ApiResponseModel> getSubscriptionbyId(SubscriptionModel subscription) async {
    ApiResponseModel response = await ApiHelper()
        .makeGetRequest(ApiRoutes.getAllSubscription + "/${subscription.id}");
    return response;
  }
}