define setUp
rm -rf /tmp/gmp
mkdir /tmp/gmp
for d in `seq 1 4`; do mkdir /tmp/gmp/$$d; done
ls -l /tmp/gmp
endef

__:
	@echo $(shell ls ../)
	@echo $(sort $(shell ls /tmp))
	@echo $(shell /usr/bin/env python -c "import os;print(os.environ['HOME'])")
	@echo $(shell rm -rf /tmp/gmp)
	@echo $(shell mkdir /tmp/gmp)
	@echo $(shell for d in `seq 1 4`; do mkdir /tmp/gmp/$$d; done)
	@echo $(shell ls -l /tmp/gmp)

