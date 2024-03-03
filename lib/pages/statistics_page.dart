import 'package:flutter/material.dart';

import '../data/list/patients_list.dart';

class StatisticsPage extends StatefulWidget {
  @override
  _StatisticsPageState createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  String selectedDisease = 'Грипп'; // Выбранное заболевание
  List<String> diseases = ['Грипп', 'Ангина', 'Бронхит', 'Гастрит', 'Пневмония']; // Список заболеваний

  int calculatePatientsCount(String disease) {
    int count = patients.where((patient) => patient.disease == disease).length;
    return count;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Статистика', style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w800)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            DropdownButton<String>(
              value: selectedDisease,
              onChanged: (value) {
                setState(() {
                  selectedDisease = value!;
                });
              },
              items: diseases.map((String disease) {
                return DropdownMenuItem<String>(
                  value: disease,
                  child: Text(disease),
                );
              }).toList(),
            ),
            SizedBox(width: 20),
            Text('Количество пациентов: ${calculatePatientsCount(selectedDisease)}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
          ],
        ),
      ),
    );
  }
}
