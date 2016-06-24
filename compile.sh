if [ ${PWD##*/} != "website" ]; then
  exit 1
fi

if [ ! -d "ressources/css" ]; then
  mkdir ressources/css
fi

if [ ! -d "ressources/js" ]; then
  mkdir ressources/js
fi

if [ $# -ge 1 ]; then
  if [ $1 = "all" ]; then
    bash compile.sh index
    bash compile.sh projets
  fi

  if [ $1 = "projets" ]; then
    sass ressources/scss/projets.scss ressources/css/projets.css
    tsc --out ressources/js/projets.js ressources/ts/projets.ts
    pug ressources/pug/projets.pug --out .
  fi

  if [ $1 = "index" ]; then
    sass ressources/scss/index.scss ressources/css/index.css
    tsc --out ressources/js/index.js ressources/ts/index.ts
    pug ressources/pug/index.pug --out .
  fi
fi
