import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pahlevikun.github.io/common/config/screen_util.dart';
import 'package:pahlevikun.github.io/common/widget/page_title.dart';
import 'package:pahlevikun.github.io/common/widget/responsive_widget.dart';
import 'package:pahlevikun.github.io/presentation/base_page.dart';
import 'package:pahlevikun.github.io/presentation/landing/landing_page.dart';
import 'package:pahlevikun.github.io/data/resume/resume_data.dart';

class ContactSection extends StatefulWidget {
  ContactSection(GlobalKey key) : super(key: key);

  @override
  _ContactSectionState createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final subjectController = TextEditingController();
  final messageController = TextEditingController();

  bool isSubmitting = false;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    subjectController.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: BasePage(
        color: Colors.white,
        child: Padding(
          padding: SizeConfig.PAGE_CONTENT_PADDING,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              PageTitle("Contact Me"),
              SizedBox(height: SizeConfig.LARGE_SIZE),
              ResponsiveWidget(
                largeScreen: buildTabletLayout(),
                mediumScreen: buildTabletLayout(),
                smallScreen: buildPhoneLayout(),
              )
            ],
          ),
        ),
      ),
    );
  }

  void toggleIsSubmitting(bool value) {
    setState(() {
      this.isSubmitting = value;
    });
  }

  Widget buildTextFormField(
    String hint,
    TextEditingController controller, {
    int maxLines = 1,
    bool isEmail = false,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SizeConfig.MEDIUM_SIZE),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: SUB_COLOR, width: 1.0),
          borderRadius: BorderRadius.circular(SizeConfig.MEDIUM_SIZE),
        ),
        hintText: hint,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 24,
          vertical: maxLines == 1 ? 0 : 12,
        ),
      ),
      style: TextStyle(fontSize: 14),
      cursorColor: SUB_COLOR,
      validator: (value) {
        if (value.trim().isEmpty) {
          return 'The field is required';
        } else if (isEmail &&
            !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                .hasMatch(value)) {
          return "Invalid email";
        }
        return null;
      },
    );
  }

  Widget buildContactItem(IconData icon, String title, String content) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Icon(
          icon,
          color: SUB_COLOR,
          size: 28,
        ),
        SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 4),
            Text(
              content,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget buildSubmitButton() {
    return MaterialButton(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      onPressed: submit,
      color: isSubmitting ? Colors.grey : SUB_COLOR,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(SizeConfig.LARGE_SIZE),
      ),
      child: Text(
        this.isSubmitting ? "Submitting..." : "Submit Message",
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  void submit() async {
    if (_formKey.currentState.validate() && !isSubmitting) {
      final name = nameController.text.trim();
      final email = emailController.text.trim();
      final subject = subjectController.text.trim();
      final message = messageController.text.trim();
      final targetMail = ResumeData.getData().email;
      try {
        toggleIsSubmitting(true);
        var response = await http.post(ResumeData.MESSAGE_API, body: {
          "name": name,
          "email": email,
          "subject": subject,
          "target_mail": targetMail,
          "message": message,
        });
        final statusCode = response.statusCode;
        if (statusCode == 200) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text("Thank for your message ^^~"),
              backgroundColor: Colors.green,
            ),
          );
          nameController.clear();
          emailController.clear();
          subjectController.clear();
          messageController.clear();
        } else {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text("Something went wrong :("),
              backgroundColor: Colors.red,
            ),
          );
        }
        toggleIsSubmitting(false);
      } on Exception catch (e) {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text("Something went wrong :("),
            backgroundColor: Colors.red,
          ),
        );
        toggleIsSubmitting(false);
      }
    }
  }

  Widget buildTabletLayout() {
    final lineHeight = 84.0;
    return Column(
      children: <Widget>[
        SizedBox(
          height: lineHeight,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: 256,
                child: buildContactItem(
                    Icons.email, "Email", ResumeData.getData().email),
              ),
              Expanded(
                child: buildTextFormField("Your name", nameController),
                flex: 2,
              ),
              SizedBox(width: 12),
              Expanded(
                child: buildTextFormField(
                  "Email address",
                  emailController,
                  isEmail: true,
                ),
                flex: 2,
              ),
            ],
          ),
        ),
        SizedBox(
          height: lineHeight,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: 256,
                child: buildContactItem(Icons.my_location, "Location",
                    ResumeData.getData().location),
              ),
              Expanded(
                child: buildTextFormField("Subject", subjectController),
                flex: 2,
              ),
            ],
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(width: 256),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 124,
                    child: buildTextFormField(
                      "Message",
                      messageController,
                      maxLines: 4,
                    ),
                  ),
                  buildSubmitButton(),
                ],
              ),
              flex: 2,
            ),
          ],
        ),
      ],
    );
  }

  Widget buildPhoneLayout() {
    final space = SizedBox(height: SizeConfig.LARGE_SIZE);
    final smallSpace = SizedBox(height: SizeConfig.MEDIUM_SIZE);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        buildContactItem(Icons.email, "Email", ResumeData.getData().email),
        space,
        buildContactItem(
            Icons.my_location, "Location", ResumeData.getData().location),
        space,
        buildTextFormField("Your name", nameController),
        smallSpace,
        buildTextFormField("Email address", emailController, isEmail: true),
        smallSpace,
        buildTextFormField("Subject", subjectController),
        smallSpace,
        buildTextFormField("Message", messageController, maxLines: 4),
        space,
        buildSubmitButton(),
      ],
    );
  }
}
