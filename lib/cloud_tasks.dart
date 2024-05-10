import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';

class CloudTasks extends StatefulWidget {
  const CloudTasks({super.key});

  @override
  State<CloudTasks> createState() => _CloudTasksState();
}

class _CloudTasksState extends State<CloudTasks> {
  List<String> fileLinks = [];
  List<String> fileNames = [];
  var storage = FirebaseStorage.instance;
  var db = FirebaseDatabase.instance;
  Future<void> _uploadFile() async {
    var result = await FilePicker.platform.pickFiles();
    if (result != null) {
      var fileBytes = result.files.first.bytes;
      String fileName = result.files.single.name;
      storage.ref('files/$fileName').putData(fileBytes!).then((snapshot) async {
        final url = await snapshot.ref.getDownloadURL();
        await db.ref('files').push().set(url).then((_) async {
          fileLinks.add(url);
          fileNames.add(fileName);
          setState(() {});
        });
      });
    }
  }

  Future<void> _retrieveLinks() async {
    fileLinks = [];
    fileNames = [];
    try {
      final ListResult listResult = await storage.ref('files').listAll();
      for (var ref in listResult.items) {
        String url = await ref.getDownloadURL();
        fileLinks.add(url);
        fileNames.add(ref.name);
      }
      setState(() {});
    } catch (e) {}
  }

  Future<void> _deleteLink(int index) async {
    print("Index: $index");
    try {
      final snapshot = await db.ref('files').get();
      if (snapshot.exists) {
        var data = snapshot.value as Map<dynamic, dynamic>;
        bool deleted = false;
        data.forEach((key, value) async{
          print("Key: $key");
          print("Value: $value");
          if (value == fileLinks[index]&&!deleted) {
            await db.ref('files').child(key).remove();
            await storage.refFromURL(fileLinks[index]).delete();
            fileLinks=[];
            fileNames=[];
            await _retrieveLinks();
            // fileLinks.removeAt(index);
            // fileNames.removeAt(index);
            // print("After Deletionnnnnnnn:\n");
            // print(fileLinks);
            // print("\n");
            // print(fileNames);
            setState(() {});
            deleted = true;
            return;
          }
        });
      }
    } catch (e) {
print("Errorrrrrr:\n");
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      await _uploadFile();
                    },
                    child: const Text('Upload File'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await _retrieveLinks();
                    },
                    child: const Text('Retrieve Links'),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              if (fileLinks.isNotEmpty)
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: fileLinks.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                                flex: 8,
                                child: Text(
                                  fileNames[index],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                )),
                            Expanded(
                              flex: 2,
                              child: IconButton(
                                onPressed: () async {
                                  _deleteLink(index);
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          fileLinks[index],
                          style: const TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline),
                        ),
                        ImageNetwork(
                          image: fileLinks[index],
                          height: 150,
                          width: 150,
                          duration: 1500,
                          curve: Curves.easeIn,
                          onPointer: true,
                          debugPrint: false,
                          fullScreen: false,
                          fitAndroidIos: BoxFit.cover,
                          fitWeb: BoxFitWeb.cover,
                          borderRadius: BorderRadius.circular(70),
                          onLoading: const CircularProgressIndicator(
                            color: Colors.indigoAccent,
                          ),
                          onError: const Icon(
                            Icons.error,
                            color: Colors.red,
                          ),
                          onTap: () {
                            debugPrint("©gabriel_patrick_souza");
                          },
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 20,
                  ),
                ),
            ],
          ),
        )),
      ),
    );
  }
}
