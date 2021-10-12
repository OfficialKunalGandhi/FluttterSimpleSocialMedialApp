import 'package:flutter/material.dart';

class PostUpload extends StatefulWidget {
  const PostUpload({Key? key}) : super(key: key);

  @override
  _PostUploadState createState() => _PostUploadState();
}
class _PostUploadState extends State<PostUpload> {
  int _currentStep = 0;
  File? _image;
  File? _imageOffice;

  final _formKey = GlobalKey<FormState>();
  final _form1Key = GlobalKey<FormState>();
  TextEditingController companyName = TextEditingController();
  TextEditingController contactPersonName = TextEditingController();
  TextEditingController emailCompany = TextEditingController();
  TextEditingController addressCompany = TextEditingController();
  TextEditingController district = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController roleContactPerson = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController aboutUs = TextEditingController();

  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Future getImage() async {
    final pickedFile =
        await picker.getImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print("Image is not added!");
      }
    });
  }

  Future getOfficeImage() async {
    final pickedFile =
        await picker.getImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        _imageOffice = File(pickedFile.path);
      } else {
        print("Image is not added!");
      }
    });
  }
    return Scaffold(
      body: Theme(
        data: ThemeData(
            primaryColor: Colors.blue,
            buttonColor: Colors.blue,
            primarySwatch: Colors.blue),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stepper(
                physics: NeverScrollableScrollPhysics(),
                steps: _mySteps(),
                currentStep: this._currentStep,
                onStepTapped: (step) {
                  setState(() {
                    this._currentStep = step;
                  });
                },
                onStepContinue: () {
                  _formKey.currentState!.validate();
                  setState(() {
                    if (this._currentStep < this._mySteps().length - 1) {
                      this._currentStep = this._currentStep + 1;
                    } else {
                      //Logic to check if everything is completed
                      print('Completed, check fields.');
                    }
                  });
                },
                onStepCancel: () {
                  setState(() {
                    if (this._currentStep > 0) {
                      this._currentStep = this._currentStep - 1;
                    } else {
                      this._currentStep = 0;
                    }
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tightFor(
                      width: 150,
                      height: 50,
                    ),
                    child: ElevatedButton(
                      autofocus: true,
                      style: ButtonStyle(
                          // backgroundColor:
                          //     MaterialStateProperty.all<Color>(blueThemeColor),
                          ),
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Home()));
                        // _form3Key.currentState.validate();
                        _formKey.currentState!.validate();
                        // _formsKey.currentState.validate();
                        _form1Key.currentState!.validate();
                        // _form2Key.currentState.validate();
                        // _formsKey.currentState.validate();
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Register",
                            style: TextStyle(
                              // color: kWhiteColor,
                              fontSize: 24,
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios_outlined)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Step> _mySteps() {
    List<Step> _steps = [
      Step(
        title: Text('Personal Details'),
        content: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Name cannot be empty';
                  }
                  return null;
                },
                maxLines: 1,
                keyboardType: TextInputType.name,
                controller: nameController,
                style: TextStyle(
                  fontSize: 24,
                ),
                cursorColor: Colors.blue,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  fillColor: Colors.blue,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  labelText: "Company Name",
                  labelStyle: TextStyle(color: Colors.blue, fontSize: 18),
                  counterText: "",
                  contentPadding: EdgeInsets.only(left: 16, right: 4),
                  border: InputBorder.none,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Email cannot be empty';
                  }
                  return null;
                },
                maxLines: 1,
                controller: emailCompany,
                style: TextStyle(
                  wordSpacing: 3,
                  fontSize: 24,
                ),
                cursorColor: kGreenThemeColor,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: kGreenThemeColor,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  fillColor: kGreenThemeColor,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  labelText: "Email",
                  labelStyle: TextStyle(color: Colors.blue, fontSize: 18),
                  counterText: "",
                  contentPadding: EdgeInsets.only(left: 16, right: 4),
                  border: InputBorder.none,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Mobile Number cannot be empty';
                  } else if (value.length < 10) {
                    return 'Mobile Number must be at least 10 characters long';
                  }
                  return null;
                },
                keyboardType: TextInputType.phone,
                maxLines: 1,
                maxLength: 10,
                controller: phoneNumber,
                style: TextStyle(
                  fontSize: 24,
                ),
                cursorColor: Colors.blue,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  fillColor: Colors.blue,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  labelText: "Mobile Number",
                  labelStyle: TextStyle(color: Colors.blue, fontSize: 18),
                  counterText: "",
                  contentPadding: EdgeInsets.only(left: 16, right: 4),
                  border: InputBorder.none,
                ),

                //autofocus: true,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Contact Person Name cannot be empty';
                  }
                  return null;
                },
                maxLines: 1,
                controller: emailCompany,
                style: TextStyle(
                  wordSpacing: 3,
                  fontSize: 24,
                ),
                cursorColor: Colors.blue,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  fillColor: Colors.blue,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  labelText: "Contact Person Name",
                  labelStyle: TextStyle(color: Colors.blue, fontSize: 18),
                  counterText: "",
                  contentPadding: EdgeInsets.only(left: 16, right: 4),
                  border: InputBorder.none,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Role of Contact Person cannot be empty';
                  }
                  return null;
                },
                maxLines: 1,
                controller: emailCompany,
                style: TextStyle(
                  wordSpacing: 3,
                  fontSize: 24,
                ),
                cursorColor: Colors.blue,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  fillColor: Colors.blue,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  labelText: "Role of Contact Person",
                  labelStyle: TextStyle(color: Colors.blue, fontSize: 18),
                  counterText: "",
                  contentPadding: EdgeInsets.only(left: 16, right: 4),
                  border: InputBorder.none,
                ),
              ),
            ],
          ),
        ),
        isActive: _currentStep >= 0,
        state: _currentStep >= 1 ? StepState.complete : StepState.disabled,
      ),
      //Step 2
      Step(
        title: Text('Address'),
        content: Form(
          key: _form1Key,
          child: Column(
            children: [
              TextFormField(
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Address cannot be empty';
                  }
                  return null;
                },
                maxLines: 1,
                keyboardType: TextInputType.name,
                controller: addressCompany,
                style: TextStyle(
                  fontSize: 24,
                ),
                cursorColor: Colors.blue,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  fillColor: Colors.blue,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  labelText: "Full Address",
                  labelStyle: TextStyle(color: Colors.blue, fontSize: 18),
                  counterText: "",
                  contentPadding: EdgeInsets.only(left: 16, right: 4),
                  border: InputBorder.none,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Address cannot be empty';
                  }
                  return null;
                },
                maxLines: 1,
                keyboardType: TextInputType.name,
                controller: district,
                style: TextStyle(
                  fontSize: 24,
                ),
                cursorColor: Colors.blue,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  fillColor: Colors.blue,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  labelText: "District",
                  labelStyle: TextStyle(color: Colors.blue, fontSize: 18),
                  counterText: "",
                  contentPadding: EdgeInsets.only(left: 16, right: 4),
                  border: InputBorder.none,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'State cannot be empty';
                  }
                  return null;
                },
                maxLines: 1,
                keyboardType: TextInputType.name,
                controller: addressCompany,
                style: TextStyle(
                  fontSize: 24,
                ),
                cursorColor: Colors.blue,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  fillColor: Colors.blue,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  labelText: "State",
                  labelStyle: TextStyle(color: Colors.blue, fontSize: 18),
                  counterText: "",
                  contentPadding: EdgeInsets.only(left: 16, right: 4),
                  border: InputBorder.none,
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        isActive: _currentStep >= 1,
        state: _currentStep >= 2 ? StepState.complete : StepState.disabled,
      ),
      //Step 3
      Step(
        title: Text('Upload Image'),
        content: Column(
          children: [
            Text("Add your company Logo"),
            GestureDetector(
                onTap: () {
                  getImage();
                },
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Card(
                    elevation: 1,
                    child: _image != null
                        ? Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(image: FileImage(_image!)),
                            ),
                          )
                        : Icon(Icons.add_a_photo),
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            Text("Add your office photo"),
            GestureDetector(
                onTap: () {
                  getOfficeImage();
                },
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Card(
                    elevation: 1,
                    child: _imageOffice != null
                        ? Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: FileImage(_imageOffice!)),
                            ),
                          )
                        : Icon(Icons.add_a_photo),
                  ),
                )),
          ],
        ),
        isActive: _currentStep >= 2,
        state: _currentStep >= 0 ? StepState.complete : StepState.disabled,
      )
    ];
    return _steps;
  }

}
