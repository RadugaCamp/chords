# make Russian letters available for chordpro
# see this issue: https://github.com/sciurius/chordpro/issues/1
# here I use open access DejaVuSans.ttf
chordpro --print-default-config > mycfg.json
sed -i -- 's/"name" : "Times-Roman"/"file" : "DejaVuSans.ttf"/g' *

mkdir pdf

for i in `ls cho`
do
    f=(${i//./ })
    chordpro --cfg mycfg.json --o pdf/$f.pdf cho/$f.cho
done

git add pdf
git commit -m "build chord pdfs"
git push origin
