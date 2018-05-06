__:
	rm -f /tmp/afile
	touch /tmp/afile
	echo $(filter a%, $(shell ls /tmp))
