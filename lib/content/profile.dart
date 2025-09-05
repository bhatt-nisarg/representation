@Deprecated(
    'Use domain/entities.dart and infrastructure/static_profile_repository.dart')
class ProfileContent {
  static const String name = 'Bhatt Nisarg';
  static const String title = 'Flutter Developer (Android/iOS)';

  static const String email = 'nmbhatt2001@gmail.com';
  static const String phone = '+91 7043928546';
  static const String linkedIn = 'www.linkedin.com/in/bhattnisarg1204';
  static const String linkedInUrl =
      'https://www.linkedin.com/in/bhattnisarg1204';

  static const String summaryLine1 =
      'Flutter Developer with 3 years of hands-on experience in designing and developing cross-platform mobile apps for Android and iOS.';
  static const String summaryLine2 =
      'Passionate, quick learner, and always ready to adapt to new skills and technologies.';

  static const List<String> skills = [
    'Flutter',
    'State Management (Bloc, Provider)',
    'Android',
    'Dart, Java',
    'API Integration',
    'JSON, SQLite',
    'Git',
    'Debugging & Problem Solving',
    'Clean Architecture'
  ];

  static const List<ExperienceItem> experience = [
    ExperienceItem(
      title: 'Mobile Application Developer',
      company: 'Kaizen Infocomm Pvt Ltd.',
      period: 'Aug 2022 – Present',
      bullets: [
        'Worked on IoT applications.',
        'Experience in multiple mobile development languages.',
        'Strong knowledge of Dart, basic Android, and Java programming.',
      ],
    ),
    ExperienceItem(
      title: 'Android Developer Intern',
      company: 'Reflect Social Media Marketing',
      period: 'Feb 2022 – May 2022',
      bullets: [
        'Worked on different Android modules.',
        'Designed UI layouts and widgets in Android.',
        'Integrated JSON and SQLite databases.',
      ],
    ),
  ];

  static const List<ProjectItem> projects = [
    ProjectItem(
      title: 'MyTDay Wedding',
      description: 'Wedding organizer app available on Android & iOS.',
    ),
    ProjectItem(
      title: 'Alaris Connect',
      description:
          'End-user Flutter app for controlling Alaris Security Bluetooth devices.',
    ),
    ProjectItem(
      title: 'Inflo Field Order',
      description: 'E-commerce application developed for iPad devices.',
    ),
    ProjectItem(
      title: 'Shareeat – KDS',
      description:
          'KDS system app for restaurants to manage placed orders and statuses (Flutter, iOS – iPad).',
    ),
  ];

  static const List<EducationItem> education = [
    EducationItem(
      title: 'B.E. in Computer Engineering',
      school: 'Gyanmanjari Institute of Technology, Bhavnagar',
      period: 'Aug 2018 – May 2022',
    ),
    EducationItem(
      title: 'Secondary & Higher Secondary (Science, 11th–12th)',
      school: 'Shree Swaminarayan Gurukul, Bhavnagar',
      period: 'Mar 2016 – May 2018',
    ),
  ];
}

class ExperienceItem {
  final String title;
  final String company;
  final String period;
  final List<String> bullets;
  const ExperienceItem({
    required this.title,
    required this.company,
    required this.period,
    required this.bullets,
  });
}

class ProjectItem {
  final String title;
  final String description;
  const ProjectItem({required this.title, required this.description});
}

class EducationItem {
  final String title;
  final String school;
  final String period;
  const EducationItem({
    required this.title,
    required this.school,
    required this.period,
  });
}
