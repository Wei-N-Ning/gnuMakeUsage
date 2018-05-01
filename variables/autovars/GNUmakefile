
foobar.ext: a.txt b.txt b.txt
	echo $(@) $(%) $(<) $(?) $(^) $(+) $(*)
	echo $(@D) $(%D) $(<D) $(?D) $(^D) $(+D) $(*D)
	rm $^

b.txt:
	touch $@

a.txt:
	touch $@

