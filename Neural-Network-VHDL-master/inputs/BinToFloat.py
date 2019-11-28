import struct

print('-' * 50)
print('Decodificador de Ponto Fixo')
print('Versao Beta 1.0')
print('-' * 50)
print('')

def bin_float(number, places = 3):
    real = 0
    count = -1
    bin_integer, bin_real = number.split('.')
    
    if bin_integer[0] == '1':
        signal = '-'
    else:
        signal = '+'
    
    integer = int(bin_integer[1:], 2)
    for bin_item in bin_real:
        if int(bin_item) == 1:
            real = real + (2 ** int(count*int(bin_item)))
        count = count - 1

    return signal + str((float(integer) + real))

file_bin = open('bitList.txt', 'r').read().split('\n')
for bin_item in file_bin:
    if bin_item != '':
        print(bin_float(bin_item))