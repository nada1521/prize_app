import 'dart:io';

void main() {
  final directory = Directory.current;
  convertTextStylesInDirectory(directory);
}

void convertTextStylesInDirectory(Directory dir) {
  final dartFiles = dir
      .listSync(recursive: true)
      .where((f) => f is File && f.path.endsWith('.dart'))
      .cast<File>();

  for (final file in dartFiles) {
    final oldContent = file.readAsStringSync();
    String newContent = oldContent;

    // نبدل style: Theme.of(context).textTheme.xxx --> style: Theme.of(context).textTheme.xxx
    newContent = newContent.replaceAllMapped(
      RegExp(r'textStyle:\s*AppTextStyles\.([a-zA-Z0-9_]+)'),
      (match) => 'style: Theme.of(context).textTheme.${match[1]}',
    );

    // نبدل style: Theme.of(context).textTheme.xxx --> style: Theme.of(context).textTheme.xxx
    newContent = newContent.replaceAllMapped(
      RegExp(r'style:\s*AppTextStyles\.([a-zA-Z0-9_]+)'),
      (match) => 'style: Theme.of(context).textTheme.${match[1]}',
    );

    if (oldContent != newContent) {
      print('✅ Modified: ${file.path}');
      file.writeAsStringSync(newContent);
    }
  }

  print('\n🎉 Done replacing AppTextStyles with Theme.of(context).textTheme');
}
