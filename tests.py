#Section 0: Imports
import unittest


#Section 1: The functionality/thing/code you want to test
def kind_of_useless(x):
    return x+3

#Section 2: The test itself
class PlusThreeTest(unittest.TestCase):
    def test(self):
        self.assertEqual(kind_of_useless(3),6)

#Section 3: The line that runs the code
#Not everyone builds this right into the test file

if__name__== '__main__':
    unittest.main()