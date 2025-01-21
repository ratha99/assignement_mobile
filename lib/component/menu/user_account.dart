import 'package:ebook_ui_assignment/component/langguage_translate.dart';
import 'package:ebook_ui_assignment/language/language.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class UserAccount extends StatefulWidget {
  
  @override
  State<UserAccount> createState() => _UserAccountState();
}

class _UserAccountState extends State<UserAccount> {
  String url = "https://cdn-icons-png.flaticon.com/512/149/149071.png";
 Language _lang = Khmer();
  @override
  Widget build(BuildContext context) {
     _lang = context.watch<LanguageLogic>().lang;
    return Scaffold(
      appBar: AppBar(
        title: Text(_lang.useracco),
        ),
      body: _buildBody(),
    );
  }

  // Widget _buildBody(){
  Widget _buildBody() {
  return LayoutBuilder(
    builder: (context, constraints) {
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: constraints.maxWidth,
            minHeight: constraints.maxHeight,
          ),
          child: IntrinsicHeight(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _profileImage(url),
                _buildTextInput(_lang.fullname, _lang.fullnametype),
                _buildTextInput(_lang.phone, _lang.phonetype),
                _buildTextInput(_lang.email, _lang.emailtype),
                Spacer(), // Spacer dynamically adjusts space
                _buildButton(),
                _buildTextDelete(),
              ],
            ),
          ),
        ),
      );
    },
  );
}

    Widget _profileImage(String img){
      return Center(
        child: Container(
          width: 140,
          height: 140,
          margin: EdgeInsets.only(top: 40, bottom: 5),
          decoration: BoxDecoration(
            
            border: Border.all(color: Colors.white, width: 5),
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, Colors.white],
            ),
            image: DecorationImage(
              image: NetworkImage(url),
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    }

    Widget _buildTextInput(String txtLabel, String txtHint) {
      return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 5),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(7)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white,
            Colors.white,
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 12, top: 5, bottom: 0),
            child: Text(
              txtLabel,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
          TextField(
            style: TextStyle(fontSize: 16),
            decoration: InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide.none),
              hintText: txtHint,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 12.0),
            ),
          ),
        ],
      ),
          );
  }

  Widget _buildButton() {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.yellow[600],   
          padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        onPressed: () {},
        label: Text(_lang.save, style: TextStyle(color: Colors.white),),
      ),
    );
  }

  Widget _buildTextDelete(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.delete, color: Colors.red, size: 18,),
          Text('Delete Account', style: TextStyle(color: Colors.red, decoration: TextDecoration.underline,),
          ),
        ],
      ),
    );
  }
}