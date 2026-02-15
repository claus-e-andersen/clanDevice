# clanDevice
R package for making reports in pdf, png or postscript (ps) format.

All plots produced between openDevice and closeDevice will be output to
the file(s) named in the call to openDevice. Choosing the type="none"
in the call to openDevice redirects the output to the graphical 
window.

When choosing type="png"" (or "png.linux"") all plots are in separate files
numbered junk001.png, junk002.png, junk003.png, etc. if "junk"
is the base file name.

To make pages with text (of tables) please use the function called:

```
txtplot()
```
in the clanLattice package. In particular, take a look at the pdf-files in
the pdfs folder. Here are examples of using txtplot and clanDevice in production 
for automated report making.

Many graphical parameters can be changed in the call to openDevice.

The system of clanDevice and txtplot (clanLattice) has been used by the author for more than 10 years. 

Side effect: a variable called:

```
close.device.wanted
```

is created by the system.

see example in function: 
```
demo.clanDevice()
```

```
clanDevice::openDevice("junk",type="pdf")

  plot(1:10)
  plot(1:20)
  plot(1:30)

clanDevice::closeDevice()
```


Help:
```
help(package=clanDevice)
```

Install:

```
library(devtools)
install_github("claus-e-andersen/clanDevice")
library(clanDevice)

```


