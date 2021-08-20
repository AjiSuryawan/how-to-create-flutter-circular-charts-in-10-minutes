import 'package:flutter/material.dart';
class FormCalculate extends StatefulWidget {
  const FormCalculate({Key? key}) : super(key: key);

  @override
  _FormCalculateState createState() => _FormCalculateState();
}

class _FormCalculateState extends State<FormCalculate> {

  TextEditingController inputcontrollerExpectedRetirement= new TextEditingController();
  TextEditingController inputcontrollerRiskProfile= new TextEditingController();
  TextEditingController inputcontrollerExpectedInvestement= new TextEditingController();

  @override
  Widget build(BuildContext context) {
    int currentage=55;
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Form Validation Example"),
              Text("current age "+currentage.toString()),
              Row(
                children: [
                  Text("makan"),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    width: MediaQuery.of(context).size.width * 0.65,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: inputcontrollerExpectedRetirement,
                      decoration: InputDecoration(
                          hintText: "input number"
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20,),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: inputcontrollerRiskProfile,
                decoration: InputDecoration(
                  hintText: "risk profile"
                ),
              ),
              SizedBox(height: 20,),
              TextFormField(
                onChanged: (value) {
                  if(inputcontrollerRiskProfile.text == ""){
                    inputcontrollerExpectedInvestement.text="";
                    showAlertDialogRiskProfile(context);
                  }
                },
                keyboardType: TextInputType.number,
                controller: inputcontrollerExpectedInvestement,
                decoration: InputDecoration(
                  hintText: "expected investment"
                ),
              ),
              ElevatedButton(onPressed: () {
                calculateData(inputcontrollerExpectedRetirement.text,currentage);
              }, child: Text("Calculate"))
            ],
          ),
        ),
      ),
    );
  }

  void calculateData(String data,int currentage) {
    if(int.parse(data)>= currentage && int.parse(data)<=100){
      print("bener nih proses data");
    }else{
      showAlertDialogExpectedRetirement(context);
    }
  }

  showAlertDialogRiskProfile(BuildContext context) {

    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("My title"),
      content: Text("Silahkan mengisi risk profile terlebih dahulu"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showAlertDialogExpectedRetirement(BuildContext context) {

    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("My title"),
      content: Text("Expected Retirement tidak boleh kurang dari current age dan maksimal 100"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
