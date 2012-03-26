i = 1
sum = 0;
while i <= 1000:
  sum += i ** i
  i += 1
s = str(sum)
l = len(s)
print s[l-10:]
