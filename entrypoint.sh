#!/bin/bash
if [[ ${1#--} == "help" ]]; then
    echo "open 'http://localhost:8080/doc.pdf' below to see the pdf document."
    python3 -m http.server 8080 -d $HOME/build > /dev/null
    exit 0
fi

mkdir -p $HOME/tmp
cp $HOME/sync/*.tex $HOME/tmp
cd $HOME/tmp
latexmk

while getopts o: OPT; do
    case $OPT in
        o )
            files=$(find . -maxdepth 1 -type f -name '*.pdf')
            for f in $files; do
                pdfcrop --margins 3 $f ${f%.pdf}_crop.pdf
                pdftocairo -png -scale-to 200 -transp ${f%.pdf}_crop.pdf
            done
            if [[ ${OPTARG#=} == "png" ]]; then
                cp $HOME/tmp/*.png $HOME/sync
                exit 0
            elif [[ ${OPTARG#=} == "all" ]]; then
                cp * $HOME/sync
            fi
            exit 0
        ;;
        \? ) exit 1;;
    esac
done

cp $HOME/tmp/*.pdf $HOME/sync

