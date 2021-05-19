require "zlib"
rng = Random.new(10)

poem = "it's a double bonanza for the quick pistols of a twilight riot.
on his deathbed, he saw him vs. the outlaw was blatantly arrogance. 
a decade of pushing comestibles to the loci all of it was bound, all to be got rid of.
he had a pallid hue, and he got into a coughing fit - he was unwell.
'get in the bathtub! get in the bunks!'
we are united by moguls, we die for properties.
the numskull reimposed the itching of completed times, 
all his burliness unmade in the purging of cadavers, his items grasped by a pirate mob.
'the poignancy of drunks,' one of the mob did openly exclaim, 'is, we are drunk, but we are pals,
and we launched a war and the moguls are marred. so get the icebox now, 
i'm not hashing out the concepts at the ovum of our games.
out of all, my mug is by far the bushier! 
i'm not at all aching to say all the precepts, to unpack the organs of our opuses.
if we are harmed, we are harmed. but if the decree is, we are to hang for all we did:
in the end, we are exorcised, we are the tipsiest!'
so he miaowed, blinking at the pushcarts of the semi- brunches the hijacking tithed - ale addled, pig plumped. 
'diplomas are not for me. i am penning the signal of a hooligan. 
the nobles are our longhorns!' he roars - he is a rhino, but squiggled.
the mob is tangibly, mannishly heroic, 
a restart to brutalize the auditoria of all us squirming for the diadem of human beauty.
it's all loanwords, nursed in boyhoods, all the poisonings of the pram -
all the aches a man is born in, and if he is gruff in his phrasings, it's why.
you and i are but hobbyists in the sunset of the hoopla.
to put it mildly, the ovum of our husbands' babble is all the blundered downturns.
i am disabused of the neural palaver of my avuncular audience.
the beauty of the nuclear is, it's potent, but universally hid in the burnooses of our niches,
in lieu of the big blowup we armed."

puts Zlib::Inflate.inflate(poem.downcase.gsub(/[\W&&[^\s]]/, "").split(" ").select{ |x| x.length > 3 }.join.gsub(/\s/, "").chars.select.with_index { |_, i| i % 3 == 0 }.join.chars.map { |x| "0123456789abcdef"[("a".."z").to_a.select{ |x| "cfjkqvwxyz".chars.find_index(x) == nil }.shuffle(random: rng).find_index(x)] }.join.scan(/../).map { |x| x.hex.chr }.join)
