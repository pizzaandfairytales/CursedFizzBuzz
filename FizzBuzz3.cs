// Emory May Bernard 2021

using System;
using System.Collections.Generic;
using System.Linq;

namespace fb
{
    class Program
    {
        static void Main()
        {
          // our only constant.
          const string f = "FizzBuzz";
          var myVariable = f.Distinct().ToList().IndexOf(f.Distinct().Last());
          var myList = Enumerable.Range((int)Math.Sqrt(myVariable), (int)(Math.Pow(myVariable, myVariable) * Math.Pow(myVariable, myVariable)))
                                 .Where(x => Enumerable.Range((int)Math.Sqrt(myVariable), (int)Math.Sqrt(x) - (myVariable/myVariable))
                                        .All(y => x % y != (myVariable-myVariable)))
                                 .ToList();

          // gotta initialize it to something! the compiler has no faith.
          decimal rate = myVariable;
          for(int x = (myVariable - myVariable); x < myList.Count; x += myVariable / myVariable){
            if (myList.IndexOf(x + (myVariable/myVariable)) > (myVariable-myVariable) && 
                myList.IndexOf(x + (myVariable/myVariable)) + (myVariable/myVariable) > Math.Pow(myVariable, myVariable) / Math.Sqrt(myVariable)){
              rate = ((decimal)(myList[x] * myList[myVariable - (myVariable/myVariable)]) / 
                      (decimal)(Math.Pow((myVariable + myVariable + Math.Sqrt(myVariable)), myVariable)));
              break;
            }
          }

          // why not add some random numbers to our essential equations?
          var rng = new Random();
          decimal value = (decimal)rng.NextDouble();
          int extra = rng.Next((int)(Math.Pow((double)rate, myVariable)), (int)(Math.Pow((double)rate, f.IndexOf(f.Distinct().Last()))));

          var nums = new List<int>();
          for (int x = (myVariable - myVariable); 
               x < (Math.Pow(myVariable + myVariable + Math.Sqrt(myVariable), Math.Sqrt(myVariable))) + extra; 
               x += myVariable / myVariable){
            // value is a random double, so who knows what this works out to!
            value = rate * value * ((myVariable / myVariable) - value);
            if (x >= extra){
              // let it loop a random number of times, then start paying attention.
              nums.Add((int)(decimal.Round(value, myVariable) * (decimal)Math.Pow((myVariable + myVariable + Math.Sqrt(myVariable)), myVariable)));
            }
          }

          nums = nums.Select((y, i) => y == nums[i] && y > extra ? i + (myVariable / myVariable) % nums.Distinct().Count() : y).ToList();

          // let's see what we wound up with.
          for (int x = (myVariable - myVariable); x < nums.Count; x += myVariable / myVariable){
            string res = "";
            if (nums[x] % (myVariable - (myVariable / myVariable)) == (myVariable - myVariable)){
              res += f.Substring(myVariable - myVariable, myVariable);
            }
            if (nums[x] % (myVariable + myVariable / myVariable) == (myVariable - myVariable)){
              res += f.Substring(myVariable);
            }
            if (res == ""){
              res = (x + myVariable / myVariable).ToString();
            }
            // hopefully fizzbuzz??
            Console.WriteLine(res);
          }

        }
    }
}
