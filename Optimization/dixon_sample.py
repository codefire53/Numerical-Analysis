import random

domain = [i for i in range(-10, 12, 2)]
#domain = [1]
def sample(n):
	ret = []
	for i in range(50):
		ret.append(random.sample(domain, 1)[0])
	return ret


lel = sample(50)

# math format
print('(', end='')
for i in lel:
	print(i, end=', ')
print(')')

# octave format
print('[', end='')
for i in lel:
	print(i, end='; ')
print(']')