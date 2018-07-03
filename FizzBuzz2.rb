# Caleb Bernard 2018
f = "FizzBuzz"
puts(
    ((9/4983244r.to_f)
    .to_s[2,15]*7)[0..99]
    .chars
    .map(&:to_i)
    .map{|x|x%4}
    .each_with_index
    .map{|x,i|x==0?i+1:x*-1}
    .map(&:to_s)
    .map{|x|x+"\n"}
    .join
    .gsub("-2",f[0,4])
    .gsub("-1",f[4,4])
    .gsub("-3",f)
)
