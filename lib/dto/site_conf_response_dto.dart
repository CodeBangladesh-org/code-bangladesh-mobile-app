class SiteConfResponseDTO {
  final String headerText;
  final String description;
  final String email;
  final String discordInvite;
  final String githubLink;

  SiteConfResponseDTO({this.headerText, this.description, this.email, this.discordInvite, this.githubLink});

  factory SiteConfResponseDTO.fromJson(Map<String, dynamic> siteConfJsonObj) {
    return SiteConfResponseDTO(
      headerText: siteConfJsonObj['headerText'] as String,
      description: siteConfJsonObj['description'] as String,
      email: siteConfJsonObj['email'] as String,
      discordInvite: siteConfJsonObj['discordInvite'] as String,
      githubLink: siteConfJsonObj['githubLink'] as String,
    );
  }
}