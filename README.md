# Static rendering test

Repo to try out static rendering in Elm via [`elm-static-html`](https://github.com/eeue56/elm-static-html).

## Basic

The basic version has no dynamic content and uses hand-written CSS. It's compiled with `elm-static-html` at the command line.

## Complex

The more complicated version accepts data from JavaScript and makes use of [`elm-css`](https://github.com/rtfeldman/elm-css/) to generate styles in a nicer way. It's compiled with [`elm-static-html-lib`](https://github.com/eeue56/elm-static-html-lib) via a JS file.
