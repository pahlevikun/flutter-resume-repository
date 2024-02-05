import 'package:flutter/widgets.dart';
import 'package:pahlevikun.github.io/domain/model/award.dart';
import 'package:pahlevikun.github.io/domain/model/education.dart';
import 'package:pahlevikun.github.io/domain/model/experience.dart';
import 'package:pahlevikun.github.io/domain/model/expertise.dart';
import 'package:pahlevikun.github.io/domain/model/portofolio.dart';
import 'package:pahlevikun.github.io/domain/model/volunteer.dart';

import 'skill.dart';

class ResumeModel {
  final String webTitle;
  final String introduce;

  final String name;
  final String job;
  final String email;
  final String location;
  final String birthDate;
  final String avatar;

  final String facebook;
  final String instagram;
  final String github;
  final String linkedin;
  final String twitter;

  final String about;
  final Map<String, String> aboutInfo;

  final List<Expertise> expertise;
  final List<Skill> technicalSkill;
  final List<Skill> industrySkill;
  final String introSkill;

  final List<Experience> experience;
  final List<Volunteer> volunteer;
  final List<Education> education;

  final List<Portfolio> portfolio;
  final List<Award> award;

  ResumeModel({
    required this.webTitle,
    required this.introduce,
    required this.name,
    required this.job,
    required this.email,
    required this.location,
    required this.birthDate,
    required this.avatar,
    required this.facebook,
    required this.instagram,
    required this.github,
    required this.linkedin,
    required this.twitter,
    required this.about,
    required this.aboutInfo,
    required this.expertise,
    required this.technicalSkill,
    required this.industrySkill,
    required this.introSkill,
    required this.experience,
    required this.volunteer,
    required this.education,
    required this.portfolio,
    required this.award,
  });
}
