





#python
# import random
# import string
# import os.path
# import jsonpickle
# import getopt
# import sys
#
# n = 5
# f = "data/groups.json"
#
#   def random_string(prefix, maxlen):
#       symbols = string.ascii_letters + string.digits + string.punctuation + " "*10
#   return prefix + "".join([random.choice(symbols) for i in range(random.randrange(maxlen))])
#
#
#   testdata = [Group(name="", header="", footer="")] + [
#       Group(name=random_string("name", 10), header=random_string("header", 20), footer=random_string("footer", 20))
#   for i in range(n)
#     ]
#
#     file = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", f)
#
#     with open(file, "w") as out:
#                                 jsonpickle.set_encoder_options("json", indent=2)
#     out.write(jsonpickle.encode(testdata))