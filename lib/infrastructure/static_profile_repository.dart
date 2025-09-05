import '../domain/entities.dart';
import '../domain/profile_repository.dart';

class StaticProfileRepository implements ProfileRepository {
  const StaticProfileRepository();

  @override
  Future<Profile> fetchProfile() async {
    return const Profile(
      name: 'Bhatt Nisarg',
      title: 'Flutter Developer (Android/iOS)',
      email: 'nmbhatt2001@gmail.com',
      phone: '+91 7043928546',
      linkedInLabel: 'linkedin.com/in/bhattnisarg1204',
      linkedInUrl: 'https://www.linkedin.com/in/bhattnisarg1204',
      summaryLines: [
        'Flutter Developer with 3 years of hands-on experience in designing and developing cross-platform mobile apps for Android and iOS.',
        'Passionate, quick learner, and always ready to adapt to new skills and technologies.',
      ],
      skills: [
        'Flutter',
        'State Management (Bloc, Provider)',
        'Android',
        'Dart, Java',
        'API Integration',
        'JSON, SQLite',
        'Git',
        'Debugging & Problem Solving',
      ],
      experiences: [
        Experience(
          title: 'Mobile Application Developer',
          company: 'Kaizen Infocomm Pvt Ltd.',
          period: 'Aug 2022 – Present',
          bullets: [
            'Worked on IoT applications.',
            'Experience in multiple mobile development languages.',
            'Strong knowledge of Dart, basic Android, and Java programming.',
          ],
        ),
        Experience(
          title: 'Android Developer Intern',
          company: 'Reflect Social Media Marketing',
          period: 'Feb 2022 – May 2022',
          bullets: [
            'Worked on different Android modules.',
            'Designed UI layouts and widgets in Android.',
            'Integrated JSON and SQLite databases.',
          ],
        ),
      ],
      projects: [
        Project(
          title: 'MyTDay Wedding',
          description: 'Wedding organizer app available on Android & iOS.',
        ),
        Project(
          title: 'Alaris Connect',
          description:
              'End-user Flutter app for controlling Alaris Security Bluetooth devices.',
        ),
        Project(
          title: 'Inflo Field Order',
          description: 'E-commerce application developed for iPad devices.',
        ),
        Project(
          title: 'Shareeat – KDS',
          description:
              'KDS system app for restaurants to manage placed orders and statuses (Flutter, iOS – iPad).',
        ),
      ],
      education: [
        Education(
          title: 'B.E. in Computer Engineering',
          school: 'Gyanmanjari Institute of Technology, Bhavnagar',
          period: 'Aug 2018 – May 2022',
        ),
        Education(
          title: 'Secondary & Higher Secondary (Science, 11th–12th)',
          school: 'Shree Swaminarayan Gurukul, Bhavnagar',
          period: 'Mar 2016 – May 2018',
        ),
      ],
    );
  }
}


