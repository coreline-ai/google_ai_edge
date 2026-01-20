#!/usr/bin/env python3
"""MediaPipe Object Detection Demo - Quick Test"""

import cv2
import mediapipe as mp
from mediapipe.tasks import python
from mediapipe.tasks.python import vision

# Constants for visualization
MARGIN = 10
FONT_SIZE = 1
FONT_THICKNESS = 2
TEXT_COLOR = (0, 255, 0)  # Green


def visualize(image, detection_result):
    """Draw bounding boxes on the image."""
    for detection in detection_result.detections:
        bbox = detection.bounding_box
        start_point = (bbox.origin_x, bbox.origin_y)
        end_point = (bbox.origin_x + bbox.width, bbox.origin_y + bbox.height)
        cv2.rectangle(image, start_point, end_point, TEXT_COLOR, 3)

        category = detection.categories[0]
        result_text = f"{category.category_name} ({category.score:.2f})"
        text_location = (MARGIN + bbox.origin_x, MARGIN + 20 + bbox.origin_y)
        cv2.putText(image, result_text, text_location, cv2.FONT_HERSHEY_SIMPLEX,
                    FONT_SIZE, TEXT_COLOR, FONT_THICKNESS)
    return image


def main():
    print("🚀 MediaPipe Object Detection Demo")
    print("=" * 40)

    # Create ObjectDetector
    base_options = python.BaseOptions(model_asset_path='efficientdet_lite0.tflite')
    options = vision.ObjectDetectorOptions(
        base_options=base_options,
        score_threshold=0.5
    )
    detector = vision.ObjectDetector.create_from_options(options)
    print("✅ Model loaded successfully!")

    # Load image
    image = mp.Image.create_from_file('cat_and_dog.jpg')
    print(f"📷 Image loaded: cat_and_dog.jpg")

    # Run detection
    detection_result = detector.detect(image)
    print(f"\n🎯 Detection Results:")
    print("-" * 40)

    for i, detection in enumerate(detection_result.detections):
        category = detection.categories[0]
        bbox = detection.bounding_box
        print(f"  [{i+1}] {category.category_name}")
        print(f"      Confidence: {category.score:.2%}")
        print(f"      Bounding Box: ({bbox.origin_x}, {bbox.origin_y}) - ({bbox.origin_x + bbox.width}, {bbox.origin_y + bbox.height})")
        print()

    # Save annotated image
    image_copy = image.numpy_view().copy()
    annotated_image = visualize(image_copy, detection_result)
    rgb_image = cv2.cvtColor(annotated_image, cv2.COLOR_RGB2BGR)
    output_path = 'detection_result.jpg'
    cv2.imwrite(output_path, rgb_image)
    print(f"💾 Result saved to: {output_path}")
    print("\n✨ Object Detection completed successfully!")


if __name__ == "__main__":
    main()
