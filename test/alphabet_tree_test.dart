// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

/*
 * These are the internal dependencies
 */
import 'package:bstevr_assessment/models/tree.dart';
import 'package:bstevr_assessment/models/node.dart';

void main() {
  group('Alphabet Tree -> ', () {
    /*
     * Because we don't have parameterized tests in Flutter similar to Jest
     * We are simulating same functionality by creating helper logic
     * For more information about parameterized tests in Jest see:
     * https://jestjs.io/docs/api#testeachtablename-fn-timeout
     */
    void checkCompareFunction(Tree tree, Tree other, Set<String> expected) {
      test('Comparing ${tree.toList()} with ${other.toList()} should return ${expected.toList()}', () {
        expect(tree.compare(other), expected);
      });
    }

    /*
     * There are 3 test cases for our class Tree
     */
    checkCompareFunction(Tree(Node('Q', [
      Node('W', [
        Node('B'),
        Node('G')
      ]),
      Node('I'),
      Node('R', [
        Node('Y'),
        Node('K')
      ]),
    ])), Tree(Node('K', [
      Node('C', [
        Node('A')
      ]),
      Node('J', [
        Node('U', [
          Node('Q')
        ])
      ]),
      Node('G', [
        Node('R')
      ]),
    ])), {'A', 'B', 'C', 'I', 'J', 'U', 'W', 'Y'});

    checkCompareFunction(Tree(Node('B', [
      Node('J', [
        Node('B'),
        Node('A'),
        Node('V')
      ]),
      Node('F'),
      Node('Q', [
        Node('H'),
        Node('J')
      ]),
    ])), Tree(Node('Q', [
      Node('A', [
        Node('H'),
        Node('Z')
      ]),
      Node('C', [
        Node('J'),
        Node('F')
      ]),
    ])), {'B', 'C', 'V', 'Z'});

    checkCompareFunction(Tree(Node('T', [
      Node('G', [
        Node('N')
      ]),
      Node('S', [
        Node('G'),
        Node('N')
      ]),
      Node('F', [
        Node('B', [
          Node('I'),
          Node('P')
        ])
      ]),
    ])), Tree(Node('Z', [
      Node('V'),
      Node('P'),
      Node('H', [
        Node('F', [
          Node('X'),
          Node('R'),
        ]),
        Node('N'),
      ]),
      Node('R'),
    ])), {'B', 'G', 'H', 'I', 'R', 'S', 'T', 'V', 'X', 'Z'});
  });
}
