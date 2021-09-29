import 'dart:collection';

/*
 * These are the internal dependencies
 */
import 'package:bstevr_assessment/models/node.dart';

class Tree {
  Node root;

  Tree(this.root);

  /*
   * This is main logic for comparing two trees
   */
  Set<String> compare(Tree other) {
    SplayTreeSet<String> firstElements =
        SplayTreeSet<String>.from(other.toList());
    SplayTreeSet<String> secondElements = SplayTreeSet<String>.from(toList());

    Set<String> difference = firstElements
        .union(secondElements)
        .difference(firstElements.intersection(secondElements));

    print('Output: $difference');

    return difference;
  }

  /*
   * This is recursive generator to reach out all its children
   */
  Iterable<Node> children([Node? node]) sync* {
    node = node ?? root;

    for (var node in node.children) {
      yield node;
      yield* children(node);
    }
  }

  /*
   * This is implementation of similar method we see
   * across data types in Dart (ex. Set -> toList)
   */
  List<String> toList() {
    List<String> elements = [root.value];

    for (var node in children()) {
      elements.add(node.value);
    }

    return elements;
  }
}
