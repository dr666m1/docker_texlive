# concept
this docker image enables you to compile `.tex` file to `.pdf` or `.png`.

since it is hosted as public container image, so you can use it immediately.

# usage
## basic usage
run the command below.
target `.tex` file must be in the current directory.

```
docker container run --rm -it -v $(pwd):/home/app/sync ghcr.io/dr666m1/texlive
```

you can compile several files at once.
the output is `.pdf` file.

## option
you can change the output by `-o` option.

- `png`... only `.png` file will be saved.
- `all`... all files (including `.log` `.aux` and so on) will be saved.

`all` is useful for debagging.

# example
save this code as `sample.tex`
(`\pagestyle{empty}` is important to compile as `.png`).

```tex
\documentclass{jlreq}
\pagestyle{empty}
\usepackage{mathtools,amssymb,bm}
\begin{document}
\begin{align*}
\documentclass{jlreq}
\pagestyle{empty}
\usepackage{mathtools,amssymb,bm}
\begin{document}
\begin{align*}
  f(\bm{x} \mid \mu, \sigma^2) &= \prod^{n}_{i=1} f(x_{i} \mid \mu, \sigma^2) \\
                               &= \prod^{n}_{i=1} \frac{1}{\sqrt{2\pi}\sigma} \exp \left[ \frac{-1}{2\sigma^2}(x - \mu)^2 \right]
\end{align*}
\end{document}
\end{align*}
\end{document}
```

then run the command below in the same directory.

```
docker container run --rm -it -v $(pwd):/home/app/sync ghcr.io/dr666m1/texlive -o png
```

a `.png` file will be saved as `sample_crop-1.png` (`1` means the page number).
<div align=center>
<img src="https://user-images.githubusercontent.com/26474260/103202908-12100200-4937-11eb-9d34-5ec03ba9c7c6.png" width=300px>
</div>
