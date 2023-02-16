String getRouteName(String name) {
  // String st = name.replaceAll('_', ' en ');
  var a = name.split('_')
    ..map((e) => capitalize(str: e))
    ..toList();

  String res = a.join(' en ')..replaceAll('epites', 'épites');
  return res;
}

String capitalize({required String str}) =>
    str[0].toUpperCase() + str.toLowerCase();
