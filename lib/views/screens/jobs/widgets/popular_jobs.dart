import 'package:flutter/material.dart';
import 'package:jobhubv2_0/constants/app_constants.dart';
import 'package:jobhubv2_0/controllers/jobs_provider.dart';
import 'package:jobhubv2_0/models/response/jobs/jobs_response.dart';
import 'package:jobhubv2_0/views/common/loader.dart';
import 'package:jobhubv2_0/views/common/pages_loader.dart';
import 'package:jobhubv2_0/views/common/styled_container.dart';
import 'package:jobhubv2_0/views/screens/jobs/widgets/jobHorizontal_tile.dart';
import 'package:provider/provider.dart';

class PopularJobs extends StatelessWidget {
  const PopularJobs({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<JobsNotifier>(
      builder: (context, jobprovider, child) {
        if (jobprovider.jobData == null) {
          jobprovider.fetchAllJobs();
        }
         final jobData = jobprovider.jobData;
        
         if (jobData == null) {
          return Center(child: CircularProgressIndicator());
        } else if (jobData.jobs == null || jobData.jobs!.isEmpty) {  // Check if jobs is null or empty
          return Center(child: Text("No Jobs Available"));  // Handle no data
        }
        return SizedBox(
            height: hieght * 0.28,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: jobData.jobs?.length,
                itemBuilder: (context, index) {
                final job = jobData.jobs![index]; 
                  return JobHorizontalTile(
                    onTap: () {},
    job: job,
                  );
                }));
      },
    );
  }
}
