List<String> formatAliasList(List<String> aliasList) {
  if (aliasList.isEmpty) return [];

  return aliasList.map(_cleanAlias).toList();
}

String _cleanAlias(String alias) {
  // Remove content within parentheses.
  alias = alias.replaceAllMapped(_parenthesesPattern, (match) => '');

  // Remove words followed by "by" (including "by").
  alias = alias.replaceAllMapped(_byPattern, (match) => '');

  return alias.trim();
}

final RegExp _parenthesesPattern = RegExp(r'\([^)]*\)');
final RegExp _byPattern = RegExp(r'\s*by\s*\w+');
