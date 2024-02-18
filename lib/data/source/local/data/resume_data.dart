import 'package:pahlevikun.github.io/domain/model/award.dart';
import 'package:pahlevikun.github.io/domain/model/education.dart';
import 'package:pahlevikun.github.io/domain/model/experience.dart';
import 'package:pahlevikun.github.io/domain/model/expertise.dart';
import 'package:pahlevikun.github.io/domain/model/portofolio.dart';
import 'package:pahlevikun.github.io/domain/model/resume.dart';
import 'package:pahlevikun.github.io/domain/model/skill.dart';
import 'package:pahlevikun.github.io/domain/model/volunteer.dart';
import 'package:pahlevikun.github.io/utils/datetime_utils.dart';

class ResumeData {
  ResumeModel getData() => ResumeModel(
        webTitle: "Farhan Yuda Pahlevi | Personal Site",
        introduce:
            "Experienced Versatile Software Engineer driving positive social impact through a demonstrated history of innovation in the technology industry since 2013.",
        name: "Farhan Yuda Pahlevi",
        job: "Versatile Software Engineer",
        email: "farhan.y.pahlevi@gmail.com",
        location: "Jakarta, Indonesia",
        birthDate: "1995-08-09",
        avatar: "images/avatar.png",
        facebook: "https://facebook.com/pahlevikun",
        instagram: "https://instagram.com/pahlevikun",
        github: "https://github.com/pahlevikun",
        linkedin: "https://linkedin.com/in/pahlevikun",
        twitter: "https://twitter.com/pahlevikun",
        about:
            """Experienced versatile software engineer with a proven track record of delivering innovative and socially impactful solutions. With a journey in the technology industry that began in 2013, I have continuously expanded my skill set and made significant contributions in various domains.\n\nI have had the privilege of working at Gojek since 2018, initially as an Android Engineer. Over time, I expanded my role and took on the responsibilities of a Backend Engineer as well, showcasing my proficiency in both front-end and back-end development. It has been an incredible experience, and I'm proud of my track record in delivering innovative solutions that have a positive social impact. I take pride in designing and building high-performance, scalable, and fault-tolerant applications across various industries. I thrive in diverse work environments, whether remote, on-site, or hybrid, and I love collaborating with talented individuals from around the world. This global perspective allows me to broaden my horizons and tackle complex problems that demand creative thinking.\n\nBeyond my professional endeavors, I actively participate in Indonesian government programs such as Bangkit, Praktisi Mengajar, and Gigih (a program by GoTo Impact Foundation). Through these initiatives, I contribute my skills to shape Indonesia's future generations. It's incredibly rewarding to have a direct impact on the future of my country.""",
        aboutInfo: _buildAboutInfo(),
        expertise: _buildExpertise(),
        experience: _buildExperience(),
        volunteer: _buildVolunteer(),
        education: _buildEducation(),
        portfolio: _buildPorto(),
        award: _buildAwards(),
      );

  List<Education> _buildEducation() {
    return [
      Education(
        title: "Nanodegree",
        field: "Field Of Study Associate Android Developer Fast Track",
        year: "2017",
        institution: "Udacity",
        image: "images/education-1.png",
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
            " with other student for this scholarship by Udacity.",
      ),
      Education(
        title: "Bachelor Of Engineer",
        field: "Field Of Study Informatics Engineer",
        year: "2013 - 2017",
        image: "images/education-2.png",
        institution: "Gunadarma University",
        description:
            "Founded in 1981, Universitas Gunadarma (Gunadarma University) is a "
            "non-profit private higher education institution located in the "
            "suburban setting of the large city of Depok (population range of "
            "1,000,000-5,000,000 inhabitants), West Java. In campus life, Farhan "
            "always exploring about code inside and outside the college. Farhan "
            "study for 4 years in Gunadarma University with Undergraduate Thesis Title "
            "'Rancang Bangun Augmented Reality Hologram Pengenalan Ilmuwan Islam Berbasis Android.",
      ),
      Education(
        title: "High School",
        field: "Field Of Study Science",
        year: "2010 - 2013",
        image: "images/education-3.png",
        institution: "SMAN 6 Bogor",
        description:
            "SMAN 6 Bogor is State High School in Bogor, West Java. Previously "
            "SMAN 6 Bogor is SPG Negeri Bogor but back in 1991 it become State "
            "High School. Farhan study Science Major for 3 years in SMAN 6 Bogor.",
      )
    ];
  }

  List<Volunteer> _buildVolunteer() {
    return [
      Volunteer(
        imagePath: "images/volunteer-6.png",
        title: "Mentor - Class Grader",
        name: "GoTo Impact Foundation",
        duration: "Apr 2023 - Dec 2023",
      ),
      Volunteer(
        imagePath: "images/volunteer-5.png",
        title: "Instructor & Mentor",
        name: "Bangkit Academy",
        duration: "Feb 2022 - Dec 2023",
      ),
      Volunteer(
        imagePath: "images/volunteer-4.png",
        title: "Practitioner Lecturer",
        name: "Kampus Merdeka",
        duration: "Jul 2022 - Dec 2022",
      ),
      Volunteer(
        imagePath: "images/volunteer-1.png",
        title: "Facilitator",
        name: "IAK Batch 1-2",
        duration: "Mar 2016 - Dec 2016",
      ),
      Volunteer(
        imagePath: "images/volunteer-2.png",
        title: "Ambassador",
        name: "Gitscrum",
        duration: "Mar 2018 - Aug 2018",
      ),
      Volunteer(
        imagePath: "images/volunteer-3.png",
        title: "Contributor",
        name: "Greenpeace",
        duration: "Jun 2017 - Jan 2018",
      ),
      Volunteer(
        imagePath: "images/no-image.png",
        title: "Team Leader",
        name: "Al-Fatih 3",
        duration: "Jul 2016 - Mar 2018",
      ),
      Volunteer(
        imagePath: "images/no-image.png",
        title: "Startup Contributor",
        name: "Wensoft",
        duration: "Jun 2016 - Mar 2018",
      ),
      Volunteer(
        imagePath: "images/no-image.png",
        title: "Community",
        name: "CT Project",
        duration: "Jan 2014 - Aug 2018",
      ),
    ];
  }

  List<Award> _buildAwards() {
    return [
      Award(
        title: "1st Place Depok ICT Award 2016",
        year: "Aug 2016",
        institution: "Depok Communication And Informatics Department",
        description:
            "Depok ICT Award Or Known As DEPICTA Is Depok Yearly Event,"
            " in 2016 The Topic Is About Smart City. "
            "Our Team, Al Fatih 3 Was Elected In 1st Place With Our Application 'Parkir Yuk!'.",
        type: "Honor",
      ),
      Award(
        title: "1st Place KURMA 2016",
        year: "Jun 2016",
        institution: "Fajrul Islam Gunadarma",
        description:
            "Karunia Ukhuwah Islamiyah Or Known As KURMA Is UKM Fajrul "
            "Islam Gunadarma Yearly Event At Ramadhan. Out Team, Al Fatih 3 Was "
            "Elected In 1st Place With Our Application 'Tahaqu'.",
        type: "Honor",
      ),
      Award(
        title: "HTML Fundamentals Course",
        year: "Mar 2018 – Present  •  License 1014-70388280",
        institution: "SoloLearn",
        description: "",
        type: "Certificate",
      ),
      Award(
          title: "Java Tutorial Course",
          year: "Mar 2018 – Present  •  License 1068-7038280",
          institution: "SoloLearn",
          description: "",
          type: "Certificate"),
      Award(
          title: "JavaScript Tutorial Course",
          year: "Mar 2018 – Present  •  License 1024-70388280",
          institution: "SoloLearn",
          description: "",
          type: "Certificate"),
      Award(
          title: "Swift Fundamentals Course",
          year: "Mar 2018 – Present  •  License 1075-7038280",
          institution: "SoloLearn",
          description: "",
          type: "Certificate"),
      Award(
        title: "Microsoft MTA 98-361 : Software Development Fundamentals",
        year: "Jan 2018 – Present  •  License G602-0607",
        institution: "Microsoft",
        description: "",
        type: "Certificate",
      ),
      Award(
        title: "The Total Kotlin Course : Learn Kotlin Today",
        year: "Nov 2017 – Present  •  License UC-AFC4ILA4",
        institution: "Udemy",
        description: "",
        type: "Certificate",
      ),
      Award(
        title: "Associate Android Developer",
        year: "Sep 2017 – Present  •  License 10942417",
        institution: "Google Developers",
        description: "",
        type: "Certificate",
      ),
      Award(
        title: "Facilitator Indonesia Android Kejar 2.0",
        year: "Jan 2017 – Present",
        institution: "Google Developers Group",
        description: "",
        type: "Certificate",
      ),
      Award(
        title: "Indonesia Android Academy",
        year: "Jan 2015 – Present",
        institution: "Google Developers Group",
        description: "",
        type: "Certificate",
      ),
    ];
  }

  List<Experience> _buildExperience() {
    return [
      Experience(
        title: "GoTo Group  ·  PT GoTo Gojek Tokopedia Tbk",
        company: "South Jakarta, Indonesia",
        duration: "Jul 2018 - Present",
        employmentStatus: "Full-time",
        image: "images/job-10.png",
        description:
            "PT GoTo Gojek Tokopedia Tbk, trading as GoTo, is an Indonesian technology company. "
            "The company was formed in 2021 in a merger — the largest in the country at that time between Indonesia's two most valuable startups, "
            "ride-hailing giant Gojek and e-commerce firm Tokopedia.",
        nested: [
          Experience(
            title: "Fullstack Software Engineer",
            company: "Gojek - Merchant Platform",
            duration: "Mar 2023 - Present",
            employmentStatus: "Full-time  ·  Onsite",
            image: "images/job-1.png",
            description:
                "Gojek is a leading tech platform in Southeast Asia, offering various services like transport, payments, food delivery, and logistics. "
                "It was founded in 2010 to address traffic issues in Jakarta. Initially, it started with 20 motorcycle-taxi drivers and has since expanded. "
                "Gojek focuses on using technology to enhance user experiences. "
                "Consistently demonstrated my ability to discover, evaluate, and implement new technologies to optimize development efficiency. "
                "Use latest technologies such as Kotlin, Elixir, Ruby, Golang, and Apache Kafka. With my expertise in mobile application development, web development, and project management, I have consistently delivered exceptional results."
                "Overall, Gojek has giving chance to explore more in horizontal & vertical field with a comprehensive skill set and a track record of success in developing high-quality applications and delivering impactful solutions. ",
            responsibility: [
              "Design and build highly scalable, reliable, and fault-tolerant systems",
              "Unit-testing code for robustness, usability, and general reliability",
              "Build Best Quality Android Application and SDK from the scratch",
              "Bug fixing and improving application performance",
              "Collaborate with cross-functional teams to define, design, and ship new features"
            ],
            workResult: [
              "Mobile - User login without OTP (1-tap login)",
              "Mobile - User re-KYC feature",
              "Backend - User authorization using ABAC framework",
              "Backend - ABAC framework management",
              "Backend - Data Encryption",
            ],
          ),
          Experience(
            title: "Senior Android Engineer",
            company: "Gojek - Merchant Platform",
            duration: "Jan 2023 - Feb 2023",
            employmentStatus: "Full-time  ·  Remote",
            image: "images/job-1.png",
            description: "At Gojek, a leading tech platform in Southeast Asia, I have the opportunity to explore various fields and utilize technologies. "
                "Gojek's focus on using technology to enhance user experiences aligns with your passion for discovering, evaluating, and implementing new technologies. "
                "Involves in building best quality Android applications and SDK from scratch, as well as bug fixing and improving application performance.",
            responsibility: [
              "Design and build highly scalable, reliable, and fault-tolerant systems",
              "Unit-testing code for robustness, usability, and general reliability",
              "Build Best Quality Android Application and SDK from the scratch",
              "Bug fixing and improving application performance",
              "Collaborate with cross-functional teams to define, design, and ship new features"
            ],
            workResult: [
              "User login without OTP (1-tap login)",
              "Receipt printing internationalization",
              "Edit user contact information",
              "Multi-outlet user profile",
            ],
          ),
          Experience(
            title: "Senior Android Engineer",
            company: "GoTo Financial - Merchant",
            duration: "Aug 2021 - Jan 2023",
            image: "images/job-11.png",
            employmentStatus: "Full-time  ·  Hybrid",
            description: "GoTo Financial is providing the comprehensive technological tools to help consumers and merchants thrive in the new economy. "
                "As a mobile engineer at GoTo Financial, I involves in designing and building highly scalable, reliable, and fault-tolerant systems.",
            responsibility: [
              "Design and build highly scalable, reliable, and fault-tolerant systems",
              "Unit-testing code for robustness, usability, and general reliability",
              "Build Best Quality Android Application and SDK from the scratch",
              "Bug fixing and improving application performance",
              "Collaborate with cross-functional teams to define, design, and ship new features",
            ],
            workResult: [
              "GoBiz DataScience camera implementation for detecting Face and KTP",
              "Self Serve edit user information enhancement",
              "Facet approach implementation",
              "GoBiz x Jago onboarding",
              "Entitlement service implementation",
              "Edit outlet information",
              "Express onboarding 2.0",
              "Corporate onboarding 2.0",
            ],
          ),
          Experience(
            title: "Senior Android Engineer",
            company: "Gojek - Merchant Platform",
            duration: "Jan 2019 - Aug 2021",
            image: "images/job-1.png",
            employmentStatus: "Full-time  ·  Hybrid",
            description: "As a mobile engineer at Gojek, my responsibilities include designing and building highly scalable, reliable, and fault-tolerant systems. "
                "I also manage to work on both Midtrans and Merchant Platform as at that time there's no available resources on Midtrans side.",
            responsibility: [
              "Design and build highly scalable, reliable, and fault-tolerant systems",
              "Unit-testing code for robustness, usability, and general reliability",
              "Build Best Quality Android Application and SDK from the scratch",
              "Bug fixing and improving application performance",
              "Collaborate with cross-functional teams to define, design, and ship new features"
            ],
            workResult: [
              "Midtrans Android SDK",
              "GoBiz Express onboarding 1.0, enabling self-registration as a merchant",
              "GoBiz Platformization, enabling multiple team on project with new architecture",
              "GoBiz Payment, enabling capability for receive debit/credit card as payment",
              "GoBiz Cart & Delivery Discount, enable merchant give a discount on GoFood checkout",
              "GoBiz SKU Recommendation, add recommendation item",
              "GoBiz Social Media Sharing",
              "GoBiz Chart Analytics Report, show promo reporting",
            ],
          ),
          Experience(
            title: "Junior Android Engineer",
            company: "Midtrans",
            duration: "Jun 2018 - Jan 2019",
            image: "images/job-2.png",
            employmentStatus: "Full-time  ·  Onsite",
            description:
                "Midtrans, previously Veritrans, was established in 2012 with a mission "
                "to provide online businesses in Indonesia with a payment infrastructure "
                "that is safe, reliable, and fraud-free. In December 2017 Midtrans join GO-JEK GROUP after being acquired.",
            responsibility: [
              "Design and build highly scalable, reliable, and fault-tolerant systems",
              "Unit-testing code for robustness, usability, and general reliability",
              "Build Best Quality Android Application and SDK from the scratch",
              "Bug fixing and improving application performance",
              "Collaborate with cross-functional teams to define, design, and ship new features"
            ],
            workResult: [
              "Midtrans Android SDK",
              "Midtrans Mobile App",
              "GoMerchants SDK",
            ],
          ),
        ],
      ),
      Experience(
        title: "Flutter Engineer",
        company: "XYZ GOAT  ·  Talinn, Estonia",
        duration: "Stealth duration",
        employmentStatus: "Part-time  ·  Remote",
        image: "images/job-12.png",
        description:
            "XYZ GOAT helps Japanese startups create products abroad to win in global markets by providing them with the product team of top-tier Product Managers and Engineers. ",
        responsibility: [
          "Design and build highly scalable, reliable, and fault-tolerant systems",
          "Unit-testing code for robustness, usability, and general reliability",
          "Build Best Quality Android Application and SDK from the scratch",
          "Bug fixing and improving application performance",
          "Collaborate with cross-functional teams to define, design, and ship new features"
        ],
        workResult: [
          "TeamBoard",
        ],
      ),
      Experience(
        title: "Bangkit Final Incubation Mentor",
        company: "Dwicara Indonesia  ·  Bogor, Indonesia",
        duration: "Jun 2022 - Jan 2023",
        employmentStatus: "Part-time Voluntary  ·  Remote",
        image: "images/job-15.png",
        responsibility: [
          "Startup Empowerment: Empowered early-stage startups by providing them with guidance and mentorship, helping them navigate the challenges of building and scaling their businesses.",
          "Technical and Business Guidance: Offered comprehensive support from both technical and business perspectives, assisting startups in making informed decisions to drive their success.",
          "Fueling Innovation: Fueled innovation by encouraging startups to think outside the box, explore new ideas, and adopt cutting-edge technologies to differentiate themselves in the market.",
          "Strategic Guidance: Provided strategic guidance to startups, helping them develop effective business models, identify target markets, and create actionable plans for growth and sustainability.",
          "Technical Support: Offered technical support and expertise to startups, assisting them in developing and refining their products or services, and leveraging technology to optimize their operations.",
          "Team Mentoring: Mentored the Dwicara team, supporting and advising them in both the technical and business aspects of their product development.",
          "Pitch Preparation: Assisted startups in preparing and refining their pitches, helping them effectively communicate their value proposition and secure funding or partnerships.",
        ],
        description:
            "Bangkit Academy stands as a platform dedicated to nurturing the talents of the future, and it was in this capacity that I served as an Incubation Mentor in 2022. "
            "My role was to empower and guide early-stage startups, both from a technical and business perspective. "
            "\n\nAs an Incubation Mentor at Bangkit Academy, my mission was to fuel innovation, inspire growth, and drive the success of emerging startups from diverse industries. "
            "This multifaceted role involved offering mentorship, strategic guidance, and technical support to foster the development of these ventures. "
            "I was assigned to the Dwicara team as an Incubation mentor, this role is to support and advise the incubation team for their product both on the tech side and the business side.",
      ),
      Experience(
        title: "Practitioner Lecturer",
        company: "STIKI Malang  ·  Bogor, Indonesia",
        duration: "Jun 2022 - Dec 2022",
        employmentStatus: "Part-time Voluntary  ·  Remote",
        image: "images/job-14.png",
        responsibility: [
          "Knowledge Sharing: Shared your deep passion and expertise in mobile app development with students, providing them with valuable insights and real-world examples.",
          "Course Development: Developed comprehensive course materials and curriculum focused on Android development, ensuring students received a well-rounded education in the subject.",
          "Practical Application: Ensured students understood the practical applications of course concepts by providing hands-on exercises, projects, and real-world examples.",
          "Student Engagement: Fostered an engaging and interactive learning environment, encouraging student participation and facilitating discussions to enhance their understanding.",
          "Nurturing Future Professionals: Played a vital role in nurturing the potential of future professionals by equipping them with the necessary skills and knowledge to excel in the field of mobile app development.",
          "Evaluation and Feedback: Conducted assessments and provided constructive feedback to students, helping them identify areas for improvement and further growth.",
        ],
        description:
            "I am deeply passionate about nurturing the potential of future professionals, and this enthusiasm led me to participate in the PraktisiMengajar program. "
            "As a Guest Lecturer, I had the privilege of sharing my knowledge and expertise with the bright minds at STIKI Malang."
            "\n\nIn my role as a Guest Lecturer, I was committed to equipping the next generation with the skills and insights they needed to excel in the world of Android development. "
            "My responsibilities extended to developing course materials, providing mentorship, and ensuring that students grasped the practical applications of course concepts.",
      ),
      Experience(
        title: "Mobile Engineer",
        company: "SwiftMind Indonesia  ·  South Tangerang, Indonesia",
        duration: "Stealth duration",
        employmentStatus: "Part-time  ·  Remote",
        image: "images/job-18.png",
        description:
            "SwiftMind specializes in website, software development, IT consulting, and digital strategy, aiming to transform how businesses operate and grow.",
        responsibility: [
          "Client Collaboration: Actively collaborated with clients to understand their unique requirements, goals, and business objectives, ensuring that the developed mobile applications aligned with their needs.",
          "User-Centric Approach: Conducted user research and usability testing to gather feedback and insights, which were then incorporated into the mobile application design and development process, resulting in highly user-friendly and intuitive interfaces.",
          "Technical Leadership: Provided technical guidance and mentorship to a team of mobile engineers, ensuring adherence to best practices and coding standards.",
          "Cross-Platform Expertise: Demonstrated proficiency in developing applications that are compatible with multiple mobile platforms, utilizing frameworks such as React Native or Flutter.",
          "Performance Optimization: Identified and resolved performance bottlenecks in mobile applications, improving overall responsiveness and user experience.",
          "Collaboration and Communication: Collaborated with product managers, designers, and stakeholders to understand business requirements and translate them into technical solutions.",
        ],
        workResult: [
          "OneFlux Mobile",
          "OneFlux O.M.",
          "OneFlux Construction",
          "OneFlux SmKsm Agon",
          "OneFlux Toba",
        ],
      ),
      Experience(
        title: "Mobile Engineer",
        company: "TAN Digital  ·  South Tangerang, Indonesia",
        duration: "Stealth duration",
        employmentStatus: "Part-time  ·  Remote",
        image: "images/job-13.png",
        description:
            "PT Teknologic Aksara Nusantara was envisioned as a provider of Clean Renewable Energy, by Leveraging Technology to achieve accessible resources for everyone and to act as an enabler of green energy."
            "PT Teknologic Aksara Nusantara saw the potential of shifting demands within the market by enabling its existing assets to fit the requirements as a Digitalization & Software House. Opportunity to prove itself as an agile company has shown how PT Teknologic Aksara Nusantara managed to stay in business even during difficult times, by securing projects and delivering quality solutions to its costumer.",
        responsibility: [
          "Client Collaboration: Actively collaborated with clients to understand their unique requirements, goals, and business objectives, ensuring that the developed mobile applications aligned with their needs.",
          "User-Centric Approach: Conducted user research and usability testing to gather feedback and insights, which were then incorporated into the mobile application design and development process, resulting in highly user-friendly and intuitive interfaces.",
          "Technical Leadership: Provided technical guidance and mentorship to a team of mobile engineers, ensuring adherence to best practices and coding standards.",
          "Cross-Platform Expertise: Demonstrated proficiency in developing applications that are compatible with multiple mobile platforms, utilizing frameworks such as React Native or Flutter.",
          "Performance Optimization: Identified and resolved performance bottlenecks in mobile applications, improving overall responsiveness and user experience.",
          "Collaboration and Communication: Collaborated with product managers, designers, and stakeholders to understand business requirements and translate them into technical solutions.",
        ],
        workResult: [
          "OneFlux Mobile",
          "OneFlux O.M.",
          "OneFlux Construction",
          "OneFlux SmKsm Agon",
          "OneFlux Toba",
        ],
      ),
      Experience(
        title: "Flutter Engineer",
        company:
            "Defenxor PT. Defender Nusa Semesta  ·  South Jakarta, Indonesia",
        duration: "Stealth duration",
        employmentStatus: "Part-time  ·  Remote",
        image: "images/job-17.png",
        description:
            "Defenxor providing IT security for businesses that safeguards business assets, by improving their information security levels to higher and acceptable levels. "
            "Defenxor is a security partner of Computrade Technology Indonesia, a holding company that focuses on IT, and is one of the biggest IT Infrastructure Solution Partner in the region with long experience and strong commitment. "
            "Here I work as a part-time worker for creating a Flutter application which has tight schedule, the application is only monitoring application, so it only has "
            "little bit action on the application and most of it was list of item and some graph",
        responsibility: [
          "Time Management: Effectively managed your time and resources to meet project deadlines, ensuring timely completion of tasks and deliverables.",
          "Collaboration with Team: Collaborated with the team at Defenxor to understand the requirements and align the application's functionalities with the desired information security objectives.",
          "Prioritization of Features: Made strategic decisions in prioritizing features and functionalities within the limited timeframe, ensuring that the essential monitoring capabilities were implemented effectively.",
          "Efficient Development Practices: Utilized agile development methodologies, such as iterative development and frequent communication, to maximize productivity and efficiency.",
          "Adapting to Changing Requirements: Demonstrated flexibility and adaptability in accommodating any changes or updates to the project scope or specifications, while still adhering to the tight schedule.",
          "Flutter Application Development: Utilized your expertise as a Flutter engineer to develop a monitoring application for Defenxor, focusing on IT security for businesses.",
        ],
        workResult: [
          "Case Management",
        ],
      ),
      Experience(
        title: "Lead Mobile Engineer",
        company: "The KidxBox  ·  Jeddah, Saudi Arabia",
        duration: "Stealth duration",
        employmentStatus: "Part-time  ·  Remote",
        image: "images/job-16.png",
        description:
            "Working as lead mobile engineer, working pair with another engineer to develop the system. "
            "KidzBox is an online marketplace focused on child daycare and activities",
        responsibility: [
          "Technical Leadership: Lead a remote team of engineers, providing guidance, direction, and technical expertise in Flutter mobile development.",
          "Collaborative Development: Worked closely with another engineer in a paired programming setup, fostering collaboration and ensuring efficient development of the system.",
          "Flutter Mobile Development: Leveraged your expertise in Flutter to develop the mobile application for KidzBox, creating a user-friendly and engaging experience for parents and caregivers.",
          "Remote Team Management: Effectively managed a remote team, ensuring clear communication, task delegation, and coordination to meet project deadlines and deliverables.",
          "System Development: Played a pivotal role in the development of KidzBox's online marketplace, focusing on child daycare and activities, ensuring that the system met the specific requirements and needs of the target audience.",
          "Agile Development Practices: Implemented agile development methodologies, such as Scrum or Kanban, to enable iterative development, frequent releases, and adaptability to changing requirements.",
          "Continuous Improvement: Actively sought opportunities for improvement, such as exploring new libraries, technologies, or best practices, to enhance the efficiency and effectiveness of mobile development processes.",
        ],
        workResult: [
          "The KidzBox Mobile",
        ],
      ),
      Experience(
        title: "Shareholder & Advisor",
        company: "Digiva.id  ·  South Jakarta, Indonesia",
        duration: "Jul 2020 - Oct 2022",
        employmentStatus: "Part-time  ·  Remote",
        image: "images/job-9.png",
        responsibility: [
          "Strategic Guidance: Provided strategic advice and insights to the management team, leveraging your experience and expertise to help steer the company towards growth and profitability.",
          "Financial Support: Contributed financial support to the startup, playing a crucial role in providing the initial funding required to kickstart the business and support its operations.",
          "Board Oversight: Monitored the CEO's activities and performance to ensure alignment with the company's vision, objectives, and corporate governance standards.",
          "Vision and Mission Alignment: Contributed to shaping the company's vision and mission, ensuring they aligned with the goal of fostering innovation and making a positive impact during challenging times.",
          "Risk Management: Provided guidance on risk mitigation strategies, helping the management team navigate potential risks and challenges in the dynamic business environment.",
          "Growth and Expansion Opportunities: Identified potential growth opportunities and market trends, advising the management team on strategic decisions related to scaling the business and expanding into new markets.",
          "Performance Evaluation: Conducted periodic evaluations of the company's performance, monitoring key metrics and providing constructive feedback to the management team for continuous improvement.",
          "Stakeholder Engagement: Actively engaged with stakeholders, such as employees, customers, and partners, to understand their perspectives and incorporate their feedback into decision-making processes.",
        ],
        description:
            "Due to covid19, I and my friend tried to venture into the world of business. While I wasn't directly involved in day-to-day operations, "
            "I played a pivotal role as an investor and shareholder in Digiva.id. id, I contributed to the company's vision and objectives by providing financial support and strategic advice, "
            "thus helping the management team navigate a path to growth and profitability. Our mission was clear: to foster innovation and contribute to making the world a better place "
            "during these trying times.",
      ),
      Experience(
          title: "Software Engineer",
          company: "PT. Deggan Technowave  ·  Depok, Indonesia",
          duration: "Feb 2017 - May 2018",
          employmentStatus: "Full-time  ·  Hybrid",
          image: "images/job-3.png",
          description:
              "PT. Deggan Technowave is a dynamic company specializing in the development and maintenance of PT. Telekomunikasi Indonesia applications. "
              "Our flagship product, Wifi.id GO, and a range of utility products have positioned us as a key vendor in the telecom industry."
              "\nAs a Software Engineer at PT. Deggan Technowave, I was instrumental in creating and enhancing Android projects that played a crucial role in improving user experiences and expanding our product portfolio. "
              "My role extended beyond conventional development to fulfill client dreams and internal innovation.",
          responsibility: [
            "From Ground Zero to Success: I led the development of Android projects from their inception, ensuring that they not only came to life but thrived on the Play Store",
            "Continuous Application Enhancement: My responsibilities included maintaining and improving Android applications, ensuring they stayed up-to-date and user-friendly",
            "Client-Centric Innovation: I excelled at transforming client ideas into functional and engaging applications, bringing their dreams to life",
            "Empowering Wifi Testing: My role extended to the internal SDK development for Wifi testing, contributing to the enhancement of network performance",
            "Mentoring Future Talent: I managed and mentored junior developers, fostering their growth and skill development",
          ],
          workResult: [
            "Wifi Tester and Monitor",
            "Wifi.id GO",
            "Wifi.id SDK",
            "DIAMOND",
            "Sekampus",
            "Picman",
            "MyFun 1.0",
            "MyFun 2.0",
            "Product Catalog",
          ]),
      Experience(
        title: "Mobile Engineer Lead",
        company: "Beehapps  ·  South Jakarta, Indonesia",
        duration: "Aug 2016 — Dec 2017  ·  Part-time - Remote",
        employmentStatus: "Part-time  ·  Remote",
        image: "images/job-4.png",
        description:
            "Beehapps is an ambitious startup dedicated to software development. "
            "We're not just looking to be a pioneer; we're committed to transforming Indonesia's local MSMEs through innovative technology solutions."
            "\nMy experience at Beehapps has been an exciting journey filled with transformative projects, an unwavering commitment to client satisfaction, and a tireless pursuit of excellence. "
            "As a Mobile Development Lead at Beehapps, I had the privilege of spearheading several groundbreaking projects and initiatives, playing a pivotal role in our journey towards becoming the foremost software technology provider. "
            "I am proud to make a tangible impact on our clients and the MSMEs we aimed to empower",
        responsibility: [
          "From Concept to Reality: I led the development of Mobile App projects from their inception, shaping them into fully functional applications that are now accessible on the Play Store",
          "Client-Centric Innovation: My role involved turning our clients' ideas into reality, translating their dreams into tangible, user-friendly Mobile applications",
          "Mentoring the Next Generation: I provided guidance and mentoring to junior Mobile developers, fostering talent and expertise within the team",
          "Architecting Success: I played a pivotal role in deciding the architectural framework and design patterns for our Mobile app projects, ensuring their scalability and efficiency",
          "Tech-Stack Wizardry: Deciding the tech stack for Mobile development, I harnessed cutting-edge technologies to create high-performing applications",
          "Team Leadership: I led multiple Mobile teams, driving design, code, and process reviews that elevated individual systems and improved our engineering as a whole",
          "Continuous Improvement: My commitment to excellence extended to helping the team debug and refine their code, contributing to a culture of continuous improvement",
        ],
        workResult: [
          "AA Londri (Laundry on-demand)",
          "Pasar Benih dan Kedelai (Ministry of Agriculture)",
          "E-Dokterku (Healthcare)",
          "KMI Katering RSPP",
        ],
      ),
      Experience(
        title: "Lab. Assistant",
        company: "iLab Gunadarma University  ·  Depok, Indonesia",
        duration: "Apr 2016 – Sep 2017",
        employmentStatus: "Full-time  ·  Onsite",
        image: "images/job-5.png",
        description:
            "Integrated Lab, often referred to as iLab, stands as the largest and most cutting-edge laboratory facility within Gunadarma University. "
            "We are committed to providing a dynamic and adaptable work environment that caters to the schedules of our college-based assistants. "
            "As an assistant, the main task is to help, assist, and support students when they do their practicum from diverse faculty, and handling laboratory activity on the field. "
            "In 2016, I played a significant role as a member of the CAT (Computer Assisted Test) Committee during the collaborative initiative between Gunadarma University and Polda Metro Jaya. "
            "This experience allowed me to actively contribute to the successful execution of the Computer Assisted Test, demonstrating my versatility and commitment to our institution's goals.",
        responsibility: [
          "Enhancing Student Experiences: Collaborate with and support students from diverse faculties as they undertake their practicum activities, ensuring a productive and engaging learning environment",
          "Efficient Lab Operations: Manage the daily activities within our laboratory, guaranteeing the availability and functionality of computer hardware, software, and essential tools",
          "Cutting-Edge Technology: Keep our technology resources up to date and in optimal condition, ensuring that students have access to the latest advancements in their respective fields",
          "Safety and Maintenance: Maintain the laboratory's tools and equipment to uphold safety standards and a well-organized work environment",
          "Versatility: Serve as an Operator at Gunadarma University Sports Center, extending your contributions to diverse areas of our institution",
        ],
      ),
      Experience(
        title: "Fullstack Engineer",
        company: "Self Employed  ·  Depok, Indonesia",
        duration: "Jan 2014 – Aug 2016",
        employmentStatus: "Part-time freelance  ·  Remote",
        image: "images/job-6.png",
        description:
            "During my college years, I developed a profound interest in Android Development, primarily due to Android's utilization of Java. "
            "This fascination with Java served as a catalyst for my journey into the world of engineering. "
            "In my first year of college, my proficiency in Java left much to be desired, and I even received a lower grade in my Java class. "
            "The experience was humbling, especially when my lecturer publicly criticized me in front of my peers, which left me feeling deeply embarrassed. "
            "However, this setback ignited a determination within me, inspiring me to not only survive but to excel. "
            "I channeled that determination into achieving the highest grade in my Java class by the end of the semester. "
            "This experience was a turning point, motivating me to embark on a path of continuous learning and development. ",
        responsibility: [
          "I am committed to a lifelong journey of learning, particularly in the realm of Android Development and programming in general",
          "I take pride in translating the dreams and ideas of clients into reality, whether it's on the web or in the Android environment. My goal is to turn their visions into functional and user-friendly applications that enhance their business or cause",
        ],
      ),
      Experience(
        title: "CEO & Founder",
        company: "FYP-Kun Online!  ·  Bogor, Indonesia",
        duration: "Dec 2010 — Apr 2016",
        employmentStatus: "Part-time  ·  Remote",
        image: "images/job-7.png",
        description:
            "FYP-Kun Online! is an online media platform dedicated to delivering Japanese news and hobby content. "
            "In my role as the Founder, I have been instrumental in shaping and guiding this initiative, which has since evolved into a thriving online community on Facebook.",
        responsibility: [
          "As the Founder, I have taken the lead in driving and overseeing the group's activities, ensuring its growth and success",
          "Formulating and implementing online strategies that have led to revenue generation and sustainable growth",
          "Granting permissions and approvals for collaborations, allowing FYP-Kun Online! to expand its reach and impact",
          "Fulfilling responsibilities as a Web Developer, contributing to the technical development and maintenance of our online presence, which has been pivotal in enhancing user experiences and engagement within the community",
        ],
      ),
      Experience(
        title: "Operator",
        company: "TanjungNet - Internet Service & Cafe  ·  Bogor, Indonesia",
        duration: "Jul 2011 – Aug 2015",
        employmentStatus: "Part-time  ·  Onsite",
        image: "images/job-8.png",
        description:
            "During my time from high school through my second year in college, I worked as an Operator at TanjungNet in Cilebut, Bogor. "
            "TanjungNet is a small internet cafe. As an Operator, my responsibilities included providing customer support, ensuring the smooth operation of daily activities",
        responsibility: [
          "Assisting and supporting customers in their internet usage and computer needs",
          "Providing scanning and printing services to customers",
          "Ensuring the overall cleanliness and organization of the cafe",
          "Handling cash transactions and managing customer accounts",
          "Maintaining computer hardware and software to ensure smooth operation",
          "Managing office tools and equipment",
          "Monitoring and maintaining a secure and welcoming environment for all patrons",
          "Assisting in resolving technical issues and troubleshooting common internet connectivity problems",
          "Collaborating with the team to optimize service delivery and customer satisfaction",
        ],
      ),
    ];
  }

  Map<String, String> _buildAboutInfo() {
    return {
      "Name": "Farhan Yuda Pahlevi",
      "Location": "Jakarta, Indonesia - Everywhere Remotely",
      "Age": DateTimeUtils.countAge(1995) + " Years old",
      "Email": "farhan.y.pahlevi@gmail.com",
    };
  }

  List<Expertise> _buildExpertise() {
    return [
      Expertise(
        title: "Native Android Development",
        body:
            "Developed core features for Android app from scratch, translating UI designs and integrating 3rd party SDKs/APIs. "
            "Deployed app, addressed bugs, UX issues, and functionality problems for maintenance.",
        skills: [
          Skill(
            name: "Java and Kotlin",
            percent: 90,
            yearOfStartingThisExperience: 2013,
          ),
          Skill(
            name: "Android Design pattern",
            percent: 90,
            yearOfStartingThisExperience: 2013,
          ),
          Skill(
            name: "Dependency Injection",
            percent: 90,
            yearOfStartingThisExperience: 2015,
          ),
          Skill(
            name: "Retrofit & Networking",
            percent: 90,
            yearOfStartingThisExperience: 2016,
          ),
          Skill(
            name: "Android Arch Component",
            percent: 90,
            yearOfStartingThisExperience: 2019,
          ),
          Skill(
            name: "Android Jetpack",
            percent: 85,
            yearOfStartingThisExperience: 2019,
          ),
          Skill(
            name: "Testing (TDD/BDD)",
            percent: 85,
            yearOfStartingThisExperience: 2019,
          ),
          Skill(
            name: "Firebase & CI/CD",
            percent: 80,
            yearOfStartingThisExperience: 2019,
          ),
          Skill(
            name: "Compose UI",
            percent: 80,
            yearOfStartingThisExperience: 2021,
          ),
        ],
      ),
      Expertise(
        title: "Native iOS Development",
        body:
            "Built high-quality iOS app prototype with native Swift code, following Apple's guidelines in Xcode. "
            "Deployed app, identified and fixed bugs, resolved UX issues, and addressed functionality problems for ongoing maintenance.",
        skills: [
          Skill(
            name: "Swift",
            percent: 85,
            yearOfStartingThisExperience: 2019,
          ),
          Skill(
            name: "Dependency Injection",
            percent: 85,
            yearOfStartingThisExperience: 2020,
          ),
          Skill(
            name: "Alamofire & Networking",
            percent: 80,
            yearOfStartingThisExperience: 2020,
          ),
          Skill(
            name: "App Store Guidelines",
            percent: 75,
            yearOfStartingThisExperience: 2020,
          ),
          Skill(
            name: "iOS Design pattern",
            percent: 70,
            yearOfStartingThisExperience: 2020,
          ),
          Skill(
            name: "iOS SDK & Xcode",
            percent: 70,
            yearOfStartingThisExperience: 2020,
          ),
          Skill(
            name: "Swift UI",
            percent: 65,
            yearOfStartingThisExperience: 2021,
          ),
          Skill(
            name: "Firebase & CI/CD",
            percent: 60,
            yearOfStartingThisExperience: 2022,
          ),
          Skill(
            name: "Testing (TDD/BDD)",
            percent: 55,
            yearOfStartingThisExperience: 2022,
          ),
        ],
      ),
      Expertise(
        title: "Hybrid Application Development",
        body:
            "Designed and developed a stellar Flutter & Kotlin Multiplatform, delivering visually captivating, natively compiled applications for mobile, web, and desktop from a unified codebase.",
        skills: [
          Skill(
            name: "Flutter",
            percent: 90,
            yearOfStartingThisExperience: 2018,
          ),
          Skill(
            name: "Kotlin Multiplatform",
            percent: 90,
            yearOfStartingThisExperience: 2021,
          ),
          Skill(
            name: "Dart Language",
            percent: 90,
            yearOfStartingThisExperience: 2018,
          ),
          Skill(
            name: "Kotlin Language",
            percent: 90,
            yearOfStartingThisExperience: 2017,
          ),
          Skill(
            name: "Flutter Framework",
            percent: 90,
            yearOfStartingThisExperience: 2018,
          ),
          Skill(
            name: "Flutter State Management",
            percent: 90,
            yearOfStartingThisExperience: 2020,
          ),
          Skill(
            name: "Platform Specific (Flutter & Kt)",
            percent: 80,
            yearOfStartingThisExperience: 2020,
          ),
          Skill(
            name: "Kotlin Shared Code Modules",
            percent: 80,
            yearOfStartingThisExperience: 2022,
          ),
          Skill(
            name: "Kotlin Multiplatform Mobile",
            percent: 80,
            yearOfStartingThisExperience: 2022,
          ),
        ],
      ),
      Expertise(
        title: "Web Application Development",
        body: "Created an impressive UX with high-quality web development. "
            "Deployed the application, diligently addressing bugs, and functionality issue to ensure seamless maintenance.",
        skills: [
          Skill(
            name: "HTML & CSS",
            percent: 80,
            yearOfStartingThisExperience: 2016,
          ),
          Skill(
            name: "Responsive Web Design",
            percent: 80,
            yearOfStartingThisExperience: 2017,
          ),
          Skill(
            name: "Javascript & Typescript",
            percent: 80,
            yearOfStartingThisExperience: 2019,
          ),
          Skill(
            name: "React.js",
            percent: 80,
            yearOfStartingThisExperience: 2020,
          ),
          Skill(
            name: "Web Architecture Stack",
            percent: 75,
            yearOfStartingThisExperience: 2021,
          ),
          Skill(
            name: "Web APIs and Routes",
            percent: 75,
            yearOfStartingThisExperience: 2021,
          ),
          Skill(
            name: "State Management",
            percent: 75,
            yearOfStartingThisExperience: 2021,
          ),
          Skill(
            name: "Web Security",
            percent: 70,
            yearOfStartingThisExperience: 2022,
          ),
          Skill(
            name: "Modern Deployment",
            percent: 70,
            yearOfStartingThisExperience: 2022,
          ),
        ],
      ),
      Expertise(
        title: "Backend Application Development",
        body:
            "Created and implemented fault-tolerant and scalable backend systems, utilizing cutting-edge technologies to develop high-quality, efficient APIs and services. "
            "Ensured seamless data processing, and optimal functionality.",
        skills: [
          Skill(
            name: "PHP Laravel",
            percent: 85,
            yearOfStartingThisExperience: 2017,
          ),
          Skill(
            name: "Java Language & Framework",
            percent: 80,
            yearOfStartingThisExperience: 2020,
          ),
          Skill(
            name: "Node.js & Express.js",
            percent: 75,
            yearOfStartingThisExperience: 2020,
          ),
          Skill(
            name: "Golang",
            percent: 85,
            yearOfStartingThisExperience: 2020,
          ),
          Skill(
            name: "API Development",
            percent: 80,
            yearOfStartingThisExperience: 2017,
          ),
          Skill(
            name: "Database Integration",
            percent: 85,
            yearOfStartingThisExperience: 2020,
          ),
          Skill(
            name: "Ruby & Elixir",
            percent: 60,
            yearOfStartingThisExperience: 2022,
          ),
          Skill(
            name: "Caching and Performance",
            percent: 80,
            yearOfStartingThisExperience: 2020,
          ),
          Skill(
            name: "Kubernetes & Deployment",
            percent: 70,
            yearOfStartingThisExperience: 2023,
          ),
        ],
      ),
      Expertise(
        title: "Project Management",
        body:
            "Effective communication, strong leadership, decisive decision-making, and technical expertise are vital skills for successful software management. "
            "These qualities form a powerful combination towards project success.",
        skills: [
          Skill(
            name: "Test Automation",
            percent: 70,
            yearOfStartingThisExperience: 2024,
          ),
          Skill(
            name: "Quality Tracking & Management",
            percent: 70,
            yearOfStartingThisExperience: 2024,
          ),
          Skill(
            name: "Agile Methodologies",
            percent: 80,
            yearOfStartingThisExperience: 2018,
          ),
          Skill(
            name: "Project Planning",
            percent: 75,
            yearOfStartingThisExperience: 2019,
          ),
          Skill(
            name: "Budgeting & Cost Management",
            percent: 75,
            yearOfStartingThisExperience: 2021,
          ),
          Skill(
            name: "Leadership & Team Management",
            percent: 85,
            yearOfStartingThisExperience: 2017,
          ),
          Skill(
            name: "Project Monitoring & Control",
            percent: 80,
            yearOfStartingThisExperience: 2017,
          ),
          Skill(
            name: "Conflict Resolution",
            percent: 60,
            yearOfStartingThisExperience: 2021,
          ),
          Skill(
            name: "Documentation and Reporting",
            percent: 75,
            yearOfStartingThisExperience: 2021,
          ),
        ],
      )
    ];
  }

  List<Portfolio> _buildPorto() {
    return [
      Portfolio(
        title: "Berat Idealmu",
        description: "My first app for check Body Mass Index",
        type: PortoType.ANDROID,
        work: PortoWorks.PERSONAL_PROJECT,
        tech: [
          PortoTech.JAVA,
        ],
      ),
      Portfolio(
        title: "Dompetku",
        description: "Money saving app for tracking income and outcome.",
        type: PortoType.ANDROID,
        work: PortoWorks.PERSONAL_PROJECT,
        tech: [
          PortoTech.JAVA,
        ],
      ),
      Portfolio(
        title: "Ilmuwan Islam Hologram",
        description:
            "Ilmuwan Islam Hologram is an Augmented Reality Application with Holo Technology based on Android device",
        type: PortoType.ANDROID,
        work: PortoWorks.PERSONAL_PROJECT,
        tech: [
          PortoTech.JAVA,
        ],
      ),
      Portfolio(
        title: "Baby Healthcare",
        description: "Android application for detect Baby disease",
        type: PortoType.ANDROID,
        work: PortoWorks.PERSONAL_PROJECT,
        tech: [
          PortoTech.JAVA,
        ],
      ),
      Portfolio(
        title: "Pocket Yasiin",
        description: "Pocket Yasiin is simple yasiin apps",
        type: PortoType.ANDROID,
        work: PortoWorks.PERSONAL_PROJECT,
        tech: [
          PortoTech.JAVA,
        ],
      ),
      Portfolio(
          title: "Tahaqu",
          industry: "Social Media",
          description:
              "Tahaqu is an Android based Islamic application to help users who struggle to save for Sacrifice or Hajj or Umrah",
          type: PortoType.ANDROID,
          work: PortoWorks.PERSONAL_PROJECT,
          tech: [PortoTech.JAVA],
          award: "1st Place Kurma, Gunadarma University"),
      Portfolio(
          title: "Parkir Yuk!",
          industry: "Social Media",
          description:
              "Parking Yuk! is an Android Based application used to find location of "
              "parking around the station, bus stops and other public places. "
              "Parkir Yuk! is created for encourage Depok's citizen to increase "
              "use of public transport and park their vehicles at the parking "
              "locations. This application can be used to remember the location "
              "of a vehicle parked in a wide parking lot. This application can "
              "also check the motor vehicle tax (PKB) which is connected directly "
              "to the website SAMSAT Polda Metro Jaya",
          type: PortoType.ANDROID,
          work: PortoWorks.PERSONAL_PROJECT,
          tech: [PortoTech.JAVA],
          award: "1st place Depok ICT Award 2016"),
      Portfolio(
        title: "Baking App",
        description:
            "Udacity's project for Associate Android Developer Fast Track",
        type: PortoType.ANDROID,
        work: PortoWorks.PERSONAL_PROJECT,
        tech: [
          PortoTech.JAVA,
        ],
      ),
      Portfolio(
        title: "Ojekita",
        industry: "Ride Hailing",
        description:
            "Ojekita is a motorcycle taxi in Cirebon city with 3 main service, "
            "'Kita Jemput' with motorcycle taxi, 'Mobil Kita' with normal car "
            "taxi, and 'Kita Antar' with delivery food service",
        type: PortoType.ANDROID,
        work: PortoWorks.OFFICE_TASK,
        tech: [
          PortoTech.KOTLIN,
        ],
      ),
      Portfolio(
        title: "AA Londri",
        industry: "Service",
        description:
            "AA Londri is shuttle laundry service based on Android device",
        type: PortoType.ANDROID,
        work: PortoWorks.OFFICE_TASK,
        tech: [
          PortoTech.JAVA,
        ],
      ),
      Portfolio(
        title: "KMI Katering RSPP",
        industry: "Service",
        description:
            "KMI Katering is native Android application for ordering food in RSPP (Rumah Sakit Pusat Pertamina)",
        type: PortoType.ANDROID,
        work: PortoWorks.OFFICE_TASK,
        tech: [
          PortoTech.JAVA,
        ],
      ),
      Portfolio(
        title: "Bogor Tourism",
        description:
            "Bogor Tourism is Location Based Service application that use for browse Historical place, Culinary Place, or anything else in Bogor",
        type: PortoType.ANDROID,
        work: PortoWorks.PERSONAL_PROJECT,
        tech: [
          PortoTech.KOTLIN,
        ],
      ),
      Portfolio(
        title: "E-Chat App",
        description:
            "E-Chat is Android apps used firebase technology and implementing end-to-end encryption",
        type: PortoType.ANDROID,
        work: PortoWorks.PERSONAL_PROJECT,
        tech: [
          PortoTech.KOTLIN,
        ],
      ),
      Portfolio(
        title: "Wifi TeMon (Tester & Monitor)",
        description:
            "Wifi Tester & Monitor (also known as Wifi TeMon) is PT Telekomunikasi "
            "Indonesia's product used for automatic test in 'Flashzone-Seamless' access point",
        type: PortoType.ANDROID,
        work: PortoWorks.OFFICE_TASK,
        tech: [
          PortoTech.JAVA,
          PortoTech.KOTLIN,
        ],
      ),
      Portfolio(
        title: "Wifi.Id GO",
        industry: "Telecommunication",
        description:
            "Wifi.id GO is PT Telekomunikasi Indonesia's product for use wifi.id hotspot."
            " The development continued by me from previous developer",
        type: PortoType.ANDROID,
        work: PortoWorks.OFFICE_TASK,
        tech: [
          PortoTech.JAVA,
          PortoTech.KOTLIN,
        ],
      ),
      Portfolio(
        title: "New Permata",
        industry: "Telecommunication",
        description:
            "New Permata is PT Telekomunikasi Indonesia's product used for making conference call with normal phone line",
        type: PortoType.ANDROID,
        work: PortoWorks.OFFICE_TASK,
        tech: [
          PortoTech.JAVA,
        ],
      ),
      Portfolio(
        title: "SeKampus",
        industry: "Social Media",
        description:
            "Sekampus is mobile application used for find your needs near your campus build for Telkom Digital AMOEBA Startup",
        type: PortoType.ANDROID,
        work: PortoWorks.OFFICE_TASK,
        tech: [
          PortoTech.JAVA,
        ],
      ),
      Portfolio(
        title: "E-Dokterku",
        industry: "Service",
        description: "On-demand medical app",
        type: PortoType.ANDROID,
        work: PortoWorks.PERSONAL_PROJECT,
        tech: [
          PortoTech.KOTLIN,
        ],
      ),
      Portfolio(
        title: "ED-Dokter",
        industry: "Doctor version of E-Dokterku Android Application",
        description: "Doctor version of E-Dokterku",
        type: PortoType.ANDROID,
        work: PortoWorks.PERSONAL_PROJECT,
        tech: [
          PortoTech.KOTLIN,
        ],
      ),
      Portfolio(
        title: "ED-Dokter",
        industry: "Doctor version of E-Dokterku Android Application",
        description: "Doctor version of E-Dokterku",
        type: PortoType.ANDROID,
        work: PortoWorks.PERSONAL_PROJECT,
        tech: [
          PortoTech.KOTLIN,
        ],
      ),
      Portfolio(
        title: "Pasar Benih 2018",
        industry: "Marketplace",
        description: "Soybean seeds Market place",
        type: PortoType.ANDROID,
        work: PortoWorks.OFFICE_TASK,
        tech: [
          PortoTech.KOTLIN,
        ],
      ),
      Portfolio(
        title: "BKids Parent",
        industry: "Banking",
        description: "Parent version of BKids BNI46 used for give task to kids",
        type: PortoType.ANDROID,
        work: PortoWorks.PERSONAL_PROJECT,
        tech: [
          PortoTech.KOTLIN,
        ],
      ),
      Portfolio(
        title: "BKids",
        industry: "Banking",
        description: "Android App for BNI46 used for give task to kids",
        type: PortoType.ANDROID,
        work: PortoWorks.PERSONAL_PROJECT,
        tech: [
          PortoTech.KOTLIN,
        ],
      ),
      Portfolio(
        title: "VOELA",
        industry: "Social Media",
        description: "Food and Culinary encyclopedia in Cirebon City",
        type: PortoType.ANDROID,
        work: PortoWorks.OFFICE_TASK,
        tech: [
          PortoTech.KOTLIN,
          PortoTech.JAVA,
        ],
      ),
      Portfolio(
        title: "VOELA Merchant",
        industry: "Social Media",
        description: "Merchant app for VOELA in Cirebon City",
        type: PortoType.ANDROID,
        work: PortoWorks.OFFICE_TASK,
        tech: [
          PortoTech.KOTLIN,
        ],
      ),
      Portfolio(
        title: "613 Twibbon",
        industry: "Image Manipulation",
        description: "Twibbon app for Highschool reunion",
        type: PortoType.ANDROID,
        work: PortoWorks.OFFICE_TASK,
        tech: [
          PortoTech.KOTLIN,
        ],
      ),
      Portfolio(
        title: "IDUang",
        description: "A simple Indonesia currency converter Android libs",
        type: PortoType.ANDROID,
        work: PortoWorks.OPEN_SOURCE,
        tech: [
          PortoTech.JAVA,
        ],
      ),
      Portfolio(
        title: "Wifiku",
        description: "A simple Android network-info libs",
        type: PortoType.ANDROID,
        work: PortoWorks.OPEN_SOURCE,
        tech: [
          PortoTech.JAVA,
        ],
      ),
      Portfolio(
        title: "Droidcrypt",
        description: "A simple Android Library. Very easy for use this Android "
            "library for performing encryption to String with AES encryption, "
            "it can used for save to SharedPreferences too",
        type: PortoType.ANDROID,
        work: PortoWorks.OPEN_SOURCE,
        tech: [
          PortoTech.KOTLIN,
        ],
      ),
      Portfolio(
        title: "Jotter",
        description:
            "Jotter, a simple library for log all of your Activity and Fragment event",
        type: PortoType.ANDROID,
        work: PortoWorks.OPEN_SOURCE,
        tech: [
          PortoTech.KOTLIN,
        ],
      ),
      Portfolio(
          title: "Expose Concrete",
          description:
              "Expose Concrete is bussines website developed with CodeIgniter and Bootstrap framework",
          type: PortoType.WEB_FRONT_END,
          work: PortoWorks.PERSONAL_PROJECT,
          tech: [
            PortoTech.BOOTSTRAP,
            PortoTech.CSS,
            PortoTech.JAVASCRIPT,
            PortoTech.HTML
          ],
          link: "https://www.exposeconcrete.com/"),
      Portfolio(
        title: "Picman Dashboard",
        description: "Dashboard web app for Picman app",
        type: PortoType.WEB_BACK_END,
        work: PortoWorks.PERSONAL_PROJECT,
        tech: [
          PortoTech.BOOTSTRAP,
          PortoTech.CSS,
          PortoTech.JAVASCRIPT,
          PortoTech.LARAVEL,
          PortoTech.HTML,
        ],
      ),
      Portfolio(
        title: "Picman",
        description: "Touring app for Car Club",
        type: PortoType.FLUTTER,
        work: PortoWorks.PERSONAL_PROJECT,
        tech: [
          PortoTech.DART,
          PortoTech.KOTLIN,
          PortoTech.SWIFT,
        ],
      ),
      Portfolio(
        title: "Watong Dashboard",
        description: "Dashboard web app for Watong app",
        type: PortoType.WEB_BACK_END,
        work: PortoWorks.PERSONAL_PROJECT,
        tech: [
          PortoTech.BOOTSTRAP,
          PortoTech.CSS,
          PortoTech.JAVASCRIPT,
          PortoTech.LARAVEL,
          PortoTech.HTML,
        ],
      ),
      Portfolio(
        title: "Watong",
        description: "On-demand coffee shop app",
        type: PortoType.FLUTTER,
        work: PortoWorks.PERSONAL_PROJECT,
        tech: [
          PortoTech.DART,
          PortoTech.KOTLIN,
          PortoTech.SWIFT,
        ],
      ),
      Portfolio(
        title: "PND MyFun",
        description: "News reader app",
        type: PortoType.FLUTTER,
        work: PortoWorks.PERSONAL_PROJECT,
        tech: [
          PortoTech.DART,
          PortoTech.KOTLIN,
          PortoTech.SWIFT,
        ],
      ),
      Portfolio(
        title: "PND MyFun Dashboard",
        description: "Dashboard web app for PND MyFun app",
        type: PortoType.WEB_BACK_END,
        work: PortoWorks.PERSONAL_PROJECT,
        tech: [
          PortoTech.BOOTSTRAP,
          PortoTech.CSS,
          PortoTech.JAVASCRIPT,
          PortoTech.LARAVEL,
          PortoTech.HTML,
        ],
      ),
      Portfolio(
        title: "Brizy",
        description: "Simple quiz app",
        type: PortoType.ANDROID,
        work: PortoWorks.PERSONAL_PROJECT,
        tech: [
          PortoTech.KOTLIN,
        ],
      ),
      Portfolio(
        title: "Prayer Times",
        description:
            "Ramadhan 1439H Side-Project, build in native iOS with Swift",
        type: PortoType.IOS,
        work: PortoWorks.PERSONAL_PROJECT,
        tech: [
          PortoTech.SWIFT,
        ],
      ),
      Portfolio(
        title: "Infinite Tab Button",
        description:
            "Flutter package containing widget for making MaterialTab look alike infinite button",
        type: PortoType.FLUTTER,
        work: PortoWorks.OPEN_SOURCE,
        tech: [
          PortoTech.DART,
        ],
      ),
      Portfolio(
        title: "Midtrans Android SDK",
        description:
            "The easiest way to integrate with Midtrans payment API on android",
        type: PortoType.ANDROID,
        work: PortoWorks.OFFICE_TASK,
        tech: [
          PortoTech.JAVA,
        ],
      ),
      Portfolio(
        title: "GoMerchants SDK",
        description: "GoMerchants Android SDK",
        type: PortoType.ANDROID,
        work: PortoWorks.OFFICE_TASK,
        tech: [
          PortoTech.KOTLIN,
        ],
      ),
      Portfolio(
        title: "Midtrans Mobile",
        description: "Midtrans Dashboard mobile app",
        type: PortoType.ANDROID,
        work: PortoWorks.OFFICE_TASK,
        tech: [
          PortoTech.KOTLIN,
        ],
      ),
      Portfolio(
        title: "Gobiz",
        description:
            "Gojek's Merchants Super App, which can answer all business needs ",
        type: PortoType.ANDROID,
        work: PortoWorks.OFFICE_TASK,
        tech: [
          PortoTech.KOTLIN,
        ],
      ),
      Portfolio(
        title: "TeamBoard",
        description: "Keyboard app",
        type: PortoType.ANDROID,
        work: PortoWorks.PERSONAL_PROJECT,
        tech: [
          PortoTech.KOTLIN,
        ],
      ),
      Portfolio(
        title: "OneFlux Agon",
        description: "TAN Digital app",
        type: PortoType.ANDROID,
        work: PortoWorks.PERSONAL_PROJECT,
        tech: [
          PortoTech.KOTLIN,
        ],
      ),
      Portfolio(
        title: "OneFlux New Ampuh",
        description: "TAN Digital app",
        type: PortoType.ANDROID,
        work: PortoWorks.PERSONAL_PROJECT,
        tech: [
          PortoTech.KOTLIN,
        ],
      ),
      Portfolio(
        title: "OneFlux Agon",
        description: "TAN Digital app",
        type: PortoType.ANDROID,
        work: PortoWorks.PERSONAL_PROJECT,
        tech: [
          PortoTech.KOTLIN,
        ],
      ),
      Portfolio(
        title: "OneFlux Construction",
        description: "TAN Digital app",
        type: PortoType.ANDROID,
        work: PortoWorks.PERSONAL_PROJECT,
        tech: [
          PortoTech.KOTLIN,
        ],
      ),
    ];
  }
}
