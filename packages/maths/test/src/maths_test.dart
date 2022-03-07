// ignore_for_file: prefer_const_constructors, cascade_invocations
import 'package:flutter_test/flutter_test.dart';
import 'package:maths/maths.dart';

class Binomial {
  Binomial({required this.n, required this.k});

  final num n;
  final num k;
}

void main() {
  group('Maths', () {
    group('calculateArc', () {});
    group('calculateBezierCurve', () {});

    group('binomial', () {
      test('fails if k is negative', () {
        expect(() => binomial(1, -1), throwsAssertionError);
      });
      test('fails if n is negative', () {
        expect(() => binomial(-1, 1), throwsAssertionError);
      });
      test('fails if n < k', () {
        expect(() => binomial(1, 2), throwsAssertionError);
      });
      test('for a specific input gives a correct value', () {
        final binomialInputsToExpected = {
          Binomial(n: 0, k: 0): 1,
          Binomial(n: 1, k: 0): 1,
          Binomial(n: 1, k: 1): 1,
          Binomial(n: 2, k: 0): 1,
          Binomial(n: 2, k: 1): 2,
          Binomial(n: 2, k: 2): 1,
          Binomial(n: 3, k: 0): 1,
          Binomial(n: 3, k: 1): 3,
          Binomial(n: 3, k: 2): 3,
          Binomial(n: 3, k: 3): 1,
          Binomial(n: 4, k: 0): 1,
          Binomial(n: 4, k: 1): 4,
          Binomial(n: 4, k: 2): 6,
          Binomial(n: 4, k: 3): 4,
          Binomial(n: 4, k: 4): 1,
          Binomial(n: 5, k: 0): 1,
          Binomial(n: 5, k: 1): 5,
          Binomial(n: 5, k: 2): 10,
          Binomial(n: 5, k: 3): 10,
          Binomial(n: 5, k: 4): 5,
          Binomial(n: 5, k: 5): 1,
          Binomial(n: 6, k: 0): 1,
          Binomial(n: 6, k: 1): 6,
          Binomial(n: 6, k: 2): 15,
          Binomial(n: 6, k: 3): 20,
          Binomial(n: 6, k: 4): 15,
          Binomial(n: 6, k: 5): 6,
          Binomial(n: 6, k: 6): 1,
        };
        binomialInputsToExpected.forEach((input, value) {
          expect(binomial(input.n, input.k), value);
        });
      });
    });
    group('factorial', () {
      test('fails if negative number', () {
        expect(() => factorial(-1), throwsAssertionError);
      });
      test('for a specific input gives a correct value', () {
        final factorialInputsToExpected = {
          0: 1,
          1: 1,
          2: 2,
          3: 6,
          4: 24,
          5: 120,
          6: 720,
          7: 5040,
          8: 40320,
          9: 362880,
          10: 3628800,
          11: 39916800,
          12: 479001600,
          13: 6227020800,
        };
        factorialInputsToExpected.forEach((input, expected) {
          expect(factorial(input), expected);
        });
      });
    });
  });
}
