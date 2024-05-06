const String baseSvgPath = 'assets/svgs/';
const String basePngPath = 'assets/pngs/';
const String baseJsonPath = 'assets/json/';
const String baseMapStylePath = 'assets/';

// app icon
final String appIcon = 'app-icon'.png;


//Jsons

// extensions
extension ImageExtension on String {
  // png paths
  String get png => '$basePngPath$this.png';
  // svgs path
  String get svg => '$baseSvgPath$this.svg';
  //Json style
  String get json => '$baseJsonPath$this.json';
}
