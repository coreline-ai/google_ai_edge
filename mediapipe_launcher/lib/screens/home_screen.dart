import 'package:flutter/material.dart';
import 'package:mediapipe_launcher/widgets/dot_grid_painter.dart';
import '../models/sample_model.dart';
import '../data/samples_data.dart';
import '../widgets/sample_card.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SampleCategory? _selectedCategory;
  String _searchQuery = '';
  final _searchController = TextEditingController();

  List<Sample> get _filteredSamples {
    var samples = allSamples;

    if (_selectedCategory != null) {
      samples = samples.where((s) => s.category == _selectedCategory).toList();
    }

    if (_searchQuery.isNotEmpty) {
      final query = _searchQuery.toLowerCase();
      samples = samples.where((s) {
        return s.name.toLowerCase().contains(query) ||
            s.description.toLowerCase().contains(query);
      }).toList();
    }

    return samples;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background Dot Grid
          Positioned.fill(
            child: CustomPaint(
              painter: DotGridPainter(dotColor: const Color(0xFFE5E7EB)),
            ),
          ),

          Column(
            children: [
              // Sticky Top Bar
              Container(
                decoration: const BoxDecoration(
                  color: Colors.black,
                  border: Border(
                    bottom: BorderSide(color: Colors.black, width: 2),
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: SafeArea(
                  bottom: false,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: Color(0xFFFFD700),
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'CORELINE // MEDIAPIPE',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.0,
                            ),
                          ),
                        ],
                      ),
                      const Row(
                        children: [
                          Text(
                            'SYSTEM: STABLE',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.0,
                            ),
                          ),
                          SizedBox(width: 16),
                          Text(
                            'BUILD: v2.4.1',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // Scrollable Content
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Header Section
                            Row(
                              children: [
                                Container(
                                  width: 48,
                                  height: 48,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFFD700),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 2,
                                    ),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black,
                                        offset: Offset(4, 4),
                                        blurRadius: 0,
                                      ),
                                    ],
                                  ),
                                  child: const Icon(
                                    Icons.auto_awesome,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                const Text(
                                  'MediaPipe Samples',
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.w900,
                                    height: 1.0,
                                    letterSpacing: -1.0,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 32),

                            // Search Bar
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2,
                                ),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black,
                                    offset: Offset(4, 4),
                                    blurRadius: 0,
                                  ),
                                ],
                              ),
                              child: TextField(
                                controller: _searchController,
                                onChanged: (value) =>
                                    setState(() => _searchQuery = value),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                                decoration: const InputDecoration(
                                  hintText: 'Search samples...',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Colors.grey,
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 24,
                                    vertical: 20,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 32),

                            // Filter Buttons
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              padding: const EdgeInsets.only(right: 24),
                              child: Row(
                                children: [
                                  _buildFilterButton(
                                    null,
                                    'Grid View',
                                    Icons.grid_view,
                                  ),
                                  _buildFilterButton(
                                    SampleCategory.vision,
                                    'Vision',
                                    Icons.visibility,
                                  ),
                                  _buildFilterButton(
                                    SampleCategory.audio,
                                    'Audio',
                                    Icons.music_note,
                                  ),
                                  _buildFilterButton(
                                    SampleCategory.text,
                                    'Text',
                                    Icons.text_fields,
                                  ),
                                  _buildFilterButton(
                                    SampleCategory.genai,
                                    'GenAI',
                                    Icons.smart_toy,
                                  ),
                                  _buildFilterButton(
                                    SampleCategory.custom,
                                    'Custom',
                                    Icons.settings,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 24),

                            // Count Display
                            Container(
                              decoration: const BoxDecoration(
                                border: Border(bottom: BorderSide(width: 2)),
                              ),
                              padding: const EdgeInsets.only(bottom: 4),
                              child: Text(
                                '${_filteredSamples.length} SAMPLES AVAILABLE',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Sample List
                    SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        final sample = _filteredSamples[index];
                        return SampleCard(
                          sample: sample,
                          onTap: () => _navigateToDetail(sample),
                        );
                      }, childCount: _filteredSamples.length),
                    ),
                    const SliverPadding(padding: EdgeInsets.only(bottom: 48)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFilterButton(
    SampleCategory? category,
    String label,
    IconData icon,
  ) {
    // "All" button logic
    final bool isSelected =
        (category == null && _selectedCategory == null) ||
        (category != null && _selectedCategory == category);

    // If 'All' button (category == null), label is 'All' actually in UI, but passed 'Grid View' here to match icon?
    // Let's match the code.html: All, Vision, Audio...
    final displayLabel = category == null ? 'All' : label;

    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: InkWell(
        onTap: () => setState(() => _selectedCategory = category),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? Colors.black : Colors.white,
            border: Border.all(color: Colors.black, width: 2),
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                offset: Offset(4, 4),
                blurRadius: 0,
              ),
            ],
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: isSelected ? Colors.white : Colors.black,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                displayLabel.toUpperCase(),
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToDetail(Sample sample) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => DetailScreen(sample: sample)),
    );
  }
}
