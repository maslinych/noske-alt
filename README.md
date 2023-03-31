## NoSketchEngine corpus search engine with modifications from ALT Linux

This container image provides a NoSketchEngine corpus search engine
tool with interface modifications from the version packaged for ALT
Linux Sisyphus.

NoSketchEngine is an open-source version of the commercial
[SketchEngine tool](https://www.sketchengine.eu/).
Sources and docs for NoSketchEngine can be found at
[https://nlp.fi.muni.cz/trac/noske](https://nlp.fi.muni.cz/trac/noske).

### ALT modifications

Interface changes in comparison to the official NoSketchEngine
release:

* Crystal web frontend: if several attributes are selected for
  display in a concordance, they are displayed below the token in a
  vertically layered manner instead of a slash-separated list.

The modified version of crystal is available in the ALT Linux Sisyphus
repository, see [package
info](https://packages.altlinux.org/en/sisyphus/srpms/crystal-open/)
and [download links](https://packages.altlinux.org/en/sisyphus/srpms/crystal-open/rpms/).

The latest docker tag corresponds to the current version of
the crystal-open package in Sisyphus: `2.130.1-alt4`.

### How to use

This image is based on the acdhch/noske docker container image. It can
be used in the same way as the original image as documented on
[https://hub.docker.com/r/acdhch/noske](https://hub.docker.com/r/acdhch/noske). 

The only difference is that the image name in the commands to run
should be replaced with the name of this image. For example, the
command to run the image on Linux would look like this:

```
docker run --rm -it -v $(pwd)/verticals:/var/lib/manatee/data/verticals -v $(pwd)/configuration-files:/var/lib/manatee/registry -p 8080:8080 -e CORPLIST=my_corpus maslinych/noske-alt:2.130.1-alt4
```

### Credits

Official references for SketchEngine and NoSketchEngine:

* RYCHLÝ, Pavel. Manatee/Bonito-A Modular Corpus Manager. In: RASLAN. 2007. p. 65-70.
* KILGARRIFF, Adam, et al. The Sketch Engine: Ten Years on. Lexicography, 2014, 1.1: 7-36.

The original docker image is created by Omar Siam, sources are available
on github:
[https://github.com/acdh-oeaw/docker-tools-environments](https://github.com/acdh-oeaw/docker-tools-environments).

### Sources

The source for this image is available on github:
[https://github.com/maslinych/noske-alt](https://github.com/maslinych/noske-alt). 


### ChangeLog

* `2.130.1-alt4` 31/03/2023 — Bugfix release

  * FIX: attribute values in layered display will keep their vertical position (layer) 
     when some of the previous attributes are empty
  * FIX: concordance rows now do not shrink vertically on mouse hover

* `2.130.1-alt2` 06/03/2023 — Initial release

