  static class LogisticMap{   
    public static void Run(){
      ScanPeriods();
    }
    
    static int TestPeriod(decimal rate){
        decimal value = 0.5M;
        var history = new List<decimal>();
        //10.Times(() => {value = LM(value, rate);});
        100.Times(() => {value = LM(value, rate);value = decimal.Round(value, 20); history.Add(value);});
        int period = TestPeriodicity(history);
        //Console.WriteLine(period);
        return period;
    }
    
    static void ScanPeriods(){
      var found = new Dictionary<int, BigDecimal>();
      var seek = -2;
      bool done = false;
      int check = 0;
      var increase = new BigDecimal("0.0001");
      BigDecimal rate = new BigDecimal("3.5001");
      int totalChecks = (int)((rate - 3) / increase);
      int onePercentChecks = totalChecks / 100;
      
      while (!done && rate <= 4){
        int period = 0;//TestPeriod(rate);
        if (period == seek){
          done = true;
          Console.WriteLine("Period {0}: {1}", seek, rate);
        }
        
        if (period > 0 && !found.ContainsKey(period)){
          found.Add(period, rate);
        }
        
        check++;
        if (check % onePercentChecks == 0){
          Console.WriteLine("Checked: {0}%, found {1} cycles so far.", check/onePercentChecks, found.Count);
        }
        rate += increase;
      }
      Console.WriteLine("Found: {0} cycles", found.Count);
      var sortedKeys = found.Keys.ToArray().OrderBy(x => x);
      var output = new List<string>();
      foreach (var x in sortedKeys){
        output.Add("Period " + x + ": " + found[x]);
        Console.WriteLine("Period {0}: {1}", x, found[x]);
      }
      File.WriteAllLines("Stored.txt", output);
    }
    
    static int TestPeriodicity(List<decimal> history){
      int precision = 10;
      bool foundPeriod = false;
      int period = 0;
      while (precision >= 1 && foundPeriod == false){
        var result = Periodicity(history, precision);
        if (result > 0 && foundPeriod == false){
          foundPeriod = true;
          period = result;
        }
        precision--;
      }
      return period;
    }
    
    static int Periodicity(List<decimal> history, int precision){
      decimal start = history[0];
      var matchIndices = new List<int>();
      for (int x = 0; x < history.Count; x++){
        if (CloseEnough(start, history[x], precision)){
          matchIndices.Add(x);
        }
      }
      int period = 0;
      // we know it's at least 1 since the start matches itself. For aperiodic behavior, this block simply won't trigger
      if (matchIndices.Count > 2){
        for (int x = 1; x < matchIndices.Count; x++){
          if (period == 0){
            period = matchIndices[x] - matchIndices[x-1];
          } else {
            if (matchIndices[x] - matchIndices[x-1] != period){
              return 0;
            }
          }
        }
      }
      else {
        return 0;
      }
      return period;
    }
    
    static bool CloseEnough(decimal first, decimal second, int precision){
      first = decimal.Round(first, precision);
      second = decimal.Round(second, precision);
      return first == second;
    }
    
    static decimal LM(decimal value, decimal rate){
      return rate * value * (1 - value);
    }
  }
