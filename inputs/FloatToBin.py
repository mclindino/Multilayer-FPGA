import math
import sys

if len(sys.argv) != 2:
    print('Invalid amount of arguments.')
    print('Syntax: python3 FloatToBin.py \n\t\t<-t: Print on terminal | -o: Make bitList.txt file>')
    sys.exit()

print('-' * 50)
print('Codificador de Ponto Fixo')
print('Versao Beta 1.0')
print('-' * 50)
print('')

def float_bin(number, places = 3):
    
    if number < 0:
        signal = '1'
        number = abs(number)
    else:
        signal = '0'
    
    whole, dec = str(number).split('.')
    
    whole = int(whole)
    dec = int(dec)
    res = bin(whole).lstrip("0b") + '.'
    for x in range(places):
        whole, dec = decimal_converter(dec)
        dec = int(dec)
        res += whole
    return signal, res

def decimal_converter(num):
    while num > 1:
        num /= 10
    str_num = ( str(num * 2) + '.0').split('.')
    return str_num[0], str_num[1]

def result(num):
    signal, result = float_bin(num, 8)
    result = result.split('.')

    if len(result[0]) != 8:
        result[0] = ('0' * (8 - len(result[0]))) + result[0]  
    #return (signal + result[0] + '.' + result[1])
    return (signal + result[0] + result[1])

def main():
    input_image = open('input.txt', 'r').read().split('\n')
    weight = open('weight.txt', 'r').read().split('\n')

    if sys.argv[1] == '-t':
        print('Input coding: ')
        for each_input in input_image:
            if each_input != '':
                print(each_input + ': ' + result(float(each_input)))
        print('-' * 50)

        print('Weight coding: ')
        for each_weight in weight:
            if each_weight != '':
                print(each_weight + ': ' + result(float(each_weight)))
        print('-' * 50)

    elif sys.argv[1] == '-o':
        print('Fie output: bitList.txt')
        out_input = open('bitList.txt', 'w')
        for each_input in input_image:
            if each_input != '':
                out_input.write(result(float(each_input)) + '\n')
        for each_weight in weight:
            if each_weight != '':
                out_input.write(result(float(each_weight)) + '\n')
    else:
        print('Invalid argument...\nExiting program...')
        sys.exit()

if __name__ == '__main__':
    main()