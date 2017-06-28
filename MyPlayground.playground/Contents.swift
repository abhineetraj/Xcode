// Playground to play the games

var number = 2

var isPrime = true

if number != 2 && number != 1
{

for var i = 2; i < number ; i++

{
    if number % i == 0
    {
    isPrime = false
    print( "\(number) is NOT PRIME and is divided by \(i)")
        break;
    }

    else
    if number == i+1
    {
        print("\(number) is a PRIME NUMBER")
        
    }
    
}
}

else
{
print ("Number \(number) is prime")
}

