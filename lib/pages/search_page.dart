import 'package:flutter/material.dart';

import '../data/list/patients_list.dart';
import '../data/model/patient.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String searchQuery = '';
  List<Patient> searchResult = [];

  void search() {
    // Пример поиска пациентов по имени
    List<Patient> result = patients.where((patient) => patient.firstName.toLowerCase().contains(searchQuery.toLowerCase())).toList();
    setState(() {
      searchResult = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Поиск пациентов'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Поиск по имени',
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: search,
              child: Text('Найти'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: searchResult.length,
                itemBuilder: (context, index) {
                  final patient = searchResult[index];
                  return ListTile(
                    title: Text('${patient.firstName} ${patient.lastName}'),
                    subtitle: Text('Возраст: ${patient.age}, Болезнь: ${patient.disease}, Дата поступления: ${patient.admissionDate}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}