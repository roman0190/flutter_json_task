import 'package:flutter/material.dart';
import 'package:flutter_json_task/view_models/json_view_model.dart';

class JsonParserPage extends StatefulWidget {
  const JsonParserPage({super.key});

  @override
  State<JsonParserPage> createState() => _JsonParserPageState();
}

class _JsonParserPageState extends State<JsonParserPage> {
  final JsonViewModel _viewModel = JsonViewModel();

  final input1 = [
    {
      "0": {
        "id": 1,
        "title": "Gingerbread"
      },
      "1": {
        "id": 2,
        "title": "Jellybean"
      },
      "3": {
        "id": 3,
        "title": "KitKat"
      }
    },
    [
      {
        "id": 4,
        "title": "Lollipop"
      },
      {
        "id": 5,
        "title": "Pie"
      },
      {
        "id": 6,
        "title": "Oreo"
      },
      {
        "id": 7,
        "title": "Nougat"
      }
    ]
  ];

  final input2 = [
    {
      "0": {
        "id": 1,
        "title": "Gingerbread"
      },
      "1": {
        "id": 2,
        "title": "Jellybean"
      },
      "3": {
        "id": 3,
        "title": "KitKat"
      }
    },
    {
      "0": {
        "id": 8,
        "title": "Froyo"
      },
      "2": {
        "id": 9,
        "title": "Éclair"
      },
      "3": {
        "id": 10,
        "title": "Donut"
      }
    },
    [
      {
        "id": 4,
        "title": "Lollipop"
      },
      {
        "id": 5,
        "title": "Pie"
      },
      {
        "id": 6,
        "title": "Oreo"
      },
      {
        "id": 7,
        "title": "Nougat"
      }
    ]
  ];

  late List<dynamic> currentInput;

  @override
  void initState() {
    super.initState();
    currentInput = input1;
    _viewModel.parseJsonData(currentInput);
  }

  void _updateInput(List<dynamic> input) {
    setState(() {
      currentInput = input;
      _viewModel.parseJsonData(currentInput);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter JSON Task"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(8.0),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 4.0,
                      crossAxisSpacing: 4.0,
                    ),
                    itemCount: _viewModel.androidVersions.length,
                    itemBuilder: (context, index) {
                      final version = _viewModel.androidVersions[index];
                      return Center(
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            version.title ?? ' ',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 140,
                    child: FloatingActionButton(
                      onPressed: () => _updateInput(input1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text('Input-1'),
                    ),
                  ),
                  const SizedBox(width: 20),
                  SizedBox(
                    width: 140,
                    child: FloatingActionButton(
                      onPressed: () => _updateInput(input2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text('Input-2'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
