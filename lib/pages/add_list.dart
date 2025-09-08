import 'package:flutter/material.dart';

class AddList extends StatelessWidget {
  const AddList({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text('Tambahkan hal yang anda ingin lakukan!',style: TextStyle(color: Colors.white),), backgroundColor: Color(0xFF50586C),),
      body: Container(
        color: Color(0xFFDCE2F0),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  labelText: "Masukan Tugas",
                  border: OutlineInputBorder(),
                  
                ),
              ),
              SizedBox(height: 16,),
              ElevatedButton(onPressed: () {
                Navigator.pop(context, controller.text);
              }, 
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF50586C),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)
                )
              ),
              child: Text('Simpan'))
            ],
          ),
        ),
      ),
    );
  }
}
