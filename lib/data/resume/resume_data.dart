import 'package:pahlevikun.github.io/data/resume/model/education.dart';
import 'package:pahlevikun.github.io/data/resume/model/experience.dart';
import 'package:pahlevikun.github.io/data/resume/model/expertise.dart';
import 'package:pahlevikun.github.io/data/resume/model/resume.dart';
import 'package:pahlevikun.github.io/data/resume/model/skill.dart';
import 'package:pahlevikun.github.io/data/resume/model/volunteer.dart';
import 'package:pahlevikun.github.io/utils/datetime_utils.dart';

class ResumeData {
  static const MESSAGE_API =
      "https://us-central1-workout-e1b53.cloudfunctions.net/api/message";

  static ResumeModel getData() => ResumeModel(
      webTitle: "Farhan Yuda Pahlevi | Personal Site",
      introduce:
          "Experienced Android Engineer with a demonstrated history of working in the software engineering industry since 2013 and still continues.",
      name: "Farhan Yuda Pahlevi",
      job: "Software Engineer",
      email: "pahlevi.kun@gmail.com",
      location: "Jakarta, Indonesia",
      birthDate: "1995-08-09",
      avatar: "assets/images/avatar.png",
      facebook: "https://facebook.com/pahlevikun",
      instagram: "https://instagram.com/pahlevikun",
      github: "https://github.com/pahlevikun",
      linkedin: "https://linkedin.com/in/pahlevikun",
      twitter: "https://twitter.com/pahlevikun",
      about:
          "Strong engineering professional with a Bachelor of Engineering (BE) focused in Informatics Engineering from Gunadarma University. "
          "Skilled in Web Development and Mobile Development mostly in Android using Java or Kotlin. Dedicated to continuously develop, "
          "implement, and adopt new technologies to maximize development efficiency and produce innovative solution. "
          "Farhan have a big dream with his ability to help many people with a user friendly application for everyone and make big social impact to Indonesia. "
          "In September 2017 Farhan become Google Certified Associate Android Developer by scholarship from Udacity and join Midtrans (Gojek Group) in June 2018.",
      aboutInfo: _buildAboutInfo(),
      expertise: _buildExpertise(),
      technicalSkill: _buildTechnicalSkill(),
      industrySkill: _buildIndustrySkill(),
      introSkill: _skillsIntro,
      experience: _buildExperience(),
      volunteer: _buildVolunteer(),
      education: _buildEducation());

  static List<Education> _buildEducation() {
    return [
      Education(
          title: "Nanodegree",
          field: "Field Of Study Associate Android Developer Fast Track",
          year: "2017",
          institution: "Udacity",
          description:
              "Google launched the Associate Android Developer Certification in May 2016. "
              "Associate Android Developer Fast Track by Google is a program that will "
              "ideal for programmers with 1-2 years of Java experience. The program "
              "is designed to teach you exactly what you need to know to successfully "
              "pass the Associate Android Developer Certification Exam from Google, "
              "a key credential in the industry. It's a great way to prove your Android"
              " Development skills and earn a certification directly from Google"
              " affirming those skills—a definitive step on the path to a job "
              "as an Android Developer. To have received one of these scholarships,"
              " you must be a current resident of Indonesia. Farhan was choosen"
              " with other student for this scholarship by Udacity."),
      Education(
          title: "Bachelor Of Engineer",
          field: "Field Of Study Informatics Engineer",
          year: "2013 - 2017",
          institution: "Gunadarma University",
          description:
              "Founded in 1981, Universitas Gunadarma (Gunadarma University) is a "
              "non-profit private higher education institution located in the "
              "suburban setting of the large city of Depok (population range of "
              "1,000,000-5,000,000 inhabitants), West Java. In campus life, Farhan "
              "always exploring about code inside and outside the college. Farhan "
              "study for 4 years in Gunadarma University with Undergraduate Thesis Title "
              "'Rancang Bangun Augmented Reality Hologram Pengenalan Ilmuwan Islam Berbasis Android.'"),
      Education(
          title: "High School",
          field: "Field Of Study Science",
          year: "2010 - 2013",
          institution: "SMAN 6 Bogor",
          description:
              "SMAN 6 Bogor is State High School in Bogor, West Java. Previously "
              "SMAN 6 Bogor is SPG Negeri Bogor but back in 1991 it become State "
              "High School. Farhan study Science Major for 3 years in SMAN 6 Bogor.'")
    ];
  }

  static List<Volunteer> _buildVolunteer() {
    return [
      Volunteer(
        imagePath: "assets/images/volunteer-1.png",
        title: "Facilitator",
        name: "IAK Batch 1-2",
        duration: "Mar 2016 - Dec 2016",
      ),
      Volunteer(
        imagePath: "assets/images/volunteer-2.png",
        title: "Ambassador",
        name: "Gitscrum",
        duration: "Mar 2018 - Aug 2018",
      ),
      Volunteer(
        imagePath: "assets/images/volunteer-3.png",
        title: "Contributor",
        name: "Greenpeace",
        duration: "Jun 2017 - Jan 2018",
      ),
      Volunteer(
        imagePath: "assets/images/volunteer-3.png",
        title: "Team Leader",
        name: "Al-Fatih 3",
        duration: "Jul 2016 - Mar 2018",
      ),
      Volunteer(
        imagePath: "assets/images/volunteer-3.png",
        title: "Startup Contributor",
        name: "Wensoft",
        duration: "Jun 2016 - Mar 2018",
      ),
      Volunteer(
        imagePath: "assets/images/volunteer-3.png",
        title: "Community",
        name: "CT Project",
        duration: "Jan 2014 - Aug 2018",
      ),
    ];
  }

  static String _skillsIntro =
      "Strong ability in Native Android Development for both Java and Kotlin, provided by :"
      "\n- 6 years+ experience in Android development"
      "\n- Strong understanding of Android Apps architecture, pattern, and implementation such as Clean Architecture, MVP, MVI, MVVM"
      "\n- Experienced building Android SDK"
      "\n- Experience with Kotlin, reactive programming(RxJava), and Dependency Injection(Dagger)"
      "\n- Experience shipping apps to Google Play"
      "\n- Experienced with popular libraries for networking, async, image loading, firebase, etc"
      "\n- Experienced with multiple field of works such and many type of application"
      "\n- Understood implementation of programming languages, good OO design concept such as SOLID Principles"
      "\n- Well versed with Agile methodologies, TDD and Test Engineering and Automation"
      "\n- Know some of techniques, standards, and capabilities regarding authentication and authorization, security vulnerabilities, and remediation";

  static List<Experience> _buildExperience() {
    return [
      Experience(
          title: "Android Engineer",
          company: "Gojek (GoMerchants)",
          duration: "Jan 2019 - Present",
          image: "images/job-1.png",
          description:
              "Founded in 2010, GO-JEK is a mobile technology company with a social mission: "
              "to unleash social impact through technology. Since the App Launch in January 2015, "
              "GO-JEK has been a one stop application for daily needs in Indonesia, "
              "revolutionizing solutions from transport, logistics and lifestyle services."
              "\n\nResponsibility :"
              "\n• Build Android Application from the scratch"
              "\n• Build Best Quality for Mobile Android SDK"
              "\n\nWork on :"
              "\n• Midtrans Android SDK "
              "\n\t- Supporting merchants "
              "\n\t- Maintain SDK"
              "\n• GoBiz (Previously GO-RESTO) "
              "\n\t- Express onboarding feature "
              "\n\t- Platformization, making new architecture "
              "\n\t- Promo Recommended Campaign"),
      Experience(
          title: "Jr. Android Developer",
          company: "Midtrans | Gojek Group",
          duration: "Jun 2018 - Dec 2018",
          image: "images/job-2.png",
          description:
              "Midtrans, previously Veritrans, was established in 2012 with a mission "
              "to provide online businesses in Indonesia with a payment infrastructure "
              "that is safe, reliable, and fraud-free. In December 2017 Midtrans join GO-JEK GROUP after being acquired."
              "\n\nResponsibility :"
              "\n• Build Android Application from the scratch"
              "\n• Build Best Quality Mobile Android SDK"
              "\n• Maintain Android Application in playstor"
              "\n• Rewrite and Revamp legacy Midtrans Android SDK"
              "\n• Supporting Merchant who used Midtrans's SDK"
              "\n\nWork on :"
              "\n• Midtrans Android SDK"
              "\n• Midtrans Mobile"
              "\n• GO-Merchant SDK (Continue some feature)"),
      Experience(
          title: "Android Developer",
          company: "PT. Deggan Technowave",
          duration: "Feb 2017 - May 2018",
          image: "images/job-3.png",
          description:
              "PT. Deggan Technowave is a company that develop and maintain PT. "
              "Telekomunikasi Indonesia application as a vendor with main product "
              "is Wifi.id GO and some utility products. The main role in PT. Deggan "
              "Technowave was working on Mobile Android SDK, develop Android "
              "application and integrating with Machine via API."
              "\n\nResponsibility :"
              "\n• Build Android Project from the scratch"
              "\n• Maintain Android Application in playstore"
              "\n• Make our client's idea dream come true"
              "\n• Continue internal SDK development for Wifi Testing"
              "\n• Manage and mentoring to Junior Android Developer"
              "\n• Deciding architecture and pattern for Android Project"
              "\n• Deciding tech-stack for Android Development"
              "\n• Making automation with CI/CD for removing human bottleneck"
              "\n\nWork on Products :"
              "\n• Wifi Tester and Monitor"
              "\n• Wifi.id GO"
              "\n• New Permata (DIAMOND)"
              "\n• Sekampus"),
      Experience(
          title: "Mobile Engineer Lead",
          company: "Beehapps",
          duration: "Aug 2016 — Dec 2017",
          image: "images/job-4.png",
          description:
              "Beehapps is a small company as startup focused in Software Development. "
              "Beehapps want to become 1st software technology provider and ready "
              "to developing local MSMEs in Indonesia. As a Mobile Engineer Lead, "
              "the main task is for develop Android app, guide other Android Developer, "
              "and decide tech-stack for Mobile development."
              "\n\nResponsibility :"
              "\n• Build Android Project from the scratch"
              "\n• Maintain Android Application in playstore"
              "\n• Make our client idea dream come tru"
              "\n• Manage and mentoring to Junior Android Developer"
              "\n• Deciding architecture and pattern for Android Project"
              "\n• Deciding tech-stack for Android Development"
              "\n• Lead multiple Android teams to perform design, code, and process reviews to improve individual systems as well as engineering-wide"
              "\n• Help make our team better by contributing to direct to the team"
              "\n• Engage with the team on helping to debug and improve code"
              "\n• Making automation with CI/CD for removing human bottleneck"
              "\n\nWork on Products :"
              "\n• AA Londri"
              "\n• Pasar Benih dan Kedelai Kementan"
              "\n• Waroeng Rakjat POS"
              "\n• E-Dokterku Mitra"
              "\n• E-Dokterku Consumer App"
              "\n• E-Dokterku Ambulance App"),
      Experience(
          title: "Lab. Assistant",
          company: "iLab Gunadarma University",
          duration: "Apr 2016 – Sep 2017",
          image: "images/job-5.png",
          description:
              "Integrated Lab or known as iLab is the largest laboratory in Gunadarma University. "
              "Assistant is an job that adapt to the student's schedule in college, "
              "so assistant is concurrent with college. The big task assistant do "
              "is become a part of CAT Committee in 2016 Polda Metro Jaya Computer "
              "Assisted Test in collaboration with Gunadarma University"
              "\n\nResponsibility :"
              "\n• Help, assist, and support student from diverse faculty for theirs practicum"
              "\n• Handling lab's daily acitivty"
              "\n• Maintain computer hardware and software"
              "\n• Maintain lab's tools"
              "\n• Act as an Operator in Gunadarma University Sport Center"),
      Experience(
          title: "Full-Stack Developer",
          company: "Self Employed (Freelance)",
          duration: "Jan 2014 – Aug 2016",
          image: "images/job-6.png",
          description:
              "Back in my first year at college, I was very bad in Java. I got the "
              "lower grade in Java class but my lecturer scorn me in front of my "
              "class, it was very embarrassed. But it give me some power to "
              "survive and revenge the Java lecturer with my highest grade at the "
              "end of Java class. After that, I'm start develop some application "
              "for freelance or for non-profit use. I work on Web Development with "
              "PHP as Back-End and just HTML-CSS for Front-End but I focuse on Android Development."
              "\n\nResponsibility :"
              "\n• Keep learn something new about programming especially Android Development"
              "\n• Make client's idea dream come true in web side or android side"),
      Experience(
          title: "CEO & Founder",
          company: "FYP-Kun Online!",
          duration: "Dec 2010 — Apr 2016",
          image: "images/job-7.png",
          description:
              "FYP-Kun Online! is online media serving japanese news and hobby. "
              "Back in the past, FYP-Kun Online! just share about news and"
              " hobby but it's make community for sharing and now FYP-Kun "
              "Online! transform into small community based on Facebook."
              "\n\nResponsibility :"
              "\n• As a Founder, lead the group activity.Help, assist, and support student from diverse faculty for theirs practicum"
              "\n• Make online strategy for make income"
              "\n• Give permission and approval if any other want to collaborate with us"
              "\n• Take responsibility as Web Developer"),
      Experience(
          title: "Operator",
          company: "TanjungNet - Internet Service & Cafe",
          duration: "Jul 2011 – Aug 2015",
          image: "images/job-8.png",
          description:
              "When I was High School untill second year in my college, I work as "
              "an Operator in TanjungNet (Cilebut, Bogor). Tanjung Net is small internet cafe."
              "\n\nResponsibility :"
              "\n• Help, assist, and support customer"
              "\n• Serving scan and print service to customer"
              "\n• Maintain computer hardware and software"
              "\n• Maintain office's tools"),
    ];
  }

  static List<Skill> _buildIndustrySkill() {
    return [
      Skill(name: "Android Native Development", percent: 90),
      Skill(name: "Project Management", percent: 85),
      Skill(name: "Flutter Development", percent: 75),
      Skill(name: "Web Development", percent: 65),
      Skill(name: "iOS Native Development", percent: 50),
    ];
  }

  static List<Skill> _buildTechnicalSkill() {
    return [
      Skill(name: "Android Design pattern", percent: 90),
      Skill(name: "Android Java & Kotlin", percent: 90),
      Skill(name: "Android Architecture", percent: 90),
      Skill(name: "OO Knowledge & Architecture", percent: 80),
      Skill(name: "Flutter Dart", percent: 75),
      Skill(name: "Firebase", percent: 70),
      Skill(name: "VCS Git", percent: 70),
      Skill(name: "PHP Laravel Stack", percent: 65),
      Skill(name: "iOS Swift", percent: 50),
    ];
  }

  static Map<String, String> _buildAboutInfo() {
    return {
      "Name": "Farhan Yuda Pahlevi",
      "Location": "Jakarta, Indonesia",
      "Age": DateTimeUtils.countAge(1995),
      "Email": "pahlevi.kun@gmail.com",
    };
  }

  static List<Expertise> _buildExpertise() {
    return [
      Expertise(
          title: "Native Android Development",
          body:
              "Designed and Developed core feature for Android Application from scrath, "
              "start from translating Conceptual UI and integrating 3rd Party SDK or "
              "back-end API into Best Quality of Android Code. Deployed application "
              "and identify bugs, user experience issues, and functionality problems "
              "for maintaining the application."),
      Expertise(
          title: "Native iOS Development",
          body:
              "Make a prototype and developed Best Quality of native Swift code "
              "when translating the user interface. Keep and use the Apple's "
              "conventional rule when developing the application with XCode. "
              "Deployed application and identify bugs, user experience issues, "
              "and functionality problems for maintaining the application."),
      Expertise(
          title: "Flutter App Development",
          body:
              "Make a prototype and developed Best Quality of native Swift code "
              "when translating the user interface. Keep and use the Apple's "
              "conventional rule when developing the application with XCode. "
              "Deployed application and identify bugs, user experience issues, "
              "and functionality problems for maintaining the application."),
      Expertise(
          title: "Web App Development",
          body:
              "Build best first impression for user when visiting the site with "
              "quality of front-end development and supported with best back-end development "
              "from powerfull backend framework. Deployed application and identify bugs, "
              "user experience issues, and functionality problems for maintaining the application."),
      Expertise(
          title: "Project Management",
          body:
              "Build best first impression for user when visiting the site with "
              "quality of front-end development and supported with best back-end development "
              "from powerfull backend framework. Deployed application and identify bugs, "
              "user experience issues, and functionality problems for maintaining the application.")
    ];
  }
}