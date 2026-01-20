import '../models/sample_model.dart';

/// All MediaPipe samples data
const List<Sample> allSamples = [
  // Vision samples
  Sample(
    id: 'object_detection',
    name: 'Object Detection',
    description:
        '이미지와 영상에서 80가지 이상의 객체를 실시간으로 감지합니다. COCO 데이터셋 기반으로 사람, 동물, 차량 등을 인식할 수 있습니다.',
    icon: '🔍',
    category: SampleCategory.vision,
    platforms: [
      Platform.android,
      Platform.ios,
      Platform.web,
      Platform.python,
      Platform.raspberryPi,
    ],
    githubPath: 'object_detection',
    docUrl:
        'https://developers.google.com/mediapipe/solutions/vision/object_detector',
  ),
  Sample(
    id: 'face_detection',
    name: 'Face Detection',
    description:
        '실시간으로 얼굴을 감지하고 6개의 핵심 랜드마크(눈, 코, 입, 귀)를 추적합니다. 빠른 속도와 높은 정확도를 제공합니다.',
    icon: '👤',
    category: SampleCategory.vision,
    platforms: [
      Platform.android,
      Platform.ios,
      Platform.web,
      Platform.python,
      Platform.raspberryPi,
    ],
    githubPath: 'face_detector',
    docUrl:
        'https://developers.google.com/mediapipe/solutions/vision/face_detector',
  ),
  Sample(
    id: 'face_landmarker',
    name: 'Face Landmarker',
    description:
        '얼굴에서 468개의 정밀한 랜드마크를 추적합니다. 표정 분석, AR 필터, 아바타 제어 등에 활용할 수 있습니다.',
    icon: '😊',
    category: SampleCategory.vision,
    platforms: [
      Platform.android,
      Platform.ios,
      Platform.web,
      Platform.python,
      Platform.raspberryPi,
    ],
    githubPath: 'face_landmarker',
    docUrl:
        'https://developers.google.com/mediapipe/solutions/vision/face_landmarker',
  ),
  Sample(
    id: 'hand_landmarker',
    name: 'Hand Landmarker',
    description:
        '손에서 21개의 랜드마크를 실시간으로 추적합니다. 손가락 관절 위치를 정확하게 감지하여 제스처 인식의 기반이 됩니다.',
    icon: '✋',
    category: SampleCategory.vision,
    platforms: [
      Platform.android,
      Platform.ios,
      Platform.web,
      Platform.python,
      Platform.raspberryPi,
    ],
    githubPath: 'hand_landmarker',
    docUrl:
        'https://developers.google.com/mediapipe/solutions/vision/hand_landmarker',
  ),
  Sample(
    id: 'gesture_recognizer',
    name: 'Gesture Recognizer',
    description:
        '손 제스처를 인식합니다. 엄지 척, 승리 사인 등 다양한 손 동작을 분류하여 터치 없는 인터페이스를 구현할 수 있습니다.',
    icon: '👋',
    category: SampleCategory.vision,
    platforms: [
      Platform.android,
      Platform.ios,
      Platform.web,
      Platform.python,
      Platform.raspberryPi,
    ],
    githubPath: 'gesture_recognizer',
    docUrl:
        'https://developers.google.com/mediapipe/solutions/vision/gesture_recognizer',
  ),
  Sample(
    id: 'pose_landmarker',
    name: 'Pose Landmarker',
    description: '전신에서 33개의 랜드마크를 추적합니다. 운동 자세 분석, 피트니스 앱, 댄스 게임 등에 활용됩니다.',
    icon: '🏃',
    category: SampleCategory.vision,
    platforms: [
      Platform.android,
      Platform.ios,
      Platform.web,
      Platform.python,
      Platform.raspberryPi,
    ],
    githubPath: 'pose_landmarker',
    docUrl:
        'https://developers.google.com/mediapipe/solutions/vision/pose_landmarker',
  ),
  Sample(
    id: 'image_classification',
    name: 'Image Classification',
    description: '이미지를 1000개 이상의 카테고리로 분류합니다. 사진 정리, 콘텐츠 필터링, 자동 태깅 등에 활용됩니다.',
    icon: '🏷️',
    category: SampleCategory.vision,
    platforms: [
      Platform.android,
      Platform.ios,
      Platform.web,
      Platform.python,
      Platform.raspberryPi,
    ],
    githubPath: 'image_classification',
    docUrl:
        'https://developers.google.com/mediapipe/solutions/vision/image_classifier',
  ),
  Sample(
    id: 'image_segmentation',
    name: 'Image Segmentation',
    description: '이미지를 픽셀 단위로 분할합니다. 배경 제거, 인물 분리, 셀피 효과 등을 구현할 수 있습니다.',
    icon: '✂️',
    category: SampleCategory.vision,
    platforms: [Platform.android, Platform.ios, Platform.web, Platform.python],
    githubPath: 'image_segmentation',
    docUrl:
        'https://developers.google.com/mediapipe/solutions/vision/image_segmenter',
  ),
  Sample(
    id: 'image_embedder',
    name: 'Image Embedder',
    description: '이미지를 고차원 벡터로 변환합니다. 이미지 유사도 검색, 중복 이미지 감지 등에 활용됩니다.',
    icon: '📐',
    category: SampleCategory.vision,
    platforms: [Platform.android, Platform.ios, Platform.web, Platform.python],
    githubPath: 'image_embedder',
    docUrl:
        'https://developers.google.com/mediapipe/solutions/vision/image_embedder',
  ),
  Sample(
    id: 'image_generation',
    name: 'Image Generation',
    description:
        '텍스트 프롬프트로 이미지를 생성합니다. Stable Diffusion 기반의 온디바이스 이미지 생성을 지원합니다.',
    icon: '🎨',
    category: SampleCategory.vision,
    platforms: [Platform.android],
    githubPath: 'image_generation',
    docUrl:
        'https://developers.google.com/mediapipe/solutions/vision/image_generator',
  ),
  Sample(
    id: 'interactive_segmentation',
    name: 'Interactive Segmentation',
    description: '사용자가 탭한 영역을 기준으로 객체를 분할합니다. 사진 편집 앱에서 객체 선택에 활용됩니다.',
    icon: '👆',
    category: SampleCategory.vision,
    platforms: [Platform.android],
    githubPath: 'interactive_segmentation',
  ),

  // Audio samples
  Sample(
    id: 'audio_classifier',
    name: 'Audio Classifier',
    description: '오디오를 521개 카테고리로 분류합니다. 음악 장르, 환경음, 동물 소리 등을 인식할 수 있습니다.',
    icon: '🎵',
    category: SampleCategory.audio,
    platforms: [
      Platform.android,
      Platform.web,
      Platform.python,
      Platform.raspberryPi,
    ],
    githubPath: 'audio_classifier',
    docUrl:
        'https://developers.google.com/mediapipe/solutions/audio/audio_classifier',
  ),

  // Text samples
  Sample(
    id: 'text_classification',
    name: 'Text Classification',
    description: '텍스트의 감정이나 카테고리를 분류합니다. 리뷰 분석, 스팸 감지, 콘텐츠 분류 등에 활용됩니다.',
    icon: '📝',
    category: SampleCategory.text,
    platforms: [Platform.android, Platform.web, Platform.python],
    githubPath: 'text_classification',
    docUrl:
        'https://developers.google.com/mediapipe/solutions/text/text_classifier',
  ),
  Sample(
    id: 'text_embedder',
    name: 'Text Embedder',
    description: '텍스트를 벡터로 변환합니다. 의미 기반 검색, 문장 유사도 계산 등에 활용됩니다.',
    icon: '🔤',
    category: SampleCategory.text,
    platforms: [Platform.android, Platform.web, Platform.python],
    githubPath: 'text_embedder',
    docUrl:
        'https://developers.google.com/mediapipe/solutions/text/text_embedder',
  ),
  Sample(
    id: 'language_detector',
    name: 'Language Detector',
    description: '텍스트의 언어를 감지합니다. 110개 이상의 언어를 지원하며 다국어 앱 개발에 유용합니다.',
    icon: '🌍',
    category: SampleCategory.text,
    platforms: [Platform.android, Platform.web, Platform.python],
    githubPath: 'language_detector',
    docUrl:
        'https://developers.google.com/mediapipe/solutions/text/language_detector',
  ),

  // GenAI samples
  Sample(
    id: 'llm_inference',
    name: 'LLM Inference',
    description:
        'Gemma 모델을 온디바이스에서 실행합니다. 텍스트 생성, 요약, 질의응답 등 생성형 AI 기능을 구현할 수 있습니다.',
    icon: '🤖',
    category: SampleCategory.genai,
    platforms: [Platform.android, Platform.ios, Platform.web],
    githubPath: 'llm_inference',
    docUrl:
        'https://developers.google.com/mediapipe/solutions/genai/llm_inference',
  ),

  // Custom samples
  Sample(
    id: 'customization',
    name: 'Model Customization',
    description:
        'MediaPipe Model Maker로 커스텀 모델을 학습합니다. 자체 데이터로 모델을 fine-tuning할 수 있습니다.',
    icon: '⚙️',
    category: SampleCategory.custom,
    platforms: [Platform.python],
    githubPath: 'customization',
    docUrl: 'https://developers.google.com/mediapipe/solutions/model_maker',
  ),
];
