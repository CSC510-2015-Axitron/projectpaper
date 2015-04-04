README.md : ./src/*.md
	@for doc in $^; \
	do \
	    echo '\n\n' >> $${doc}; \
	    perl -0 -i -pe 's/\n+\Z/\n\n/' $${doc}; \
	done;
	cat $^ > $@
