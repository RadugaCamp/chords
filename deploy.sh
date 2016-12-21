# clone the repository to the book-output directory
git clone -b gh-pages \
  https://${GH_TOKEN}@github.com/${TRAVIS_REPO_SLUG}.git \
  chords
cd chords
cp -r ../pdf/* .
git add *
git commit -m "build chord pdfs"
git push origin HEAD:gh-pages
