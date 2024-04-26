// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mukrata_sau_app/views/show_pay_bill_ui_.dart';

class CalculatePayBillUI extends StatefulWidget {
  const CalculatePayBillUI({super.key});

  @override
  State<CalculatePayBillUI> createState() => _CalculatePayBillUIState();
}

class _CalculatePayBillUIState extends State<CalculatePayBillUI> {
  @override
  //ตัวแปรเก็บ ในราบการDropDown
  List<String> _memberType = [
    'ไม่เป็นสมาชิก',
    'สมาชิก Silver Member ลด 5%',
    'สมาชิก Gold Member ลด 10%',
    'สมาชิก Platinum Member ลด 20%',
  ];
  //ตัวแปรเก็บ ที่จะเลือกDropDown
  String _memberTypeSelected = 'ไม่เป็นสมาชิก';
  //ตัวแปรเก็บรูปที่ถ่าย
  File? _imageFromCamera;

  //เมธอดเปิดกล้องแล้วถ่ายรูป
  Future getImageFromCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);

    if (image == null) return;

    //เก็บรูปที่ถ่ายไว้ในตัวแปรที่สร้างไว้ก่อนหน้า
    setState(() {
      _imageFromCamera = File(image.path);
    });
  }

  //สร้างตัวแปรเก็บสถานะผู้ใหญ่และเด็กว่าเลือกไม่เลือก
  bool adultStatus = false;
  bool babyStatus = false;
//สรเางตัวแปร
  int waterStatuse = 1;
//
TextEditingController adultCtrl = TextEditingController(text: '0');
  TextEditingController babyCtrl = TextEditingController(text: '0');
  TextEditingController cokeCtrl = TextEditingController(text: '0');
  TextEditingController pureCtrl = TextEditingController(text: '0');
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 50.0,
            right: 50.0,
          ),
          child: Center(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    //เปิดกล้องเอารูปที่ถ่ายมาแสดง
                    getImageFromCamera();
                  },
                  child: _imageFromCamera == null
                      ? Image.asset(
                          'assets/images/camera.jpg',
                          width: 140.0,
                          height: 140.0,
                          fit: BoxFit.cover,
                        )
                      : Image.file(
                          _imageFromCamera!,
                          width: 140.0,
                          height: 140.0,
                          fit: BoxFit.cover,
                        ),
                ),
                SizedBox(height: 30.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'จำนวนคน',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                      value: adultStatus,
                      onChanged: (paramValue) {
                        setState(() {
                          adultStatus = adultStatus == true ? false : true;
                        });
                      },
                    ),
                    Text('ผู้ใหญ่ 299 บาท/คน จำนวน'),
                    Expanded(
                      child: TextField(
                        controller: adultCtrl,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(),
                      ),
                    ),
                    Text(
                      'คน',
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: babyStatus,
                      onChanged: (paramValue) {
                        babyStatus = babyStatus == true ? false : true;
                      },
                    ),
                    Text('เด็ก 69 บาท/คน จำนวน'),
                    Expanded(
                        child: TextField(
                          controller: babyCtrl,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(),
                    )),
                    Text(
                      'คน',
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'บุปเฟต์น้ำดื่ม',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Radio(
                      value: 1,
                      groupValue: waterStatuse,
                      onChanged: (paramValue) {
                        setState(() {
                          waterStatuse = paramValue!;
                        });
                      },
                    ),
                    Text('รับ 25 บาท/หัว'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: 2,
                      groupValue: waterStatuse,
                      onChanged: (paramValue) {
                        setState(() {
                          waterStatuse = paramValue!;
                        });
                      },
                    ),
                    Text('ไม่รับ'),
                  ],
                ),
                Row(
                  children: [
                    Text('โค้ก 20 บาท/ขวด จำนวน'),
                    Expanded(
                      child: TextField(
                        controller: cokeCtrl,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Text(
                      'ขวด',
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text('น้ำเปล่า 20 บาท/ขวด จำนวน'),
                    Expanded(
                      child: TextField(
                        controller: pureCtrl,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Text(
                      'ขวด',
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ประเภทสมาชิก',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                DropdownButton(
                  items: _memberType
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(
                              e,
                            ),
                          ))
                      .toList(),
                  onChanged: (paramValue) {
                    setState(() {
                      _memberTypeSelected = paramValue!;
                    });
                  },
                  value: _memberTypeSelected,
                  isExpanded: true,
                ),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          //คิดผู้ใหญ่
                          double adultPay = adultStatus == false ? 0 : (int.parse(adultCtrl.text) * 299); 
                          //คิดเด็ก
                          double babyPay = babyStatus == false ? 0 : (int.parse(babyCtrl.text) * 69);
                          //คิดน้ำดื่มบุปเฟต์
                          double waterPay = waterStatuse == 1 ? (int.parse(adultCtrl.text)+int.parse(babyCtrl.text)) * 25 : 0;
                          //คิดโค้ก
                          double cokePay = int.parse(babyCtrl.text) * 20 ;
                          //คิดน้ำเปล่า
                          double purePay = int.parse(pureCtrl.text) * 15 ;
                          //คำนวณเงินที่ต้องจ่ายพร้อมส่วนลด
                          //คำนวณเงินรวมก่อนลด
                          double totalPay = adultPay + babyPay + waterPay + cokePay + purePay;
                          //หักส่วนลด
                          if (_memberTypeSelected == 'ไม่เป็นสมาชิก') {
                            totalPay = totalPay;
                          } else if (_memberTypeSelected == 'สมาชิก Silver Member ลด 5%') {
                            totalPay = totalPay - (totalPay *5/100);
                          } else if (_memberTypeSelected == 'สมาชิก Gold Member ลด 10%') {
                            totalPay = totalPay - (totalPay *10/100);
                          } else {
                            totalPay = totalPay - (totalPay *20/100);
                          }
                          //
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ShowPayBillUI(
                                adult: adultCtrl.text,
                                baby: babyCtrl.text,
                                water: waterStatuse,
                                coke: cokeCtrl.text,
                                pure: pureCtrl.text,
                                memberType: _memberTypeSelected,
                                totalPay: totalPay,
                                imageFile: _imageFromCamera,
                              ),
                            ),
                          );
                        },
                        icon: Icon(
                          FontAwesomeIcons.calculator,
                          color: Color.fromARGB(255, 247, 243, 243),
                        ),
                        label: Text(
                          'คำนวณเงิน',
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 117, 105, 89),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          fixedSize: Size(
                            double.infinity,
                            55.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15.0),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          FontAwesomeIcons.cancel,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        label: Text(
                          'ยกเลิก',
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 121, 121, 121),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          fixedSize: Size(
                            double.infinity,
                            55.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
