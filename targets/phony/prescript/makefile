
.PHONY: task
task: prescript
	cat /tmp/_

.PHONY: prescript
prescript:
	df -kh | awk 'NR > 1 { print $$4 }' > /tmp/_

