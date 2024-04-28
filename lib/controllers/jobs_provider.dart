import 'dart:convert';
import 'package:jobhubv2_0/models/response/jobs/jobs_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:jobhubv2_0/constants/app_constants.dart';
import 'package:jobhubv2_0/models/request/bookmarks/bookmarks_model.dart';
import 'package:jobhubv2_0/models/response/applied/applied.dart';
import 'package:jobhubv2_0/models/response/bookmarks/all_bookmarks.dart';
import 'package:jobhubv2_0/models/response/jobs/get_job.dart';
import 'package:jobhubv2_0/models/response/jobs/jobs_response.dart';
import 'package:jobhubv2_0/services/helpers/book_helper.dart';
import 'package:jobhubv2_0/services/helpers/jobs_helper.dart';

class JobsNotifier extends ChangeNotifier {
  JobResponse? _jobData;
  String? _errorMessage;

  JobResponse? get jobData => _jobData;
  String? get errorMessage => _errorMessage;
  Future<void> fetchAllJobs() async {
    const String apiUrl =
        'https://job-backend-production.up.railway.app/api/jobs/getAllJob';

    print(apiUrl);

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        _jobData = JobResponse.fromJson(json);
        // print(response.body);
        notifyListeners();
      } else {
        _errorMessage = 'Failed to load jobs: ${response.statusCode}';
      }
    } catch (e) {
      _errorMessage = 'Error fetching jobs: $e';
    }
  }
}
