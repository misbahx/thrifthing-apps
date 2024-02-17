import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thrifthing_app_kel4/services/Blocs/Product/product_bloc.dart';

class AddProductForm extends StatefulWidget {
  @override
  _AddProductFormState createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _price = TextEditingController();
  File? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff0F172A),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            'Tambah Produk',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color(0xff0F172A),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _buildImagePicker(),
                SizedBox(height: 16),
                TextFormField(
                  controller: _name,
                  decoration: InputDecoration(
                    labelText: 'Nama Produk',
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _description,
                  decoration: InputDecoration(
                    labelText: 'Deskripsi Produk',
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _price,
                  decoration: InputDecoration(
                    labelText: 'Harga Produk',
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (_image == null) {
                      _name.text = "";
                      _description.text = "";
                      _price.text = "";

                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: Text("Tidak ada gambar"),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                Text("Silahkan lengkapi data berikut"),
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: Text("OK")),
                          ],
                        ),
                      );
                    } else {
                      context.read<ProductBloc>().add(ClickAddProductEvent(
                          name: _name.text.trim(),
                          description: _description.text.trim(),
                          price: _price.text.trim(),
                          image: _image!));
                    }
                  },
                  child: Text(
                    'Simpan',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xff4338CA)),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget _buildImagePicker() {
    return Column(
      children: [
        _image != null
            ? Container(
                height: 300,
                child: Image.file(
                  _image!,
                  fit: BoxFit.cover,
                ),
              )
            : Container(
                height: 100,
                width: 100,
                color: Color(0xFF1E293B),
                child: Icon(
                  Icons.image,
                  color: Colors.grey,
                ),
              ),
        SizedBox(height: 8),
        ElevatedButton(
          onPressed: () async {
            FilePickerResult? result = await FilePicker.platform.pickFiles(
              type: FileType.custom,
              allowedExtensions: ['jpg'],
            );
            if (result != null && result.files.isNotEmpty) {
              setState(() {
                _image = File(result.files.single.path!);
              });
            }
          },
          child: Text('Pilih Gambar'),
        ),
      ],
    );
  }
}
