import 'package:flutter/material.dart';

class final_input_title extends StatefulWidget {
  final_input_title({
    Key? key,
    this.title,
    this.message,
    this.enabled,
    this.bg_color,
    this.border_color,
    this.focused_color,
    this.imIcon_box,
    this.isTitle,
    this.isMessage,
    this.isEnabled,
    this.isIcon,
    this.isError,
    this.hinttext_,
    this.text_inject,
    this.listen_mode,
    this.export_data,
    this.listen_pulse,
  }) : super(key: key);

  final String? title;
  final String? message;
  final bool? enabled;
  final Color? bg_color;
  final Color? border_color;
  final Color? focused_color;
  final String? imIcon_box;
  final String? hinttext_;
  final String? text_inject;
  bool? listen_mode;
  Function? export_data;
  Function? listen_pulse;

  final bool? isTitle;
  final bool? isMessage;
  final bool? isEnabled;
  final bool? isIcon;
  final bool? isError;

  @override
  _final_input_titleState createState() => _final_input_titleState();
}

class _final_input_titleState extends State<final_input_title> {
  TextEditingController _txt =
      new TextEditingController(); //<-----------------------

  @override
  Widget build(BuildContext context) {
    String _title;
    _title = widget.title ?? "TITLE";
    String _message;
    _message = widget.message ?? "MESSAGE";

    // enabled title
    bool _isTitle;
    _isTitle = widget.isTitle ?? false;

    List<Widget> _isTitleList = [];
    if (_isTitle) {
      _isTitleList = [
        Container(
          height: 12,
          margin: EdgeInsets.only(bottom: 4),
          child: Text(_title,
              style: TextStyle(
                fontFamily: 'Mitr',
                color: Color(0xff666666),
                fontSize: 10,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                letterSpacing: 0,
              )),
        ),
        Spacer(),
      ];
    } else {
      _isTitleList = [];
    }

    // enabled message
    bool _isMessage;
    _isMessage = widget.isMessage ?? false;

    List<Widget> _isMessageList = [];
    if (_isMessage) {
      _isMessageList = [
        Container(
          // width: 30,
          height: 16,
          margin: EdgeInsets.only(top: 5),
          child: Text(_message,
              style: TextStyle(
                fontFamily: 'Mitr',
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w300,
                fontStyle: FontStyle.normal,
                letterSpacing: 0,
              )),
        ),
        Spacer(),
      ];
    } else {
      _isMessageList = [];
    }

    List<Widget> _title_box = _isTitleList;

    List<Widget> _message_box = _isMessageList;

    return Container(
      width: 208,
      height: 80,
      child: Column(
        children: [
          Container(
            // height: 20,
            child: Row(
              children: _title_box,
            ),
          ),
          box_complete(_txt), //<------------------------------ txt
          Container(
            height: 20,
            child: Row(
              children: _message_box,
            ),
          )
        ],
      ),
    );
  }

  Widget box_complete(TextEditingController _txt) {
    //<----------------------
    bool _enabled;
    _enabled = widget.enabled ?? true;
    Color _bg_color;

    Color _border_color;
    _border_color = widget.border_color ?? Color(0xffe5e5e5);
    Color _focused_color;
    _focused_color = widget.focused_color ?? Color(0xff000000);
    String _imIcon_box;
    _imIcon_box = widget.imIcon_box ?? "assets/icons/icon-search@3x.png";

    //isError
    bool _isError;
    _isError = widget.isError ?? false;

    if (_isError) {
      _border_color = Color(0xFFdb4c41);
      _focused_color = Color(0xFFdb4c41);
    } else {
      _border_color = widget.border_color ?? Color(0xffe5e5e5);
      _focused_color = widget.focused_color ?? Color(0xff000000);
    }

    //Hinttext

    String _hinttext_;
    _hinttext_ = widget.hinttext_ ?? "Text";

    // enabled icon box
    bool _isIcon;
    _isIcon = widget.isIcon ?? false;

    Padding _isIconPadding_true = Padding(
        padding: const EdgeInsetsDirectional.only(
            end: 12.0, start: 12.0, top: 8.0, bottom: 8.0),
        child: Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                _imIcon_box,
              ),
            ),
          ),
        ));

    Container _isIconPadding_false = Container(
      width: 1,
      height: 1,
    );
    var _isIconShow;
    if (_isIcon) {
      _isIconShow = _isIconPadding_true;
    } else {
      _isIconShow = _isIconPadding_false;
    }

    Function _export_data = widget.export_data ?? (String nodata) {};

    String _text_inject;
    _text_inject = widget.text_inject ?? "";

//================================================================== //<----------------------
    bool _listen_mode;
    _listen_mode = widget.listen_mode ?? false;
    if (_listen_mode) {
      _txt.text = _text_inject;
      _bg_color = Color(0xfff2f2f2);
    } else {}

    if (_enabled) {
      _bg_color = widget.bg_color ?? Color(0xffffffff);
    } else {
      _bg_color = Color(0xfff2f2f2);
    }

    Function _listen_pulse = widget.listen_pulse ?? () {};

//==================================================================
    return Container(
        width: 208,
        height: 40,
        child: TextFormField(
          onTap: () {
            setState(() {
              _listen_pulse();
            });
          },
          onChanged: (value) {
            setState(() {
              _export_data(value);
            });
          },
          controller: _txt, //<------------------------------------
          cursorColor: Colors.black,
          enabled: _enabled,
          decoration: InputDecoration(
            filled: true,
            fillColor: _bg_color,
            contentPadding: EdgeInsets.fromLTRB(10, 8, 10, 8),
            hintText: _hinttext_,
            hintStyle: TextStyle(
              fontFamily: 'Mitr',
              color: Color(0xffb2b2b2),
              fontSize: 16,
              fontWeight: FontWeight.w300,
              fontStyle: FontStyle.normal,
              letterSpacing: 0,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: _border_color, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: _focused_color, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            suffixIcon: _isIconShow,
          ),
        ));
  }
}
