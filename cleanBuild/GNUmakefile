lib_treasureV1 := treasureV1
lib_treasureV2 := treasureV2
lib_middleManA := middleManA
lib_middleManB := middleManB

middleManA_all := $(lib_middleManA) $(lib_treasureV1)
middleManB_all := $(lib_middleManB) $(lib_treasureV2)
libraries := $(middleManA_all) $(middleManB_all)

app_client := client

.PHONY: all $(app_client) $(libraries)
all: $(app_client)

$(app_client) $(libraries):
	$(MAKE) --directory=$(@)

$(app_client): $(libraries)
$(lib_middleManA): $(lib_treasureV1)
$(lib_middleManB): $(lib_treasureV2)
