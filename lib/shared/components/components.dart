import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:news_app/modules/news_app/news_view/news_view.dart';

Widget defaultButton({
  Color buttonColor = Colors.cyanAccent,
  double height = 30,
  double width = double.infinity,
  @required String text,
  @required Function function,
  TextStyle textStyle = const TextStyle(
      color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
  double radius = 0,
}) =>
    Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: buttonColor,
      ),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          text,
          style: textStyle,
        ),
      ),
    );

Widget defaultTextFormField({
  bool enabled = true,
  Function onTab,
  Function onChange,
  Function onSubmited,
  @required String hintText,
  String labelText,
  @required IconData prefixIcon,
  Widget suffixIcon,
  Color textColor,
  Color hintColor,
  Color prefixIconColor = Colors.grey,
  Color suffixIconColor = Colors.grey,
  TextStyle hintStyle,
  TextStyle textStyle,
  TextEditingController controller,
  Function validatorFunction,
  double borderRadius = 0,
  Color borderColor = Colors.grey,
  double borderSize = 1,
  bool hidden = false,
  TextInputAction textInputAction,
  TextInputType textInputType,
  bool autoCorrect = false,
  int maxLines = 1,
  TextDirection textDirection,
  Key textFieldKey,
  Color cursorColor,
  int maxLength,
  double height = 60,
  bool isDense = false,
  contentPadding = const EdgeInsets.symmetric(vertical: 10),
}) =>
    Container(
      height: height,
      child: TextFormField(
        autocorrect: autoCorrect,
        maxLines: maxLines,
        key: textFieldKey,
        cursorColor: cursorColor,
        maxLength: maxLength,
        textInputAction: textInputAction,
        keyboardType: textInputType,
        enabled: enabled,
        obscureText: hidden,
        style: textStyle,
        controller: controller,
        validator: validatorFunction,
        onTap: onTab,
        onChanged: onChange,
        onFieldSubmitted: onSubmited,
        decoration: InputDecoration(
          errorStyle: const TextStyle(fontSize: 0.01),
          // contentPadding: EdgeInsets.symmetric(vertical: 10),
          labelText: labelText,
          isDense: isDense,
          hintText: hintText,
          hintStyle: hintStyle,
          prefixIcon: Icon(
            prefixIcon,
            color: prefixIconColor,
          ),
          suffix: suffixIcon,

          border: OutlineInputBorder(
            borderSide: BorderSide(width: borderSize, color: borderColor),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: borderSize, color: borderColor),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: borderSize, color: borderColor),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
    );


Widget buildFullScreen(list, {bool isSearch = false}) {
  return Scaffold(
      body: ConditionalBuilder(
    condition: list != null && list.length > 0,
    builder: (context) => ListView.builder(
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () => doWidgetNavigation(
              context,
              NewsWebView(
                url: list[index]["url"],
              )),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(
                          list[index]["urlToImage"] != null
                              ? list[index]["urlToImage"]
                              : "https://cdn.dribbble.com/users/27766/screenshots/3488007/media/ac55b16291e99eb1740c17b4ac793454.png",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          list[index]["title"] != null
                              ? "${list[index]["title"]}"
                              : "There were no title in this article",
                          style: Theme.of(context).textTheme.subtitle1,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          list[index]["description"] != null
                              ? "${list[index]["description"]}"
                              : "There were no Description in this article",
                          style: Theme.of(context).textTheme.caption,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          list[index]["publishedAt"] != null
                              ? "${list[index]["publishedAt"]}"
                              : "Nothing",
                          style: TextStyle(fontSize: 9, color: Colors.grey),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
      itemCount: list.length,
    ),
    fallback: (context) => isSearch
        ? Container()
        : Center(
            // child: Text("Business Screen"),
            child: CircularProgressIndicator(),
          ),
  ));
}

doNamedNavigation(BuildContext context, String routeName) =>
    Navigator.pushNamed(context, routeName);

doWidgetNavigation(BuildContext context, Widget screen) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));

doReplacementWidgetNavigation(BuildContext context, Widget screen) =>
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => screen));

enum SnackBarStates { SUCCESS, ERROR, WARNING }

Color chooseSnackBarColor(SnackBarStates states) {
  Color color;
  switch (states) {
    case SnackBarStates.ERROR:
      color = Colors.red;
      break;
    case SnackBarStates.WARNING:
      color = Colors.amber;
      break;
    case SnackBarStates.SUCCESS:
      color = Colors.green;
      break;
  }
  return color;
}

showSnackBar({
  @required BuildContext context,
  @required String message,
  @required SnackBarStates states,
  int seconds = 2,
}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    duration: Duration(seconds: seconds),
    backgroundColor: chooseSnackBarColor(states),
  ));
}
