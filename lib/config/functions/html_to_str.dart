import 'package:html/parser.dart';

String parseHtmlString(String htmlString) {
//! usage : convert the description of product from HTML format to normal String 
final document = parse(htmlString);
final String parsedString = parse(document.body!.text).documentElement!.text;

return parsedString;
}

