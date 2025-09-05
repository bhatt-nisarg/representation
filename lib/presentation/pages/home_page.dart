import 'package:flutter/material.dart';
import '../../domain/entities.dart';
import '../../infrastructure/link_opener.dart';

const double _kMaxContentWidth = 1100;

class HomePage extends StatelessWidget {
  final Profile profile;
  final LinkOpener linkOpener;
  const HomePage({super.key, required this.profile, required this.linkOpener});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: null,
        actions: [
          _TopNav(onTap: (key) => _scrollTo(key)),
        ],
      ),
      body: _ResponsiveBody(profile: profile, linkOpener: linkOpener),
    );
  }

  void _scrollTo(GlobalKey key) {
    final BuildContext? context = key.currentContext;
    if (context == null) return;
    Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 450),
      curve: Curves.easeOutCubic,
      alignment: 0.05,
    );
  }
}

class _Keys {
  static final GlobalKey summary = GlobalKey();
  static final GlobalKey skills = GlobalKey();
  static final GlobalKey experience = GlobalKey();
  static final GlobalKey projects = GlobalKey();
  static final GlobalKey education = GlobalKey();
  static final GlobalKey contact = GlobalKey();
}

class _TopNav extends StatelessWidget {
  final void Function(GlobalKey) onTap;
  const _TopNav({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _NavLink(text: 'Summary', targetKey: _Keys.summary, onTap: onTap),
        _NavLink(text: 'Experience', targetKey: _Keys.experience, onTap: onTap),
        _NavLink(text: 'Projects', targetKey: _Keys.projects, onTap: onTap),
        _NavLink(text: 'Contact', targetKey: _Keys.contact, onTap: onTap),
        const SizedBox(width: 16),
      ],
    );
  }
}

class _NavLink extends StatelessWidget {
  final String text;
  final GlobalKey targetKey;
  final void Function(GlobalKey) onTap;
  const _NavLink(
      {required this.text, required this.targetKey, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: () => onTap(targetKey), child: Text(text));
  }
}

class _ResponsiveBody extends StatelessWidget {
  final Profile profile;
  final LinkOpener linkOpener;
  const _ResponsiveBody({required this.profile, required this.linkOpener});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isWide = constraints.maxWidth >= 900;
        final EdgeInsets pagePadding = EdgeInsets.symmetric(
          horizontal: isWide ? 80 : 20,
          vertical: 24,
        );

        final List<Widget> sections = [
          _AnimatedSection(
            delayMs: 0,
            child: _HeaderSection(profile: profile, linkOpener: linkOpener),
          ),
          const SizedBox(height: 24),
          const SizedBox(height: 8),
          _AnimatedSection(
            delayMs: 100,
            child: _SummarySection(profile: profile),
          ),
          const SizedBox(height: 16),
          _AnimatedSection(
            delayMs: 200,
            child: _SkillsSection(profile: profile),
          ),
          const SizedBox(height: 16),
          _AnimatedSection(
            delayMs: 300,
            child: _ExperienceSection(profile: profile),
          ),
          const SizedBox(height: 16),
          _AnimatedSection(
            delayMs: 400,
            child: _ProjectsSection(profile: profile),
          ),
          const SizedBox(height: 16),
          _AnimatedSection(
            delayMs: 500,
            child: _EducationSection(profile: profile),
          ),
          const SizedBox(height: 16),
          _AnimatedSection(
            delayMs: 600,
            child: _ContactSection(profile: profile, linkOpener: linkOpener),
          ),
          const SizedBox(height: 48),
        ];

        return SingleChildScrollView(
          padding: pagePadding,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: _kMaxContentWidth),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: sections,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _HeaderSection extends StatelessWidget {
  final Profile profile;
  final LinkOpener linkOpener;
  const _HeaderSection({required this.profile, required this.linkOpener});

  @override
  Widget build(BuildContext context) {
    final TextTheme text = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(profile.name, style: text.displaySmall),
        const SizedBox(height: 6),
        Text(profile.title, style: text.titleMedium),
        const SizedBox(height: 8),
        Container(
          width: 64,
          height: 3,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }
}

class _HeaderContact extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const _HeaderContact(
      {required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18),
          const SizedBox(width: 6),
          Text(label),
        ],
      ),
    );
  }
}

class _SummarySection extends StatelessWidget {
  final Profile profile;
  const _SummarySection({required this.profile});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _Keys.summary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionTitle('Summary'),
          const SizedBox(height: 8),
          Text(
            profile.summaryLines.first,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          if (profile.summaryLines.length > 1) ...[
            const SizedBox(height: 8),
            Text(
              profile.summaryLines[1],
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ],
      ),
    );
  }
}

class _SkillsSection extends StatelessWidget {
  final Profile profile;
  const _SkillsSection({required this.profile});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _Keys.skills,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionTitle('Skills'),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: profile.skills
                .map((s) => Chip(
                      label: Text(s),
                      backgroundColor: Theme.of(context)
                          .colorScheme
                          .surface
                          .withOpacity(0.06),
                      side: BorderSide(
                          color:
                              Theme.of(context).dividerColor.withOpacity(0.6)),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _ExperienceSection extends StatelessWidget {
  final Profile profile;
  const _ExperienceSection({required this.profile});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _Keys.experience,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionTitle('Experience'),
          const SizedBox(height: 12),
          ...profile.experiences.map((e) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _ExperienceItem(item: e),
              )),
        ],
      ),
    );
  }
}

class _ExperienceItem extends StatelessWidget {
  final Experience item;
  const _ExperienceItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return _HoverScale(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).dividerColor),
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).colorScheme.surface,
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.work_outline),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    '${item.title} – ${item.company}',
                    style: Theme.of(context).textTheme.titleLarge,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(item.period, style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: 8),
            for (final b in item.bullets.take(3))
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('• '),
                  Expanded(child: Text(b)),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class _ProjectsSection extends StatelessWidget {
  final Profile profile;
  const _ProjectsSection({required this.profile});

  @override
  Widget build(BuildContext context) {
    final bool isWide = MediaQuery.of(context).size.width >= 900;
    final int crossAxisCount = isWide ? 3 : 1;
    final projects = profile.projects;
    return Container(
      key: _Keys.projects,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionTitle('Projects'),
          const SizedBox(height: 12),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: projects.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: isWide ? 1.6 : 1.8,
            ),
            itemBuilder: (context, index) {
              final item = projects[index];
              return _ProjectCard(
                  title: item.title, description: item.description);
            },
          ),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  const _ProjectCard({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return _HoverScale(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).dividerColor),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.folder_open),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(description, style: Theme.of(context).textTheme.bodyMedium),
            const Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(onPressed: () {}, child: const Text('View')),
            ),
          ],
        ),
      ),
    );
  }
}

class _ContactSection extends StatelessWidget {
  final Profile profile;
  final LinkOpener linkOpener;
  const _ContactSection({required this.profile, required this.linkOpener});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _Keys.contact,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionTitle('Contact'),
          const SizedBox(height: 12),
          _ContactRow(
            icon: Icons.email_outlined,
            text: profile.email,
            onTap: () => linkOpener.sendEmail(profile.email),
          ),
          const SizedBox(height: 8),
          _ContactRow(
            icon: Icons.phone_outlined,
            text: profile.phone,
            onTap: () => linkOpener.dialPhone(profile.phone),
          ),
          const SizedBox(height: 8),
          _ContactRow(
            icon: Icons.link,
            text: profile.linkedInLabel,
            onTap: () => linkOpener.openUrl(profile.linkedInUrl),
          ),
          const SizedBox(height: 12),
          ElevatedButton.icon(
            onPressed: () => linkOpener.sendEmail(
              profile.email,
              subject: 'Hello Nisarg',
              body:
                  'Hi Nisarg,\n\nI came across your portfolio and would like to connect.',
            ),
            icon: const Icon(Icons.send_outlined),
            label: const Text('Mail Me'),
          ),
        ],
      ),
    );
  }
}

class _ContactRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback? onTap;
  const _ContactRow({required this.icon, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    final Widget row = Row(
      children: [
        Icon(icon),
        const SizedBox(width: 8),
        Expanded(child: Text(text)),
      ],
    );
    if (onTap == null) return row;
    return InkWell(
      onTap: onTap,
      hoverColor: Colors.transparent,
      child: AnimatedDefaultTextStyle(
        duration: const Duration(milliseconds: 150),
        style: Theme.of(context).textTheme.bodyMedium!,
        child: row,
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String text;
  const _SectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return _AnimatedSection(
      delayMs: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: theme.textTheme.headlineLarge,
          ),
          const SizedBox(height: 6),
          Container(
            width: 44,
            height: 3,
            decoration: BoxDecoration(
              color: theme.colorScheme.primary,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }
}

class _AnimatedSection extends StatefulWidget {
  final Widget child;
  final int delayMs;
  const _AnimatedSection({required this.child, this.delayMs = 0});

  @override
  State<_AnimatedSection> createState() => _AnimatedSectionState();
}

class _AnimatedSectionState extends State<_AnimatedSection>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _opacity;
  late final Animation<Offset> _offset;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _opacity = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _offset = Tween<Offset>(begin: const Offset(0, 0.05), end: Offset.zero)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    Future.delayed(Duration(milliseconds: widget.delayMs), _controller.forward);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacity,
      child: SlideTransition(position: _offset, child: widget.child),
    );
  }
}

class _HoverScale extends StatefulWidget {
  final Widget child;
  const _HoverScale({required this.child});

  @override
  State<_HoverScale> createState() => _HoverScaleState();
}

// Collapsible section removed per user request; sections render directly.

class _HoverScaleState extends State<_HoverScale>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scale;
  bool _hovering = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
      lowerBound: 0.0,
      upperBound: 1.0,
    );
    _scale = Tween<double>(begin: 1.0, end: 1.02).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() => _hovering = true);
        _controller.forward();
      },
      onExit: (_) {
        setState(() => _hovering = false);
        _controller.reverse();
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: _scale.value,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              decoration: BoxDecoration(
                boxShadow: _hovering
                    ? [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 16,
                          offset: const Offset(0, 8),
                        ),
                      ]
                    : const [],
              ),
              child: child,
            ),
          );
        },
        child: widget.child,
      ),
    );
  }
}

class _EducationSection extends StatelessWidget {
  final Profile profile;
  const _EducationSection({required this.profile});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _Keys.education,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionTitle('Education'),
          const SizedBox(height: 12),
          ...profile.education.map((e) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _EducationItem(item: e),
              )),
        ],
      ),
    );
  }
}

class _EducationItem extends StatelessWidget {
  final Education item;
  const _EducationItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(item.title, style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 4),
        Text(item.school),
        const SizedBox(height: 4),
        Text(item.period, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}
