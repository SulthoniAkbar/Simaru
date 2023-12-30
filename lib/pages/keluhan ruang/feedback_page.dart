import 'dart:io';
import 'package:flutter/material.dart';
import 'package:simaru/provider/auth_provider.dart';
import 'package:simaru/provider/feedback_provider.dart';
import 'package:simaru/themes.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';

class FeedbackPage extends StatefulWidget {
  final String idRoom;

  const FeedbackPage({Key key, this.idRoom}) : super(key: key);

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  List<File> _mediaList = [];
  TextEditingController descriptionController = TextEditingController(text: '');

  @override
  void initState() {
    super.initState();
    // roomidController = TextEditingController(text: widget.idRoom);

    // Tambahkan perintah print untuk memeriksa nilai idRoom
    print('idRoom: ${widget.idRoom}');
  }

  void _pickImage() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Pilih Sumber Gambar"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _getImage(ImageSource.camera);
              },
              child: Text("Kamera"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _getImage(ImageSource.gallery);
              },
              child: Text("Galeri"),
            ),
          ],
        );
      },
    );
  }

  Future<void> _getImage(ImageSource source) async {
    try {
      var image = await ImagePicker().getImage(source: source);
      if (image != null) {
        setState(() {
          _mediaList.add(File(image.path));
        });
      }
      for (var file in _mediaList) {
        print(file.path);
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  void _deleteImage(int index) {
    setState(() {
      _mediaList.removeAt(index);
    });
  }

  void showFeedbackDialog(bool isSuccess) {
    String message =
        isSuccess ? 'Berhasil Melakukan Feedback' : 'Gagal Melakukan Feedback';

    TextStyle titleTextStyle = isSuccess
        ? TextStyle(fontSize: 30, color: Colors.green) // Style for 'Berhasil'
        : TextStyle(fontSize: 30, color: Colors.red); // Style for 'Gagal'

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        titlePadding: EdgeInsets.zero,
        contentPadding: EdgeInsets.zero,
        title: Container(
          padding: EdgeInsets.symmetric(vertical: 0), // Remove vertical padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                padding: EdgeInsets.all(0), // Remove all padding
                child: Lottie.asset(
                  isSuccess
                      ? 'animations/feedback succes.json'
                      : 'animations/feedback gagal.json',
                  height: 200,
                  width: 200,
                ),
              ),
            ],
          ),
        ),
        content: Container(
          padding: EdgeInsets.symmetric(
              horizontal: 24, vertical: 0), // Remove vertical padding
          child: Text(message, textAlign: TextAlign.center),
        ),
        actions: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(0), // Remove all padding
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                if (isSuccess) {
                  Navigator.pushNamed(context, '/home');
                }
              },
              style: ElevatedButton.styleFrom(
                primary: isSuccess
                    ? Colors.green
                    : Colors.red, // Change button color based on success
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(12), // Make button rounded
                ),
              ),
              child: Text(
                'OK',
                style: TextStyle(
                  color: Colors.white, // Customize the text color
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void handleReport() async {
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);
    FeedbackProvider feedbackProvider =
        Provider.of<FeedbackProvider>(context, listen: false);

    if (await feedbackProvider.feedback(
      roomid: widget.idRoom.toString(),
      description: descriptionController.text,
      mediaList: _mediaList,
      token: authProvider.user.token,
    )) {
      showFeedbackDialog(true);
    } else {
      showFeedbackDialog(false);
    }

    if (feedbackProvider.responseBody != null) {
      print(feedbackProvider.responseBody);
    }
    if (feedbackProvider.errorMessage != null) {
      print(feedbackProvider.errorMessage);
    }
  }

  Widget header() {
    return AppBar(
      backgroundColor: bgColor1,
      centerTitle: true,
      title: Text('Reporting'),
      elevation: 0,
    );
  }

  // Widget roomInput() {
  //   return Container(
  //     margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text(
  //           'Ruangan',
  //           style: blackTextStyle.copyWith(
  //             fontSize: 17,
  //             fontWeight: medium,
  //           ),
  //         ),
  //         const SizedBox(
  //           height: 8,
  //         ),
  //         TextFormField(
  //           controller: roomidController,
  //           decoration: InputDecoration(
  //             hintText: 'Ruangan',
  //             border: OutlineInputBorder(
  //               borderRadius: BorderRadius.circular(14),
  //             ),
  //             contentPadding: EdgeInsets.symmetric(
  //               vertical: 16,
  //               horizontal: 20,
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget deskripsiInput() {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Deskripsi',
            style: blackTextStyle.copyWith(
              fontSize: 17,
              fontWeight: medium,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            controller: descriptionController,
            minLines: null,
            maxLines: null,
            maxLength: 500,
            decoration: InputDecoration(
              hintText: 'Deskripsi',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _imagePicker() {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Gambar',
            style: primaryTextStyle3.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
            ),
            itemCount: _mediaList.length + 1,
            itemBuilder: (context, index) {
              if (index == _mediaList.length) {
                return InkWell(
                  onTap: _pickImage,
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      border: Border.all(color: blackColor),
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.photo,
                      color: Colors.black,
                    ),
                  ),
                );
              } else {
                return Stack(
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Image.file(
                        _mediaList[index],
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 5,
                      right: 5,
                      child: _DeleteImageButton(
                        onPressed: () => _deleteImage(index),
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget sendButton() {
    return Container(
      height: 50,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: TextButton(
        onPressed: () {
          handleReport();
        },
        style: TextButton.styleFrom(
          backgroundColor: blueColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          'Kirim',
          style: primaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      resizeToAvoidBottomInset: false,
      appBar: header(),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            setState(() {
              _mediaList.clear();
              // roomidController.text = '';
              descriptionController.text = '';
            });
          },
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // roomInput(),
                deskripsiInput(),
                _imagePicker(),
                sendButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DeleteImageButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _DeleteImageButton({Key key, @required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.red,
        ),
        padding: EdgeInsets.all(4),
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }
}
