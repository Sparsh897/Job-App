// import 'package:http/http.dart' as https;
// import 'package:jobhubv2_0/models/response/jobs/get_job.dart';
// import 'package:jobhubv2_0/models/response/jobs/jobs_response.dart';
// import 'package:jobhubv2_0/services/config.dart';

// class JobsHelper {
//   static var client = https.Client();

//   static Future<List<JobsResponse>> getJobs() async {
//     Map<String, String> requestHeaders = {
//       'Content-Type': 'application/json',
//     };
//     var url = Uri.https(
//       Config.apiUrl,
//       Config.jobs,
//     );
//     print(url);
//     var response = await client.get(
//       url,
//       headers: requestHeaders,
//     );
//     if (response.statusCode == 200) {
//       var jobList = jobsResponseFromJson(response.body);
//       return jobList;
//     } else {
//       throw Exception('Failed to get job list');
//     }
//   }

 
// }
