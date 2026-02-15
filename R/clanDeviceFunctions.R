
#' @title openDevice
#' @description  Open device for printing a report
#'
#' @param grand.plotfilename = "junk"
#' @param type  ="png","png.linux", "pdf", "ps", or "none"
#' @param png.fac = 1.5 (scaling factor for png)
#' @param png.width = ng.fac*20 (width)
#' @param png.height = png.fac*13 (height)
#' @param png.res = 600 (resolution)
#' @param png.bg = "white" (lightgray or pink are also good background colors)
#' @param png.family = "arial" (font)
#' @param png.type = c("windows", "cairo", "cairo-png")[2] on Windows
#' @param png.restoreConsole = TRUE on Windows
#' @param pdf.inch.fac = 2.54 / 1.2 (scaling factor for pdf)
#' @param pdf.width = 9.7/pdf.inch.fac
#' @param pdf.height = 21/pdf.inch.fac
#' @param pdf.pointsize = 19
#' @param pdf.family = "Courier" (font)
#' @details Notes:
#' The png.linux is without the restoreConsole parameter (only available on windows).
#' @export
openDevice <- function(grand.plotfilename="junk", type="pdf",
                       png.fac = 1.5,
                       png.width = png.fac*20,
                       png.height = png.fac*13,
                       png.res = 600,
                       png.bg = "white",
                       png.family = "arial",
                       png.type = c("windows", "cairo", "cairo-png")[2],
                       png.restoreConsole = TRUE,
                       pdf.inch.fac = 2.54 / 1.2,
                       pdf.width = 29.7/pdf.inch.fac,
                       pdf.height = 21/pdf.inch.fac,
                       pdf.pointsize = 19,
                       pdf.family = "Courier"){
  # Revised: February 15, 2026
  # Name: Claus E. Andersen

  type <- tolower(type)
  if(!type %in% c("pdf","png","png.linux","ps","none")){
    cat(paste("openDevice: Unknown type =",type,"??!\n"))
  }

  ##########################################
  # none (no plots to file)
  ##########################################
  if(type %in% c("none")){
    close.device.wanted <- FALSE
    assign("close.device.wanted",close.device.wanted,envir=.GlobalEnv)
    cat(paste("clanDevice:  No device was opened for output","\n"))
  }

  ##########################################
  # png (one file per plot)
  ##########################################
  if(type %in% c("png")){

    png.fac <- 1.5
    #png(filename = paste(grand.plotfilename,"%03d.png",sep=""),
    #    width = png.fac*20, height = png.fac*13, units = "cm",
    #    pointsize = png.fac*10,
    #    bg = "white", res = png.res, family = "arial", restoreConsole = TRUE,
    #    type = c("windows", "cairo", "cairo-png")[1])
    cat(paste("png.type =",png.type,"\n"))
    grDevices::png(filename = paste(grand.plotfilename,"%03d.png",sep=""),
        width = png.width, height = png.height, units = "cm",
        pointsize = png.fac*10,
        bg = png.bg, res = png.res, family = png.family, restoreConsole = png.restoreConsole,
        type = png.type)

    close.device.wanted <- TRUE
    assign("close.device.wanted",close.device.wanted,envir=.GlobalEnv)
    cat(paste("clanDevice:  A png device was opened for output","\nGrand file name =",grand.plotfilename,"\n"))
  }

  ##########################################
  # png.linux (one file per plot) No restoreConsole on linux
  ##########################################
  if(type %in% c("png.linux")){

    png.fac <- 1.5
    #png(filename = paste(grand.plotfilename,"%03d.png",sep=""),
    #    width = png.fac*20, height = png.fac*13, units = "cm",
    #    pointsize = png.fac*10,
    #    bg = "white", res = png.res, family = "arial", restoreConsole = TRUE,
    #    type = c("windows", "cairo", "cairo-png")[1])
    cat(paste("png.type =",png.type,"\n"))
    grDevices::png(filename = paste(grand.plotfilename,"%03d.png",sep=""),
        width = png.width, height = png.height, units = "cm",
        pointsize = png.fac*10,
        bg = png.bg, res = png.res, family = png.family,
        type = png.type)

    close.device.wanted <- TRUE
    assign("close.device.wanted",close.device.wanted,envir=.GlobalEnv)
    cat(paste("clanDevice:  A png device was opened for output","\nGrand file name =",grand.plotfilename,"\n"))
  }

  ##########################################
  # pdf (one file)
  ##########################################
  if(type %in% c("pdf")){

    #inch.fac <- 2.54 / 1.2
    #pdf(paste(grand.plotfilename,".pdf",sep=""),
    #width = 29.7/inch.fac, height = 21/inch.fac,pointsize=19,family="Courier")

    grDevices::pdf(paste(grand.plotfilename,".pdf",sep=""),
        width = pdf.width,
        height = pdf.height,
        pointsize=pdf.pointsize,
        family=pdf.family)


    close.device.wanted <- TRUE
    assign("close.device.wanted",close.device.wanted,envir=.GlobalEnv)
    cat(paste("clanDevice:  A pdf device was opened for output","\nGrand file name =",grand.plotfilename,"\n"))
  }

  ##########################################
  # ps (postscript, one file)
  ##########################################
  if(type %in% c("ps")){
    grDevices::postscript(paste(grand.plotfilename,".ps",sep=""),onefile=TRUE)
    close.device.wanted <- TRUE
    assign("close.device.wanted",close.device.wanted,envir=.GlobalEnv)
    cat(paste("clanDevice:  A ps device was opened for output","\nGrand file name =",grand.plotfilename,"\n"))
  }

}# end openDevice


#################################################

#' @title closeDevice
#' @description  Close device for printing a report
#'
#' @details Notes:
#' The  MSP's are in units of MeV pr. g/cm2.
#' The I is in eV
#' The density (rho) is in g/cm3
#' @export
closeDevice <- function(){
  # Close one device with dev.off() if .device.wanted == TRUE
  close.device.wanted <- get("close.device.wanted",envir = .GlobalEnv)
  if(close.device.wanted){
    grDevices::dev.off()
    cat("clanDevice: Device was closed\n")
  } else {
    # do nothing
  }
  close.device.wanted <- FALSE
  assign("close.device.wanted",close.device.wanted,envir=.GlobalEnv)
} # end closeDevice

#################################################
#' @title closeDeviceAll
#' @description  Close all devices for printing a report
#'
#' @details Notes:
#' The  MSP's are in units of MeV pr. g/cm2.
#' The I is in eV
#' The density (rho) is in g/cm3
#' @export
closeDeviceAll <- function(){
  # Close ALL device with dev.off()
  while(length(grDevices::dev.list())>0){grDevices::dev.off()}
  cat("clanDevice: All open devices were closed with dev.off().\n")
  close.device.wanted <- FALSE
  assign("close.device.wanted",close.device.wanted,envir=.GlobalEnv)
} # end closeDeviceAll



#################################################
#' @title demo.clanDevice
#' @description  Demonstration of how to use the clanDevice package
#'
#' @details Notes:
#' Make a pdf-repost with three plote
#' @export
demo.clanDevice <- function(){
clanDevice::openDevice("junk",type="pdf")
  print(plot(1:10))
  print(plot(1:20))
  print(plot(1:30))
clanDevice::closeDevice()
}
