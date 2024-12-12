class Cat {
  final String id;
  final String name;
  final String? origin;
  final int? intelligence;
  final String? imageUrl;
  final String? referenceImageId;
  final String description;
  final String? lifeSpan;
  final int? adaptability;
  final int? affectionLevel;
  final int? childFriendly;
  final int? dogFriendly;
  final int? energyLevel;
  final int? grooming;
  final int? healthIssues;
  final int? sheddingLevel;
  final int? socialNeeds;
  final int? strangerFriendly;
  final int? vocalisation;
  final int? experimental;
  final int? hairless;
  final int? natural;
  final int? rare;
  final int? rex;
  final int? suppressedTail;
  final int? shortLegs;
  final String wikipediaUrl;
  final int? hypoallergenic;
  

  Cat({
    required this.id,
    required this.name,
    this.origin,
    this.intelligence,
    this.imageUrl,
    this.referenceImageId,
    required this.description,
    required this.lifeSpan, 
    required this.adaptability, 
    required this.affectionLevel, 
    required this.childFriendly, 
    required this.dogFriendly, 
    required this.energyLevel, 
    required this.grooming, 
    required this.healthIssues, 
    required this.sheddingLevel, 
    required this.socialNeeds, 
    required this.strangerFriendly, 
    required this.vocalisation, 
    required this.experimental, 
    required this.hairless, 
    required this.natural, 
    required this.rare, 
    required this.rex, 
    required this.suppressedTail, 
    required this.shortLegs, 
    required this.wikipediaUrl, 
    required this.hypoallergenic,
  });

  factory Cat.fromJson(Map<String, dynamic> json) {
    return Cat(
      id: json['id'],
      name: json['name'],
      origin: json['origin'],
      intelligence: json['intelligence'],
      imageUrl: json['reference_image_id'] != null
          ? 'https://cdn2.thecatapi.com/images/${json['reference_image_id']}.jpg'
          : null,
      description: json['description'], 
      lifeSpan: json['life_span'],
      adaptability: json['adaptability'], 
      affectionLevel: json['affection_level'],
      childFriendly: json['child_friendly'], 
      dogFriendly: json['dog_friendly'], 
      energyLevel: json['energy_level'], 
      grooming: json['grooming'], 
      healthIssues: json['health_issues'],
      sheddingLevel: json['shedding_level'],
      socialNeeds: json['social_needs'], 
      strangerFriendly: json['stranger_friendly'],
      vocalisation: json['vocalisation'],
      experimental: json['experimental'], 
      hairless: json['hairless'],
      natural: json['natural'],
      rare: json['rare'], 
      rex: json['rex'], 
      suppressedTail: json['suppressed_tail'],
      shortLegs: json['short_legs'], 
      wikipediaUrl: json['wikipedia_url'] ?? '', 
      hypoallergenic: json['hypoallergenic'],
    );
  }
}