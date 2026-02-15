# clanDevice
R package for making reports in pdf, png or postscript (ps) format.

see example in function:  demo.clanDevice()


clanDevice::openDevice("junk",type="pdf")

print(plot(1:10))
print(plot(1:20))
print(plot(1:30))

clanDevice::closeDevice()


Help:
help(package=clanDevice)

Install:

library(devtools)
install_github("claus-e-andersen/clanDevice")


