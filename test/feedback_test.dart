import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:simaru/provider/feedback_provider.dart';

void main() {
  group('Feedback Tests', () {
    FeedbackProvider feedbackProvider;

    setUp(() {
      feedbackProvider = FeedbackProvider();
    });

    test('feedback - succes', () async {
      // Arrange: Set up the data for the test case.
      final roomid = '1';
      final description = 'Test feedback dari unit tes';
      final token =
          '32|w1YyrdvAGQKNeCAxuget2HDTk4RHBTCAmZlblV1X'; // Replace with a valid token for testing

      // Create sample image files (you can use temporary files for testing).
      final image1 = File('assets/meeting-room1.jpg');
      final image2 = File('assets/meeting-room1.jpg');

      // Add the image files to the mediaList.
      final mediaList = [image1, image2];

      // Act: Call the feedback method and await the result.
      final result = await feedbackProvider.feedback(
        roomid: roomid,
        description: description,
        mediaList: mediaList,
        token: token,
      );

      // Assert: Verify the expected outcome.
      expect(result, true);
    });

    test('failed - data cant empty', () async {
      // Arrange: Set up the data for the test case.
      final roomid = '13';
      final description = 'Test feedback';
      final token =
          '430|ZSSQ5KNPnsWm00cmUzJOeBNVsu0QfYeGohM0FNct'; // Replace with an invalid token for testing
      // Act: Call the feedback method with an empty mediaList and await the result.
      final result = await feedbackProvider.feedback(
        roomid: roomid,
        description: description,
        mediaList: [], // Empty mediaList
        token: token,
      );
      // Assert: Verify the expected outcome.
      expect(result, false);
    });

    test('failed - no token acces', () async {
      // Arrange: Set up the data for the test case.
      final roomid = '11';
      final description = 'Test feedback';
      final token = ''; // Replace with a valid token for testing

      // Create sample image files (you can use temporary files for testing).
      final image1 = File('assets/meeting-room1.jpg');
      final image2 = File('assets/meeting-room1.jpg');

      // Add the image files to the mediaList.
      final mediaList = [image1, image2];

      // Act: Call the feedback method and await the result.
      final result = await feedbackProvider.feedback(
        roomid: roomid,
        description: description,
        mediaList: mediaList,
        token: token,
      );

      // Assert: Verify the expected outcome.
      expect(result, false);
    });
  });
}
