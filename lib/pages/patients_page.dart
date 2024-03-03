import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../data/list/patients_list.dart';

class PatientsPage extends StatefulWidget {
  const PatientsPage({super.key});

  @override
  State<PatientsPage> createState() => _PatientsPageState();
}

class _PatientsPageState extends State<PatientsPage> {
  int currentIndex = 0;
  late Orientation orientation = Orientation.portrait;

  @override
  void initState() {
    super.initState();
  }

  void nextPatient() {
    setState(() {
      currentIndex = (currentIndex + 1) % patients.length;
      if (currentIndex == 1) {
        SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
        orientation = Orientation.landscape;
      }
      else
        {
          SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
          orientation = Orientation.portrait;
        }
    });
  }

  void previousPatient() {
    setState(() {
      currentIndex = (currentIndex - 1 + patients.length) % patients.length;
    });
    orientation = MediaQuery.of(context).orientation; // Обновляем значение ориентации после изменения состояния
  }

  @override
  Widget build(BuildContext context) {
    final patient = patients[currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('Пациент №${currentIndex + 1}', style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w800)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: orientation == Orientation.portrait
            ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Имя: ${patient.firstName} ${patient.lastName}', style: const TextStyle(fontSize: 18)),
            Text('Возраст: ${patient.age}', style: const TextStyle(fontSize: 18)),
            Text('Болезнь: ${patient.disease}', style: const TextStyle(fontSize: 18)),
            Text('Дата поступления: ${patient.admissionDate}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 30),
            CircleAvatar(radius:120, child: Image(image: patient.avatar.image))
          ],
        )
            : Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Имя: ${patient.firstName} ${patient.lastName}', style: const TextStyle(fontSize: 18)),
                  Text('Возраст: ${patient.age}', style: const TextStyle(fontSize: 18)),
                  Text('Болезнь: ${patient.disease}', style: const TextStyle(fontSize: 18)),
                  Text('Дата поступления: ${patient.admissionDate}', style: const TextStyle(fontSize: 18)),
                ],
              ),
            ),
            const SizedBox(width: 30),
            CircleAvatar(radius:120, child: Image(image: patient.avatar.image))
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: previousPatient,
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward),
              onPressed: nextPatient,
            ),
          ],
        ),
      ),
    );
  }
}

