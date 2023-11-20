import 'package:flutter/material.dart';
import 'package:flutter_exam/core/domain/entities/person.dart';

class PersonDetailPage extends StatelessWidget {
  final Person person;

  const PersonDetailPage({super.key, required this.person});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Text(
                "Full name: ${person.firstname ?? ''} ${person.lastname ?? ''}")
          ],
        ),
      );
}
