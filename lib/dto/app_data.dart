import 'package:code_bangladesh_mobile_app/dto/category_response_dto.dart';
import 'package:code_bangladesh_mobile_app/dto/site_conf_response_dto.dart';

class AppDataResponseDTO {
  final SiteConfResponseDTO siteConf;
  final List<CategoryResponseDTO> categories;

  AppDataResponseDTO({this.siteConf, this.categories});

  factory AppDataResponseDTO.fromJson(Map<String, dynamic> appDataJson) {
    List<CategoryResponseDTO> categories = appDataJson['categories']
        .map<CategoryResponseDTO>((categoryJsonObj) => CategoryResponseDTO.fromJson(categoryJsonObj))
        .toList();

    return AppDataResponseDTO(siteConf: SiteConfResponseDTO.fromJson(appDataJson['siteConf']), categories: categories);
  }
}
