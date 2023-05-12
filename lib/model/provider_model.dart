class ProviderModel {
  bool? success;
  String? message;
  int? currentPage;
  List<Data>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  // ignore: prefer_typing_uninitialized_variables
  var nextPageUrl;
  String? path;
  int? perPage;
  // ignore: prefer_typing_uninitialized_variables
  var prevPageUrl;
  int? to;
  int? total;

  ProviderModel(
      {this.success,
      this.message,
      this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.links,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total});

  ProviderModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add( Data.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    data['current_page'] = currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = firstPageUrl;
    data['from'] = from;
    data['last_page'] = lastPage;
    data['last_page_url'] = lastPageUrl;
    if (links != null) {
      data['links'] = links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = nextPageUrl;
    data['path'] = path;
    data['per_page'] = perPage;
    data['prev_page_url'] = prevPageUrl;
    data['to'] = to;
    data['total'] = total;
    return data;
  }
}

class Data {
  String? uuid;
  String? businessName;
  // ignore: prefer_typing_uninitialized_variables
  var categoryId;
  String? vatNo;
  String? regNo;
  String? idNo;
  String? type;
  String? email;
  String? phone;
  String? note;
  String? webLink;
  int? highlight;
  String? category;
// ignore: prefer_typing_uninitialized_variables
var keyword;
  String? imagePath;
  String? backgroundImagePath;
  File? file;
  Cashback? cashback;

  Data(
      {this.uuid,
      this.businessName,
      this.categoryId,
      this.vatNo,
      this.regNo,
      this.idNo,
      this.type,
      this.email,
      this.phone,
      this.note,
      this.webLink,
      this.highlight,
      this.category,
      this.keyword,
      this.imagePath,
      this.backgroundImagePath,
      this.file,
      this.cashback});

  Data.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    businessName = json['business_name'];
    categoryId = json['category_id'];
    vatNo = json['vat_no'];
    regNo = json['reg_no'];
    idNo = json['id_no'];
    type = json['type'];
    email = json['email'];
    phone = json['phone'];
    note = json['note'];
    webLink = json['web_link'];
    highlight = json['highlight'];
    category = json['category'];
    keyword = json['keyword'];
    imagePath = json['image_path'];
    backgroundImagePath = json['background_image_path'];
    file = json['file'] != null ? File.fromJson(json['file']) : null;
    cashback = json['cashback'] != null
        ? Cashback.fromJson(json['cashback'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uuid'] = uuid;
    data['business_name'] = businessName;
    data['category_id'] = categoryId;
    data['vat_no'] = vatNo;
    data['reg_no'] = regNo;
    data['id_no'] = idNo;
    data['type'] = type;
    data['email'] = email;
    data['phone'] = phone;
    data['note'] = note;
    data['web_link'] = webLink;
    data['highlight'] = highlight;
    data['category'] = category;
    data['keyword'] = keyword;
    data['image_path'] = imagePath;
    data['background_image_path'] = backgroundImagePath;
    if (file != null) {
      data['file'] = file!.toJson();
    }
    if (cashback != null) {
      data['cashback'] = cashback!.toJson();
    }
    return data;
  }
}

class File {
  int? id;
  String? uuid;
  String? name;
  String? extension;
  String? creatorUuid;
  String? createdAt;
  String? updatedAt;
  String? backgroundImage;

  File(
      {this.id,
      this.uuid,
      this.name,
      this.extension,
      this.creatorUuid,
      this.createdAt,
      this.updatedAt,
      this.backgroundImage});

  File.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    name = json['name'];
    extension = json['extension'];
    creatorUuid = json['creator_uuid'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    backgroundImage = json['background_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['uuid'] = uuid;
    data['name'] = name;
    data['extension'] = extension;
    data['creator_uuid'] = creatorUuid;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['background_image'] = backgroundImage;
    return data;
  }
}

class Cashback {
  String? uuid;
  String? providerUuid;
  int? percentage;
  String? startDate;

  Cashback({this.uuid, this.providerUuid, this.percentage, this.startDate});

  Cashback.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    providerUuid = json['provider_uuid'];
    percentage = json['percentage'];
    startDate = json['start_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uuid'] = uuid;
    data['provider_uuid'] = providerUuid;
    data['percentage'] = percentage;
    data['start_date'] = startDate;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['label'] = label;
    data['active'] = active;
    return data;
  }
}