import 'package:flutter/material.dart';

class ModalFormWidget extends StatelessWidget {
  var titleController;
  var categoryController;
  var nominalController;
  List<String>? items;
  String? selectedItem = 'masuk';
  ModalFormWidget(
      {super.key,
      this.titleController,
      this.categoryController,
      this.nominalController,
      this.items});

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Menutup modal ketika pengguna mengetuk di luar form
        Navigator.of(context).pop();
      },
      child: Container(
        padding: EdgeInsets.all(16.0),
        color: Colors.white,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Judul'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Nama harus diisi';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: nominalController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Nominal'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Nama harus diisi';
                  }
                  return null;
                },
              ),
              DropdownButton(
                items: items
                    ?.map(
                      (item) => DropdownMenuItem<String>(
                        child: Text(
                          item,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    )
                    .toList(),
                value: selectedItem,
                onChanged: categoryController,
              ),
              ElevatedButton(
                child: Text('Kirim'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Proses pengiriman form group
                    // Lakukan tindakan yang diinginkan
                    // ...

                    // Menutup modal setelah form dikirim
                    Navigator.of(context).pop();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
