class Profile {
  final String name;
  final String title;
  final String email;
  final String phone;
  final String linkedInLabel;
  final String linkedInUrl;
  final List<String> summaryLines;
  final List<String> skills;
  final List<Experience> experiences;
  final List<Project> projects;
  final List<Education> education;

  const Profile({
    required this.name,
    required this.title,
    required this.email,
    required this.phone,
    required this.linkedInLabel,
    required this.linkedInUrl,
    required this.summaryLines,
    required this.skills,
    required this.experiences,
    required this.projects,
    required this.education,
  });
}

class Experience {
  final String title;
  final String company;
  final String period;
  final List<String> bullets;
  const Experience({
    required this.title,
    required this.company,
    required this.period,
    required this.bullets,
  });
}

class Project {
  final String title;
  final String description;
  const Project({required this.title, required this.description});
}

class Education {
  final String title;
  final String school;
  final String period;
  const Education({
    required this.title,
    required this.school,
    required this.period,
  });
}


