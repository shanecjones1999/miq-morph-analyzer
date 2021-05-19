CORPUS=../../ling073-miq-corpus/miq.legends.web.txt
MORPH=../miq.automorf.bin
RLX=../miq.rlx.bin # you might need to remove ".bin"
TOKENS=`apertium-destxt ${CORPUS} | lt-proc ${MORPH} | apertium-retxt | sed 's/$\W*\^/$\n^/g' | wc -l`
ANALYSES=`apertium-destxt ${CORPUS} | lt-proc ${MORPH} | apertium-retxt | sed 's/$\W*\^/$\n^/g' | cut -f2- -d'/' | sed 's/\//\n/g' | wc -l`
DISAMB=`apertium-destxt ${CORPUS} | lt-proc ${MORPH} | cg-proc ${RLX} | apertium-retxt | sed 's/$\W*\^/$\n^/g' | cut -f2- -d'/' | sed 's/\//\n/g' | wc -l`
AMBIGPRE=`calc $ANALYSES/$TOKENS`
AMBIGPOST=`calc $DISAMB/$TOKENS`
echo "Ambiguity before disambiguation: ${AMBIGPRE}"
echo "Ambiguity after disambiguation: ${AMBIGPOST}"