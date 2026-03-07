import 'package:flutter/material.dart';
import 'package:pegasus_flutter/pegasus_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;

  void _toggleTheme() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return McApp(
      title: 'Pegasus Flutter Example',
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode,
      home: HomePage(onThemeToggle: _toggleTheme),
    );
  }
}

class HomePage extends StatelessWidget {
  final VoidCallback onThemeToggle;

  const HomePage({super.key, required this.onThemeToggle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: McAppBar(
        leading: Builder(
          builder:
              (context) => IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  McSideSheet.show(
                    context: context,
                    header: McSideSheetLogoHeader(),
                    children: [
                      McSideSheetItem(
                        label: 'Home',
                        leading: const Icon(Icons.home),
                        onTap: () {
                          Navigator.pop(context);
                          debugPrint('Navigating to Home');
                        },
                      ),
                      McSideSheetItem(
                        label: 'Profile',
                        leading: const Icon(Icons.person),
                        onTap: () {
                          Navigator.pop(context);
                          debugPrint('Navigating to Profile');
                        },
                      ),
                      McSideSheetItem(
                        label: 'Settings',
                        leading: const Icon(Icons.settings),
                        onTap: () {
                          Navigator.pop(context);
                          debugPrint('Navigating to Settings');
                        },
                      ),
                      McSideSheetItem(
                        label: 'Notifications',
                        leading: const Icon(Icons.notifications),
                        trailing: McBadge(badgeText: '5'),
                        onTap: () {
                          Navigator.pop(context);
                          debugPrint('Navigating to Notifications');
                        },
                      ),
                    ],
                  );
                },
                tooltip: 'Menu',
              ),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.brightness_6),
          onPressed: onThemeToggle,
          tooltip: 'Toggle Theme',
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pegasus Flutter Design System',
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Example app demonstrating McApp and design system components',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 32),
            const McDivider(),
            const SizedBox(height: 32),
            Text(
              'Buttons',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                McButton(
                  label: 'Primary Button',
                  onPressed: () => debugPrint('Primary pressed'),
                ),
                McButton(
                  label: 'With Start Icon',
                  startIcon: const Icon(Icons.add, size: 18),
                  onPressed: () => debugPrint('Start icon pressed'),
                ),
                McButton(
                  label: 'With End Icon',
                  endIcon: const Icon(Icons.arrow_forward, size: 18),
                  onPressed: () => debugPrint('End icon pressed'),
                ),
                McButton(label: 'Disabled', onPressed: null),
              ],
            ),
            const SizedBox(height: 32),
            const McDivider(),
            const SizedBox(height: 32),
            Text(
              'Chips',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                McChip(
                  type: ChipType.input,
                  label: 'Safe',
                  style: ChipStyle.filled,
                  kind: ChipKind.safe,
                  backgroundColor: context.extendedColors.positive,
                  foregroundColor: context.extendedColors.onPositive,
                  onDeleted: () => debugPrint('Safe deleted'),
                ),
                McChip(
                  type: ChipType.input,
                  label: 'In Progress',
                  style: ChipStyle.filled,
                  kind: ChipKind.inProgress,
                  backgroundColor:
                      Theme.of(context).colorScheme.surfaceContainerHigh,
                  foregroundColor: Theme.of(context).colorScheme.primary,
                  onDeleted: () => debugPrint('In Progress deleted'),
                ),
                McChip(
                  type: ChipType.input,
                  label: 'Issue',
                  style: ChipStyle.filled,
                  kind: ChipKind.warning,
                  backgroundColor: context.extendedColors.warningContainer,
                  foregroundColor: context.extendedColors.warning,
                  onDeleted: () => debugPrint('Issue deleted'),
                ),
                McChip(
                  type: ChipType.input,
                  label: 'Resolved',
                  style: ChipStyle.filled,
                  kind: ChipKind.resolved,
                  backgroundColor: context.extendedColors.positiveContainer,
                  foregroundColor: context.extendedColors.positive,
                  onDeleted: () => debugPrint('Resolved deleted'),
                ),
              ],
            ),
            const SizedBox(height: 32),
            const McDivider(),
            const SizedBox(height: 32),
            Text(
              'Filter Chips',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            _FilterChipExample(),
            const SizedBox(height: 32),
            const McDivider(),
            const SizedBox(height: 32),
            Text(
              'Cards',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            McCard(
              variant: CardVariant.filled,
              title: 'Filled Card',
              description:
                  'This is a filled card demonstrating the design system card component.',
            ),
            const SizedBox(height: 16),
            McCard(
              variant: CardVariant.outlined,
              title: 'Outlined Card',
              description: 'This is an outlined card variant with a border.',
            ),
            const SizedBox(height: 32),
            const McDivider(),
            const SizedBox(height: 32),
            Text(
              'Connection Details',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            const McConnectionDetails(
              title: 'Wi-Fi Network',
              status: 'Connected',
              bullets: [
                BulletItem('High-speed internet connection'),
                BulletItem('Secure WPA3 encryption'),
                BulletItem('Signal strength: Excellent'),
              ],
            ),
            const SizedBox(height: 32),
            const McDivider(),
            const SizedBox(height: 32),
            Text(
              'Text Field',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            McTextField(
              hintText: 'Type a message...',
              onAttachPressed: () => debugPrint('Attach pressed'),
              onSendPressed: () => debugPrint('Send pressed'),
            ),
            const SizedBox(height: 32),
            const McDivider(),
            const SizedBox(height: 32),
            Text(
              'Chat Bubbles',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            const McChatBubble(
              text: 'Hello! This is a user message.',
              isSent: true,
            ),
            const SizedBox(height: 12),
            const McChatBubble(
              text: 'This is a bot response message.',
              isSent: false,
            ),
            const SizedBox(height: 32),
            const McDivider(),
            const SizedBox(height: 32),
            Text(
              'Loader',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            const Center(child: McLoader()),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

class _FilterChipExample extends StatefulWidget {
  const _FilterChipExample();

  @override
  State<_FilterChipExample> createState() => _FilterChipExampleState();
}

class _FilterChipExampleState extends State<_FilterChipExample> {
  bool _isSelected1 = false;
  bool _isSelected2 = true;
  bool _isSelected3 = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Individual Filter Chips',
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            McFilterChip(
              label: 'Active',
              isSelected: _isSelected1,
              onSelected: (selected) {
                setState(() => _isSelected1 = selected);
                debugPrint('Active: $selected');
              },
            ),
            McFilterChip(
              label: 'Completed',
              isSelected: _isSelected2,
              onSelected: (selected) {
                setState(() => _isSelected2 = selected);
                debugPrint('Completed: $selected');
              },
            ),
            McFilterChip(
              label: 'With Icon',
              leadingIcon: const Icon(Icons.filter_alt, size: 18),
              isSelected: _isSelected3,
              onSelected: (selected) {
                setState(() => _isSelected3 = selected);
                debugPrint('With Icon: $selected');
              },
            ),
            McFilterChip(
              label: 'Elevated',
              elevated: true,
              isSelected: false,
              onSelected: (selected) => debugPrint('Elevated: $selected'),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Text(
          'Filter Chip Group (Multi-Select)',
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 12),
        McFilterChipGroup(
          labels: ['All', 'Documents', 'Images', 'Videos', 'Audio'],
          selectedIndices: {0},
          onSelectionChanged: (selectedIndices) {
            debugPrint('Selected indices: $selectedIndices');
          },
        ),
        const SizedBox(height: 24),
        Text(
          'Filter Chip Group (Single-Select)',
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 12),
        McFilterChipGroup(
          labels: ['Today', 'This Week', 'This Month', 'All Time'],
          selectedIndices: {0},
          multiSelect: false,
          onSelectionChanged: (selectedIndices) {
            debugPrint('Selected time range: $selectedIndices');
          },
        ),
      ],
    );
  }
}
