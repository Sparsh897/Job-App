class JobResponse {
  List<JobsResponse>? jobs;

  JobResponse({this.jobs});

  JobResponse.fromJson(Map<String, dynamic> json) {
    if (json['jobs'] != null) {
      jobs = <JobsResponse>[];
      json['jobs'].forEach((v) {
        jobs!.add(new JobsResponse.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.jobs != null) {
      data['jobs'] = this.jobs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class JobsResponse {
  String? sId;
  String? title;
  String? company;
  String? location;
  String? description;
  String? agentName;
  String? salary;
  String? period;
  bool? hiring;
  String? contract;
  List<String>? requirements;
  String? imageUrl;
  String? agentId;
  int? iV;

  JobsResponse(
      {this.sId,
      this.title,
      this.location,
      this.description,
      this.agentName,
      this.salary,
      this.period,
      this.hiring,
      this.company,
      this.contract,
      this.requirements,
      this.imageUrl,
      this.agentId,
      this.iV});

  JobsResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    company = json['company'];
    location = json['location'];
    description = json['description'];
    agentName = json['agentName'];
    salary = json['salary'];
    period = json['period'];
    hiring = json['hiring'];
    contract = json['contract'];
    requirements = json['requirements'].cast<String>();
    imageUrl = json['imageUrl'];
    agentId = json['agentId'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['company'] = this.company;
    data['location'] = this.location;
    data['description'] = this.description;
    data['agentName'] = this.agentName;
    data['salary'] = this.salary;
    data['period'] = this.period;
    data['hiring'] = this.hiring;
    data['contract'] = this.contract;
    data['requirements'] = this.requirements;
    data['imageUrl'] = this.imageUrl;
    data['agentId'] = this.agentId;
    data['__v'] = this.iV;
    return data;
  }
}
