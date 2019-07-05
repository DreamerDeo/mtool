.PHONY: history regression

history:
	git log --pretty=tformat:"%H	%ae	%ai	%s" -- score/mces.py

regression:
	for i in $$(awk '{print $$1}' data/score/revisions.txt); do \
	  ( cd etc; \
	    [ -d $$i ] || git clone git@github.com:cfmrp/mtool.git $$i; \
	    cd $$i; git checkout $$i; \
	    cd data/score; sbatch ../../../../data/score/test.slurm; ) \
	done

