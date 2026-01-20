import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mediapipe_launcher/main.dart';
import 'package:mediapipe_launcher/screens/home_screen.dart';
import 'package:mediapipe_launcher/widgets/sample_card.dart';
import 'package:mediapipe_launcher/data/samples_data.dart';

void main() {
  testWidgets('App start and verify UI elements', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MediaPipeLauncherApp());

    // Verify that the AppBar is present and has the correct title
    expect(find.text('MediaPipe Samples'), findsOneWidget);
    expect(find.byIcon(Icons.auto_awesome), findsOneWidget);

    // Verify search bar is present
    expect(find.byType(TextField), findsOneWidget);
    expect(find.text('샘플 검색...'), findsOneWidget);

    // Verify category chips are present
    expect(find.text('Vision'), findsAtLeastNWidgets(1));
    expect(find.text('Audio'), findsOneWidget);
    expect(find.text('Text'), findsOneWidget);
    expect(find.text('GenAI'), findsOneWidget);

    // Verify sample cards are displayed
    // We expect at least a few cards to be rendered on screen
    expect(find.byType(SampleCard), findsAtLeastNWidgets(1));

    // Check specific sample content (e.g., Object Detection)
    expect(find.text('Object Detection'), findsOneWidget);
    expect(find.text('Vision'), findsAtLeastNWidgets(1));
  });

  testWidgets('Category filtering works', (WidgetTester tester) async {
    await tester.pumpWidget(const MediaPipeLauncherApp());

    // Originally, we should see samples from differnt categories
    // Object Detection (Vision) should be visible
    expect(find.text('Object Detection'), findsOneWidget);
    // Audio Classifier (Audio) should be visible (if scrolled, but assuming list view loads enough)
    // To be safe, let's filter specifically for Audio

    // Tap on 'Audio' category chip
    await tester.tap(find.text('Audio'));
    await tester.pumpAndSettle();

    // Now 'Object Detection' (Vision) should NOT be visible
    expect(find.text('Object Detection'), findsNothing);

    // But 'Audio Classifier' should be visible
    expect(find.text('Audio Classifier'), findsOneWidget);
  });

  testWidgets('Search functionality works', (WidgetTester tester) async {
    await tester.pumpWidget(const MediaPipeLauncherApp());

    // Enter text into search field
    await tester.enterText(find.byType(TextField), 'Face');
    await tester.pumpAndSettle();

    // 'Face Detection' should be visible
    expect(find.text('Face Detection'), findsOneWidget);

    // 'Object Detection' should NOT be visible (unless it contains 'Face', which it doesn't)
    expect(find.text('Object Detection'), findsNothing);
  });
}
