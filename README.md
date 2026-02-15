# clanDevice
R package for making reports in pdf, png or postscript (ps) format.

All plots produced between openDevice and closeDevice will be output to
the file(s) named in the call to openDevice. Choosing the type="none"
in the call to openDevice redirects the output to the graphical 
window. The closeDevice is essentially just a dev.off() call. closeDeviceAll()
closes all devices.

When choosing type="png"" (or "png.linux"") all plots are then output
to separate files numbered sequentially like junk001.png, junk002.png, 
junk003.png, etc. if "junk" is the base file name.

To make pages with text (of tables) please use the function called:

```
txtplot()
```
in the clanLattice package. In particular, take a look at the pdf-files in
the pdfs folder for that package. Here are examples of using txtplot and clanDevice in 
production for automated report making. The report generating tools provided by txtplot 
(clanLattice) and the code now (2026) implemented in clanDevice have been used by the 
author since 2006! It actually works. 

Many graphical parameters can be changed in the call to openDevice.


Side effect: a variable called:

```
close.device.wanted
```

is created by the system.

see example in function: 
```
demo.clanDevice()

```

Three plots can be made into a 3-page pdf-report as follows: 
```
clanDevice::openDevice("junk",type="pdf")

  plot(1:10)
  plot(1:20)
  plot(1:30)

clanDevice::closeDevice()
```
To get the same as png-files (sequentially numbered aj junk001.png, junk002.png, and 
junk003.png) such that they can be imported into, for example, Microsoft 
Powerpoint use:

```
clanDevice::openDevice("junk",type="png")

  plot(1:10)
  plot(1:20)
  plot(1:30)

clanDevice::closeDevice()
```
To get the same output to the graphical screen, just comment out the
openDevice call or set type to "none":

```
clanDevice::openDevice("junk",type="none")

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


