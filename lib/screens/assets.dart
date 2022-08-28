import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class AssetsPage extends StatefulWidget {
  const AssetsPage({Key? key}) : super(key: key);

  @override
  State<AssetsPage> createState() => _AssetsPageState();
}

class _AssetsPageState extends State<AssetsPage> {

  late var assetNameController = TextEditingController();
  late var assetUniqueIDController = TextEditingController();
  late var assetDescController = TextEditingController();
  late var priceController = TextEditingController();

  void onSubmit(){
    setState((){
      assetDescController = TextEditingController(text: '');
      assetUniqueIDController = TextEditingController(text: '');
      assetNameController = TextEditingController(text: '');
      priceController = TextEditingController(text: '');
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height-55,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(10, 12, 8, 10),
                width: double.infinity,
                child: const Center(
                  child: Text('Add Assets',style: TextStyle(fontSize: 20),)
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 12, 8, 10),
                child: TextFormField(
                  autofocus: true,
                  textInputAction: TextInputAction.next,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    labelText: "Asset Name",
                    fillColor: Colors.white,
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                  ),
                  /*validator: (val) {
                    if(val.length==0) {
                      return "Name cannot be empty";
                    }else{
                      return null;
                    }
                  },*/
                  controller: assetNameController,
                  keyboardType: TextInputType.text,
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(8, 12, 8, 10),
                child: TextFormField(
                  autofocus: true,
                  textInputAction: TextInputAction.next,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    labelText: "Asset Unique ID",
                    fillColor: Colors.white,
                    hintText: "IEMI or Service Tag",
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                  ),
                  controller: assetUniqueIDController,
                  keyboardType: TextInputType.text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 12, 8, 10),
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    labelText: "Asset Description",
                    hintText: "Mobile or Laptop in Good Conditions",
                    fillColor: Colors.white,
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                  ),
                  controller: assetDescController,
                  keyboardType: TextInputType.multiline,
                  minLines: 10,
                  maxLines: null,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 12, 8, 10),
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    labelText: "Price in INR",
                    hintText: "Original Price",
                    fillColor: Colors.white,
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                  ),
                  controller: priceController,
                  keyboardType: TextInputType.number
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 12, 8, 10),
                child:
                MaterialButton(
                  onPressed: () async{
                    FilePickerResult? result = await FilePicker.platform.pickFiles();

                    if (result != null) {
                      print(result.files.single.path);
                      //File file = File(result.files.single.path);
                    } else {
                      // User canceled the picker
                    }
                  },
                  color: const Color(0xff3b22a1),
                  child: const Text('Upload Image',style: TextStyle(color: Colors.white),),
                )
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(10, 12, 8, 10),
                  child: Container(
                    width: double.maxFinite,
                    child: MaterialButton(
                      onPressed: onSubmit,
                      color: const Color(0xff3b22a1),
                      child: const Text('Add Asset',style: TextStyle(color: Colors.white),),
                    ),
                  )
              )

            ],
          )
        ),
      ),
    );
  }
}
