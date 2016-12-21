# make Russian letters available for chordpro
# see this issue: https://github.com/sciurius/chordpro/issues/1
# here I use open access DejaVuSans.ttf
chordpro --print-default-config > mycfg.json
sed -i -- 's/"name" : "Times-Roman"/"file" : "DejaVuSans.ttf"/g' mycfg.json
sed -i -- 's/"name" : "Times-Bold"/"file" : "DejaVuSans.ttf"/g' mycfg.json

mkdir pdf

chordpro --cfg mycfg.json --o pdf/all_songs.pdf \
    cho/victor-tsoy-peremen.cho \
    cho/victor-tsoy-peremen1.cho

git config --global user.email "vladimir.yu.kiselev@gmail.com"
git config --global user.name "wikiselev"

git clone -b gh-pages https://${GH_TOKEN}@github.com/${TRAVIS_REPO_SLUG}.git chords

cd chords
git rm -rf *
cp -r ../pdf .
cp -r ../cho .
cp ../mycfg.json .

git add *
git commit -m "build chord pdfs"
git push origin HEAD:gh-pages
